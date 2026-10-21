# Status: MERGED upstream

- PR: MoganLab/mogan#4745, squash-merged 2026-10-20 as `980bc1ebe` (upstream's final text may differ from the branch; upstream's version wins).
- Local and fork branch `pr/headless-convert` deleted 2026-10-21; its content reaches `main` through `upstream-main`.
- Kept here as a record only (PR text, bug report, notes).

## Earlier status notes

### Status: OPEN (not yet accepted)

- PR: MoganLab/mogan#4745 (opened 2026-10-19, still open). Supersedes #4742, which was closed unmerged on 2026-10-19.
- Base: upstream/main af724b028.
- Maintainer edit: on 2026-10-19 18:03 (+0800) pigmagicfly pushed to the PR branch (not a force-push; my work is kept):
  - 8ec83b7c0 is my original commit "Fix headless -c file conversion", re-committed onto the latest upstream/main (old local hash e7701fe3f).
  - ff92a9a7e "[6224] 精简 headless -c 转换命令并修复错误输出不可见" is their follow-up in src/System/Boot/init_texmacs.cpp: drops the no-op plugin-initialize calls and the source-format binding, writes the "Could not load/export" errors to current-error-port so they reach stderr in headless mode, and rewrites the comment in Chinese.
- Local pr/headless-convert was reset to github/pr/headless-convert (ff92a9a7e) on 2026-10-19. Do not push the old e7701fe3f over it.
- My main contains this branch at ff92a9a7e (merge 4321f2734).
- Status noted: 2026-10-19
