# 08 - `gf fmt` formatting of the local patches

Patch: `0008-Format-files-changed-by-the-local-patches-with-gf-fm.patch`
(branch commit `a480b6b4b`; apply after 1-7)

## What
Layout-only changes to `TeXmacs/progs/kernel/gui/kbd-define.scm` (patch 3),
`src/System/Boot/init_texmacs.cpp` (patch 2) and
`src/Edit/Interface/edit_interface.cpp` (patch 5). The project requires
`gf fmt --changed-since=main` before every commit (CLAUDE.md); patches 2-7 were
committed before `gf` was installed.

For upstream, squash this into the patches it belongs to.

## How it was run (Windows)
```
export PATH="$PATH:/c/opt/msys/v20240918.l7/App/ucrt64/bin"   # clang-format
gf fmt --changed-since <upstream base c68a494fc>
```
- Use the upstream base commit, not `main`: the local `main` branch is stale.
- `--check` combined with `--changed-since` still **rewrites** the files.
- Without `clang-format` on PATH, `gf fmt` only prints a hint and skips C++.

## Caveats
- `clang-format` here is **22.1.8** (msys); CI uses **19**. v22 formats unmodified
  upstream code identically except one construct: `operator tree ()` in
  `edit_interface.cpp/.hpp` gets split/indented. That artifact was reverted by
  hand and **reappears every time `gf fmt` is rerun** on those two files; revert it
  again (`git checkout` the hunk) before committing. Installing clang-format 19
  would remove the problem.
- `gf_fmt.json` lists only linux/macos clang-format paths; on Windows it relies on
  PATH.
- Verified afterwards: keyboard-layer and Alt+Up/Down key-press tests give the same
  results with the reformatted `kbd-define.scm`. C++ changes are whitespace and
  line wrapping only; the build was not redone for this commit.
- Patch 7 and patch 6 files (`fromtex_post.cpp`, `edit_collab.cpp`) needed no
  changes; they were already clean.

## Upstream CI uses clang-format 19 (update, 2026-10-19)
- For now upstream CI (`gf fmt --check`) runs **clang-format 19.1.7**; the local msys one is 22.1.8 and
  formats some unmodified upstream lines differently (seen: a continuation line in `parsetex.cpp`
  near `is_math_environment`; CI failed with "1 file(s) need formatting"). Do not trust `gf fmt` locally for C++.
- Get v19 without admin: `python -m pip install --target <dir> clang-format==19.1.7`, then
  `<dir>/clang_format/data/bin/clang-format.exe --dry-run <files>` (or `-i`). A file is correct when
  `--dry-run` prints nothing. Run it on every changed C++ file before pushing, and check the diff
  contains only your own lines.
- `gf fmt` also rewrites Scheme files in ways that are not harmless: it adds a comma before string literals
  inside quasiquotes (`,"1"`) across a whole file (`convert-latex-tmtex.scm`). After running it, keep only the
  hunks for your own lines (restore the file and re-apply by hand).
