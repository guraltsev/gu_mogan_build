# Building Mogan on Windows (this machine)

## Prerequisites
- xmake (latest master is fine; v3.1.1+master).
- VS 2026 BuildTools (`C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools`)
  **plus a Windows SDK** (installed 10.0.28000.0; BuildTools alone has no
  `stdlib.h`/`winsock2.h`). Needs an elevated installer.
- Qt 6.8.3 installed outside xmake: `aqt install-qt windows desktop 6.8.3 win64_msvc2022_64 -O %LOCALAPPDATA%\Qt`
  (`pip install aqtinstall`; run from a writable cwd, it writes `aqtinstall.log` there).
  The xmake `qt6widgets` package reports "unsupported on windows/x64", so pass `--qt=`.

## Gotchas
- Run xmake from PowerShell, with `-p windows -a x64`. Under Git Bash it selects mingw.
- If the SDK was installed after a failed xmake run, delete
  `%LOCALAPPDATA%\.xmake\cache\detect` and `build\.packages`; otherwise xmake keeps
  a stale MSVC environment without SDK include/lib paths
  (symptoms: missing `stdlib.h`, `winsock2.h`, `advapi32.lib`).
- `gf` (formatter, `gf fmt --changed-since=main`) is not installed yet.
- Git: a branch `GU` blocks creating `gu/...` branches (case-insensitive FS).

## Configure / build
`scripts/configure.ps1`, then `xmake build --yes stem`.

## Local patches (branch dev/200_27/local-fixes on origin/main)
See `patches/`: amsmath aligned, headless CLI conversion, Qt non-ASCII key input.
User keyboard config: `user-config/my-init-texmacs.scm` (contains "fuck" test
bindings for alpha; clean before using).


- Qt modules needed beyond base: `-m qtnetworkauth qtlottie` (Bodymovin).

## Run / test
- `xmake build --yes stem` then `xmake install --yes stem` (needed before `xmake run stem`).
- Headless conversion check: `xmake run stem -headless -c in.tex out.tmu` (verified: amsmath `aligned` -> `<aligned>`).
- Running `MoganSTEM.exe` directly from build\windows\... fails (0xC0000135, no Qt DLLs); use `xmake run`.
