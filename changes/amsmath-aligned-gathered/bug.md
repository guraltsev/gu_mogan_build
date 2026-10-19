**Title:** `LaTeX import: \begin{gathered} is not recognised and the optional [t|b|c] argument of aligned/gathered is dropped; no gathered environment`

**Labels (suggested):** bug, LaTeX import

---

## Summary

1. Mogan has no equivalent of amsmath's `gathered` (several centered rows under a single
   equation number).
2. Importing LaTeX that uses `\begin{gathered}` gives unsplit text.
3. The optional vertical-position argument of `aligned` and `gathered`
   (`\begin{aligned}[t]`, `[b]`, `[c]`) is not interpreted: it becomes a stray macro
   argument.
4. Plain `\begin{aligned}` is flattened into a generic `tabular*` instead of the native
   `aligned` macro.

## Environment

- Mogan STEM built from `main` at `c68a494fc`, xmake mode `releasedbg`
- Windows 11 Enterprise, Qt 6.8.3; empty user directory and cache

## Steps to reproduce

Save as `t.tex` (note the doubled backslashes):

```latex
\documentclass{article}
\usepackage{amsmath}
\begin{document}
G1: \[ \begin{gathered} a=b\\ c=d \end{gathered} \]
G4: \[ x \begin{gathered}[t] 1 \\ 2 \end{gathered} y \]
A1: \[ \begin{aligned} a&=b\\ c&=d \end{aligned} \]
A2: \[ x \begin{aligned}[t] 1 & 2 \\ 3 & 4 \end{aligned} y \]
\end{document}
```

Run `MoganSTEM.exe -headless -c t.tex t.tmu` and read `t.tmu`.

## Expected

- G1: a `gathered` block with two rows `a=b` and `c=d`.
- G4: the same with the vertical position "top" stored (`table-valign` = `t`).
- A1: the native `aligned` macro with two rows and two columns.
- A2: `aligned` with `table-valign` = `t`.

## Actual

- G1: `<gathered| a=b<next-line>c=d>`, one unsplit text, no table.
- G4: `<gathered|t|1<next-line>2>`, the option as a stray argument.
- A1: a generic `<tabular*|<tformat|<table|...>>>`.
- A2: `<aligned|t|<tformat|<table|...>>>`, again a stray argument `t` and no vertical
  position.

## Analysis

- There is no `gathered` macro in `TeXmacs/packages/environment/env-math.stem`.
- In `src/Plugins/Tex/fromtex_post.cpp`, `finalize_pmatrix` sends `aligned` to the generic
  `tabular*` conversion and does not know `gathered`. When the parser has consumed an
  optional argument it apparently renames the environment to `aligned*`/`gathered*`,
  which `finalize_pmatrix` does not match either, so those blocks are built by a generic
  path that leaves the argument behind (consistent with the output above; matching both
  spellings is what fixes it).
- `parse_pmatrix` treats a second argument as a matrix column specification
  (`parse_matrix_params`), not as a vertical position.

## Fix

Pull request: branch `pr/amsmath-aligned-gathered`. It adds the `gathered` macro (a centered single
column, meant to be placed in `equation`), imports `aligned` and `gathered` as the native
macros with a real table, one row per row separator, stores `[t|b|c]` as `table-valign`
(default `c`), matches both spellings of the renamed environment, and declares the
`amsmath` dependency for export (the table exporter already writes
`\begin{gathered}...\end{gathered}`). Note that plain `\begin{aligned}` now imports as the
native `aligned` macro instead of `tabular*`.

## Notes

The diagnosis was worked out interactively with an AI assistant (Claude Sonnet 5.5); I ran
the imports above on a clean build and on the fix and checked the results by hand.
