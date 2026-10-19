**Branch:** `pr/headless-convert` (2 commits: my `8ec83b7c0` and the maintainer's follow-up `ff92a9a7e`; tip `ff92a9a7e`) -> `MoganLab/mogan:main`

**Title:** `[NNNN] Fix headless -c file conversion`

---

## What happened

I wanted to convert documents from the command line, without opening a window, with
`MoganSTEM -headless -c <in> <out>`. Converting a TeXmacs document to LaTeX or to another
TeXmacs format wrote **no output file at all**, and nothing about the conversion was printed (only the
normal startup and shutdown lines).

## Problem

For every conversion except `.tex -> .tmu` (which has its own branch) and PDF, the code
in `TeXmacs_main` generates
`(load-buffer "<in>" :strict) (export-buffer "<out>")`.

On a clean build of `main` (`c68a494fc`, Windows), with an empty user directory and cache:

- `MoganSTEM -headless -c doc.tm doc.tex` writes no file;
- `MoganSTEM -headless -c doc.tm doc.tmu` writes no file;
- `MoganSTEM -headless -c blocks.tex blocks.tmu` works (the special branch).

I did not trace why the generated sequence produces nothing; headless mode has no active
view, and `export-buffer` exports the *current* buffer.

## Change (`src/System/Boot/init_texmacs.cpp`, default branch only)

The generated Scheme now:

- calls `(lazy-plugin-force)` first (about 1 s);
- takes the source format from `(url-format source)` (the input file exists) and the
  target format from the file suffix, `(format-from-suffix (url-suffix target))`. The
  output file normally does not exist yet, so `url-format` cannot be asked about it, and
  formats such as `latex` are only registered once their plugin has been initialised;
- initialises the plugins of both formats, loads the buffer **by URL**
  (`buffer-load source`) and exports **that buffer** (`buffer-export source target
  target-format`), printing a message if either step fails.

The `.tex -> .tmu` branch is unchanged. The PDF branch (screens expanded into slides) is
unchanged except that it now carries its own `load-buffer`.

## Verified

A local script runs conversions and checks the output text (31 checks, all pass on this
branch):

- `.tex -> .tmu`: `gathered`/`aligned`/`array`/`pmatrix` rows and options (the unchanged
  branch, as a regression guard);
- `.tm -> .tex`: a full document with `\documentclass`, `\usepackage{amsmath}`,
  `\begin{equation}`, `\begin{gather*}`, aligned and plain text;
- `.tm -> .tmu`, `.tmu -> .tex`, and a `.tex -> .tmu -> .tex` round trip.

On the clean `main` build, `.tm -> .tex` and `.tm -> .tmu` write nothing (above).

## Not checked

- With the new code, a failed load or export is only printed as a message; I did not
  check or change the process exit status.
- The PDF branch and the `.tex -> .tmu` branch were not changed and were not re-tested
  beyond the regression guard above.
- Linux and macOS were not tested.
- The test script is a bash script outside the project's test layout. I am happy to port
  it to `tests/` (C++) or a Scheme integration test if you tell me which you prefer.

## How this fix was made

The fix was developed through human-aided debugging: I reported the symptoms, ran the
builds and checked the results by hand, and the cause was worked out interactively with
an AI assistant. The code itself was written using Claude Sonnet 5.5 (Anthropic). I
reviewed and tested it before submitting. The commit carries a `Co-Authored-By` trailer
to the same effect.
