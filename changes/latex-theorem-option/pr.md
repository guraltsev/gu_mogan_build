**Branch:** `pr/latex-theorem-option` (1 commit) -> `MoganLab/mogan:main`

**Title:** `[NNNN] LaTeX: keep the optional [Name] of \begin{theorem} after \newtheorem`

---

## What happened

Importing `\begin{theorem}[Foo] ... \end{theorem}` from a document that declares the theorem with
`\newtheorem{theorem}{Theorem}` left `[Foo]` as literal text at the start of the theorem body instead of
making it the theorem's name (`<dueto|Foo>`). Without the `\newtheorem` line the name was recognised.

## Background: how the importer decides whether an environment has an optional argument

`parsetex.cpp` parses LaTeX into a tuple tree. For every command or environment it looks up a type and an
arity (`latex_type`, `latex_arity`; defaults come from the DRD in `convert-latex-command-drd.scm`, and
documents can change them while parsing). When the parser reaches the arguments of a command it does

    int  arity = latex_arity (cmd);
    bool option= (arity < 0);
    if (option) arity= -1 - arity;

so a negative arity means "an optional `[...]` argument may follow, then `-1 - arity` required `{...}`
arguments"; arity -1 is therefore "one optional argument, no required ones". If an option is found it is
stored as an argument and the name of the command is renamed with a trailing `*` (`theorem` ->
`theorem*`). `fromtex_post.cpp` (`finalize_layout`) later turns `theorem*` with its argument into
`<theorem>` followed by `<dueto|option>`. The standard enunciations (`theorem`, `lemma`, `proof`, ...) are
registered with an optional argument by default (`latex-enunciation%` implies `latex-environment-0*%`).

## Cause

Declaring a theorem in the preamble also registers it in the parser. For `\newtheorem{name}{Title}` and
`\declaretheorem[...]{name}` the parser executes

    command_type (var)= "enunciation";
    command_arity (var)= 0;

for `\begin-name` (and the same for `\end-name`). This is meant to make unknown, user-defined names behave
as enunciations, but it also runs for names that are already known. For `theorem`, it replaces arity -1
(optional argument) by arity 0 (no arguments). From then on `option` is false for every
`\begin{theorem}` in the file, the parser never looks at the `[`, and `[Foo]` stays as ordinary characters
in the body. The post-processing that creates `<dueto|...>` is correct; it is just never given an option.
Since almost every document that uses theorems declares them with `\newtheorem`, the named-theorem form
was effectively unavailable in real documents.

The evidence: the parse tree of the failing document has `(tuple "\begin-theorem")` followed by the text
`"["`, `"F"`, `"o"`, `"o"`, `"]"`, while the same document without the `\newtheorem` line yields
`<dueto|Foo>` (the latter checked on the fixed build, whose change does not touch that path).

## Change

`src/Plugins/Tex/parsetex.cpp`, two one-token edits: in the `\newtheorem` / `\newtheorem*` branch and in the
`\declaretheorem` / `\declaretheorem*` branch, the `\begin-<name>` registration uses arity -1 instead of 0,

    command_arity (var)= -1; // keep the optional [Title]

so a declared theorem still accepts an optional argument, which is what LaTeX itself does (`\newtheorem`
environments take `[...]`). The `\end-<name>` registrations stay at arity 0: an end marker takes no
arguments.

Effects:

- `\begin{theorem}[Foo]` after `\newtheorem{theorem}{Theorem}`: the option is parsed, the marker is renamed
  `theorem*`, and the existing post-processing produces `<dueto|Foo>`.
- User-defined names (`\newtheorem{claim}{Claim}`) get the same treatment; in the file converter
  `\begin{claim}[Bar]` converts to `<dueto|Bar>`.
- `\begin{theorem}` without an option is unaffected: with arity -1 the parser only consumes a bracket if one
  actually follows.
- A consequence of the same rule: in a document that declares `theorem` with `\newtheorem`, a body
  that begins with `[` immediately after `\begin{theorem}` is now read as an option, exactly as LaTeX does.

New integration test `TeXmacs/tests/7004.scm` (5 checks): a named theorem imports with a `dueto`, with the
name, and without the literal `[Foo]` in the text; an unnamed theorem imports with no `dueto`.

## Verified (Windows, release build, headless)

- `TeXmacs/tests/7004.scm`: **2 of 5 checks fail on unmodified `upstream/main`, 5 of 5 pass with the
  change** (console output below). It covers a named theorem and an unnamed one (which must not
  get a `dueto`).
- Converting `theorem.tex` (shown below): before `[Foo] Statement.`, after `<dueto|Foo>Statement.`.
- A theorem type declared only by `\newtheorem{claim}{Claim}` converts to `<dueto|Bar>` in the file
  converter as well.

## Input and outputs

Input (`theorem.tex`):

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

Output of `MoganSTEM.exe -headless -c theorem.tex theorem.tmu` on unmodified `upstream/main`:

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

Output with this change:

```
<TMU|<tuple|1.1.0|2026.3.0>>

<style|<tuple|article|std-latex>>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <\theorem>
    <dueto|Foo>Statement.
  </theorem>
</body>
```

Test output, unmodified `upstream/main` (the two failing checks) and with this change:

```
(contains? t 'dueto) => #f ; *** failed ***
(contains? t "Foo") => #f ; *** failed ***
; *** checks *** : 3 correct, 2 failed.

; *** checks *** : 5 correct, 0 failed.
```

## Not checked

- The result in the GUI.
- `\newtheorem` with a counter argument (`\newtheorem{lemma}[theorem]{Lemma}`,
  `\newtheorem{x}{Name}[section]`) and the starred `\newtheorem*`/`\declaretheorem*` forms were not
  exercised separately.
- A body that legitimately starts with a bracket right after `\begin{theorem}` is now read as an option;
  this matches LaTeX's own behaviour but was not tested.
- Through the Scheme call `latex->texmacs` alone, a theorem name declared only by a user `\newtheorem`
  (e.g. `claim`) comes out as `(claim "Bar" (document ...))` rather than with `dueto`, unlike the file
  converter. I did not investigate that difference and the test does not assert it.
- macOS and Linux (all work was on Windows 11); the test was run by a hand-made headless command, not
  `xmake r 7004`.

## How this fix was made

Developed through human-aided debugging: I reported the problem and ran and checked the builds, and the
cause was worked out interactively with an AI assistant. The code was written using Claude Sonnet 5.5
(Anthropic); I reviewed and tested it before submitting. The commit carries a `Co-Authored-By` trailer to
the same effect.
