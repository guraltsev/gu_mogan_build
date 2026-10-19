**Branch:** `pr/amsmath-aligned-gathered` (1 commit, `115c45b0e`) -> `MoganLab/mogan:main`

**Title:** `[NNNN] Support amsmath aligned and gathered: gathered macro, LaTeX import and export`

---

## What happened

When writing displayed equations of several lines that share **one** equation number, I
found that Mogan had no environment for it: `gather` numbers every line, and `aligned`
needs an `&` on each line or the lines are pushed to the right. LaTeX users solve this
with `\begin{gathered}` inside `equation`. When I tried importing LaTeX that uses
`aligned` or `gathered`, the results were also wrong: `gathered` came in as one
unbroken line of text, and the optional `[t]`/`[b]` position of `aligned` was lost or
left as a stray argument.

## Problem

1. There is no way to put several **centered** rows under a **single** equation number.
   `gather` numbers every row; `aligned*` aligns at `&`, and a row without `&` is
   right-aligned. amsmath's `gathered` (inside `equation`) is exactly that.
2. LaTeX import turns `\begin{aligned}` into a generic `tabular*` table. That loses the
   native `aligned` macro's right/left column layout and zero outer padding, so a leading
   or trailing `&` produces visible extra width.
3. The optional position argument (`\begin{aligned}[t]`, `[b]`, `[c]`) is not handled:
   the importer renames the environment to `aligned*` once it has consumed the argument
   and `finalize_pmatrix` only matched the plain name, so the table is built by a
   generic path that leaves the argument behind as a stray macro argument
   (`<aligned|t|<tformat|...>>`) and drops the vertical position.
4. `\begin{gathered}` is imported as an unsplit blob (`a=b<next-line>c=d`).

## Change

- **`env-math.stem`:** new `gathered` macro (16 lines): like `aligned*` but with a
  single centered column. Used as `(equation (document (gathered (tformat (table ...)))))`.
- **`convert-latex-drd.scm`:** declare the `amsmath` dependency for `begin-aligned` and
  `begin-gathered`. **`convert-latex-command-drd.scm`:** add both to
  `latex-environment-0*%` (environments that may take an optional argument).
  LaTeX *export* needs nothing else: tables are already exported generically, and
  `gathered` comes out as `\begin{gathered} ... \end{gathered}`.
- **`fromtex_post.cpp`:** `\begin{aligned}` and `\begin{gathered}` become the native
  macros with a real table, one row per row separator; the optional `[t|b|c]` argument
  becomes `table-valign` on the table (default `c`, other values fall back to `c`); for
  `aligned`, a column that is empty in every row (leading/trailing `&`) gets zero width
  and padding; both spellings (`aligned`/`aligned*`, `gathered`/`gathered*`) are matched.

- **`math-edit.scm`:** `gathered` and `aligned` form a variant group, so Ctrl+Tab on either
  one switches to the other (both take the same body, so the rows are kept). Checked by
  hand in a running Windows release build: Ctrl+Tab switches between the two.

**Behaviour change to be aware of:** existing `\begin{aligned}` imports now produce the
native `aligned` macro instead of `tabular*`.

## Behaviour before the change (clean build of `main`, `c68a494fc`)

Importing LaTeX with `.tex -> .tmu`:

- `\[ \begin{gathered} a=b\\ c=d \end{gathered} \]` gives `<gathered| a=b<next-line>c=d>`:
  one unsplit text, no table;
- `\begin{gathered}[t] 1\\ 2 \end{gathered}` gives `<gathered|t|1<next-line>2>`: the
  option becomes a stray macro argument;
- `\begin{aligned} a&=b\\ c&=d \end{aligned}` gives a generic `<tabular*|...>`, not the
  `aligned` macro;
- `\begin{aligned}[t] 1 & 2 \\ 3 & 4 \end{aligned}` gives
  `<aligned|t|<tformat|...>>`: again a stray argument `t`, and no vertical position.

## Verified (headless `.tex -> .tmu` and export, on a debug-info Windows build)

This commit was applied **alone** on top of a clean `main` (`c68a494fc`), built, and run
with an empty user directory and cache: all 11 checks of my local `.tex -> .tmu` script pass; they cover the
import cases listed below (the corresponding inputs give the wrong results on `main`, as
described above), and exporting an `equation` with a `gathered` writes
`\usepackage{amsmath}` and the `gathered` environment, so the PR does not depend on any
other change.

- `\[ \begin{gathered} a=b\\ c=d \end{gathered} \]` (also inside `$$`, `equation`,
  `$..$`) imports as a `gathered` with one row per `\\`: two rows `a=b` and `c=d`,
  `table-valign` `c`.
- `\begin{gathered}[t]` and `[b]`, alone and in the middle of a line between text, give
  `table-valign` `t` and `b`.
- `\begin{aligned} a&=b\\ c&=d \end{aligned}`, `aligned[t]` and `aligned[b]` give the native
  `aligned` with the right rows and columns and the given valign (the optional-argument
  forms used to come out as `<aligned|t|...>`).
- Export of an `equation` containing a `gathered` gives `\usepackage{amsmath}` and
  `\begin{equation}`, `\begin{gathered}`, rows ending in `\\`, `\end{gathered}`,
  `\end{equation}`.
- A numbered and an unnumbered `gathered` exported to PDF: I looked at the rendered page
  for an `article`-based style stack (one number, three centered rows); for plain
  `generic` and `article` I checked the text extracted from the PDF (the rows and a
  single equation number).
- `array` and `pmatrix` imports were checked to be unaffected.
- Re-checked on a release build of this branch (`58148954a`) with a fresh user directory:
  the same `.tex -> .tmu` imports and `.tmu -> .pdf` rendering give the results above
  (one equation number, centered rows); a LaTeX file exported from the editor has
  `\usepackage{amsmath}` and `\begin{equation}\begin{gathered}...\end{gathered}\end{equation}`.

## Not checked / limits

- No automated test is included in this PR.
- Only `aligned` and `gathered` were touched; `alignedat`, `array[t]` and other
  environments with optional arguments were not audited for the same renaming problem.
- Visual spacing of `gathered` is copied from `aligned*`.
- Windows only.

Note for testing: Mogan keeps a compiled copy of each style in
`%LOCALAPPDATA%\moganlab\system\cache\<version>\` and does not notice that a package file
changed. If a style was used before this change, a `gathered` block may be drawn as an
unknown tag `<gathered|...>`; deleting the `<md5>.scm` style files in that folder (or
using a fresh user directory) shows the macro correctly.

## How this fix was made

The fix was developed through human-aided debugging: I reported the symptoms, ran the
builds and checked the results by hand, and the cause was worked out interactively with
an AI assistant. The code itself was written using Claude Sonnet 5.5 (Anthropic). I
reviewed and tested it before submitting. The commit carries a `Co-Authored-By` trailer
to the same effect.
