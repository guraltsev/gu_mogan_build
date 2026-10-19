**Branch:** `pr/line-breaker-shared-hyphen-state` (1 commit, `38c9316eb`) -> `MoganLab/mogan:main`

**Title:** `[NNNN] Fix paragraphs that do not wrap: give each hyphenation point its own lb_info`

---

## Summary

A two-file change: a fix in `src/Typeset/Line/line_breaker.cpp` (4 lines added, 1 removed), and **three regression
tests** in `tests/Typeset/Line/line_breaker_test.cpp` (129 lines added, 2 removed). All three tests fail on
`upstream/main` and pass with the fix. A minimal reproduction document and its PDF exports
before and after are attached (see "Reproduction files").

## What happened

Some ordinary paragraphs were not wrapped: the whole paragraph came out as one line wider than
the page, with a break only at a hyphenation point near its end (`bound-` / `aries`). It depends
on the exact text and line width. In a 93-page paper, paragraphs ended up outside the page.

## Cause, and how it was introduced

`c87f08744` (PR #4711, [6018], "optimise the line-breaking algorithm: introduce an array index
for atomic paths and avoid useless hyphenation of single characters") is a performance change.
Its description says line breaking was a main bottleneck when typesetting large documents: almost
every break position is an atomic path `path (i)`, and each test of a break cost heap allocations
of one-element list nodes and up to four hash-map reads/writes on the same key. On a document
with 89,000 paragraphs it reports `line_breaks` falling from 14.6 s to 3.6 s. It did two things:

- **Speed.** Break positions that are plain word boundaries (atomic paths such as `[17]`) now live
  in an array, `atom_best`, instead of the path-keyed hash map. Only hyphenation points
  (compound paths such as `[30, 4]`) stay in the map `best`. The places that read or update a
  position's record were changed to go through a new helper, `get_lb_info`.
- **CJK.** `can_hyphenate` stops the breaker from generating hyphenation candidates inside a
  single CJK character, whose internal form `<#4E00>` is longer than the old `N (s) > 4` limit.

Before the commit, `test_better` created the record of a new position explicitly:

```cpp
if (!best->contains (new_pos)) best (new_pos)= lb_info ();   // fresh object
lb_info cur= best[new_pos];
```

The helper replaced both lines by `return best (pos)` for non-atomic paths. That looks the same,
but `best (pos)` (non-const `operator()`) creates a missing entry by copying the map's default
value, and `lb_info` is a reference-counted handle (`CONCRETE`), so the copy shares the default
object. After the commit **every hyphenation position of a paragraph shares one record**:
updating the best break of one hyphen point changed all of them, and the chain of breaks
followed `prev` into a position that had never been proposed from there. Atomic positions are
in `atom_best`, an array of distinct objects, and were not affected.

Neither the PR description nor the commit message discusses the dropped guard, and the PR has no
comments or reviews, so why it was dropped is a reading of the diff, not the author's stated
intent. The most likely reason is that the repeated hash-map accesses in `test_better` (the
`contains`, the assignment and the read) were exactly what the PR set out to remove, and the
`contains` check was folded away together with them. For atomic positions that is correct, since
`atom_best` is pre-allocated. For hyphenation positions the check was doing real work.

This change keeps the optimisation: atomic positions still use the array, with no hash-map
access. Only the first proposal for a hyphenation point pays one `contains` and one assignment,
as it did before #4711.

Why it was not noticed:

- The four tests added with the commit never reach a hyphenation candidate: they use items
  without a language, or CJK mock boxes for which `can_hyphenate` is false.
- It shows only when the breaker evaluates a hyphenation candidate and the best layout needs
  one, which depends on the exact text and width. Most paragraphs lay out normally.
- The commit's goal (speed) was met.


## Reproduction files (attach to the PR)

- `repro.tmu`: the minimal document. One paragraph of plain text, style `generic`, no math,
  no references, `page-medium = paper`.
- `repro-before.pdf`: `MoganSTEM -headless -c repro.tmu` on `upstream/main` (`c68a494fc`). The
  first line runs past the right margin and is clipped; only `aries` is on the second line.
- `repro-after.pdf`: the same command with this change. Three lines, wrapped at the margin
  (`... bound-` / `aries`).
  
## Change

`src/Typeset/Line/line_breaker.cpp`:

- `test_better` allocates a fresh `lb_info` for a position that is not atomic (or is out of the
  atomic range) and not yet in `best`.
- `get_lb_info` reads with `best[pos]` again (no insertion on read), exactly the behaviour before
  `c87f08744`. The atomic-path array and `can_hyphenate` from that commit are unchanged.

`tests/Typeset/Line/line_breaker_test.cpp`: three regression tests, described next.


## Speed

The fix must not give back what #4711 gained, so it was measured two ways. A generated
lorem-ipsum document with 89,000 paragraphs (30-130 words each, a few very long words) was used.
All builds are `releasedbg` on the same machine, with their own settings and cache folders.

- **Typesetting inside the application** (Mogan's own benchmark line `typeset: br->typeset`,
  headless PDF export, one run each):

  | Build | `br->typeset` | PDF pages |
  |---|---|---|
  | `upstream/main` (with #4711, without this fix) | 96.3 s | 8,196 |
  | `upstream/main` + this fix | 99.9 s | 12,104 |

  The fixed build lays out 48 % more pages, because the unfixed build loses about 30 % of the
  text off the page (see below), for 4 % more typesetting time.
- **`line_breaks` alone** (a temporary benchmark, not part of this PR, calling `line_breaks` on
  20,000 paragraphs built from real `text_box` items; 3 runs each): `upstream/main` 41.7-41.9 s,
  with this fix 40.2-41.5 s, so no measurable difference per call. The unfixed code returns
  76,692 lines in total where the fixed code returns 174,392 for the same input: the unfixed
  breaker collapses most paragraphs to too few lines.

Whole-document correctness on the same 89,000-paragraph document: the text extracted from the
PDF of the fixed build is identical (735,654 lines) to that of the build just before #4711
(`c87f08744^`), while the unfixed `upstream/main` yields 520,697 lines and 8,196 pages instead of
12,104.


## Regression tests

`tests/Typeset/Line/line_breaker_test.cpp`: three new tests that use real `text_box` items with
the roman font and the real hyphenation patterns, as in the editor. A shared helper,
`check_paragraph_wraps`, sets up the paragraph, sweeps the line width over 101 values
(paragraph width divided by 1.50 ... 4.50) and requires, for every width:

- the breaks start at `path (0)`, end at `path (n)` and are monotonic;
- there are at least as many lines as the total width needs (at most a line width + 25 %);
- no line (the hyphenated fragments at its two ends are not counted) is more than 25 % wider
  than `large_width`.

| Test | Paragraph | Language |
|---|---|---|
| `test_hyphenation_keeps_lines_within_width` | the 28-word minimal reproduction | English |
| `test_hyphenation_long_paragraph` | 60 words, many hyphenation candidates | English |
| `test_hyphenation_german_compounds` | long compounds, nearly every word has several hyphen points | German |

The monotonic-break and line-count checks are an extra net; the width check
is what detects the bug.


## Verified (Windows 11, `releasedbg`)

- **Without the change, all three new tests fail; with it they pass** (9 passed, 0 failed in
  the file; the 4 existing tests still pass). Without the change, the first failures are at
  `k=207` (a line 1.40 times the limit), `k=324` (2.06 times) and `k=264` (1.36 times) for the
  three tests; `k` is 100 x paragraph width / line width.
- Reproduction paragraph (`repro.tmu`, headless PDF export): before, one 124-character first
  line and a lone `aries`; after, `... along bound-` / `aries` on proper lines.
- A 93-page paper exported to PDF before and after: a paragraph that was entirely outside the
  page before is now on the page; the document grows from 93 to 94 pages.
- Right-to-left text: a Hebrew paragraph, an Arabic paragraph, and a mixed Hebrew/English/Arabic
  paragraph export **byte-identical text** before and after. The change does not touch any
  direction logic: line breaking works on the logical item list, and `src/Typeset` contains no
  bidi code.


## Not checked

- Speed relative to the build before #4711 was not measured separately from the whole export
  (250 s, dominated by writing the PDF); that build has no `typeset:` benchmark lines.
- Mogan's GUI was not opened on the fixed build (the reproduction is headless PDF export, which
  uses the same typesetter).
- The paper was compared by eye on one page and by text extraction over the whole document, not
  pixel by pixel.
- Only English and German hyphenation were exercised by the tests (the code path does not depend
  on the language).
- The tests use `roman` at 10 pt, 600 dpi. Widths in other fonts differ, but the property tested
  does not depend on the font.
- The 89,000-paragraph document from #4711 was not available; a generated lorem-ipsum document
  of the same size was used instead (see "Speed"), so the absolute numbers are not comparable
  with those in #4711.
- Why the guard was dropped is inferred from the diff and PR text, not stated by the author.

## How this fix was made

Developed through human-aided debugging, code written using Claude Sonnet 5.5, reviewed and
tested by the user.
