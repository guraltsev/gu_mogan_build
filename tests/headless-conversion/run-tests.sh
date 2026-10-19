#!/usr/bin/env bash
# Local tests for `MoganSTEM -headless -c <in> <out>`.
#
#   ./run-tests.sh [--keep] [path/to/MoganSTEM.exe]
#
# Default executable: <mogan>/build/dist-releasedbg/bin/MoganSTEM.exe.
# Converted files go to a temp dir that is deleted afterwards unless --keep.
# Exit status 0 = all passed.  See README.md.

set -u
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$HERE/../../.." && pwd)"
KEEP=0
EXE=""
for a in "$@"; do
  case "$a" in
    --keep) KEEP=1 ;;
    *) EXE="$a" ;;
  esac
done
EXE="${EXE:-$ROOT/build/dist-releasedbg/bin/MoganSTEM.exe}"
[ -x "$EXE" ] || { echo "executable not found: $EXE" >&2; exit 2; }

# Windows-style paths for the native exe (Git Bash); fall back to plain paths.
winpath() { (cd "$(dirname "$1")" && printf '%s/%s' "$(pwd -W 2>/dev/null || pwd)" "$(basename "$1")"); }

FIX="$HERE/fixtures"
OUT="$(mktemp -d)"
[ "$KEEP" = 1 ] || trap 'rm -rf "${OUT:?}"' EXIT

PASS=0
FAIL=0
pass() { PASS=$((PASS + 1)); echo "  ok    $1"; }
fail() { FAIL=$((FAIL + 1)); echo "  FAIL  $1"; }

# Fixtures written through a shell can silently lose one backslash of every
# `\\`, which turns row separators into TeX control spaces (and `*` in the
# import).  Refuse to run on such files.
grep -qF '\\' "$FIX/blocks.tex" || {
  echo "fixtures/blocks.tex contains no double backslash; it was probably written" >&2
  echo "through a shell.  Recreate it with an editor." >&2
  exit 2
}

# convert <in> <out>: run the CLI from the exe's directory, 3 minute cap
convert() {
  local in out
  in="$(winpath "$1")"
  out="$(winpath "$2")"
  (cd "$(dirname "$EXE")" && timeout 180 "$EXE" -headless -c "$in" "$out" >/dev/null 2>&1)
}

# has <file> <description> <fixed string>
has() {
  if grep -qF -- "$3" "$1" 2>/dev/null; then pass "$2"; else fail "$2   [missing: $3]"; fi
}
# lacks <file> <description> <fixed string>
lacks() {
  if grep -qF -- "$3" "$1" 2>/dev/null; then fail "$2   [found: $3]"; else pass "$2"; fi
}
# nonempty <file> <description> <min bytes>
big() {
  local n
  n=$(wc -c <"$1" 2>/dev/null || echo 0)
  if [ "$n" -ge "$3" ]; then pass "$2 ($n bytes)"; else fail "$2   [only $n bytes, want >= $3]"; fi
}

echo "exe: $EXE"
echo

echo "tex -> tmu  (blocks.tex)"
T="$OUT/blocks.tmu"
convert "$FIX/blocks.tex" "$T"
big "$T" "output written" 200
has "$T" "gathered: one row per \\\\" \
  '<gathered|<tformat|<twith|table-valign|c>|<table|<row|<cell|a=b>>|<row|<cell|c=d>>>>>'
has "$T" "gathered[t] sets table-valign t" \
  '<gathered|<tformat|<twith|table-valign|t>|<table|<row|<cell|1>>|<row|<cell|2>>>>>'
has "$T" "gathered[b] sets table-valign b" \
  '<gathered|<tformat|<twith|table-valign|b>|<table|<row|<cell|1>>|<row|<cell|2>>>>>'
has "$T" "aligned: rows and columns" \
  '<row|<cell|a>|<cell|=b>>|<row|<cell|c>|<cell|=d>>'
has "$T" "aligned[t] sets table-valign t" \
  '<tformat|<twith|table-valign|t>|<table|<row|<cell|1>|<cell|2>>|<row|<cell|3>|<cell|4>>>>'
lacks "$T" "no stray macro argument <aligned|t|" '<aligned|t|'
lacks "$T" "no <gathered|t|" '<gathered|t|'
has "$T" "array: rows" '<row|<cell|a>|<cell|b>>|<row|<cell|c>|<cell|d>>'
has "$T" "pmatrix: rows" '<row|<cell|p>|<cell|q>>|<row|<cell|r>|<cell|s>>'
lacks "$T" "no literal * where a \\\\ should split rows" '<cell|b*'
echo

echo "tm -> tex  (equations.tm)"
T="$OUT/equations.tex"
convert "$FIX/equations.tm" "$T"
big "$T" "output is a full document, not plain text" 300
has "$T" "documentclass" '\documentclass{article}'
has "$T" "amsmath is loaded" '\usepackage{amsmath}'
has "$T" "equation" '\begin{equation}'
has "$T" "gathered" '\begin{gathered}'
has "$T" "gathered row 1" '    a = b\\'
has "$T" "gathered row 2" '    c = d\\'
has "$T" "gathered ends" '\end{gathered}'
has "$T" "gather*" '\begin{gather*}'
has "$T" "aligned" '\begin{aligned}'
has "$T" "equation* becomes \\[ ... \\]" '\[ \begin{aligned}'
has "$T" "plain text kept" 'Intro text.'
echo

echo "tm -> tmu  (equations.tm)"
T="$OUT/equations.tmu"
convert "$FIX/equations.tm" "$T"
big "$T" "output written" 100
has "$T" "gathered survives" '<gathered|'
has "$T" "three gathered rows" '<row|<cell|a=b>>|<row|<cell|c=d>>|<row|<cell|e>>'

echo
echo "tmu -> tex  (round trip of the file above)"
T2="$OUT/equations-from-tmu.tex"
convert "$OUT/equations.tmu" "$T2"
big "$T2" "output is a full document" 300
has "$T2" "gathered" '\begin{gathered}'

echo
echo "tex -> tex  (export of the import; checks both directions together)"
convert "$FIX/blocks.tex" "$OUT/blocks.tmu"
convert "$OUT/blocks.tmu" "$OUT/blocks-back.tex"
T3="$OUT/blocks-back.tex"
big "$T3" "output is a full document" 300
has "$T3" "gathered comes back" '\begin{gathered}'
has "$T3" "gathered rows come back" '    a = b\\'

echo
echo "tex -> tmu  (norms.tex: nested norms)"
T="$OUT/norms.tmu"
convert "$FIX/norms.tex" "$T"
big "$T" "output written" 200
has "$T" "braced nested norm is a norm of a norm" '<around|\<\|\|\>|<around|\<\|\|\>|f'
has "$T" "simple norm unchanged" '<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|p>>'
has "$T" "\left\| imports as a double bar" '<around*|\<\|\|\>|<around*|\<\|\|\>|f'

echo
echo "tm -> tex  (norms.tm: bars of nested norms are braced)"
T="$OUT/norms.tex"
convert "$FIX/norms.tm" "$T"
big "$T" "output is a full document" 200
has "$T" "nested norms braced" '\| {\|f'
has "$T" "nested absolute values braced" '| {|f|_q} |_p'
lacks "$T" "no unbraced nested norms" '\|\|f'

echo
echo "tex -> tmu -> tex -> tmu  (norms round trip is stable)"
convert "$OUT/norms.tex" "$OUT/norms-back.tmu"
convert "$FIX/norms.tex" "$OUT/norms-first.tmu"
if grep -F -- '<around|\<\|\|\>|<around|\<\|\|\>|f' "$OUT/norms-back.tmu" >/dev/null 2>&1; then
  pass "braced nested norm survives a round trip"
else fail "braced nested norm survives a round trip"; fi

echo
echo "passed: $PASS   failed: $FAIL"
[ "$KEEP" = 1 ] && echo "outputs kept in: $OUT"
[ "$FAIL" = 0 ]
