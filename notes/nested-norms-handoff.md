# Nested norms in LaTeX import/export: findings and implementation (handoff)

> **STATUS UPDATE (written later the same evening):** a parallel session finished this task
> while this note was being written. Sections 3 (implementation) and 4 (results) are still
> accurate. Sections 5 and 6 are partly outdated:
> - committed on branch `latex-nested-norms` (`92a7ac6e0`, the 5 files of section 3) and
>   `latex-left-double-bar` (`c18646126`, maps `\|` to `||` in the `\left`/`\right` branch of
>   `fromtex.cpp`; open item 1 below is DONE);
> - both merged into `main` (`7c121f0dc`), pushed to `github` (branches and `main` match);
> - PR/bug texts exist: `../changes/latex-nested-norms/{pr,bug}.md`,
>   `../changes/latex-left-double-bar/{pr,bug}.md`;
> - `tests/headless-conversion` was extended (norms fixtures; about 39 checks now);
> - not checked by me: whether `gf fmt` (clang-format 19) was applied to those commits, and the
>   remaining items 5 (Chinese UI string, other delimiters, a large real document).
> The working tree is clean; there is no uncommitted work for this task.

Written 2026-10-17 so work can continue in a fresh session. The earlier work on
slowness is finished and irrelevant here; only the repo/environment facts that this
task needs are repeated.

## 1. The problem (as reported)

```
$\|\|f(x,y)+g(x,y)\|_{L^q{\mathbb{R}}}\|_{L^p(\mathbb{R})}$      (N1, ambiguous)
$\|{\|f(x,y)+g(x,y)\|_{L^q{\mathbb{R}}}}\|_{L^p(\mathbb{R})}$    (N2, unambiguous)
```
The importer reads N1 *and* N2 identically and wrongly: the first two bars are paired
into an empty fence and the last two into another, instead of a norm of a norm.
Wanted: the importer understands N2 (braces give the pairing) and the exporter writes the
N2 form for nested bars, as a configurable option.

## 2. Findings

### Importer
- Pipeline: `latex_to_tree_body` (`src/Plugins/Tex/fromtex_post.cpp`, ~line 2503):
  `parsed_latex_to_tree` -> ... -> `handle_matches` (t6) -> `upgrade_tex` (t7).
  Bracket pairing is `upgrade_brackets` (`src/Data/Tree/tree_brackets.cpp`), called from
  `upgrade_tex` in `src/Data/Convert/Texmacs/upgradetm.cpp` (~line 4627).
- The parser DOES keep the braces: the raw parse tree of N2 is
  `(concat (tuple "\\|") (tuple "\\begingroup") (concat ...inner...) (tuple "\\endgroup")
  (tuple "\\|") (tuple "\\<sub>" "p"))`.
- They are lost because `handle_matches` -> `reopen_envs` / `handle_improper_matches`
  (`fromtex_post.cpp` ~1525-1760) drops the begingroup/endgroup markers, and
  `concat_tokenize` (`src/Data/Tree/tree_analyze.cpp`) flattens nested concats, so a nested
  concat cannot serve as an opaque group for the bracket matcher. Adjacent plain symbols in a
  math concat are also merged into one string (`"<||><||>f<||>"`) by the conversion loop.
- `upgrade_brackets` pairs "nearest same bar" (`detect_absolute`), which gives the N1 result.
- Single bars: `\|` converts to the TeXmacs symbol `"<||>"` (printed `\<\|\|\>` in .tmu);
  `|` stays `"|"`.
- Where `\left...\right` is converted: `fromtex.cpp` `l2e`, ~line 2506 (see section 5).

### Exporter
- `texmacs->latex` (`TeXmacs/plugins/latex/progs/latex/convert-latex-tmtex.scm`, ~line 4900)
  first runs `tmtm-eqnumber->nonumber` then **`tmtm-match-brackets`**
  (`TeXmacs/progs/convert/rewrite/tmtm-brackets.scm`). That step *downgrades every `around`
  into plain delimiter symbols*: `(around "<||>" body "<||>")` becomes a flat string. So
  `convert-around`/`tmtex-around` are NOT reached for ordinary documents; adding braces there
  has no effect (my first attempt failed for this reason).
- Before the change a correct nested tree exported as `\|\|f (x, y) + g (x, y)\|_{L^q} \|_{L^p}`
  and nested absolute values as `||f|_q |_p`: both re-import wrongly.
- TeX brace group in the exporter's intermediate language is `(!group ...)`.

## 3. Implementation (all UNCOMMITTED, in the working tree of branch `main`)

`git status` shows exactly these 5 modified files:

### 3.1 Exporter (Scheme)
`TeXmacs/plugins/latex/progs/latex/convert-latex-tmtex.scm`
- helpers `bar-delimiter?` (`"|" "||" "<||>"`), `contains-around-of?`, `protect-around`
- `(tm-define (tmtex-protect-nested-bars x) ...)`: recursive pre-pass over the stree; wraps the
  body of a SMALL `around` whose open == close is a bar and whose body contains an `around`
  with the same bar into `(tmtex-brace-group body)`. `around*` (large, `\left..\right`) is not
  touched (unambiguous).
- `(define (tmtex-brace-group s l) (list '!group (tmtex (car l))))` plus table entry
  `(tmtex-brace-group (,tmtex-brace-group 1))` (next to `math-union`).
- hook in `texmacs->latex`: `x1 = (if (!= (assoc-ref opts "texmacs->latex:protect-nested-bars") "off")
  (tmtex-protect-nested-bars x) x)`, then `x2` is computed from `x1`. Absent option counts as ON.
- `convert-around` is back to its original form.

Option wiring:
- `TeXmacs/plugins/latex/progs/latex/latex-format.scm`: `(:option "texmacs->latex:protect-nested-bars" "on")`
  in both texmacs->latex converters (an `:option` automatically registers a preference with that
  default via `converter-define-option` in `tm-convert.scm`).
- `TeXmacs/progs/kernel/texmacs/pref-keys.scm`: `(pref-convert-latex-protect-nested-bars)`.
- `TeXmacs/progs/texmacs/menus/preferences-widgets.scm`: checkbox "Group nested norms and
  absolute values with braces" after "Allow for macro definitions in preamble".
  (No Chinese translation added.)

### 3.2 Importer (C++)
`src/Plugins/Tex/fromtex.cpp`, before `latex_concat_to_tree`:
- `is_bar_token(t)`: `(tuple "\\|")`, `\Vert`, `\vert`, or atomic `"|"`
- `skip_math_spaces`
- `match_braced_bar_pair(t, i, group_begin, group_end, close)`: at a bar, optional spaces, a
  `\begingroup`, matching `\endgroup` (depth counted), optional spaces, the SAME bar.
In the loop of `latex_concat_to_tree`, before `bool operator_flag`: in math mode, if the pattern
matches and `l2e(bar)` is atomic: convert the group contents with a recursive
`latex_concat_to_tree`, run `upgrade_brackets(body, "math")` on them (needed: the later global
pass does not descend into the new node), push `tree(AROUND, open, body, open)`, set
`i = close; continue`.
Scope: only `bar {group} same-bar`. Other symmetric delimiters and N1 are unchanged.

## 4. Test results (debug-info build on Windows, after both changes)

Fixtures (created with the Write tool; see the backslash trap below):
`gu_mogan_build/tests/headless-conversion/fixtures/norms.tex` (N1-N4) and `norms.tm`
(nested, single, nested absolute values, sibling norms).

Import (`MoganSTEM -headless -c norms.tex out.tmu`):
- N2 -> `<around|‖|<around|‖|f<around|(|x,y|)>+g<around|(|x,y|)>|‖><rsub|L<rsup|q>*R>|‖><rsub|L<rsup|p><around|(|R|)>>`
  (correctly nested; before: same output as N1)
- N1 unchanged (still the "nearest pairs" reading, inherently ambiguous)
- N3 `\|f\|_{L^p}` unchanged and correct
Export (`-c norms.tm out.tex`), option default:
- nested: `$\| {\|f (x, y) + g (x, y)\|_{L^q}} \|_{L^p}$`
- nested absolute values: `$| {|f|_q} |_p$`
- single `\|f\|_{L^p}` and sibling `\|f\| + \|g\|` unchanged; `‖ |f| ‖` (different bars) unchanged
Option: through the real converter with the preference set in an isolated user dir:
off -> old form, on -> braced form, unset ("default") -> braced.
Round trip N1-N3: tex -> tmu -> tex -> tmu gives identical trees (N2 exported text with its
spaces around `{}` re-imports identically).

## 5. Open items

1. **`\left\|` imports as a single bar (separate bug, not fixed).** `fromtex.cpp` ~2506-2518:
   in the `is_large_delimiter` branch the label `"\\|"` has its backslash stripped, giving `"|"`
   (single bar), while `Vert`/`Arrowvert` are mapped to `"||"`. Fix: map `"\\|"` to `"||"` before
   stripping, e.g. `if (s == "\\|") s= "||";`. Consequence today: N4 `\left\|\left\|f\right\|_{L^q}
   \right\|_{L^p}` becomes `<around*|\||...|` and re-exports as `| | f |_{L^q} |_{L^p}`, which is
   wrong and not stable on re-import. Needs a rebuild and a check that `\left\Vert` still works.
2. Create the branch and commit (see section 6). Format with `gf fmt`; remember clang-format 19
   vs 22 (the `operator tree ()` hunk in `edit_interface.cpp/.hpp` is an artifact, revert it).
3. Add tests to `gu_mogan_build/tests/headless-conversion/run-tests.sh`: import N2 expecting the
   substring `<around|\<\|\|\>|<around|\<\|\|\>|f`, export of `norms.tm` expecting
   `\| {\|f` and `| {|f|_q} |_p`, sibling/single unchanged, round trip stable.
4. Write the PR text and a bug report in the style of `gu_mogan_build/changes/*/pr.md`
   (plain-language "What happened", cause, change, verification, "How this fix was made"
   section, and keep each text self-contained, no cross-references to other PRs).
   Mention the option name and that the importer rule covers only `bar {group} bar`.
5. Not done: option for the importer; Chinese UI string; other delimiters (e.g. `\langle`);
   `\mathrm`-style groups; a check on a larger real document.

## 6. Repository and environment facts needed to continue

- Repo `C:\Users\guraltsev\Documents\devel\mogan`. Remotes: `upstream` = MoganLab/mogan
  (`origin` was renamed), `github` = `git@github.com:guraltsev/mogan.git` (the user's fork).
  `upstream/main` was `c68a494fc` when last fetched; run `git fetch upstream` first.
- Local `main` = `upstream/main` + eight merged feature branches, pushed to `github/main`
  (head `d139cee2c` at the time). The 5 uncommitted files above are on top of that.
  Feature branches (each one commit on upstream/main, pushed): skip-remote-cursors-on-repaint,
  delay-toolbar-refresh, style-cache-invalidation, headless-convert, user-keyboard-layer,
  amsmath-gathered (now pr/amsmath-aligned-gathered), aligned-valign-control, aligned-enter-nesting. Do NOT name branches with the
  `username/200_27/xxx` scheme (the user dislikes it); use plain descriptive names.
- Suggested for this work: `git checkout -b latex-nested-norms upstream/main` (the 5 files are
  unchanged between `main` and `upstream/main`, so the edits carry over), commit, push to
  `github`, then merge into `main` with `--no-ff` like the others. Watch for the Windows
  "unable to unlink ... edit_interface.hpp" checkout error: restore with `git checkout -- <file>`.
- Build: `cmd /c "gu_mogan_build\scripts\_build.cmd releasedbg dist-releasedbg"` from the repo
  root (PowerShell, not Git Bash; no running MoganSTEM from `build\dist-releasedbg`). About 2-3
  minutes. Result: `build\dist-releasedbg\bin\MoganSTEM.exe`. Scheme-only changes can be tested
  by copying the files into `build\dist-releasedbg\...` (same relative paths).
- A clean upstream build exists in a git worktree `..\mogan-upstream-baseline`
  (`build\dist\bin\MoganSTEM.exe`; currently on branch `pr6-alone`). For baselines run it with
  isolated `LOCALAPPDATA` and `TEXMACS_HOME_PATH` (the style cache in
  `%LOCALAPPDATA%\moganlab\system\cache\<version>\` is shared by every build).
- Local conversion tests: `gu_mogan_build/tests/headless-conversion/run-tests.sh` (31 checks, run
  from Git Bash), README next to it.
- Formatting: `gf` is installed; `clang-format` 22 from
  `/c/opt/msys/v20240918.l7/App/ucrt64/bin` (add to PATH). CI wants clang-format 19.1.x.
  Use `gf fmt --changed-since upstream/main` (it rewrites files even with `--check`).
- PR conventions: titles `[NNNN] summary` (maintainers assign numbers), submission texts in
  `gu_mogan_build/changes/`, commits end with
  `Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>`.

## 7. Gotchas learned the hard way

- **Backslash trap:** LaTeX test files written with shell heredocs/`printf` lose one backslash
  of `\\` (a backslash-space is TeX control space, imported as `*`). Always create `.tex`
  fixtures and any text containing `\\` with the file-writing tool, and check with `od -c`.
- `-c in out` works only on the real converter chain; `buffer-export` of an untitled buffer fails.
- stdout of the Mogan exe is only captured reliably through PowerShell `Start-Process
  -RedirectStandardOutput`, not from Git Bash redirects.
- `tree-set!` needs a variable as its first argument (not an expression).
- `tmtex-initialize` and other module-private functions are not callable from `-x` scripts; use
  `(use-modules (latex convert-latex-tmtex))` after `(plugin-initialize 'latex)` for public ones.
- Do not patch files in `build\dist-releasedbg` temporarily for debugging (the user objected);
  write read-only probe scripts instead and run them with
  `MoganSTEM.exe -headless -x "(load \"<script>\")"` (script saves results with `string-save`
  to a path given in an environment variable such as `TEST_OUT`).
- The style cache is not invalidated by package changes in builds without the cache-stamp fix
  (it is in `main`); use isolated env vars when comparing builds.
