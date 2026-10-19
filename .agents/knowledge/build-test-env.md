# Build, run, test, isolate

## Build
- From the repo root in **PowerShell** (not Git Bash, xmake would pick mingw):
  `cmd /c "gu_mogan_build\scripts\_build.cmd releasedbg dist-releasedbg"` -> 1.5-4 minutes,
  output `build\dist-releasedbg\bin\MoganSTEM.exe` (a console build). `build-release.cmd` makes
  `build\dist-release` (no console). Needs Qt in `%LOCALAPPDATA%\Qt\6.8.3\msvc2022_64`.
- The compile succeeds even if the install step fails because that exe is running. Close the
  instance started from `build\dist-releasedbg` first (an installed copy under `C:\opt\mogan\current`
  does not block it, but it does NOT get your changes).
- Scheme/style files are copied to `build\dist-releasedbg\...` by the install; for a Scheme-only
  change you can copy the file to the same relative path there instead of rebuilding.
- `xmake r <test>` does not work here (expects `build\packages\stem\data\bin`).
- `xmake` also needs `xmake f -c --yes -p windows -a x64 -m releasedbg --loro=yes --qt=...` for a
  fresh tree; `_build.cmd` does that every time.
- The exe takes its data directory from its own folder; `TEXMACS_PATH` is ignored. Test against an
  installed dist, not `build\windows\...`.
- A clean upstream build can live in a worktree: `git worktree add ..\mogan-upstream-baseline
  upstream/main`, then `xmake f ...; xmake build --yes stem; xmake install --yes -o build\dist stem`
  (about 4 min first time). Use it to confirm what upstream really does before claiming a bug.

## Headless usage
- Convert: `MoganSTEM.exe -headless -c <in> <out>` (`.tex->.tmu` has its own branch, pdf another).
- Run Scheme: `MoganSTEM.exe -headless -x "(load \"C:/path/script.scm\")"`; end the script with
  `(quit-TeXmacs)`. Pass paths with forward slashes. Inside bash, `$(pwd -W)` gives a Windows path.
- Scripts cannot `display` to a capturable stdout from Git Bash. Write results with
  `(string-save text (system->url (getenv "TEST_OUT")))` and read the file.
  PowerShell `Start-Process -RedirectStandardOutput/-RedirectStandardError` does capture the console.
- For key tests: `(new-buffer) (set-style-list '("article")) (insert "t ") (key-press "return")`;
  load `(use-modules (math math-edit) (text text-edit) (generic generic-edit))` first or math keys
  fail with unbound `math-tabcycle-menu-needed?`. `(lazy-keyboard-force #t)` loads lazy keyboards;
  keyboard modules that plugins register need `(lazy-plugin-force)` too.
- Default new buffers use style `generic`; `make` on a tag only knows its arity if the style loaded it
  (tags known to C++ by name, like `gather*`, `align*`, `aligned*`, work anyway).

## Isolation (important when comparing builds)
- All builds with the same version string share the compiled-style cache
  `%LOCALAPPDATA%\moganlab\system\cache\<XMACS_VERSION>\` (path built from `$LOCALAPPDATA`, see
  `get_tm_cache_path`), and settings in `%APPDATA%\moganlab` (`$TEXMACS_HOME_PATH`).
  To get a clean run set both env vars to empty temp folders before starting the exe.
  The user init file is `$TEXMACS_HOME_PATH/progs/my-init-texmacs.scm` (here `progs` is a link to
  `C:\Users\guraltsev\Config\Mogan\progs`).

## Logs and benchmarks
- `%APPDATA%\moganlab\system\<date>.log` has `std-bench` lines (`Task '...' took N ms`, printed above
  10 ms) and every key press (`QTMWidget::keyPressEvent`). Useful to time `apply_changes`,
  `update_menus: icons*`, `repaint_invalid_regions`, `typeset`.
- `cdb.exe -pv -p <pid> -y <dist\bin> -c "~0k 60;q"` (Windows SDK debugger, no admin) gives a stack
  sample; repeat 40 times for a poor-man's profile.

## Formatting and CI
- CI runs `gf fmt --check` and needs **clang-format 19.1.x** (`devel/Format_ZH.md`). Locally only
  v22 from `/c/opt/msys/v20240918.l7/App/ucrt64/bin` exists; it differs from upstream on one thing,
  the `operator tree ()` declaration in `edit_interface.cpp/.hpp` -> revert that hunk after `gf fmt`.
- `gf fmt --changed-since <rev>` rewrites files even when `--check` is given; with no clang-format on
  PATH it silently skips C++. Use the upstream base commit as `<rev>` (local `main` can be stale).
- Local tests: `gu_mogan_build/tests/headless-conversion/run-tests.sh [--keep] [exe]` (bash; 31 checks when
  written, about 39 after the norms fixtures were added; its README has the list). A stray directory
  `fixtures/C-/` with 13 converted outputs appeared at 19:52, probably from a run whose output path was
  resolved relative to the current directory (not investigated, safe to delete).
- Keyboard layer test: `regtest-kbd-define` in `TeXmacs/progs/kernel/gui/kbd-define-test.scm`,
  run through `-x "(load \"script\")"` where the script does `(load "./TeXmacs/progs/.../kbd-define-test.scm")`
  from the repo root; expect "22 correct, 0 failed".

## Running `TeXmacs/tests/NNNN.scm` integration tests (found while writing 7002)
- Use the user's own build: `gu_mogan_build\scripts\build-release.cmd` (-> `build\dist-release`) or
  `_build.cmd releasedbg dist-releasedbg`. Do NOT run `xmake b stem` / `xmake r NNNN` yourself: `xmake r`
  needs `build\packages\stem\data\bin` (absent) and `xmake b stem` only fills `build\windows\x64\release`,
  which has no Qt DLLs (the exe dies with "Qt6Core.dll: cannot open shared object file", silently in a pipe).
- The release exe takes its data dir from its own folder; `TEXMACS_PATH` is ignored. To try a test against
  a dist: `cd` into the dist root (the folder holding `bin/` and `progs/`), run
  `./bin/MoganSTEM.exe -headless -d -b tests/NNNN.scm -x "(catch #t (lambda () (test_NNNN) (quit-TeXmacs)) (lambda args ...))"`.
  Tests do `(load "./TeXmacs/plugins/latex/progs/init-latex.scm")`, so the dist root also needs a `TeXmacs/`
  subfolder (or run from the repo root with a repo-local exe). Console output is not capturable from Git Bash:
  end the `-x` expression with `(string-save text "path")` and read that file. A passing `check-report`
  prints `; *** checks *** : N correct, 0 failed.` only in captured console output.
- Tests that call `serialize-latex` need `(import-from (latex latex-format))` after loading `init-latex.scm`,
  otherwise it is unbound (lazy-define only becomes active once that module is loaded).
