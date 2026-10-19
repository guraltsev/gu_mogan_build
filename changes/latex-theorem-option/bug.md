**Title:** `LaTeX import: \begin{theorem}[Name] keeps "[Name]" as literal text when the document uses \newtheorem`

**Labels (suggested):** bug, latex

---

## Summary

In a LaTeX document that declares its theorems with `\newtheorem{theorem}{Theorem}` (i.e. almost every
document), the optional name of a theorem, `\begin{theorem}[Foo] ... \end{theorem}`, is not recognised.
The text `[Foo]` is left in the body as ordinary characters instead of becoming Mogan's theorem name
(`<dueto|Foo>`). The same document without the `\newtheorem` line imports correctly, because the built-in
definition of `theorem` accepts an optional argument.

## Environment

Mogan STEM 2026.3.8-rc.1 built from `upstream/main` at `af724b028`, Windows 11, release build, headless
conversion (`MoganSTEM.exe -headless -c in.tex out.tmu`). The unfixed behaviour was produced by a build
of exactly that source.

## Steps to reproduce

Convert `attachments/theorem.tex`:

```latex
\documentclass{article}
\usepackage{amsthm}
\newtheorem{theorem}{Theorem}
\begin{document}

\begin{theorem}[Foo]
Statement.
\end{theorem}

\end{document}
```

## Actual result (`attachments/theorem-before.tmu`)

```
<\theorem>
  [Foo] Statement.
</theorem>
```

## Expected result (`attachments/theorem-after.tmu`)

```
<\theorem>
  <dueto|Foo>Statement.
</theorem>
```

## Cause

`src/Plugins/Tex/parsetex.cpp`: when the parser meets `\newtheorem` or `\declaretheorem` it registers
`\begin-<name>` as an "enunciation" with arity 0. Arity 0 means "no arguments at all". It replaces the
built-in entry for `theorem` (and the other standard names), which has the "optional argument allowed"
arity. The argument parser therefore never looks for `[...]` after `\begin{theorem}`. The importer's
later step that turns `theorem*` into `<dueto|...>` is correct but never receives the option.

## Fix

Register the begin command with arity -1 (optional argument, no required ones). The `\end-` entries are
unchanged.

## Attachments

All in `attachments/`: `theorem.tex`, `theorem-before.tmu`, `theorem-after.tmu`,
`test-7004-before-fix.txt` (`3 correct, 2 failed`), `test-7004-after-fix.txt` (`5 correct, 0 failed`).
