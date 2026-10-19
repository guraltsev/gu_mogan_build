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
that source, see the attachments.

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

## Expected result

The proof environment is kept and the title replaces the default "Proof" heading, i.e. something like

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

`render-proof` is the macro Mogan's own `proof` and `proof-of` are built on, and it is the tag the editor
uses for a proof with its own title (`text-edit.scm` rewrites `proof` into `(render-proof "" body)` when
the title is made editable), so it is the natural counterpart of `\begin{proof}[Title]`.

## Where it comes from (evidence)

The parser is not at fault. Parsing the file with `(parse-latex-document src)` and printing the tree gives,
for the first proof:

```
(tuple "\begin-proof*" (concat "P" "r" "o" "o" "f" " " "o" "f" " " "T" "h" "e" "o" "r" "e" "m" " " "1"))
 ... body ...
(tuple "\end-proof")
```

so the option is read and the environment is renamed `proof*` (`parsetex.cpp`: after an optional
argument is consumed, `t[0]->label= t[0]->label * "*"`). The final tree from `latex->texmacs` contains
neither a begin nor an end marker for that proof, so the loss happens in the post-processing in
`src/Plugins/Tex/fromtex_post.cpp`, function `finalize_layout`:

- The branch that handles theorem-like environments with an option is
  `if (is_func (v, BEGIN, 2) && is_enunciation (v) && v[0] != "proof*")`. It turns `theorem*` into
  `<theorem>` plus `<dueto|...>`. It explicitly excludes `proof*`.
- No other branch in `finalize_layout` mentions `proof*`, so that begin marker is not emitted.
- The closing `\end{proof}` is parsed as `(END "proof")`: it carries no trace of the option, so there is
  nothing that could pair it with a begin marker of a different name.
- Mogan's own `proof*` is renamed `render-proof` by the format upgrader
  (`src/Data/Convert/Texmacs/upgradetm.cpp`), which is why a `proof*` marker is not usable as the target
  name either.

Untitled proofs do not go through the `proof*` rename and so are unaffected, which matches the observation.

## Related issues

- #2985 (closed, fixed by #2990, tests in #3052) is about the opposite direction: Mogan's proof block should
  export to LaTeX as `\begin{proof} ... \end{proof}`. #2990 changed the export rules for the `proof` and
  `proof*` tags and #3052 added export tests for them. None of the three touches the importer
  (`src/Plugins/Tex`), so they do not address this report: the source used here (`upstream/main` at
  `af724b028`) contains all of them and still loses the environment on import.
- A proof with a custom title is the `render-proof` tag in current documents, and its export rule
  `tmtex-render-proof` writes a custom `proof*` environment
  (`\begin{proof*}{Title}` plus a preamble `\newenvironment{proof*}[1]{\begin{proof}[{#1}]}...`) rather than
  `\begin{proof}[Title]`. This is the same kind of export problem as #2985, for the titled case.

## Attachments

In `attachments/`: `proof.tex` (input) and `proof-before.tmu` (actual output on `upstream/main`).
