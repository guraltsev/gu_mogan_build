# Pitfalls (each one cost real time)

## The shell tool and files
- **Backslash loss:** text written through shell heredocs or `printf` loses one backslash of every `\\`.
  A backslash-space is TeX's control space; the importer turns it into `*`, which looks like an importer
  bug. Always create `.tex` fixtures (and any text with `\\` or `\begin`) with the file-writing tool,
  and verify with `od -c`. The conversion test script refuses fixtures without `\\`.
- Git Bash redirects (`> file 2>&1`) do not capture the console output of the Mogan exe; use PowerShell
  `Start-Process -RedirectStandardOutput`.
- `python`/`python3 -` fed by a heredoc hangs in this environment; use `sed`, the edit tool, or small scripts.
- `rm -f "$VAR/..."` is blocked by a safety check; write `rm -f "${VAR:?}/name"`.
- `grep` with backslashes: use `grep -F` (BRE treats `\\` as one backslash).
- Check `$?`/output of every build; a trailing xmake warning can make a background task report "failed"
  although the log says `build ok` and `install ok!`.
- Scratch files go to the session scratchpad; test fixtures that must persist go to
  `gu_mogan_build/tests/...`.

## Git on this machine
- Working copies are CRLF, the index is LF (`autocrlf`): `git status`/`diff` show whole-file noise;
  use `git diff -w` and `git ls-files --eol`.
- Checkout between branches sometimes fails with `unable to unlink old '...edit_interface.hpp': Invalid
  argument` (file locked, IDE/antivirus). The branch still switches; restore the file with
  `git checkout -- <file>` and re-check `git status`.
- An interrupted fast-forward leaves upstream's new files as UNTRACKED files that then block the
  retry. Remove only untracked files that exist in the target tree and are byte-identical
  (`git hash-object --path=f f` vs `git rev-parse rev:f`), never `git clean`; the user's two untracked notes
  (`mogan-unicode-greek-keyboard-bug-report.md`, `my-init-texmacs-keyboard.md`) must stay.
- A local branch named `GU` exists; on this case-insensitive filesystem do not create `gu/...` branches.
- Local `main` was 145 commits behind upstream when found; compare against `upstream/main` after
  `git fetch upstream`.

## Testing mistakes made
- Looking for the word of a feature in extracted PDF text (`pdftotext`) gives false positives when the
  caption contains the word. Compare rendered images (`pdftoppm -png`) or structure instead.
- Not isolating `LOCALAPPDATA`/`TEXMACS_HOME_PATH` lets one build's style cache and init file leak into
  another build's results.
- "Before" measurements taken on a build that already contains part of your own patches are not upstream
  behaviour; use the clean upstream worktree build.
- A headless run of a key-handling test depends on which modules are loaded and in which order; load the
  modules explicitly and test both orders.
- `PowerShell Start-Process -ArgumentList` does not quote for you: build the argument string by hand
  (`'-headless -x "(load \"C:/path/s.scm\")"'`), and check the child's command line if it behaves oddly.
