/*****************************************************************************/
/*                                                                           */
/*                                   gc.c                                    */
/*                                                                           */
/*              Garbage collection (dead code elimination) for ld65          */
/*                                                                           */
/*  Strategy v8: Export-based GC. Delete fragments within dead export ranges */
/*  Dead export = not marked as live, has Size > 0                           */
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
/*                               Section Offset                              */
/*****************************************************************************/



typedef struct {
    Section *Section;
    unsigned long Offset;
} SectionOffset;



static SectionOffset GetExprSectionOffset (ExprNode* Expr) {
    SectionOffset SO = {0, 0};
    if (Expr == 0) {
        return SO;
    }

    /* Direct section reference */
    if (Expr->Op == EXPR_SECTION) {
        SO.Section = GetExprSection (Expr);
        SO.Offset = 0;
    }

    /* Section + offset (most common case for symbols) */
    if (Expr->Op == EXPR_PLUS) {
        if (Expr->Left->Op == EXPR_SECTION && Expr->Right->Op == EXPR_LITERAL) {
            SO.Section = GetExprSection (Expr->Left);
            SO.Offset = Expr->Right->V.IVal;
        }
        if (Expr->Right->Op == EXPR_SECTION && Expr->Left->Op == EXPR_LITERAL) {
            SO.Section = GetExprSection (Expr->Right);
            SO.Offset = Expr->Left->V.IVal;
        }
    }

    return SO;
}



/*****************************************************************************/
/*                                   Data                                    */
/*****************************************************************************/

/* Work list for reachability analysis */
static Collection ExportsToMarkNextList = STATIC_COLLECTION_INITIALIZER;

/* Live exports collection */
static Collection LiveCodeExports = STATIC_COLLECTION_INITIALIZER;

/* Marked Exports */
static Collection MarkedExports = STATIC_COLLECTION_INITIALIZER;

/*****************************************************************************/
/*                                 Exports                                   */
/*****************************************************************************/
static int IsExportLive (Export* E)
/* Check if an export is marked as live */
{
    return ExportHasMark (E);
}

static void MarkExportLive (Export* E)
/* Mark an export as live and add to worklist if not already marked */
{
    if (E == 0 || ExportHasMark (E)) {
        return;
    }

    const char* Name = GetString (E->Name);
    fprintf (stderr, "GC:   -> Marking %s as live\n", Name);
    MarkExport (E);
    CollAppend (&MarkedExports, E);
    CollAppend (&ExportsToMarkNextList, E);

    {
        SectionOffset SO = GetExprSectionOffset (E->Expr);
        if (SO.Section != 0) {
            CollAppend (&LiveCodeExports, E);
        } else {
            fprintf(stderr, "GC: WARNING: Export %s has no section information\n", Name);
        }
    }
}

static Export* FindExportAtSectionOffset (Section* Sec, unsigned long Offset)
/* Find an export that starts at the given section offset (CODE segment only) */
{
    unsigned I;

    if (Sec == 0 || Sec->Seg == 0) {
        return 0;
    }

    const char* SegName = GetString (Sec->Seg->Name);
    if (strcmp (SegName, "CODE") != 0) {
        return 0;
    }

    /* Search all object files for exports in this section */
    for (I = 0; I < CollCount (&ObjDataList); ++I) {
        ObjData* O = CollAt (&ObjDataList, I);
        unsigned J;
        for (J = 0; J < CollCount (&O->Exports); ++J) {
            Export* E = CollAt (&O->Exports, J);

            SectionOffset SO = GetExprSectionOffset (E->Expr);
            if (SO.Section == Sec && SO.Offset == Offset) {
                return E;
            }
        }
    }

    return 0;
}

static void MarkExportsInExprLive (ExprNode* Expr)
/* Recursively walk expression tree and mark referenced symbols as live */
{
    if (Expr == 0) {
        return;
    }

    /* Recurse into children first */
    if (EXPR_NODETYPE (Expr->Op) == EXPR_BINARYNODE) {
        MarkExportsInExprLive (Expr->Left);
        MarkExportsInExprLive (Expr->Right);
    } else if (EXPR_NODETYPE (Expr->Op) == EXPR_UNARYNODE) {
        MarkExportsInExprLive (Expr->Left);
    }

    /* Handle symbol references */
    if (Expr->Op == EXPR_SYMBOL) {
        Export* E = GetExprExport (Expr);
        MarkExportLive (E);
    }

    /* Handle EXPR_SECTION + EXPR_LITERAL pattern (section offset reference) */
    SectionOffset SO = GetExprSectionOffset(Expr);

    if (SO.Section != 0) {
        Export* E = FindExportAtSectionOffset (SO.Section, SO.Offset);
        if (E != 0) {
            MarkExportLive (E);
        } else {
            // fprintf(stderr, "GC: WARNING: No export at section %s + %lu\n",
            //         GetString (SO.Section->Seg->Name), SO.Offset);
        }
    }
}

/* Dead export ranges - ranges of bytes to delete within a section */
typedef struct {
    Section*        Sec;
    Export*        Exp;
    unsigned long   Start;
    unsigned long   End;
} DeadRange;

static DeadRange* NewDeadRange (Export* Exp, Section* Sec, unsigned long Start, unsigned long End)
/* Create a new dead range */
{
    DeadRange* DR = xmalloc (sizeof (DeadRange));
    DR->Sec = Sec;
    DR->Exp = Exp;
    DR->Start = Start;
    DR->End = End;
    return DR;
}



// static void FreeDeadRange (DeadRange* DR)
// /* Free a dead range */
// {
//     xfree (DR);
// }



static DeadRange* FindDeadRange (Collection* DeadRanges, SectionOffset SO) {
    unsigned I;
    for (I = 0; I < CollCount (DeadRanges); ++I) {
        DeadRange* DR = CollAt (DeadRanges, I);
        if (DR->Sec == SO.Section && SO.Offset >= DR->Start && SO.Offset < DR->End) {
            return DR;
        }
    }

    return 0;
}



/*****************************************************************************/
/*                        Removed Fragment Accounting                        */
/*****************************************************************************/



typedef struct RemovalRange RemovalRange;
struct RemovalRange {
    unsigned long   Start;  /* Offset within the section before GC */
    unsigned long   Len;    /* Length of the removed fragment */
};



/*****************************************************************************/
/*                         Section Reference Extraction                      */
/*****************************************************************************/



/*****************************************************************************/
/*                            Root Symbol Marking                            */
/*****************************************************************************/
static void MarkRootSymbols (void)
/* Mark root segments' symbols and ConDes symbols as live */
{
    unsigned I, J;
    unsigned SegCount = SegmentCount ();

    fprintf (stderr, "GC: Marking root segments\n");

    /* Walk all symbols in non-CODE segment and mark referenced symbols */
    for (I = 0; I < SegCount; ++I) {
        Segment* Seg = SegmentByIndex (I);
        const char* SegName = GetString (Seg->Name);

        if (strcmp (SegName, "CODE") == 0) {
            continue;
        }

        for (J = 0; J < CollCount (&Seg->Sections); ++J) {
            Section* Sec = CollAt (&Seg->Sections, J);
            Fragment* F;

            for (F = Sec->FragRoot; F != 0; F = F->Next) {
                if (F->Type != FRAG_EXPR && F->Type != FRAG_SEXPR) {
                    continue;
                }

                MarkExportsInExprLive (F->Expr);
            }
        }
    }

    fprintf (stderr, "GC: Marking constructor/destructor symbols\n");

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
             CollCount (&ExportsToMarkNextList));
}



void SetExprSectionOffset (ExprNode *Expr, SectionOffset SO) {
    if (Expr == 0) {
        return;
    }

    /* Direct section reference */
    if (Expr->Op == EXPR_SECTION) {
        /* Nothing to do, offset is zero */
        assert(SO.Offset == 0);
        return;
    }

    /* Section + offset (most common case for symbols) */
    if (Expr->Op == EXPR_PLUS) {
        if (Expr->Left->Op == EXPR_SECTION && Expr->Right->Op == EXPR_LITERAL) {
            Expr->Right->V.IVal = SO.Offset;
            return;
        }
        if (Expr->Right->Op == EXPR_SECTION && Expr->Left->Op == EXPR_LITERAL) {
            Expr->Left->V.IVal = SO.Offset;
            return;
        }
        fprintf(stderr, "GC: WARNING: Export has unexpected EXPR_PLUS expression\n");
    }

    /* Unreachable because the expression should be accepted by GetExprSectionOffset first */
    assert(0);
}



/*****************************************************************************/
/*                         Reachability Propagation                          */
/*****************************************************************************/



static int max(int a, int b) {
    return (a > b) ? a : b;
}



static void PropagateReachability (void)
/* Process worklist and mark symbols referenced by live symbols as live */
{
    fprintf (stderr, "GC: Propagating reachability\n");

    while (CollCount (&ExportsToMarkNextList) > 0) {
        Export* E = CollPop (&ExportsToMarkNextList);
        fprintf(stderr, "GC: Processing export %s\n", GetString(E->Name));

        SectionOffset SO = GetExprSectionOffset(E->Expr);
        if (SO.Section == 0) {
            continue;
        }

        Fragment* F;
        unsigned Offset = 0;
        for (F = SO.Section->FragRoot; F != 0; F = F->Next) {
            /* For exports not reporting their size correctly, use a conservative estimate */
            if (Offset >= SO.Offset + max(100000, E->Size)) {
                break;
            }

            if (Offset < SO.Offset) {
                Offset += F->Size;
                continue;
            }
            if (F->Type != FRAG_EXPR && F->Type != FRAG_SEXPR) {
                Offset += F->Size;
                continue;
            }

            /* Mark symbols referenced by fragments within this export */
            MarkExportsInExprLive (F->Expr);
            Offset += F->Size;
        }
    }
}





/*****************************************************************************/
/*                           Dead Code Removal                               */
/*****************************************************************************/



typedef struct {
    Export* Exp;
    Fragment* Frag;
} ExportedFragment;



/* Section offset table for tracking adjustments per section */
typedef struct {
    Section*    Sec;
    Collection  Offsets;    /* Collection of OffsetEntry* */
} SectionOffsetTable;



static int CompareSectionOffset (void* Data attribute ((unused)), const void* A, const void* B)
{
    const SectionOffset* SA = A;
    const SectionOffset* SB = B;
    /* Forgive me unspecified behavior... */
    if (SA->Section < SB->Section) return -1;
    if (SA->Section > SB->Section) return 1;
    if (SA->Offset < SB->Offset) return -1;
    if (SA->Offset > SB->Offset) return 1;
    return 0;
}



static int CompareExportedFragment (void* Data attribute ((unused)), const void* A, const void* B)
{
    const ExportedFragment* EFA = A;
    const ExportedFragment* EFB = B;
    /* Forgive me unspecified behavior... */
    if (EFA->Frag < EFB->Frag) return -1;
    if (EFA->Frag > EFB->Frag) return 1;
    return 0;
}



static void RemoveDeadCode (void)
/* Remove fragments in dead export ranges, adjusting Expr offsets */
{
    unsigned I, J;
    unsigned long TotalKept = 0;
    unsigned long TotalRemoved = 0;

    fprintf (stderr, "GC: Collecting dead export ranges\n");

    /* ============================================================
     * Phase 1: Collect all dead export ranges (not live, size > 0)
     * ============================================================ */
    Collection DeadRanges = STATIC_COLLECTION_INITIALIZER;
    for (I = 0; I < CollCount (&ObjDataList); ++I) {
        ObjData* O = CollAt (&ObjDataList, I);
        for (J = 0; J < CollCount (&O->Exports); ++J) {
            Export* E = CollAt (&O->Exports, J);

            /* Skip if live or size is too small (maybe just assembly) */
            if (IsExportLive (E) || E->Size < 10) {
                continue;
            }

            /* Get section and offset */
            SectionOffset SO = GetExprSectionOffset (E->Expr);

            if (!SO.Section) {
                continue;
            }

            const char* SegName = GetString (SO.Section->Seg->Name);
            if (strcmp (SegName, "CODE") == 0) {
                DeadRange* DR = NewDeadRange (E, SO.Section, SO.Offset, SO.Offset + E->Size);
                CollAppend (&DeadRanges, DR);
                fprintf (stderr, "GC:   Dead export '%s' at 0x%lX-0x%lX (size %u)\n",
                            GetString (E->Name), SO.Offset, SO.Offset + E->Size, E->Size);
            }
        }
    }

    fprintf (stderr, "GC: Collected %u dead export ranges\n", CollCount (&DeadRanges));

    fprintf (stderr, "GC: Removing dead code\n");

    /* Collect fragments to remove - iterate CODE segments and check if fragment offset is in dead range */
    Collection FragmentsToRemove = STATIC_COLLECTION_INITIALIZER;
    for (I = 0; I < SegmentCount (); ++I) {
        Segment* Seg = SegmentByIndex (I);
        const char* SegName = GetString (Seg->Name);
        if (strcmp (SegName, "CODE") != 0) {
            continue;
        }

        for (J = 0; J < CollCount (&Seg->Sections); ++J) {
            Section* Sec = CollAt (&Seg->Sections, J);
            Fragment* F = Sec->FragRoot;
            unsigned long CurrentOffset = 0;
            while (F != 0) {
                /* Check if this fragment's offset falls within a dead range */
                SectionOffset FragSO = { Sec, CurrentOffset };
                DeadRange* DR = FindDeadRange (&DeadRanges, FragSO);
                if (!DR) {
                    TotalKept += F->Size;
                } else {
                    TotalRemoved += F->Size;
                    ExportedFragment *EF = xmalloc (sizeof (ExportedFragment));
                    EF->Exp = DR->Exp;
                    EF->Frag = F;
                    CollAppend (&FragmentsToRemove, EF);
                }

                CurrentOffset += F->Size;
                F = F->Next;
            }
        }
    }
    CollSort (&FragmentsToRemove, CompareExportedFragment, 0);

    /* Create a map from sequence number to original offset */
    Collection OriginalOffsets = STATIC_COLLECTION_INITIALIZER;
    for (I = 0; I < CollCount (&LiveCodeExports); ++I) {
        Export* E = CollAt (&LiveCodeExports, I);
        SectionOffset *SO = xmalloc (sizeof (SectionOffset));
        *SO = GetExprSectionOffset (E->Expr);
        assert (SO->Section != 0);

        /* Check for duplicates */
        unsigned InsertionPoint = CollLowerBound (&OriginalOffsets, SO, CompareSectionOffset, 0);
        if (InsertionPoint < CollCount (&OriginalOffsets)
            && CompareSectionOffset (0, SO, CollAt (&OriginalOffsets, InsertionPoint)) == 0) {
            xfree (SO);
            continue;
        }
        CollInsert (&OriginalOffsets, SO, InsertionPoint);
    }

    /* Assert OriginalOffsets are sorted (correctly inserted) */
    for (I = 1; I < CollCount (&OriginalOffsets); ++I) {
        SectionOffset* Prev = CollAt (&OriginalOffsets, I - 1);
        SectionOffset* Curr = CollAt (&OriginalOffsets, I);
        assert (CompareSectionOffset (0, Prev, Curr) < 0);
    }

    /* Prepare a map from sequence number to shifted offset. Just copy for now */
    Collection ShiftedOffsets = STATIC_COLLECTION_INITIALIZER;
    for (I = 0; I < CollCount (&OriginalOffsets); ++I) {
        SectionOffset* SO = CollAt (&OriginalOffsets, I);
        SectionOffset* NewSO = xmalloc (sizeof (SectionOffset));
        NewSO->Section = SO->Section;
        NewSO->Offset = SO->Offset;
        CollAppend (&ShiftedOffsets, NewSO);
    }

    /* Unlink unused fragments in CODE segment */
    for (I = 0; I < SegmentCount (); ++I) {
        Segment* Seg = SegmentByIndex (I);
        const char* SegName = GetString (Seg->Name);
        if (strcmp (SegName, "CODE") != 0) {
            continue;
        }

        for (J = 0; J < CollCount (&Seg->Sections); ++J) {
            Section* Sec = CollAt (&Seg->Sections, J);

            Fragment* F = Sec->FragRoot;
            unsigned long CurrentOffset = 0;
            unsigned long CurrentShiftedOffset = 0;
            Fragment *PrevF = 0;
            while (F != 0) {
                /* Create a temporary structure for binary search */
                ExportedFragment SearchKey = { 0, F };
                unsigned ToRemoveIndex = CollBinarySearch (&FragmentsToRemove, &SearchKey, CompareExportedFragment, 0);
                int ShouldRemove = (ToRemoveIndex < CollCount (&FragmentsToRemove));

                if (!ShouldRemove) {
                    /* Keep the fragment */
                    CurrentOffset += F->Size;
                    CurrentShiftedOffset += F->Size;
                    PrevF = F;
                    F = F->Next;
                    continue;
                }

                /* Remove the fragment from the section */
                Fragment* NextF = F->Next;
                if (PrevF == 0) {
                    Sec->FragRoot = NextF;
                } else {
                    PrevF->Next = NextF;
                }
                if (NextF == 0) {
                    Sec->FragLast = PrevF;
                }
                CurrentOffset += F->Size;
                /* Don't update PrevF - it stays the same after removal */
                F = NextF;

                /* Update exports if this is start of export */
                SectionOffset SearchSO = { Sec, CurrentShiftedOffset };
                unsigned SOIndex = CollBinarySearch (&ShiftedOffsets, &SearchSO, CompareSectionOffset, 0);
                if (SOIndex < CollCount (&ShiftedOffsets)) {
                    /* Invariant: This keep ShiftedOffsets sorted */
                    SectionOffset* SO = CollAt (&ShiftedOffsets, SOIndex);
                    SO->Offset = CurrentShiftedOffset;
                }
            }
        }
    }

    /* DEBUG: Dump all shifted offsets */
    for (I = 0; I < CollCount (&ShiftedOffsets); ++I) {
        SectionOffset* OSO = CollAt (&OriginalOffsets, I);
        SectionOffset* SSO = CollAt (&ShiftedOffsets, I);
        fprintf(stderr, "GC:   Shifted Offset for Section %s: %lx -> %lx\n",
                GetString(OSO->Section->Seg->Name), OSO->Offset, SSO->Offset);
    }

    /* Adjust all references */
    for (I = 0; I < SegmentCount (); ++I) {
        Segment* Seg = SegmentByIndex (I);
        const char* SegName = GetString (Seg->Name);
        if (strcmp (SegName, "CODE") != 0) {
            continue;
        }

        for (J = 0; J < CollCount (&Seg->Sections); ++J) {
            Section* Sec = CollAt (&Seg->Sections, J);
            Fragment* F = Sec->FragRoot;

            fprintf(stderr, "GC: Adjusting expressions in Section %s\n", GetString(Sec->Seg->Name));

            while (F != 0) {
                if (F->Type != FRAG_EXPR && F->Type != FRAG_SEXPR) {
                    F = F->Next;
                    continue;
                }

                SectionOffset SO = GetExprSectionOffset (F->Expr);
                if (SO.Section == 0) {
                    F = F->Next;
                    continue;
                }

                assert(OriginalOffsets.Count == ShiftedOffsets.Count);
                unsigned OriginalIndex = CollBinarySearch (&OriginalOffsets, &SO, CompareSectionOffset, 0);
                if (OriginalIndex >= CollCount (&OriginalOffsets)) {
                    fprintf(stderr, "GC: WARNING: Could not find original offset for Section %s + %lu\n", GetString(SO.Section->Seg->Name), SO.Offset);
                    F = F->Next;
                    continue;
                }
                SectionOffset* ShiftedOffset = CollAt (&ShiftedOffsets, OriginalIndex);
                // SetExprSectionOffset(F->Expr, *ShiftedOffset);
                fprintf(stderr, "GC:   Adjusted Expr in fragment at Section %s + %lu to new offset %lu\n",
                        GetString(SO.Section->Seg->Name), SO.Offset, ShiftedOffset->Offset);
                F = F->Next;
            }
        }

    }

    /* Recalculate section and segment sizes */
    for (I = 0; I < SegmentCount (); ++I) {
        Segment* Seg = SegmentByIndex (I);
        const char* SegName = GetString (Seg->Name);

        if (strcmp (SegName, "CODE") != 0) {
            continue;
        }

        Seg->Size = 0;
        for (J = 0; J < CollCount (&Seg->Sections); ++J) {
            Section* Sec = CollAt (&Seg->Sections, J);

            /* Recalculate section size from fragments */
            unsigned long SecSize = 0;
            Fragment* F;
            for (F = Sec->FragRoot; F != 0; F = F->Next) {
                SecSize += F->Size;
            }
            Sec->Size = SecSize;

            Sec->Fill = AlignCount (Seg->Size, Sec->Alignment);
            Seg->Size += Sec->Fill;
            Sec->Offs = Seg->Size;
            Seg->Size += Sec->Size;
        }
    }
}


/*****************************************************************************/
/*                           Analysis and Report                             */
/*****************************************************************************/



static void AnalyzeExports (void)
/* Count live/dead exports */
{
    unsigned I, J;

    fprintf (stderr, "GC: Live CODE symbols:\n");

    for (I = 0; I < CollCount (&ObjDataList); ++I) {
        ObjData* O = CollAt (&ObjDataList, I);

        for (J = 0; J < CollCount (&O->Exports); ++J) {
            Export* E = CollAt (&O->Exports, J);
            const char* SymName = GetString (E->Name);

            SectionOffset SO = GetExprSectionOffset (E->Expr);
            if (SO.Section == 0) {
                continue;
            }

            Segment* Seg = SO.Section->Seg;
            const char* SegName = GetString (Seg->Name);

            if (strcmp (SegName, "CODE") == 0) {
                if (IsExportLive (E)) {
                    fprintf (stderr, "GC:   Live: %s (size=%u)\n",
                                SymName, E->Size);
                } else {
                }
            }
        }
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

    /* Unmark all exports - use LiveCodeExports collection which only has valid exports */
    for (I = 0; I < CollCount (&MarkedExports); ++I) {
        Export* E = CollAt (&MarkedExports, I);
        // fprintf(stderr, "GC:   -> Unmarking %s\n", GetString(E->Name));
        UnmarkExport (E);
    }

    /* Clear the collections */
    CollDeleteAll (&ExportsToMarkNextList);
    CollDeleteAll (&LiveCodeExports);
    CollDeleteAll (&MarkedExports);
}



/*****************************************************************************/
/*                              Main Entry Point                             */
/*****************************************************************************/



void GcCollect (void)
/* Perform garbage collection - remove unreferenced code */
{
    fprintf (stderr, "\n");
    fprintf (stderr, "========================================\n");
    fprintf (stderr, "GC: Starting garbage collection (v8)\n");
    fprintf (stderr, "GC: Export-based dead code removal\n");
    fprintf (stderr, "========================================\n");

    CollDeleteAll (&ExportsToMarkNextList);
    CollDeleteAll (&LiveCodeExports);

    /* Mark roots */
    MarkRootSymbols ();

    /* Propagate reachability */
    PropagateReachability ();

    /* Remove dead code */
    RemoveDeadCode ();

    /* Analyze and report */
    AnalyzeExports ();
    ReportSegmentSizes ();

    /* Final report */
    fprintf (stderr, "\n");
    fprintf (stderr, "========================================\n");
    fprintf (stderr, "GC Complete (v8)\n");
    fprintf (stderr, "========================================\n");
    fprintf (stderr, "\n");

    /* Cleanup */
    Cleanup ();
}
