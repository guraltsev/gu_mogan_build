# Build a worktree's checkout (created by worktree-add.ps1) -> <worktree>\build\dist-<mode>.
# Usage: .\worktree-build.ps1 <branch-or-commit> [release|releasedbg]   (default: release)
param([Parameter(Mandatory)][string]$Ref,
      [ValidateSet('release', 'releasedbg')][string]$Mode = 'release')
. "$PSScriptRoot\_wt.ps1"

$wt = Find-Worktree $Ref
if (-not $wt) { throw "No worktree for '$Ref'. Run worktree-add.ps1 first." }
# Package builds nest so deep they overflow MAX_PATH under the worktree, and main already has them
# built: share main's package dir through a junction (worktree-remove deletes the link only).
$pk = Join-Path $wt 'build\.packages'
$mainPk = Join-Path $MainRepo 'build\.packages'
if ((Test-Path $mainPk) -and -not ((Get-Item $pk -ErrorAction SilentlyContinue).Attributes -band [IO.FileAttributes]::ReparsePoint)) {
  if (Test-Path $pk) { Remove-Item $pk -Recurse -Force }   # partial/failed installs inside the worktree
  New-Item -ItemType Directory -Force (Split-Path $pk) | Out-Null
  cmd /c mklink /J "$pk" "$mainPk" | Out-Null
}
& "$PSScriptRoot\_build.cmd" $Mode "dist-$Mode" $wt
exit $LASTEXITCODE
