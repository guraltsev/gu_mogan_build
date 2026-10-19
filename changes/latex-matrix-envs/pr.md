**Branch:** `pr/latex-matrix-envs` (1 commit, `1d9023a98`) -> `MoganLab/mogan:main`

**Title:** `[NNNN] LaTeX: map matrix, pmatrix and bmatrix to native Mogan tags`

---

## What happened

Mogan's own matrices did not round-trip through LaTeX. A Mogan `matrix` exported as
`\left( \begin{array}...\end{array} \right)` rather than `pmatrix`, and a `bmatrix` exported the
same way with square brackets. Going the other way, `\begin{bmatrix}` was imported as a plain
table between two literal `[` `]` characters, so it was not a matrix in Mogan: the brackets do
not scale and the matrix commands do not apply.

## Cause

- Import: `fromtex_post.cpp` sent `bmatrix` through `parse_pmatrix` with literal delimiters and the
  generic `tabular*` tag.
- Export: `tmtex-table-props%` in `convert-latex-tmtex.scm` had entries for `matrix` and `bmatrix`
  that wrap an `array` in `\left`/`\right`. Tags without an entry already fall through to
  `\begin{<tag>}`.

## Change

- Import: `bmatrix` becomes the native `bmatrix` tag (two places in `fromtex_post.cpp`).
  `pmatrix` -> `matrix` is unchanged; a plain LaTeX `matrix` stays a `tabular*`.
- Export: removed the `matrix` and `bmatrix` entries from `tmtex-table-props%`. Because Mogan's
  `matrix` is the parenthesised one, the fall-through renames it to `pmatrix`; `bmatrix` exports
  under its own name.
- `convert-latex-drd.scm`: `pmatrix`, `bmatrix` and `Bmatrix` now load `amsmath`.
- New integration test `TeXmacs/tests/7002.scm` (11 checks: the table above, both directions).

| LaTeX | Mogan | LaTeX on export |
|---|---|---|
| `pmatrix` | `matrix` | `pmatrix` |
| `bmatrix` | `bmatrix` | `bmatrix` |
| `matrix` | table (`tabular*`) | `tabular` |

## Verified (Windows, release build, headless)

`TeXmacs/tests/7002.scm` runs 11 checks, all passing, against a build containing this change:
the exported text contains `\begin{pmatrix}` / `\begin{bmatrix}` and no `array`, `\left(` or
`\left[`; `pmatrix` imports as `matrix`, `bmatrix` as `bmatrix` (not `tabular*`), and plain `matrix`
as `tabular*`.

## Not checked

- The exported LaTeX was not compiled with a TeX engine.
- Opening an imported `bmatrix` in the GUI and using the matrix editing commands on it.
- `Bmatrix` and `vmatrix` import were not changed, and `Bmatrix` export was not tested.
- macOS and Linux (all work was on Windows 11).
- The test was run by a hand-made headless command, not by `xmake r 7002`.

## How this fix was made

Developed through human-aided debugging: I reported the problem and ran and checked the
builds, and the cause was worked out interactively with an AI assistant. The code was
written using Claude Sonnet 5.5 (Anthropic); I reviewed and tested it before submitting.
The commit carries a `Co-Authored-By` trailer to the same effect.
