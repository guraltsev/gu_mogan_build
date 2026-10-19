**Title:** `LaTeX: matrix and bmatrix are not mapped to native matrix tags (bmatrix imports as a table, matrix exports as array)`

**Labels (suggested):** bug, latex

---

## Summary

Mogan has native `matrix` (parenthesised), `bmatrix`, `Bmatrix` and `det` tags, but the LaTeX
converter does not use them for `matrix` and `bmatrix`:

- A Mogan `matrix` exports as `\left( \begin{array}...\end{array} \right)` instead of
  `\begin{pmatrix}...\end{pmatrix}`.
- A Mogan `bmatrix` exports as `\left[ \begin{array}...\end{array} \right]` instead of
  `\begin{bmatrix}...\end{bmatrix}`.
- LaTeX `\begin{bmatrix}` imports as a generic table wrapped in literal `[` `]` characters,
  not as a `bmatrix`. The brackets do not grow with the matrix, and matrix commands (insert
  row/column) do not apply.

So a LaTeX document with `pmatrix`/`bmatrix` does not survive an import/export round trip.

## Environment

Mogan STEM from `main` at `c68a494fc`, Windows 11. Found by reading the importer and exporter;
the behaviour was not reproduced on a separate clean upstream build.

## Steps to reproduce

1. Import `$\begin{bmatrix}1&2\\3&4\end{bmatrix}$` (`mogan -headless -c in.tex out.tmu`):
   the result is a table between literal brackets.
2. In Mogan insert a matrix (`matrix` or `bmatrix`) and export to LaTeX: the output uses
   `array` with `\left`/`\right`.

## Expected

| LaTeX | Mogan | LaTeX on export |
|---|---|---|
| `pmatrix` | `matrix` | `pmatrix` |
| `bmatrix` | `bmatrix` | `bmatrix` |
| `matrix` | table (`tabular*`) | `tabular` |

## Actual

`pmatrix` imports correctly, but exports as `array`; `bmatrix` imports as a table with literal
brackets and exports as `array`.

## Cause

- Import (`src/Plugins/Tex/fromtex_post.cpp`): `bmatrix` is passed to `parse_pmatrix` with the
  delimiters `[` and `]` and the target tag `tabular*`, instead of the native `bmatrix` tag.
- Export (`TeXmacs/plugins/latex/progs/latex/convert-latex-tmtex.scm`): `matrix` and `bmatrix`
  have entries in `tmtex-table-props%`, which wrap an `array` in `\left`/`\right`. Tags without
  such an entry fall through to `\begin{<tag>}`, which is what is wanted here.

## Fix

See the PR "Map matrix, pmatrix and bmatrix to native Mogan tags".
