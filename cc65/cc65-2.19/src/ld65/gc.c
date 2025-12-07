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

/* common */
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
                /* For zero-sized exports, use a very large default to ensure we don't delete anything important */
                if (Size == 0) {
                    Size = 65536;  /* Use maximum possible to be safe */
                    fprintf (stderr, "GC:   Zero-sized export '%s' at offset %lu, using size %lu\n",
                             GetString (E->Name), Offset, Size);
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



static void RemoveDeadCode (void)
/* Remove fragments that are not in live ranges */
{
    unsigned I, J;
    unsigned SegCount = SegmentCount ();
    unsigned long TotalRemoved = 0;
    unsigned FragsRemoved = 0;
    unsigned FragsKept = 0;

    fprintf (stderr, "GC: Phase 6 - Removing dead code\n");
    fprintf (stderr, "GC: Debug - will check fragments and log removals\n");

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
            unsigned long OldOffset = 0;
            unsigned long NewOffset = 0;
            unsigned long SectionBytesRemoved = 0;

            /* Build offset adjustment map for this section */
            /* Key: old offset -> value: bytes removed before this offset */
            unsigned long* OffsetAdjustments = xmalloc(sizeof(unsigned long) * 65536);
            unsigned long AdjustmentCount = 0;
            unsigned long CurrentAdjustment = 0;

            /* First pass: determine which fragments to remove and build adjustment map */
            F = Sec->FragRoot;
            OldOffset = 0;
            while (F != 0) {
                unsigned long FragEnd = OldOffset + F->Size;
                int FragLive = 0;
                unsigned long CheckOffset;

                /* Check if any part of this fragment is in a live range */
                for (CheckOffset = OldOffset; CheckOffset < FragEnd; ++CheckOffset) {
                    if (IsOffsetLive (Sec, CheckOffset)) {
                        FragLive = 1;
                        break;
                    }
                }

                if (!FragLive) {
                    /* This fragment will be removed */
                    CurrentAdjustment += F->Size;
                }

                /* Store adjustment for this offset */
                if (AdjustmentCount < 65536) {
                    OffsetAdjustments[AdjustmentCount++] = CurrentAdjustment;
                }

                OldOffset = FragEnd;
                F = F->Next;
            }

            /* Second pass: actually remove fragments and update offsets */
            F = Sec->FragRoot;
            OldOffset = 0;
            NewOffset = 0;
            while (F != 0) {
                unsigned long FragEnd = OldOffset + F->Size;
                int FragLive = 0;
                unsigned long CheckOffset;

                Next = F->Next;

                /* Check if any part of this fragment is in a live range */
                for (CheckOffset = OldOffset; CheckOffset < FragEnd; ++CheckOffset) {
                    if (IsOffsetLive (Sec, CheckOffset)) {
                        FragLive = 1;
                        break;
                    }
                }

                if (FragLive) {
                    /* Keep this fragment */
                    Prev = F;
                    NewOffset += F->Size;
                    FragsKept++;
                } else {
                    /* Remove this fragment */
                    SectionBytesRemoved += F->Size;
                    TotalRemoved += F->Size;
                    FragsRemoved++;

                    /* Unlink from list */
                    if (Prev == 0) {
                        Sec->FragRoot = Next;
                    } else {
                        Prev->Next = Next;
                    }

                    if (Sec->FragLast == F) {
                        Sec->FragLast = Prev;
                    }
                }

                OldOffset = FragEnd;
                F = Next;
            }

            /* Update section size */
            Sec->Size -= SectionBytesRemoved;

            /* Export offset adjustment removed - not needed for cross-section references */

            xfree(OffsetAdjustments);
        }

        /* Recalculate segment size */
        unsigned long OldSegSize = Seg->Size;
        Seg->Size = 0;
        for (J = 0; J < CollCount (&Seg->Sections); ++J) {
            Section* Sec = CollAt (&Seg->Sections, J);
            Seg->Size += Sec->Size;
        }
        fprintf (stderr, "GC:   Segment '%s': old size 0x%lX (%lu), new size 0x%lX (%lu)\n",
                SegName, OldSegSize, OldSegSize, Seg->Size, Seg->Size);
    }

    TotalBytesRemoved = TotalRemoved;
    fprintf (stderr, "GC: Removed %u fragments (%lu bytes), kept %u fragments\n",
             FragsRemoved, TotalRemoved, FragsKept);
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
    unsigned I, J;

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
