# Working with this user (stated preferences)

- Branch names: plain and descriptive (`delay-toolbar-refresh`), NOT the `username/200_27/xxx` scheme.
  Name leftover/backup branches descriptively too (`original-13-commit-history`, `all-changes-linear`).
- One branch per change, one commit per branch, each applying to `upstream/main` on its own; branches
  are pushed to the user's fork (`github` remote, `git@github.com:guraltsev/mogan.git`); `upstream` is
  MoganLab/mogan. The fork's `main` = upstream + all feature branches merged `--no-ff`, one by one.
- Ask before: force-pushing, deleting branches, rewriting published commits, anything outward-facing.
  Pushing new feature branches to the fork was explicitly requested earlier.
- PR/issue texts (`gu_mogan_build/changes/`): each text must stand alone (no "the same paper", no
  references to other PRs); start with a plain-language "What happened"; then cause, change, what was
  verified, what was NOT checked; end with "How this fix was made": developed through human-aided
  debugging, code written using Claude Sonnet 5.5, reviewed and tested by the user. One bug report per PR.
  Titles use `[NNNN]` (maintainers assign numbers). Claims about upstream behaviour must be verified on
  a clean upstream build.
- Commits end with `Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>`; keep them formatted with
  `gf fmt` (see `build-test-env.md`).
- Do not temporarily modify installed files under `build\dist-releasedbg` just to debug; write read-only
  probe scripts instead (the user rejected such a patch-and-restore step).
- The user prefers concise answers that state clearly what was and was not verified, and corrections of
  earlier claims as soon as they are found. Handoff notes go to `gu_mogan_build/notes/`.
- The user's own config lives in `gu_mogan_build/user-config/my-init-texmacs.scm` (installed via the link
  `%APPDATA%\moganlab\progs`): `$` / `$$` behaviour, `Alt+Down/Up` multi-line equation, backtick math keys.
