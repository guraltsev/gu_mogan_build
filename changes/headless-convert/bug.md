**Title:** `MoganSTEM -headless -c doc.tm doc.tex writes no output file`

**Labels (suggested):** bug, command line

---

## Summary

Converting a document from the command line, `MoganSTEM -headless -c <in> <out>`, produces
no output file for TeXmacs inputs (`.tm`, `.tmu`) and no message. Only `.tex -> .tmu` (which
has its own code path) and PDF export are handled.

## Environment

- Mogan STEM built from `main` at `c68a494fc`, xmake mode `releasedbg`
- Windows 11 Enterprise, Qt 6.8.3; run with an empty user directory and an empty cache
  (`TEXMACS_HOME_PATH` and `LOCALAPPDATA` pointing to empty folders)

## Steps to reproduce

1. Save this as `doc.tm`:

   ```
   <TeXmacs|2.1.4>

   <style|<tuple|article|number-europe>>

   <\body>
     Intro text.

     <\equation>
       a=b
     </equation>
   </body>
   ```

2. Run `MoganSTEM.exe -headless -c doc.tm doc.tex` (also with `doc.tmu` as the target).

## Expected

`doc.tex` contains a LaTeX document with the equation; `doc.tmu` a TeXmacs document.

## Actual

Neither file is created. Nothing about the conversion is printed (only the normal startup
and shutdown lines); I did not check the exit status.

## Analysis

For the default case, `TeXmacs_main` (`src/System/Boot/init_texmacs.cpp`) generates the
command sequence `(load-buffer "<in>" :strict) (export-buffer "<out>")`. I did not trace why
this writes nothing; in headless mode there is no active view, and `export-buffer`
exports the *current* buffer. Loading the buffer by URL and exporting that same buffer by
URL (`buffer-load`, `buffer-export source target format`) produces the expected files.

The target format has to be determined from the output suffix, because the output file
does not exist yet and formats such as `latex` are only registered once their plugin is
initialised (`(lazy-plugin-force)`, then `(format-from-suffix (url-suffix target))`).

## Fix

Pull request: branch `headless-convert`. After it, `.tm -> .tex`, `.tm -> .tmu`,
`.tmu -> .tex` and a `.tex -> .tmu -> .tex` round trip all produce the expected output.

## Notes

The diagnosis was worked out interactively with an AI assistant (Claude Sonnet 5.5); I ran
the commands and checked the output by hand.
