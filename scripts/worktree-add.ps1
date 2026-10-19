# Create a worktree for a branch or commit at gu_mogan_build\worktrees\<ref>.
# Usage: .\worktree-add.ps1 <branch-or-commit>   (run from PowerShell)
param([Parameter(Mandatory)][string]$Ref)
. "$PSScriptRoot\_wt.ps1"

if (Find-Worktree $Ref) { Write-Host "Worktree already exists: $(Find-Worktree $Ref)"; exit 0 }
$path = Get-WtPath $Ref
if (Test-Path $path) { throw "Path already exists: $path" }

git rev-parse --verify --quiet "$Ref^{commit}" | Out-Null
if ($LASTEXITCODE -ne 0) { throw "Unknown branch or commit: $Ref" }

git show-ref --verify --quiet "refs/heads/$Ref"
if ($LASTEXITCODE -eq 0) { git worktree add $path $Ref }
else                      { git worktree add --detach $path $Ref }   # commit id
if ($LASTEXITCODE -ne 0) { throw "git worktree add failed" }
Write-Host "Created $path"
