# Scripts

Helper scripts for building and testing Mogan (MoganSTEM) on Windows, working with temporary git
worktrees, and exporting PR branches as patch files.

Everything here assumes this layout:

```
<mogan>\                      main checkout (the only permanent one)
  build\                      build output of the main checkout
  gu_mogan_build\
    scripts\                  <- you are here
    worktrees\                temporary worktrees (created by the worktree-* scripts)
    changes\<name>\           per-change notes; patches\ is written by make-patches.sh
```

## Quick reference

| I want to...                                       | Run                                                       |
|----------------------------------------------------|-----------------------------------------------------------|
| Build a normal (windowless) release of main        | `build-release.cmd`                                       |
| Build a release with a debug console of main       | `build-releasedbg.cmd`                                    |
| Only configure xmake, no build                     | `configure.cmd`                                           |
| Build another branch/commit beside main            | `worktree-add.cmd <ref>` then `worktree-build.cmd <ref>`  |
| Throw a worktree away when done                    | `worktree-remove.cmd <ref>`                               |
| Merge new upstream commits into main            | `sync-main.cmd` (see `.agents/knowledge/fork-workflow.md`) |
| Delete branches whose PR upstream merged           | `prune-merged.cmd` (dry run; `-Apply`, `-Remote`)         |
| Save `pr/*` branches as portable patch files       | `bash scripts/make-patches.sh`                            |

## General rules

- **Run from PowerShell or cmd at the repo root, not Git Bash.** In Git Bash xmake picks the mingw
  platform and cannot find the Windows SDK. (`make-patches.sh` is the one exception: it is a bash
  script and needs Git Bash.)
- **Do not use `xmake b stem` / `xmake r <test>` directly.** `xmake b stem` only fills
  `build\windows\x64\release`, whose exe has no Qt DLLs and fails silently. These scripts build and
  *install* into a self-contained `dist` folder instead.
- **Close any running `MoganSTEM.exe` from the target dist** before rebuilding it.
- Every `.cmd` is a thin wrapper that calls the matching `.ps1` (or `_build.cmd`) and forwards all
  arguments, so the `.cmd` form works from both cmd and PowerShell without execution-policy problems.

## Prerequisites

- Visual Studio 2022 C++ toolchain, xmake, git.
- Qt 6.8.3 (MSVC 2022 x64) at `%LOCALAPPDATA%\Qt\6.8.3\msvc2022_64`. If missing, the build prints the
  install command:
  ```
  aqt install-qt windows desktop 6.8.3 win64_msvc2022_64 -m qtnetworkauth qtlottie -O "%LOCALAPPDATA%\Qt"
  ```
- Further setup notes and gotchas: `gu_mogan_build\_docs\windows-build-setup.md`.

---

## Building the main checkout

### `build-release.cmd`
Builds the **windowless release** and installs it to `<mogan>\build\dist-release`.
Run the result with `build\dist-release\bin\MoganSTEM.exe`. Use this for day-to-day use and for
checking behaviour as a user would see it.

### `build-releasedbg.cmd`
Builds **release with debug info** (a console window shows logs) into
`<mogan>\build\dist-releasedbg`. Use this when you need log output or want to attach a debugger.
Console output is also what integration tests use to report results.

Both scripts end with `pause` so the window stays open to show success or errors, and return the
build's exit code.

### `configure.cmd` / `configure.ps1`
Runs only the xmake **configure** step (`releasedbg`, Windows x64, Qt 6.8.3, `--loro=yes`), forcing a
clean reconfigure (`-c`). It does not build. Follow it with `xmake build --yes stem` if you want the
raw xmake build; for normal work prefer the build scripts above, which configure for you.

### `_build.cmd` (internal)
The shared worker behind the build scripts. You normally never call it directly, but it is useful for
custom combinations:

```
_build.cmd <xmake-mode> <dist-folder-name> [checkout-dir]
_build.cmd releasedbg dist-releasedbg
```

It (1) checks Qt is installed, (2) runs `xmake f` for the given mode, (3) runs `xmake build stem`,
(4) runs `xmake install` into `<checkout>\build\<dist-folder-name>`. Each mode keeps its own object
directory, so switching between `release` and `releasedbg` reconfigures but does not throw away the
other mode's compiled objects. The optional third argument is the checkout to build (defaults to the
main checkout); the worktree scripts use it.

---

## Worktrees

Worktrees let you build a PR branch, an old commit, or a clean `upstream/main` baseline **beside**
main without touching your main checkout. They are temporary: create, build, test, remove.

**All worktrees live in `gu_mogan_build\worktrees\<ref>`** and nowhere else; the scripts refuse to
operate on worktrees outside that folder (including the main checkout). `<ref>` is a branch name or
a commit id; characters illegal in folder names (`/ : * ? " < > |` and spaces) become `-`.

### `worktree-add.cmd <ref>`
Creates the worktree. A branch is checked out normally; a commit id gives a detached HEAD. If the
worktree already exists it just reports its path. Fails on an unknown ref.

### `worktree-build.cmd <ref> [release|releasedbg]`
Builds the worktree (default `release`) into `<worktree>\build\dist-<mode>`, using `_build.cmd`.
To avoid Windows MAX_PATH overflows from deeply nested package builds (and to save a long first
build), it **links `build\.packages` to main's** with a directory junction, so main must have been
built at least once.

### `worktree-remove.cmd <ref> [-Force]`
Deletes the worktree and its build output; **the branch stays**. It refuses if a `MoganSTEM.exe` from
that worktree is running, or if there are uncommitted changes (override with `-Force`, which
discards them). The shared-packages junction is unlinked first, so main's packages are never deleted.

### `_wt.ps1` (internal)
Shared helpers dot-sourced by the three scripts above: computes the worktree root and path for a ref
(`Get-WtPath`) and finds the existing worktree for a branch or commit (`Find-Worktree`), restricted
to `gu_mogan_build\worktrees`.

### Typical session

```powershell
.\gu_mogan_build\scripts\worktree-add.cmd pr/latex-matrix-envs
.\gu_mogan_build\scripts\worktree-build.cmd pr/latex-matrix-envs releasedbg
# test: <repo>\gu_mogan_build\worktrees\pr-latex-matrix-envs\build\dist-releasedbg\bin\MoganSTEM.exe
.\gu_mogan_build\scripts\worktree-remove.cmd pr/latex-matrix-envs
```

---

## Patches

### `make-patches.sh [BRANCH...]`
Snapshots `pr/*` branches as `git format-patch` series so the work survives if a branch is deleted
and can be ported to a different upstream commit. With no arguments it processes every local
`pr/*` branch.

- Output goes to `gu_mogan_build/changes/<name>/patches/` (`<name>` = branch name without `pr/`).
  That directory **must already exist** (create `changes/<name>/` with its `pr.md`/`bug.md` first),
  otherwise the script stops with an error.
- Patches are generated from the merge base with `$BASE` (default `upstream/main`; override with
  `BASE=origin/main bash scripts/make-patches.sh`). The base commit is recorded in each patch as a
  `base-commit:` trailer.
- Each `patches/` folder is wiped and regenerated, and gets a generated `README.md` with the
  upstream base commit and the `git am` commands to re-apply the series. Do not edit these by hand;
  re-run the script after the branch changes.

```bash
bash gu_mogan_build/scripts/make-patches.sh                 # all pr/* branches
bash gu_mogan_build/scripts/make-patches.sh pr/latex-matrix-envs
```

---

## Troubleshooting

- **Build fails with stale or odd configuration:** the build scripts already force a clean
  reconfigure; if it persists, remove `build\windows\x64\<mode>` for that mode and rebuild.
- **xmake complains about the mingw platform / missing Windows SDK:** you are in Git Bash. Switch to
  PowerShell or cmd.
- **"Qt not found":** install Qt 6.8.3 as shown under Prerequisites.
- **`worktree-build` says no worktree:** run `worktree-add` first with the same `<ref>`.
- **`worktree-remove` refuses:** close the running exe, commit/stash changes, or pass `-Force`.
- **The exe ignores `TEXMACS_PATH`:** by design it reads its data from its own folder, so test
  against a dist built by these scripts.
