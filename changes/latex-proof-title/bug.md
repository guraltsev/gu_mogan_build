**Title:** `LaTeX import: \begin{proof}[Title] loses the proof environment and its title`

**Labels (suggested):** bug, latex

---

## Summary

Importing a LaTeX proof that has an optional title, e.g. `\begin{proof}[Proof of Theorem 1] ... \end{proof}`
(amsthm), silently destroys the environment. The title is dropped, the `proof` block is gone, and the body
is left as an ordinary paragraph that is indistinguishable from surrounding text. No error or warning is
shown. A plain `\begin{proof} ... \end{proof}` imports correctly.

## Environment

Mogan STEM 2026.3.8-rc.1 built from `upstream/main` at `af724b028`, Windows 11, release build, headless
conversion (`MoganSTEM.exe -headless -c in.tex out.tmu`). The behaviour was checked on a build of exactly
that source (the single changed file reverted to `upstream/main`), see the attachments.

## Steps to reproduce

Convert `attachments/proof.tex`:

```latex
\documentclass{article}
\usepackage{amsthm}
\begin{document}

\begin{proof}[Proof of Theorem 1]
Because $x$.
\end{proof}

\begin{proof}
Plain.
\end{proof}

\end{document}
```

## Actual result (`attachments/proof-before.tmu`)

```
<\body>
  Because <math|x>.

  <\proof>
    Plain.
  </proof>
</body>
```

The first proof has no `<proof>` wrapper and no title: the text "Proof of Theorem 1" is gone and
`Because x.` is a bare paragraph (no "Proof." heading, no end-of-proof square).

## Expected result (`attachments/proof-after.tmu`)

```
<\body>
  <\render-proof|Proof of Theorem 1>
    Because <math|x>.
  </render-proof>

  <\proof>
    Plain.
  </proof>
</body>
```

`render-proof` is the macro Mogan's own `proof` and `proof-of` are built on, and it is what the
exporter already writes for this shape (`tmtex-render-proof` -> `\begin{proof}[...]`), so the title
replaces the word "Proof" as it does in LaTeX.

## Cause

The LaTeX parser consumes the optional argument and renames the environment `proof*`. In
`finalize_layout` (`src/Plugins/Tex/fromtex_post.cpp`) the branch for theorem-like environments
(`dueto`) explicitly excludes `proof*`, and no other branch emits a begin marker for it. The closing
`\end{proof}` carries no trace of the option, so the matching end marker no longer pairs with anything.
The result is a document with neither begin nor end.

## Related issues

- #2985 (closed) asked for the opposite direction: Mogan's proof block should export to LaTeX as
  `\begin{proof} ... \end{proof}`. This report is about the import side. After the import fix, a titled
  proof exports through the existing `render-proof` path as a custom `proof*` environment (defined in the
  preamble as a wrapper around `\begin{proof}[...]`) rather than as a plain `\begin{proof}[Title]`;
  that is the same kind of export problem as #2985 and is not changed here.

## Related, separate

`\begin{theorem}[Foo]` after `\newtheorem{theorem}{Theorem}` also loses its option handling (`[Foo]`
stays as literal text). That is a different cause (the parser) and is reported separately.

## Attachments

All in `attachments/`: `proof.tex` (input), `proof-before.tmu` (unfixed), `proof-after.tmu` (fixed),
`test-7003-before-fix.txt` (`5 correct, 3 failed`), `test-7003-after-fix.txt` (`8 correct, 0 failed`).
