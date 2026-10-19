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
- `moganlab/progs/latex-table-macros.scm` - LaTeX import/export for one-column table macros, no
  Mogan source changes. Register more with
  `(latex-register-table-macro "name" "style-package" "default-option")` at its end.
  `\name[o]{a \ b}` imports as `(name "o" (table ...))`; export writes `\name[o]{...}`
  (option omitted at the default) and adds `\usepackage{name}`.
- `moganlab/packages/lga.stem` - Mogan macro `lga`: left-aligned one-column table, top/centre/bottom
  baseline from the first argument.
- `tex/lga.sty` - LaTeX side: `\lga[t|c|b]{...}` on top of mathtools' `lgathered`.
- `tests/7003-old-ltae-inrepo.scm.txt` - obsolete test from the first (in-repo, `ltae`) attempt;
  kept for reference, not runnable as is.

To add another construct like `lga`: write its `.stem` macro and `.sty`, add one registry line,
restart Mogan.
