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
conversion (`MoganSTEM.exe -headless -c in.tex out.tmu`). The behaviour was produced by a build
of exactly that source.

## Steps to reproduce

Convert this file (`theorem.tex`):

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

## Actual result (complete output file `theorem.tmu`)

```
<TMU|<tuple|1.1.0|2026.3.0>>

<style|<tuple|article|std-latex>>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <\theorem>
    [Foo] Statement.
  </theorem>
</body>
```

## Expected result

The option becomes the theorem name:

```
<\theorem>
  <dueto|Foo>Statement.
</theorem>
```

## Where it comes from (evidence)

The file converter and the Scheme call `(latex->texmacs (parse-latex-document src))` agree. Printing the
parse tree `(tree->stree (parse-latex-document src))` for the document above gives

```
... (tuple "\begin-theorem") "[" "F" "o" "o" "]" (concat " ") "S" "t" ... (tuple "\end-theorem") ...
```

so the parser did not treat `[Foo]` as an argument of `\begin{theorem}`: the begin marker has no argument
and the bracket characters are ordinary text. For comparison, `\begin{proof}[...]` in the same kind of
document is parsed with its argument (`(tuple "\begin-proof*" ...)`), and the same `theorem` example
without the `\newtheorem` line converts with `<dueto|Foo>`.

Whether the parser takes an optional argument is decided in `src/Plugins/Tex/parsetex.cpp` from the
command's arity: `arity = latex_arity (cmd); option = (arity < 0)`, i.e. a negative arity means "optional
argument allowed". The importer's later step that turns a begin marker named `theorem*` (the name the parser
gives an environment after it consumed an option) into `<dueto|...>` is in `fromtex_post.cpp`, and is not
involved: it never sees an option here.

What differs between the two documents is the `\newtheorem{theorem}{Theorem}` line. In `parsetex.cpp`, the
code that processes `\newtheorem` / `\declaretheorem` (the `command_type (var)= "enunciation";
command_arity (var)= 0;` blocks) re-registers `\begin-<name>` with arity 0 ("no arguments at all"),
overwriting the built-in registration of `theorem`, which allows an option (the DRD lists `begin-theorem`
among the enunciations with an optional argument, `latex-environment-0*%` in `convert-latex-command-drd.scm`).
After that, `option` is false for every `\begin{theorem}` in the file, so the bracket is left as text.
