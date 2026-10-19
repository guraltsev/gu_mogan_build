# Build, test, repo conventions (Windows)

- Build (PowerShell, from repo root, ~3 min, not while MoganSTEM from that dist runs):
  `cmd /c "gu_mogan_build\scripts\_build.cmd releasedbg dist-releasedbg"`
  -> `build\dist-releasedbg\bin\MoganSTEM.exe`. Scheme-only edits can be tested by copying
  the files to the same relative path under `build\dist-releasedbg`, but prefer probe scripts.
- Headless conversion: `MoganSTEM.exe -headless -c in out` (format by extension). Needs the
  `headless-convert` branch: a build of plain `upstream/main` writes NO file. stdout is only
  captured reliably via PowerShell `Start-Process -RedirectStandardOutput`.
- Tests: `gu_mogan_build/tests/headless-conversion/run-tests.sh` (Git Bash, 40 checks).
  `gu_mogan_build` has its own git repo and is untracked in the main repo.
- BACKSLASH TRAP: heredocs/printf lose one backslash of `\` in test files. Create `.tex`
  fixtures with the file-writing tool and verify with `od -c`.
- Baseline of clean upstream: git worktree `..\mogan-upstream-baseline`.
- Remotes: `upstream` = MoganLab/mogan, `github` = the user's fork. Fetch `upstream` first.
  Feature branches: plain descriptive names (NOT `username/200_27/xxx`), one commit on
  `upstream/main`, push to `github`, then `git merge --no-ff` into local `main`.
- Formatting: `gf fmt --changed-since upstream/main` with clang-format from
  `/c/opt/msys/v20240918.l7/App/ucrt64/bin` on PATH. CI wants clang-format 19, installed is 22:
  it also realigns unrelated lines (e.g. `bool cc_flag      =`, `operator tree ()` in
  `edit_interface`); revert those hunks by hand.
- Windows checkout may fail with "unable to unlink ... edit_interface.hpp": `git checkout -- <file>`.
- Commits end with `Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>`. PR titles
  `[NNNN] summary` (maintainers number them). Texts go in `gu_mogan_build/changes/`
  (bug-N / pr-N, plain-language, self-contained, with a "How this fix was made" section).
- Splitting a fix out of a branch: do not rewrite with a quick script on CRLF files; use the
  Edit tool, then `git commit --amend`, and re-merge into `main` (unpushed `main` can be reset).
