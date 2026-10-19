**Title:** `[NNNN] Some paragraphs are not wrapped: one very long line that only breaks at a hyphenation point`

**Labels (suggested):** bug, typesetting

---

## Summary

Since `c87f08744` ([6018], 2026-10-12) some ordinary paragraphs are not line-broken. The paragraph
is laid out as a single line that runs past the right margin (off the page in a PDF, off the
window in the editor) and only breaks at a hyphenation point near the end of that line, e.g.
`bound-` / `aries`. Which paragraphs are hit depends on the exact text and line width; adding or
removing a single word, or resizing the window, can make it go away or appear. The text of the
paragraph can be plain, with no math, no references and no special style.

## Environment

Mogan STEM from `upstream/main` at `c68a494fc` (clean worktree, no local patches), Windows 11,
Qt 6.8.3, `releasedbg` build. Reproduced from the editor and from headless PDF export. Also
reproduced on a second, independently built copy of the same commit.

## Steps to reproduce

1. Save the attached `repro.tmu` and open it, or export it headless:
   `MoganSTEM.exe -headless -c repro.tmu out.pdf`.
   Its body is one paragraph, style `generic`, `page-medium = paper`:

   > where are Schwartz functions on the real line. This operator arises in diverse contexts:
   > averages of  over yield relevant correction terms for evaluating Cauchy integrals alonggggg
   > boundarie boundaries

2. Look at the first line.

## Expected

The paragraph wraps at the right margin like any other paragraph (the same paragraph without
`alonggggg ` wraps correctly into two lines).

## Actual

The first line is about 125 characters wide where the page holds about 100. It extends past the
right margin and the PDF clips it. Only the tail `aries` is on a second line (`bound-aries` hyphen
break). `pdftotext -layout` of the export:

```
where are Schwartz functions on the real line. This operator arises in diverse contexts: averages of over yield relevant cor...
aries
```

A real document (a 93-page paper) loses whole paragraphs this way: in the PDF export of one page
a paragraph that is present in the source is missing, because its single line is entirely outside
the page.

## Files

`repro.tmu` is the minimal document. `repro-before.pdf` is its export from `upstream/main`
(`c68a494fc`) showing the problem; `repro-after.pdf` is the export with the fix.

## Cause

`line_breaker.cpp` keeps, for every candidate break position, a record `lb_info` (best previous
break, penalty, accumulated space cost). Atomic positions live in the array `atom_best`;
hyphenation positions (paths like `[30, 4]`) live in the hash map `best`.

`lb_info` is a reference-counted handle (`CONCRETE`), so copying it shares the object. A
`hashmap` creates a new entry by copying its default value. Before `c87f08744`, `test_better`
guarded against this:

```cpp
if (!best->contains (new_pos)) best (new_pos)= lb_info ();   // fresh object per position
lb_info cur= best[new_pos];
```

`c87f08744` replaced both lines by `get_lb_info (new_pos)`, which for non-atomic paths returns
`best (pos)`. The entry is created from the shared default, so **all hyphenation positions of
the paragraph share one record**. A proposal for any one of them overwrites the best
penalty/previous break of all of them, and the final chain of breaks (`get_breaks`, following
`prev`) can point at a break that is not actually reachable.

Evidence from the log of an instrumented build, for the reproduction paragraph (31 items): the
proposals for `[16,3]` and for `[30,4]`, two different hyphenation points, print the same
`curpen=10000 curspc=31684`, and the result is

```
END N=31 breaks=[ [ 0 ], [ 30, 4 ], [ 31 ] ]
```

i.e. line 1 runs from item 0 to the hyphen point in item 30 (the whole paragraph minus the last
word fragment), although no proposal from `[0]` to `[30,4]` was ever made: the record of `[30,4]`
had inherited `prev = [0]` from the proposal for `[16,3]`.

## Notes

- Not related to the style (`preview-ref`, `smart-ref`), `eqref`, math, `page-medium` or the
  window width: those only changed the text length enough to hide or show the problem.
- The paragraph does not need hyphenation to be wrapped. The bug needs the breaker to consider a
  hyphenation candidate (the next word does not fit), which is why it appears only for some
  widths.

## How this report was made

Developed through human-aided debugging, text drafted using Claude Sonnet 5.5, reviewed and
tested by the user.
