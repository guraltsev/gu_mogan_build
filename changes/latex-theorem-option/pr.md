**Branch:** `pr/latex-theorem-option` (1 commit) -> `MoganLab/mogan:main`

**Title:** `[NNNN] LaTeX: keep the optional [Name] of \begin{theorem} after \newtheorem`

---

## What happened

Importing `\begin{theorem}[Foo] ... \end{theorem}` from a document that declares the theorem with
`\newtheorem{theorem}{Theorem}` left `[Foo]` as literal text at the start of the theorem body instead of
making it the theorem's name (`<dueto|Foo>`). Without the `\newtheorem` line the name was recognised.

## Cause

When the parser sees `\newtheorem` / `\declaretheorem` it registers `\begin-<name>` with arity 0 ("no
arguments"), replacing the built-in entry that allows an optional argument. The argument parser then never
looks for `[...]` after `\begin{theorem}`.

## Change

`src/Plugins/Tex/parsetex.cpp`: register the begin command with arity -1 (optional argument, no required
ones), in both the `\newtheorem` and `\declaretheorem` branches. The end commands are unchanged. New
integration test `TeXmacs/tests/7004.scm` (5 checks).

## Verified (Windows, release build, headless)

- `TeXmacs/tests/7004.scm`: **2 of 5 checks fail on unmodified `upstream/main`, 5 of 5 pass with the
  change** (`attachments/test-7004-*.txt`). It covers a named theorem and an unnamed one (which must not
  get a `dueto`).
- Converting `attachments/theorem.tex`: before `[Foo] Statement.`, after `<dueto|Foo>Statement.`
  (`theorem-before.tmu`, `theorem-after.tmu`).
- A theorem type declared only by `\newtheorem{claim}{Claim}` converts to `<dueto|Bar>` in the file
  converter as well.

## Not checked

- The result in the GUI.
- `\newtheorem` with a counter argument (`\newtheorem{lemma}[theorem]{Lemma}`,
  `\newtheorem{x}{Name}[section]`) and the starred `\newtheorem*`/`\declaretheorem*` forms were not
  exercised separately.
- A body that legitimately starts with a bracket right after `\begin{theorem}` is now read as an option;
  this matches LaTeX's own behaviour but was not tested.
- Through the Scheme call `latex->texmacs` alone, a theorem name declared only by a user `\newtheorem`
  (e.g. `claim`) comes out as `(claim "Bar" (document ...))` rather than with `dueto`, unlike the file
  converter. I did not investigate that difference and the test does not assert it.
- macOS and Linux (all work was on Windows 11); the test was run by a hand-made headless command, not
  `xmake r 7004`.

## How this fix was made

Developed through human-aided debugging: I reported the problem and ran and checked the builds, and the
cause was worked out interactively with an AI assistant. The code was written using Claude Sonnet 5.5
(Anthropic); I reviewed and tested it before submitting. The commit carries a `Co-Authored-By` trailer to
the same effect.
