# Bring the rolling fork up to date with upstream. History only grows; nothing is rewritten.
#   1. fetch upstream
#   2. fast-forward upstream-main to upstream/main (pure mirror, never has local commits)
#   3. merge upstream-main into main
# Stops on conflicts so you can resolve them by hand (take upstream's version where upstream squash-merged
# one of your PRs differently), then git commit. Does not push; push main and upstream-main yourself.
# Usage: .\sync-main.ps1
$ErrorActionPreference = 'Stop'
# gu_mogan_build has its own git repo; operate on the main checkout.
Set-Location (Split-Path (Split-Path $PSScriptRoot))
if (git status --porcelain --untracked-files=no) { throw "Working tree is not clean." }
if ((git branch --show-current) -ne 'main') { throw "Switch to main first." }

git fetch upstream
if ($LASTEXITCODE) { throw "git fetch upstream failed" }

# -f is safe: upstream-main only ever mirrors upstream/main.
git branch -f upstream-main upstream/main
$n = [int](git rev-list --count main..upstream-main)
if ($n -eq 0) { Write-Host "main already contains upstream/main."; exit 0 }

Write-Host "Merging $n upstream commit(s) into main..."
git merge upstream-main -m "Merge upstream-main into main"
if ($LASTEXITCODE) {
  Write-Host "`nConflicts. Resolve, git add, git commit. Then run prune-merged.cmd." -ForegroundColor Yellow
  exit 1
}
Write-Host "`nDone. Next: prune-merged.cmd, update-fork-readme.cmd -Commit, build/test, then push main and upstream-main to the fork."
