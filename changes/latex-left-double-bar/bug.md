**Title:** `LaTeX import: \left\| becomes a single bar`

**Labels (suggested):** bug, latex

---

## Summary

`\left\|` ... `\right\|` is imported with single bars instead of double bars, so a norm
looks like an absolute value and re-exports as `|`.

## Environment

Mogan STEM from `main` at `c68a494fc`, releasedbg, Windows 11.

## Steps to reproduce

1. Import `$\left\|\left\|f\right\|_{L^q}\right\|_{L^p}$` (`mogan -headless -c in.tex out.tmu`).

## Expected

`<around*|\<\|\|\>|...` (double bars), as for `\left\Vert`.

## Actual

`<around*|\||...` (single bars); exported again as `| | f |_{L^q} |_{L^p}`.

## Cause

`l2e` in `src/Plugins/Tex/fromtex.cpp` strips the backslash from the delimiter label, so
`\|` becomes `|`; only `Vert`/`Arrowvert` are mapped to `||`.

## Fix

See the PR "Import \left\| as a double bar".
