/*****************************************************************************/
/*                                                                           */
/*                                   gc.c                                    */
/*                                                                           */
/*              Garbage collection (dead code elimination) for ld65          */
/*                                                                           */
/*  Strategy v6: Track both section-relative references AND symbol imports   */
/*  as potential CODE references. Local labels (L1001B etc.) are imported    */
/*  as EXPR_SYMBOL, so we add their target offsets to live ranges.           */
/*                                                                           */
/*****************************************************************************/



#include <stdio.h>
#include <string.h>
#include <assert.h>

/* common */
#include "alignment.h"
#include "cddefs.h"
#include "coll.h"
#include "exprdefs.h"
#include "fragdefs.h"
#include "print.h"
#include "xmalloc.h"

/* ld65 */
#include "exports.h"
#include "expr.h"
#include "fragment.h"
#include "gc.h"
#include "global.h"
#include "objdata.h"
#include "segments.h"
#include "spool.h"



/*****************************************************************************/
/*                                   Data                                    */
/*****************************************************************************/



/* Work list for reachability analysis */
static Collection WorkList = STATIC_COLLECTION_INITIALIZER;

/* Live exports collection */
static Collection LiveExports = STATIC_COLLECTION_INITIALIZER;

/* Live fragment ranges - stores pairs of (Section*, offset ranges) */
typedef struct LiveRange LiveRange;
struct LiveRange {
    Section*        Sec;
    unsigned long   Start;
    unsigned long   End;
};
static Collection LiveRanges = STATIC_COLLECTION_INITIALIZER;

/* Pending section references to process */
typedef struct SectionRef SectionRef;
struct SectionRef {
    Section*        Sec;
    unsigned long   Offset;
};
static Collection PendingRefs = STATIC_COLLECTION_INITIALIZER;

/* Statistics */
static unsigned long TotalBytesRemoved = 0;
static unsigned ExportsLive = 0;
static unsigned ExportsDead = 0;



/*****************************************************************************/
/*                             Helper Functions                              */
/*****************************************************************************/



static int IsExportLive (Export* E)
/* Check if an export is marked as live */
{
    return ExportHasMark (E);
}



static void MarkExportLive (Export* E)
/* Mark an export as live and add to worklist if not already marked */
{
    if (E != 0 && !ExportHasMark (E)) {
        MarkExport (E);
        CollAppend (&WorkList, E);
        CollAppend (&LiveExports, E);
    }
}



/* Forward declarations */
static Section* GetExportSection (Export* E, unsigned long* Offset);
static SectionRef* NewSectionRef (Section* Sec, unsigned long Offset);

static void MarkExprSymbolsLive (ExprNode* Expr)
/* Recursively walk expression tree and mark referenced symbols as live */
{
    if (Expr == 0) {
        return;
    }

    /* Recurse into children first */
    if (EXPR_NODETYPE (Expr->Op) == EXPR_BINARYNODE) {
        MarkExprSymbolsLive (Expr->Left);
        MarkExprSymbolsLive (Expr->Right);
    } else if (EXPR_NODETYPE (Expr->Op) == EXPR_UNARYNODE) {
        MarkExprSymbolsLive (Expr->Left);
    }

    /* Handle symbol references */
    if (Expr->Op == EXPR_SYMBOL) {
        Export* E = GetExprExport (Expr);
        MarkExportLive (E);

        /* Also add the symbol's location as a section reference if it's in CODE */
        if (E != 0) {
            Section* Sec;
            unsigned long Offset;
            Sec = GetExportSection (E, &Offset);
            if (Sec != 0) {
                Segment* Seg = Sec->Seg;
                const char* SegName = GetString (Seg->Name);
                if (strcmp (SegName, "CODE") == 0) {
                    CollAppend (&PendingRefs, NewSectionRef (Sec, Offset));
                }
            }
        }
    }
}



static void MarkFragmentSymbols (Fragment* F)
/* Mark symbols referenced by a fragment as live */
{
    if (F->Type == FRAG_EXPR || F->Type == FRAG_SEXPR) {
        MarkExprSymbolsLive (F->Expr);
    }
}



static LiveRange* NewLiveRange (Section* Sec, unsigned long Start, unsigned long End)
/* Create a new live range */
{
    LiveRange* LR = xmalloc (sizeof (LiveRange));
    LR->Sec = Sec;
    LR->Start = Start;
    LR->End = End;
    return LR;
}



static void FreeLiveRange (LiveRange* LR)
/* Free a live range */
{
    xfree (LR);
}



static int AddLiveRange (Section* Sec, unsigned long Start, unsigned long End)
/* Add a live range, merging with existing if overlapping.
 * Returns 1 if a new range was added or an existing one was extended, 0 otherwise.
 */
{
    unsigned I;

    /* Try to merge with existing range */
    for (I = 0; I < CollCount (&LiveRanges); ++I) {
        LiveRange* LR = CollAt (&LiveRanges, I);
        if (LR->Sec == Sec) {
            /* Check for overlap or adjacency */
            if (Start <= LR->End && End >= LR->Start) {
                /* Check if this would extend the range */
                int Extended = 0;
                if (Start < LR->Start) {
                    LR->Start = Start;
                    Extended = 1;
                }
                if (End > LR->End) {
                    LR->End = End;
                    Extended = 1;
                }
                return Extended;
            }
        }
    }

    /* No merge possible, add new range */
    CollAppend (&LiveRanges, NewLiveRange (Sec, Start, End));
    return 1;
}



static int IsOffsetLive (Section* Sec, unsigned long Offset)
/* Check if an offset in a section is within a live range */
{
    unsigned I;
    for (I = 0; I < CollCount (&LiveRanges); ++I) {
        LiveRange* LR = CollAt (&LiveRanges, I);
        if (LR->Sec == Sec && Offset >= LR->Start && Offset < LR->End) {
            return 1;
        }
    }
    return 0;
}



static SectionRef* NewSectionRef (Section* Sec, unsigned long Offset)
/* Create a new section reference */
{
    SectionRef* SR = xmalloc (sizeof (SectionRef));
    SR->Sec = Sec;
    SR->Offset = Offset;
    return SR;
}



static void FreeSectionRef (SectionRef* SR)
/* Free a section reference */
{
    xfree (SR);
}



/*****************************************************************************/
/*                        Removed Fragment Accounting                        */
/*****************************************************************************/



typedef struct RemovalRange RemovalRange;
struct RemovalRange {
    unsigned long   Start;  /* Offset within the section before GC */
    unsigned long   Len;    /* Length of the removed fragment */
};



static unsigned long AdjustOffsetForRemovals (unsigned long Offset,
                                              const Collection* Ranges,
                                              int* InRemoved)
/* Translate an old section offset to its new position after removing
** fragments. Returns the adjusted offset. If the offset was inside a removed
** range, *InRemoved is set to true and the returned offset points to the
** start of that range.
*/
{
    unsigned long RemovedBefore = 0;
    unsigned I;

    if (InRemoved) {
        *InRemoved = 0;
    }

    for (I = 0; I < CollCount (Ranges); ++I) {
        const RemovalRange* Range = CollConstAt (Ranges, I);

        if (Offset >= Range->Start + Range->Len) {
            RemovedBefore += Range->Len;
            continue;
        }

        if (Offset >= Range->Start) {
            if (InRemoved) {
                *InRemoved = 1;
            }
            return Range->Start - RemovedBefore;
        }

        break;
    }

    return Offset - RemovedBefore;
}



static void UpdateExportSectionExpr (Export* E, Section* Sec, unsigned long NewOffset)
/* Replace the export expression with a fresh section expression using the
** adjusted offset.
*/
{
    if (E->Expr != 0) {
        FreeExpr (E->Expr);
    }
    /* Pass NULL for ObjData to use direct section pointer (V.Sec) instead of
    ** index (V.SecNum), since we have the Section pointer directly.
    */
    E->Expr = SectionExpr (Sec, NewOffset, 0);
}



/*****************************************************************************/
/*                         Section Reference Extraction                      */
/*****************************************************************************/



static void ExtractSectionRefs (ExprNode* Expr, Section* ContextSec)
/* Recursively walk expression tree and extract section+offset references.
 * These represent local labels (branch targets within the same section).
 */
{
    if (Expr == 0) {
        return;
    }

    /* Check for EXPR_SECTION + EXPR_LITERAL pattern (local label reference) */
    if (Expr->Op == EXPR_PLUS) {
        Section* RefSec = 0;
        long Offset = 0;
        int HasSection = 0;
        int HasOffset = 0;

        /* Check left operand */
        if (Expr->Left && Expr->Left->Op == EXPR_SECTION) {
            RefSec = GetExprSection (Expr->Left);
            HasSection = 1;
        } else if (Expr->Left && Expr->Left->Op == EXPR_LITERAL) {
            Offset = Expr->Left->V.IVal;
            HasOffset = 1;
        }

        /* Check right operand */
        if (Expr->Right && Expr->Right->Op == EXPR_SECTION) {
            RefSec = GetExprSection (Expr->Right);
            HasSection = 1;
        } else if (Expr->Right && Expr->Right->Op == EXPR_LITERAL) {
            Offset = Expr->Right->V.IVal;
            HasOffset = 1;
        }

        /* If we found a section+offset pattern, add as pending reference */
        if (HasSection && HasOffset && RefSec != 0) {
            /* Only track CODE segment references */
            Segment* Seg = RefSec->Seg;
            const char* SegName = GetString (Seg->Name);
            if (strcmp (SegName, "CODE") == 0 && Offset >= 0) {
                CollAppend (&PendingRefs, NewSectionRef (RefSec, (unsigned long)Offset));
            }
        }
    }

    /* Also check for direct EXPR_SECTION (section start reference) */
    if (Expr->Op == EXPR_SECTION) {
        Section* RefSec = GetExprSection (Expr);
        if (RefSec != 0) {
            Segment* Seg = RefSec->Seg;
            const char* SegName = GetString (Seg->Name);
            if (strcmp (SegName, "CODE") == 0) {
                CollAppend (&PendingRefs, NewSectionRef (RefSec, 0));
            }
        }
    }

    /* Recurse into children */
    if (EXPR_NODETYPE (Expr->Op) == EXPR_BINARYNODE) {
        ExtractSectionRefs (Expr->Left, ContextSec);
        ExtractSectionRefs (Expr->Right, ContextSec);
    } else if (EXPR_NODETYPE (Expr->Op) == EXPR_UNARYNODE) {
        ExtractSectionRefs (Expr->Left, ContextSec);
    }
}



static void ExtractFragmentSectionRefs (Fragment* F)
/* Extract section references from a fragment's expression */
{
    if (F->Type == FRAG_EXPR || F->Type == FRAG_SEXPR) {
        ExtractSectionRefs (F->Expr, F->Sec);
    }
}



/*****************************************************************************/
/*                              Root Detection                               */
/*****************************************************************************/



static int IsRootSegment (const char* SegName)
/* Check if this is a root segment that should always be kept */
{
    return (strcmp (SegName, "STARTUP") == 0 ||
            strcmp (SegName, "VECTORS") == 0 ||
            strcmp (SegName, "HEADER") == 0 ||
            strcmp (SegName, "INIT") == 0 ||
            strcmp (SegName, "ONCE") == 0);
}



static int IsDataSegment (const char* SegName)
/* Check if this is a data segment */
{
    return (strcmp (SegName, "RODATA") == 0 ||
            strcmp (SegName, "DATA") == 0 ||
            strcmp (SegName, "BSS") == 0 ||
            strcmp (SegName, "ZEROPAGE") == 0);
}



/*****************************************************************************/
/*                          Symbol-Section Mapping                           */
/*****************************************************************************/



static Section* GetExportSection (Export* E, unsigned long* Offset)
/* Get the section containing an export and its offset within that section */
{
    ExprNode* Expr = E->Expr;

    if (Expr == 0) {
        return 0;
    }

    /* Direct section reference */
    if (Expr->Op == EXPR_SECTION) {
        *Offset = 0;
        return GetExprSection (Expr);
    }

    /* Section + offset (most common case for symbols) */
    if (Expr->Op == EXPR_PLUS) {
        if (Expr->Left && Expr->Left->Op == EXPR_SECTION) {
            if (Expr->Right && Expr->Right->Op == EXPR_LITERAL) {
                *Offset = Expr->Right->V.IVal;
            } else {
                *Offset = 0;
            }
            return GetExprSection (Expr->Left);
        }
        if (Expr->Right && Expr->Right->Op == EXPR_SECTION) {
            if (Expr->Left && Expr->Left->Op == EXPR_LITERAL) {
                *Offset = Expr->Left->V.IVal;
            } else {
                *Offset = 0;
            }
            return GetExprSection (Expr->Right);
        }
    }

    return 0;
}



/*****************************************************************************/
/*                            Root Symbol Marking                            */
/*****************************************************************************/



static void MarkRootSymbols (void)
/* Mark root segments' symbols and ConDes symbols as live */
{
    unsigned I, J;
    unsigned SegCount = SegmentCount ();

    fprintf (stderr, "GC: Phase 1 - Marking root segments\n");

    /* Walk all fragments in root and data segments and mark referenced symbols */
    for (I = 0; I < SegCount; ++I) {
        Segment* Seg = SegmentByIndex (I);
        const char* SegName = GetString (Seg->Name);

        if (IsRootSegment (SegName) || IsDataSegment (SegName)) {
            for (J = 0; J < CollCount (&Seg->Sections); ++J) {
                Section* Sec = CollAt (&Seg->Sections, J);
                Fragment* F;

                for (F = Sec->FragRoot; F != 0; F = F->Next) {
                    MarkFragmentSymbols (F);
                    /* Also extract section references from root segments */
                    ExtractFragmentSectionRefs (F);
                }
            }
        }
    }

    fprintf (stderr, "GC: Phase 2 - Marking constructor/destructor symbols\n");

    /* Mark constructor/destructor symbols */
    for (I = 0; I < CollCount (&ObjDataList); ++I) {
        ObjData* O = CollAt (&ObjDataList, I);

        for (J = 0; J < CollCount (&O->Exports); ++J) {
            Export* E = CollAt (&O->Exports, J);
            unsigned Type;

            for (Type = 0; Type < CD_TYPE_COUNT; ++Type) {
                if (E->ConDes[Type] != CD_PRIO_NONE) {
                    MarkExportLive (E);
                    break;
                }
            }
        }
    }

    fprintf (stderr, "GC: Worklist has %u symbols after root marking\n",
             CollCount (&WorkList));
    fprintf (stderr, "GC: Pending section refs: %u\n",
             CollCount (&PendingRefs));
}



/*****************************************************************************/
/*                         Reachability Propagation                          */
/*****************************************************************************/



static void PropagateReachability (void)
/* Process worklist and mark symbols referenced by live symbols as live */
{
    unsigned ProcessedCount = 0;

    fprintf (stderr, "GC: Phase 3 - Propagating reachability\n");

    while (CollCount (&WorkList) > 0) {
        Export* E = CollPop (&WorkList);
        Section* Sec;
        unsigned long Offset;

        ProcessedCount++;

        /* Mark symbols referenced by this export's expression */
        if (E->Expr) {
            MarkExprSymbolsLive (E->Expr);
            /* Also extract section references */
            ExtractSectionRefs (E->Expr, 0);
        }

        /* Get the section for this export */
        Sec = GetExportSection (E, &Offset);
        if (Sec != 0) {
            /* Walk fragments in the symbol's range and mark their references */
            Fragment* F;
            unsigned long CurrentOffset = 0;
            unsigned long EndOffset = Offset + E->Size;

            /* If Size is 0, use a minimal size */
            if (E->Size == 0) {
                EndOffset = Offset + 1;
            }

            for (F = Sec->FragRoot; F != 0; F = F->Next) {
                unsigned long FragEnd = CurrentOffset + F->Size;

                /* Check if this fragment overlaps with the symbol's range */
                if (CurrentOffset < EndOffset && FragEnd > Offset) {
                    MarkFragmentSymbols (F);
                    /* Extract section references from fragments in this export */
                    ExtractFragmentSectionRefs (F);
                }

                CurrentOffset = FragEnd;
                if (CurrentOffset >= EndOffset) {
                    break;
                }
            }
        }
    }

    fprintf (stderr, "GC: Processed %u symbols, %u total live\n",
             ProcessedCount, CollCount (&LiveExports));
}



/*****************************************************************************/
/*                         Build Live Ranges                                 */
/*****************************************************************************/



static void BuildLiveRanges (void)
/* Build live ranges from live exports */
{
    unsigned I;

    fprintf (stderr, "GC: Phase 4 - Building initial live ranges from exports\n");

    for (I = 0; I < CollCount (&LiveExports); ++I) {
        Export* E = CollAt (&LiveExports, I);
        Section* Sec;
        unsigned long Offset;

        Sec = GetExportSection (E, &Offset);
        if (Sec != 0) {
            Segment* Seg = Sec->Seg;
            const char* SegName = GetString (Seg->Name);

            if (strcmp (SegName, "CODE") == 0) {
                unsigned long Size = E->Size;
                /* For zero-sized exports, use size 1 - they mark a single location */
                if (Size == 0) {
                    Size = 1;
                }
                AddLiveRange (Sec, Offset, Offset + Size);
            }
        }
    }

    fprintf (stderr, "GC: Built %u initial live ranges\n", CollCount (&LiveRanges));
}



/*****************************************************************************/
/*                    Section Reference Transitive Closure                   */
/*****************************************************************************/



static unsigned long FindFragmentEndOffset (Section* Sec, unsigned long StartOffset)
/* Find the end of the fragment that contains StartOffset.
 * This helps us determine how much code to keep for a local label target.
 * Returns the end offset of the fragment, or StartOffset + some default if not found.
 */
{
    Fragment* F;
    unsigned long CurrentOffset = 0;

    for (F = Sec->FragRoot; F != 0; F = F->Next) {
        unsigned long FragEnd = CurrentOffset + F->Size;

        if (StartOffset >= CurrentOffset && StartOffset < FragEnd) {
            /* Found the fragment containing this offset */
            return FragEnd;
        }

        CurrentOffset = FragEnd;
    }

    /* Not found - return a minimal range */
    return StartOffset + 1;
}



static void ProcessPendingSectionRefs (void)
/* Process pending section references and add them as live ranges.
 * This implements a transitive closure: when we add a new live range,
 * we extract section references from fragments in that range, which
 * may discover more targets to keep.
 */
{
    unsigned Iteration = 0;
    unsigned TotalRefsProcessed = 0;

    fprintf (stderr, "GC: Phase 5 - Processing section references (transitive closure)\n");

    while (CollCount (&PendingRefs) > 0) {
        unsigned I;
        unsigned RefsThisIteration = CollCount (&PendingRefs);
        unsigned NewRangesAdded = 0;

        Iteration++;
        TotalRefsProcessed += RefsThisIteration;

        /* Process all currently pending refs */
        for (I = 0; I < RefsThisIteration; ++I) {
            SectionRef* SR = CollAt (&PendingRefs, I);
            Section* Sec = SR->Sec;
            unsigned long Offset = SR->Offset;

            /* Check if this offset is already in a live range */
            if (!IsOffsetLive (Sec, Offset)) {
                /* Find the end of the fragment containing this offset */
                unsigned long EndOffset = FindFragmentEndOffset (Sec, Offset);

                /* Add this as a live range */
                if (AddLiveRange (Sec, Offset, EndOffset)) {
                    NewRangesAdded++;

                    /* Now scan fragments in this new range for more section refs */
                    Fragment* F;
                    unsigned long CurrentOffset = 0;

                    for (F = Sec->FragRoot; F != 0; F = F->Next) {
                        unsigned long FragEnd = CurrentOffset + F->Size;

                        if (CurrentOffset < EndOffset && FragEnd > Offset) {
                            ExtractFragmentSectionRefs (F);
                        }

                        CurrentOffset = FragEnd;
                        if (CurrentOffset >= EndOffset) {
                            break;
                        }
                    }
                }
            }

            FreeSectionRef (SR);
        }

        /* Remove processed refs from collection */
        for (I = 0; I < RefsThisIteration; ++I) {
            CollDelete (&PendingRefs, 0);
        }

        fprintf (stderr, "GC:   Iteration %u: processed %u refs, added %u new ranges, %u pending\n",
                 Iteration, RefsThisIteration, NewRangesAdded, CollCount (&PendingRefs));

        /* Safety limit to prevent infinite loops */
        if (Iteration > 10000) {
            fprintf (stderr, "GC: WARNING: Too many iterations, aborting transitive closure\n");
            break;
        }
    }

    fprintf (stderr, "GC: Transitive closure complete: %u iterations, %u total refs, %u live ranges\n",
             Iteration, TotalRefsProcessed, CollCount (&LiveRanges));
}



/*****************************************************************************/
/*                           Dead Code Removal                               */
/*****************************************************************************/



/* Helper: Get the Section referenced by an Expr (handles SECTION and SECTION+LITERAL patterns) */
static Section* GetExprRefSection (ExprNode* Expr)
{
    if (Expr == 0) {
        return 0;
    }

    /* Direct section reference */
    if (Expr->Op == EXPR_SECTION) {
        if (Expr->Obj) {
            if (Expr->V.SecNum >= CollCount (&Expr->Obj->Sections)) {
                return 0;
            }
            return CollAt (&Expr->Obj->Sections, Expr->V.SecNum);
        } else {
            return Expr->V.Sec;
        }
    }

    /* SECTION + LITERAL pattern */
    if (Expr->Op == EXPR_PLUS) {
        ExprNode* SectionExpr = 0;

        if (Expr->Left && Expr->Left->Op == EXPR_SECTION) {
            SectionExpr = Expr->Left;
        } else if (Expr->Right && Expr->Right->Op == EXPR_SECTION) {
            SectionExpr = Expr->Right;
        }

        if (SectionExpr) {
            if (SectionExpr->Obj) {
                if (SectionExpr->V.SecNum >= CollCount (&SectionExpr->Obj->Sections)) {
                    return 0;
                }
                return CollAt (&SectionExpr->Obj->Sections, SectionExpr->V.SecNum);
            } else {
                return SectionExpr->V.Sec;
            }
        }
    }

    return 0;
}



/* Helper: Extract offset from EXPR_SECTION + EXPR_LITERAL pattern */
static int GetSectionPlusLiteralOffset (ExprNode* Expr, Section* TargetSec, long* OutOffset)
/* If Expr is (SECTION + LITERAL) referencing TargetSec, return 1 and set OutOffset.
** Otherwise return 0.
*/
{
    if (Expr == 0) {
        return 0;
    }

    /* Direct section reference with offset 0 */
    if (Expr->Op == EXPR_SECTION) {
        Section* Sec;
        if (Expr->Obj) {
            if (Expr->V.SecNum >= CollCount (&Expr->Obj->Sections)) {
                return 0;
            }
            Sec = CollAt (&Expr->Obj->Sections, Expr->V.SecNum);
        } else {
            Sec = Expr->V.Sec;
        }
        if (Sec == TargetSec) {
            *OutOffset = 0;
            return 1;
        }
        return 0;
    }

    /* SECTION + LITERAL pattern */
    if (Expr->Op == EXPR_PLUS) {
        ExprNode* SectionExpr = 0;
        ExprNode* LiteralExpr = 0;

        if (Expr->Left && Expr->Left->Op == EXPR_SECTION) {
            SectionExpr = Expr->Left;
            if (Expr->Right && Expr->Right->Op == EXPR_LITERAL) {
                LiteralExpr = Expr->Right;
            }
        } else if (Expr->Right && Expr->Right->Op == EXPR_SECTION) {
            SectionExpr = Expr->Right;
            if (Expr->Left && Expr->Left->Op == EXPR_LITERAL) {
                LiteralExpr = Expr->Left;
            }
        }

        if (SectionExpr && LiteralExpr) {
            Section* Sec;
            if (SectionExpr->Obj) {
                if (SectionExpr->V.SecNum >= CollCount (&SectionExpr->Obj->Sections)) {
                    return 0;
                }
                Sec = CollAt (&SectionExpr->Obj->Sections, SectionExpr->V.SecNum);
            } else {
                Sec = SectionExpr->V.Sec;
            }
            if (Sec == TargetSec) {
                *OutOffset = LiteralExpr->V.IVal;
                return 1;
            }
        }
    }

    return 0;
}



/* Helper: Update the LITERAL part of EXPR_SECTION + EXPR_LITERAL */
static void UpdateSectionPlusLiteralOffset (ExprNode* Expr, long NewOffset)
/* Assumes Expr is (SECTION + LITERAL) pattern. Updates the LITERAL value. */
{
    if (Expr->Op == EXPR_SECTION) {
        /* Was a direct section reference, need to add a literal */
        /* This case shouldn't happen if offset was 0 and stays 0, but handle it */
        return;
    }

    if (Expr->Op == EXPR_PLUS) {
        if (Expr->Left && Expr->Left->Op == EXPR_LITERAL) {
            Expr->Left->V.IVal = NewOffset;
        } else if (Expr->Right && Expr->Right->Op == EXPR_LITERAL) {
            Expr->Right->V.IVal = NewOffset;
        }
        return;
    }

    // Should not reach here
    assert(0);
}



/* Offset entry for tracking referenced offsets */
typedef struct OffsetEntry OffsetEntry;
struct OffsetEntry {
    unsigned long OrigOffset;
    unsigned long FinalOffset;
};

/* Section offset table for tracking adjustments per section */
typedef struct SectionOffsetTable SectionOffsetTable;
struct SectionOffsetTable {
    Section*    Sec;
    Collection  Offsets;    /* Collection of OffsetEntry* */
};

/* Comparison function for sorting OffsetEntry by OrigOffset */
static int CompareOffsetEntries (void* Data attribute ((unused)), const void* A, const void* B)
{
    const OffsetEntry* EA = A;
    const OffsetEntry* EB = B;
    if (EA->OrigOffset < EB->OrigOffset) return -1;
    if (EA->OrigOffset > EB->OrigOffset) return 1;
    return 0;
}

/* Binary search: find entry with largest OrigOffset <= target */
static int BinarySearchOffset (Collection* Offsets, unsigned long Target)
{
    int Lo = 0;
    int Hi = (int)CollCount (Offsets) - 1;
    int Result = -1;

    while (Lo <= Hi) {
        int Mid = (Lo + Hi) / 2;
        OffsetEntry* E = CollAt (Offsets, Mid);
        if (E->OrigOffset <= Target) {
            Result = Mid;
            Lo = Mid + 1;
        } else {
            Hi = Mid - 1;
        }
    }
    return Result;
}



/* Helper: Add offset to a section's offset table */
static void AddOffsetToSection (Collection* SectionTables, Section* TargetSec, unsigned long Offset)
{
    unsigned I;
    SectionOffsetTable* Table = 0;

    /* Find or create table for this section */
    for (I = 0; I < CollCount (SectionTables); ++I) {
        SectionOffsetTable* T = CollAt (SectionTables, I);
        if (T->Sec == TargetSec) {
            Table = T;
            break;
        }
    }
    if (Table == 0) {
        Table = xmalloc (sizeof (SectionOffsetTable));
        Table->Sec = TargetSec;
        InitCollection (&Table->Offsets);
        CollAppend (SectionTables, Table);
    }

    /* Check if offset already exists */
    for (I = 0; I < CollCount (&Table->Offsets); ++I) {
        OffsetEntry* E = CollAt (&Table->Offsets, I);
        if (E->OrigOffset == Offset) {
            return;  /* Already exists */
        }
    }

    /* Add new offset */
    {
        OffsetEntry* Entry = xmalloc (sizeof (OffsetEntry));
        Entry->OrigOffset = Offset;
        Entry->FinalOffset = Offset;
        CollAppend (&Table->Offsets, Entry);
    }
}

/* Helper: Find offset table for a section */
static SectionOffsetTable* FindSectionTable (Collection* SectionTables, Section* Sec)
{
    unsigned I;
    for (I = 0; I < CollCount (SectionTables); ++I) {
        SectionOffsetTable* T = CollAt (SectionTables, I);
        if (T->Sec == Sec) {
            return T;
        }
    }
    return 0;
}

static void RemoveDeadCode (void)
/* Remove fragments that are not in live ranges, adjusting Expr offsets */
{
    unsigned I, J, K;
    unsigned SegCount = SegmentCount ();
    unsigned long TotalRemoved = 0;
    unsigned FragsRemoved = 0;
    unsigned FragsKept = 0;
    Collection SectionTables = STATIC_COLLECTION_INITIALIZER;  /* Collection of SectionOffsetTable* */

    fprintf (stderr, "GC: Phase 6 - Removing dead code\n");

    /* ============================================================
     * Phase 1: Collect all referenced offsets from ALL fragments
     *          targeting CODE sections
     * ============================================================ */
    for (I = 0; I < CollCount (&ObjDataList); ++I) {
        ObjData* O = CollAt (&ObjDataList, I);
        for (J = 0; J < CollCount (&O->Sections); ++J) {
            Section* Sec = CollAt (&O->Sections, J);
            Fragment* F = Sec->FragRoot;
            while (F != 0) {
                if (F->Type == FRAG_EXPR || F->Type == FRAG_SEXPR) {
                    /* Check if this references a CODE section */
                    Section* RefSec = GetExprRefSection (F->Expr);
                    if (RefSec != 0 && RefSec->Seg != 0) {
                        const char* SegName = GetString (RefSec->Seg->Name);
                        if (strcmp (SegName, "CODE") == 0) {
                            long RefOffset;
                            if (GetSectionPlusLiteralOffset (F->Expr, RefSec, &RefOffset) && RefOffset >= 0) {
                                AddOffsetToSection (&SectionTables, RefSec, (unsigned long)RefOffset);
                            }
                        }
                    }
                }
                F = F->Next;
            }
        }
    }

    /* Sort all offset tables */
    for (I = 0; I < CollCount (&SectionTables); ++I) {
        SectionOffsetTable* T = CollAt (&SectionTables, I);
        CollSort (&T->Offsets, CompareOffsetEntries, 0);
    }

    /* ============================================================
     * Phase 2: Remove fragments and calculate offset adjustments
     * ============================================================ */
    for (I = 0; I < SegCount; ++I) {
        Segment* Seg = SegmentByIndex (I);
        const char* SegName = GetString (Seg->Name);

        /* Only process CODE segment */
        if (strcmp (SegName, "CODE") != 0) {
            continue;
        }

        for (J = 0; J < CollCount (&Seg->Sections); ++J) {
            Section* Sec = CollAt (&Seg->Sections, J);
            Fragment* F;
            Fragment* Prev = 0;
            Fragment* Next;
            unsigned long CurrentOffset;
            unsigned long CurrentlyRemovedBytes = 0;
            unsigned long SectionBytesRemoved = 0;
            SectionOffsetTable* Table = FindSectionTable (&SectionTables, Sec);
            unsigned OffsetIdx = 0;

            F = Sec->FragRoot;
            CurrentOffset = 0;
            CurrentlyRemovedBytes = 0;

            while (F != 0) {
                unsigned long FragEnd = CurrentOffset + F->Size;
                int FragLive = 0;
                unsigned long CheckOffset;

                Next = F->Next;

                /* Check if fragment is live */
                for (CheckOffset = CurrentOffset; CheckOffset < FragEnd; ++CheckOffset) {
                    if (IsOffsetLive (Sec, CheckOffset)) {
                        FragLive = 1;
                        break;
                    }
                }

                /* Update FinalOffset for all referenced offsets within this fragment's range */
                if (Table != 0) {
                    while (OffsetIdx < CollCount (&Table->Offsets)) {
                        OffsetEntry* E = CollAt (&Table->Offsets, OffsetIdx);
                        if (E->OrigOffset < FragEnd) {
                            E->FinalOffset = E->OrigOffset - CurrentlyRemovedBytes;
                            OffsetIdx++;
                        } else {
                            break;
                        }
                    }
                }

                if (FragLive) {
                    Prev = F;
                    FragsKept++;
                } else {
                    SectionBytesRemoved += F->Size;
                    TotalRemoved += F->Size;
                    CurrentlyRemovedBytes += F->Size;
                    FragsRemoved++;

                    /* Unlink the fragment */
                    if (Prev == 0) {
                        Sec->FragRoot = Next;
                    } else {
                        Prev->Next = Next;
                    }
                    if (Sec->FragLast == F) {
                        Sec->FragLast = Prev;
                    }
                }

                CurrentOffset = FragEnd;
                F = Next;
            }

            /* Process any remaining offsets after the last fragment */
            if (Table != 0) {
                while (OffsetIdx < CollCount (&Table->Offsets)) {
                    OffsetEntry* E = CollAt (&Table->Offsets, OffsetIdx);
                    E->FinalOffset = E->OrigOffset - CurrentlyRemovedBytes;
                    OffsetIdx++;
                }
            }

            Sec->Size -= SectionBytesRemoved;
        }

        /* Recalculate segment size */
        Seg->Size = 0;
        for (J = 0; J < CollCount (&Seg->Sections); ++J) {
            Section* Sec = CollAt (&Seg->Sections, J);

            Sec->Fill = AlignCount (Seg->Size, Sec->Alignment);
            Seg->Size += Sec->Fill;
            Sec->Offs = Seg->Size;
            Seg->Size += Sec->Size;
        }
    }

    /* ============================================================
     * Phase 3: Update Expr offsets in ALL fragments
     * ============================================================ */
    for (I = 0; I < CollCount (&ObjDataList); ++I) {
        ObjData* O = CollAt (&ObjDataList, I);

        /* Update fragment expressions */
        for (J = 0; J < CollCount (&O->Sections); ++J) {
            Section* Sec = CollAt (&O->Sections, J);
            Fragment* F = Sec->FragRoot;
            while (F != 0) {
                if (F->Type == FRAG_EXPR || F->Type == FRAG_SEXPR) {
                    Section* RefSec = GetExprRefSection (F->Expr);
                    if (RefSec != 0) {
                        SectionOffsetTable* Table = FindSectionTable (&SectionTables, RefSec);
                        if (Table != 0) {
                            long RefOffset;
                            if (GetSectionPlusLiteralOffset (F->Expr, RefSec, &RefOffset) && RefOffset >= 0) {
                                int Idx = BinarySearchOffset (&Table->Offsets, (unsigned long)RefOffset);
                                if (Idx >= 0) {
                                    OffsetEntry* E = CollAt (&Table->Offsets, Idx);
                                    if (E->OrigOffset == (unsigned long)RefOffset && E->FinalOffset != E->OrigOffset) {
                                        fprintf (stderr, "GC: Rewrite 0x%lX -> 0x%lX\n",
                                                 (unsigned long)RefOffset, E->FinalOffset);
                                        UpdateSectionPlusLiteralOffset (F->Expr, (long)E->FinalOffset);
                                    }
                                }
                            }
                        }
                    }
                }
                F = F->Next;
            }
        }

        /* Update export expressions */
        for (J = 0; J < CollCount (&O->Exports); ++J) {
            Export* Exp = CollAt (&O->Exports, J);
            if (Exp->Expr != 0) {
                Section* RefSec = GetExprRefSection (Exp->Expr);
                if (RefSec != 0) {
                    SectionOffsetTable* Table = FindSectionTable (&SectionTables, RefSec);
                    if (Table != 0) {
                        long RefOffset;
                        if (GetSectionPlusLiteralOffset (Exp->Expr, RefSec, &RefOffset) && RefOffset >= 0) {
                            int Idx = BinarySearchOffset (&Table->Offsets, (unsigned long)RefOffset);
                            if (Idx >= 0) {
                                OffsetEntry* E = CollAt (&Table->Offsets, Idx);
                                if (E->OrigOffset == (unsigned long)RefOffset && E->FinalOffset != E->OrigOffset) {
                                    fprintf (stderr, "GC: Rewrite export 0x%lX -> 0x%lX\n",
                                             (unsigned long)RefOffset, E->FinalOffset);
                                    UpdateSectionPlusLiteralOffset (Exp->Expr, (long)E->FinalOffset);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    /* Free the offset tables */
    for (I = 0; I < CollCount (&SectionTables); ++I) {
        SectionOffsetTable* Table = CollAt (&SectionTables, I);
        for (J = 0; J < CollCount (&Table->Offsets); ++J) {
            OffsetEntry* E = CollAt (&Table->Offsets, J);
            xfree (E);
        }
        DoneCollection (&Table->Offsets);
        xfree (Table);
    }
    DoneCollection (&SectionTables);

    TotalBytesRemoved = TotalRemoved;
}



/*****************************************************************************/
/*                           Analysis and Report                             */
/*****************************************************************************/



static void AnalyzeExports (void)
/* Count live/dead exports */
{
    unsigned I, J;
    int WriteFound = 0;

    fprintf (stderr, "GC: Live CODE symbols:\n");

    for (I = 0; I < CollCount (&ObjDataList); ++I) {
        ObjData* O = CollAt (&ObjDataList, I);

        for (J = 0; J < CollCount (&O->Exports); ++J) {
            Export* E = CollAt (&O->Exports, J);
            Section* Sec;
            unsigned long Offset;
            const char* SymName = GetString (E->Name);

            /* Check for _write specifically */
            if (strcmp (SymName, "_write") == 0) {
                WriteFound = 1;
                fprintf (stderr, "GC: Found _write: live=%d, size=%u\n",
                         IsExportLive (E), E->Size);
            }

            /* Debug: check expression before calling GetExportSection */
            if (E->Expr != 0) {
                ExprNode* Expr = E->Expr;
                if (Expr->Op == EXPR_SECTION && Expr->Obj != 0) {
                    unsigned SecCount = CollCount (&Expr->Obj->Sections);
                    if (Expr->V.SecNum >= SecCount) {
                        fprintf (stderr, "GC: ERROR: Export '%s' has SecNum=%u but Obj has only %u sections\n",
                                 SymName, Expr->V.SecNum, SecCount);
                        continue;
                    }
                } else if (Expr->Op == EXPR_PLUS) {
                    if (Expr->Left && Expr->Left->Op == EXPR_SECTION && Expr->Left->Obj != 0) {
                        unsigned SecCount = CollCount (&Expr->Left->Obj->Sections);
                        if (Expr->Left->V.SecNum >= SecCount) {
                            fprintf (stderr, "GC: ERROR: Export '%s' (left) has SecNum=%u but Obj has only %u sections\n",
                                     SymName, Expr->Left->V.SecNum, SecCount);
                            continue;
                        }
                    }
                    if (Expr->Right && Expr->Right->Op == EXPR_SECTION && Expr->Right->Obj != 0) {
                        unsigned SecCount = CollCount (&Expr->Right->Obj->Sections);
                        if (Expr->Right->V.SecNum >= SecCount) {
                            fprintf (stderr, "GC: ERROR: Export '%s' (right) has SecNum=%u but Obj has only %u sections\n",
                                     SymName, Expr->Right->V.SecNum, SecCount);
                            continue;
                        }
                    }
                }
            }

            Sec = GetExportSection (E, &Offset);
            if (Sec != 0) {
                Segment* Seg = Sec->Seg;
                const char* SegName = GetString (Seg->Name);

                if (strcmp (SegName, "CODE") == 0) {
                    if (IsExportLive (E)) {
                        ExportsLive++;
                        fprintf (stderr, "GC:   Live: %s (size=%u)\n",
                                 SymName, E->Size);
                    } else {
                        ExportsDead++;
                    }
                }
            }
        }
    }

    if (!WriteFound) {
        fprintf (stderr, "GC: WARNING: _write not found in any exports!\n");
    }
}



static void ReportSegmentSizes (void)
/* Report final segment sizes */
{
    unsigned I;
    unsigned SegCount = SegmentCount ();

    fprintf (stderr, "GC: Phase 7 - Final segment sizes\n");
    for (I = 0; I < SegCount; ++I) {
        Segment* Seg = SegmentByIndex (I);
        if (Seg->Size > 0) {
            fprintf (stderr, "GC:   %s: %lu bytes\n",
                     GetString (Seg->Name), Seg->Size);
        }
    }
}



/*****************************************************************************/
/*                               Cleanup                                     */
/*****************************************************************************/



static void Cleanup (void)
/* Free all allocated memory and unmark exports */
{
    unsigned I;

    /* Unmark all exports - use LiveExports collection which only has valid exports */
    for (I = 0; I < CollCount (&LiveExports); ++I) {
        Export* E = CollAt (&LiveExports, I);
        if (E != 0) {
            UnmarkExport (E);
        }
    }

    /* Don't free memory - just clear the collections to avoid double-free */
    CollDeleteAll (&WorkList);
    CollDeleteAll (&LiveExports);
    CollDeleteAll (&LiveRanges);
    CollDeleteAll (&PendingRefs);
}



/*****************************************************************************/
/*                              Main Entry Point                             */
/*****************************************************************************/



void GcCollect (void)
/* Perform garbage collection - remove unreferenced code */
{
    fprintf (stderr, "\n");
    fprintf (stderr, "========================================\n");
    fprintf (stderr, "GC: Starting garbage collection (v6)\n");
    fprintf (stderr, "GC: With symbol import tracking for local labels\n");
    fprintf (stderr, "========================================\n");

    /* Reset statistics */
    TotalBytesRemoved = 0;
    ExportsLive = 0;
    ExportsDead = 0;
    CollDeleteAll (&WorkList);
    CollDeleteAll (&LiveExports);
    CollDeleteAll (&LiveRanges);
    CollDeleteAll (&PendingRefs);

    /* Mark roots */
    MarkRootSymbols ();

    /* Propagate reachability */
    PropagateReachability ();

    /* Build initial live ranges from exports */
    BuildLiveRanges ();

    /* Process section references with transitive closure */
    ProcessPendingSectionRefs ();

    /* Remove dead code */
    RemoveDeadCode ();

    /* Analyze and report */
    AnalyzeExports ();
    ReportSegmentSizes ();

    /* Final report */
    fprintf (stderr, "\n");
    fprintf (stderr, "========================================\n");
    fprintf (stderr, "GC Complete (v6):\n");
    fprintf (stderr, "  Live exports: %u\n", ExportsLive);
    fprintf (stderr, "  Dead exports: %u\n", ExportsDead);
    fprintf (stderr, "  Bytes removed: %lu\n", TotalBytesRemoved);
    fprintf (stderr, "========================================\n");
    fprintf (stderr, "\n");

    /* Cleanup */
    Cleanup ();
}
