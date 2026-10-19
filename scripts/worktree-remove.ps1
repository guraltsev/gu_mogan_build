# Delete the worktree (including its build output) for a branch or commit. The branch stays.
# Refuses if there are uncommitted changes unless -Force.
# Usage: .\worktree-remove.ps1 <branch-or-commit> [-Force]
param([Parameter(Mandatory)][string]$Ref, [switch]$Force)
. "$PSScriptRoot\_wt.ps1"

$wt = Find-Worktree $Ref
if (-not $wt) { throw "No worktree for '$Ref'." }
if (Get-Process MoganSTEM -ErrorAction SilentlyContinue | Where-Object { $_.Path -like "$wt*" }) {
  throw "A MoganSTEM.exe from $wt is running; close it first."
}
if (-not $Force) {
  $dirty = git -C $wt status --porcelain
  if ($dirty) { throw "Uncommitted changes in $wt (use -Force to discard):`n$dirty" }
}
# Unlink the shared-packages junction first so deletion can never reach main's packages.
$pk = Join-Path $wt 'build\.packages'
if ((Get-Item $pk -ErrorAction SilentlyContinue).Attributes -band [IO.FileAttributes]::ReparsePoint) { cmd /c rmdir "$pk" }
git worktree remove --force $wt
if ($LASTEXITCODE -ne 0) { throw "git worktree remove failed" }
git worktree prune
Write-Host "Removed $wt"
