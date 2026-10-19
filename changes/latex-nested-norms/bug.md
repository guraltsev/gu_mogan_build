**Title:** `LaTeX import/export mispairs nested norms and absolute values`

**Labels (suggested):** bug, latex

---

## Summary

Nested norms such as `\|{\|f\|_{L^q}}\|_{L^p}` are imported with the bars paired the wrong
way (two empty fences), and a correctly nested document exports as `\|\|f\|_{L^q} \|_{L^p}`,
which re-imports wrongly. Nested absolute values behave the same.

## Environment

Mogan STEM from `main` at `c68a494fc`, releasedbg, Windows 11.

## Steps to reproduce

1. Import `$\|{\|f(x,y)+g(x,y)\|_{L^q}}\|_{L^p}$` (`mogan -headless -c in.tex out.tmu`).
2. Or export a document containing a norm of a norm, or `| |f|_q |_p`.

## Expected

A norm of a norm; exported LaTeX that reads back to the same tree.

## Actual

Empty fences paired from the outside; flat `\|\|` on export.

## Cause

Braces are dropped before bracket pairing, which takes the nearest equal bar; the exporter
flattens `around` to characters before writing.

## Fix

See the PR "Keep nested norms and absolute values apart in LaTeX import and export".
