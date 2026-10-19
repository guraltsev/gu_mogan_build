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
  backtick math keys, Alt+T inserts `lga`), the typed commands `\mc \mb \mbf \mf \ms \R \C \Q \Z \N
  \1 \oper \lga` (type the name, press Enter), and a `(load ...)` of the LaTeX extensions below.
  Bindings use Mogan's prefix names (`var`, `math`, `copyto`, `cutto`) but the keyboard sends physical keys
  (Tab, Alt+letter, Ctrl+Shift+C), and the user layer stores a key literally. The macro `user-kbd-map+`
  therefore registers every binding under both spellings (`var` -> `tab`, `math t` -> `A-t`,
  `copyto` -> `C-C`, `cutto` -> `C-X`); a test checks that each physical form reaches the same action.
  Not covered: `A-x` (opens the "Interactive command" prompt, which only runs commands that take
  arguments) and `pastefrom l`, which has no physical key (`Ctrl+Shift+V` is Mogan's smart paste).
  `\lga` and `\oper` (and Alt+T) add their style package to the document if it is missing; without
  the package Mogan cannot render the tag and shows a plain centered table.
- `moganlab/progs/latex-user-extensions.scm` - LaTeX import/export extensions (one-column table macros), no
  Mogan source changes. Register more with
  `(latex-register-table-macro "name" "style-package" "default-option" "preamble" "latex-pkg" ...)`
  at its end. Importing `\name[o]{rows separated by row breaks}` gives `(name "o" (table ...))`;
  export writes `\name[o]{...}` (option omitted at the default) and injects the preamble text
  and `\usepackage` lines into the exported file, so no `.sty` is needed. Without a preamble
  argument it adds `\usepackage{name}` instead.
  The same file maps `\R \C \Q \Z \N` to the symbols typed as `RR CC QQ ZZ NN` (`<bbb-R>` ...):
  import accepts `\R`, `\mathbb{R}` and `\mathbb R`; export writes `\R` and, only if used,
  `\NewDocumentCommand{\R}{}{\mathbb{R}}` plus `amssymb` in the preamble. More via
  `(latex-register-symbol-command "R" "<bbb-R>" "R")`. `\1` is the double-struck one
  (`<bbb-1>`, typed `1 1 var var var`), defined as `\mathbbm{1}` with the `bbm` package;
  `\mathbbm{1}` and `\mathbb{1}` import as the same symbol.
  `\oper[*]{...}` is a synonym of `\operatorname` (defined once in the preamble with
  `\NewDocumentCommand{\oper}{s m}{...}`, starred form for limits). Export renames Mogan's
  `\tmop{...}` to `\oper{...}`, and Mogan's own `oper` macro exports to it as well; import reads
  `\oper{x}` as `<oper|x>` and adds the `oper` package.
  `\mc \mb \mbf \mf \ms` are synonyms of `\mathcal \mathbb \mathbf \mathfrak \mathscr`: import
  gives the same result as the long forms, export writes the short forms, and each one used is
  defined in the preamble (with a comment, plus its package: amssymb, mathrsfs).
  Mogan's wide accents export as `\tilde`, `\hat`, `\bar`; when one occurs, the preamble
  redefines it (`\RenewDocumentCommand`) to `\widetilde`, `\widehat`, `\overline`. `\check` is left
  alone: standard LaTeX has no `\widecheck` (only font packages such as stix provide one).
- `moganlab/packages/oper.stem` - Mogan macro `oper`: upright operator name.
- `moganlab/packages/mathfonts.stem` - Mogan macros `mc mb mbf mf ms` (cal, Bbb, bold, Euler, cal* fonts).
- `moganlab/packages/lga.stem` - Mogan macro `lga`: left-aligned one-column table, top/centre/bottom
  baseline from the first argument.
- `tex/lga.sty` - optional standalone copy of the same definition, for hand-written documents;
  exported files do not need it.
- `tests/` - headless test suites, one per feature: `test-lga.scm`, `test-symbols.scm`,
  `test-oper.scm`, `test-mathfonts.scm`, `test-accents.scm`, `test-clipboard.scm` (paste and copy of LaTeX snippets), `test-editor.scm`
  (typed `\name` commands and Alt+T);
  shared code in `helpers.scm`. Each covers import, export, the preamble definitions and comments,
  that unused commands are not defined, and round trips. Run from PowerShell:

  ```
  .\tests\run-tests.ps1 -Install     # copy moganlab\* to %APPDATA%\moganlab first, then test
  .\tests\run-tests.ps1 -Name oper   # one suite; -Exe <path> picks another MoganSTEM.exe
  ```

  The tests run against the installed config, so use `-Install` after editing files here.
  The clipboard suite tests the `latex-snippet` converters that copy and paste use; the system
  clipboard itself cannot be driven headless (`clipboard-set` ends the process).
- `tests/7003-old-ltae-inrepo.scm.txt` - obsolete test from the first (in-repo, `ltae`) attempt;
  kept for reference, not runnable as is.

To add another construct like `lga`: write its `.stem` macro and `.sty`, add one registry line,
restart Mogan.
