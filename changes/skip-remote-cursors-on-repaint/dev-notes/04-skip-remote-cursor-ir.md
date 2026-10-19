# 04 - Skip linear IR build when there are no remote cursors

Patch: `0004-Skip-linear-IR-build-in-get_remote_cursors-when-no-r.patch`
(branch commit `7a91fc432`)

## What
`edit_modify_rep::get_remote_cursors()` returns immediately when
`remote_cursors` is empty.

## Why
Large documents were very slow to scroll and edit (`ubht-orig.tm`, 870 KB,
10k lines). `get_remote_cursors()` is called on every repaint
(`draw_post -> draw_remote_cursors`) and built `tree_to_linear_ir (the_buffer ())`
for the whole buffer *before* looking at `remote_cursors`. Without collaboration
the array is always empty, so each scroll step or keystroke paid O(document size)
for nothing.

## How it was found
Stack sampling of the running debug-info build, no code changes needed:
`cdb.exe -pv -p <pid> -y build\dist-releasedbg\bin -c "~0k 60;q"` about 40 times
while scrolling (`cdb` is in `C:\Program Files (x86)\Windows Kits\10\Debuggers\x64`;
non-invasive attach needs no admin). 33 of 34 busy samples were in
`repaint_invalid_regions > draw_post > draw_remote_cursors > get_remote_cursors >
tree_to_linear_ir > emit_node`; the rest were idle in the event loop.
The `std-bench` lines in `%APPDATA%\moganlab\system\<date>.log` showed the symptom
(`repaint_invalid_regions` 100-300 ms per paint).

## Result (releasedbg, same file, same machine)
| Measure | Before | After |
|---|---|---|
| `repaint_invalid_regions` avg | ~220 ms | 17 ms (max 26) |
| initial typeset | 7.7 s | 3.2 s |

## Caveats
- `gf fmt --changed-since=main` was not run (`gf` not installed here).
- Remaining per-keystroke cost: `update_menus: icons2-focus` ~60 ms avg; first
  `apply_changes` after load up to ~3.6 s. Load time itself was not profiled.
- Worth sending upstream: it affects every large document, not only this setup.
