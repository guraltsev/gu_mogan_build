# Knowledge base for working on this Mogan checkout

Short, verified facts that save experiments. Read the file that matches the task.
Everything here was learned on Windows 11 with a `releasedbg` (release + debug info) build
of Mogan STEM 2026.3.8-rc.1, Qt 6.8.3, in `C:\Users\guraltsev\Documents\devel\mogan`.
`gu_mogan_build/` is excluded from the main repo (`.git/info/exclude`) and has its own small git repo,
so these files are local only.

## Two sets of files (written by two sessions at the same time; they agree)

Set A, longer, one topic per file:

| File | Read it when |
|---|---|
| `build-test-env.md` | building, running headless, writing test scripts, isolating a build |
| `latex-import-export.md` | touching the LaTeX importer/exporter (`src/Plugins/Tex`, `plugins/latex`) |
| `scheme-editor-internals.md` | touching menus, keyboard, focus bar, kbd/Enter handlers, style cache |
| `formatting-gf-fmt.md` | running `gf fmt` / clang-format (local v22 vs CI v19: use a v19 binary for C++, see file) |
| `pitfalls.md` | before using the shell tool, git on Windows, or writing test fixtures |
| `working-with-this-user.md` | before submitting, naming branches, or writing PR/issue text |

Set B, shorter summaries of the same ground (from the nested-norms session):

| File | Overlaps with |
|---|---|
| `build-and-env.md` | `build-test-env.md`, `pitfalls.md`, `working-with-this-user.md` |
| `latex-conversion.md` | `latex-import-export.md` |
| `scheme-and-glue.md` | `scheme-editor-internals.md` |

Facts only in Set B: C++/Scheme glue declarations live in `src/Scheme/Glue/glue_*.lua`, not in the legacy
`.scm` files; and a Scheme list literal in evaluated position is applied as a call, so quote it.

Where both say something, they agree. When one needs updating, update both or merge them
(not done yet; the `README.md` that was here before was overwritten by mistake while writing Set A and
had to be rebuilt from the files in the folder).

## Related, outside this folder
`../notes/nested-norms-handoff.md` (nested-norms task, now finished; status banner at the top),
`../changes/` (one directory per self-contained change, named after its branch: `pr.md`, `bug.md`, `dev-notes/`,
extras and `patches/` with a README naming the upstream commit they apply to; patches are generated from the
branch by `scripts/make-patches.sh`; `unapplied-*` = work that is not a PR), `../tests/headless-conversion/`,
`../issues/` (open findings).
