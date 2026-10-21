# Find your PR branches that upstream has merged (squash merges are invisible to git, so ask GitHub)
# and delete them. Dry run unless -Apply. Remote (fork) copies are removed only with -Remote.
# Safe for main: the merged content is already in main, so deleting the pr/* branch changes nothing there.
# Usage: .\prune-merged.ps1 [-Apply] [-Remote] [-Author guraltsev]
param([switch]$Apply, [switch]$Remote, [string]$Author = 'guraltsev')
$ErrorActionPreference = 'Stop'
# gu_mogan_build has its own git repo; operate on the main checkout.
Set-Location (Split-Path (Split-Path $PSScriptRoot))
$prs = gh pr list --repo MoganLab/mogan --author $Author --state merged --limit 100 --json number,headRefName,title | ConvertFrom-Json
foreach ($pr in $prs) {
  $b = $pr.headRefName
  $hasLocal = git branch --list $b
  $hasFork = git branch -r --list "github/$b"
  if (-not $hasLocal -and -not $hasFork) { continue }
  Write-Host ("#{0} {1}  [{2}{3}]" -f $pr.number, $b, $(if ($hasLocal) {'local '}), $(if ($hasFork) {'fork'}))
  if (-not $Apply) { continue }
  if ($hasLocal) { git branch -D $b }
  if ($Remote -and $hasFork) { git push github --delete $b }
}
if (-not $Apply) { Write-Host "`nDry run. Add -Apply (and -Remote to delete fork copies)." }

# Branches still carrying unmerged work, for the README patch list.
Write-Host "`nOpen patches in main (pr/* branches not merged upstream):"
git branch --list 'pr/*' --format '  %(refname:short)'
