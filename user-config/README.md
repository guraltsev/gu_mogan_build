# user-config

Personal Mogan customisations kept outside the Mogan sources. Each folder mirrors where its
files go; copy them there and restart Mogan.

| Here | Install to |
|---|---|
| `moganlab/progs/*.scm` | `%APPDATA%\moganlab\progs\` (a link to `C:\Users\guraltsev\Config\Mogan\progs`, so these may already be in place) |
| `moganlab/packages/*.stem` | `%APPDATA%\moganlab\packages\` |
| `tex/*.sty` | anywhere LaTeX finds it, e.g. next to the `.tex` file or `texmf/tex/latex/lga/` |

## Contents

- `moganlab/progs/my-init-texmacs.scm` - user init: keyboard bindings (`$`, `$$`, Alt+Up/Down,
  backtick math keys, Alt+T inserts `lga`) and a `(load ...)` of the table-macro registry.
- `moganlab/progs/latex-user-extensions.scm` - LaTeX import/export extensions (one-column table macros), no
  Mogan source changes. Register more with
  `(latex-register-table-macro "name" "style-package" "default-option" "preamble" "latex-pkg" ...)`
  at its end. Importing `\name[o]{rows separated by row breaks}` gives `(name "o" (table ...))`;
  export writes `\name[o]{...}` (option omitted at the default) and injects the preamble text
  and `\usepackage` lines into the exported file, so no `.sty` is needed. Without a preamble
  argument it adds `\usepackage{name}` instead.
  The same file maps `\R \C \Q \Z \N` to the symbols typed as `RR CC QQ ZZ NN` (`<bbb-R>` ...):
  import accepts `\R`, `\mathbb{R}` and `\mathbb R`; export writes `\R` and, only if used,
  `\providecommand{\R}{\mathbb{R}}` plus `amssymb` in the preamble. More via
  `(latex-register-symbol-command "R" "<bbb-R>" "R")`.
- `moganlab/packages/lga.stem` - Mogan macro `lga`: left-aligned one-column table, top/centre/bottom
  baseline from the first argument.
- `tex/lga.sty` - optional standalone copy of the same definition, for hand-written documents;
  exported files do not need it.
- `tests/7003-old-ltae-inrepo.scm.txt` - obsolete test from the first (in-repo, `ltae`) attempt;
  kept for reference, not runnable as is.

To add another construct like `lga`: write its `.stem` macro and `.sty`, add one registry line,
restart Mogan.
