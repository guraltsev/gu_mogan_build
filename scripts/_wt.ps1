# Shared helpers for worktree-*.ps1. Dot-source: . "$PSScriptRoot\_wt.ps1"
$ErrorActionPreference = 'Continue'  # git writes progress to stderr; failures are checked via $LASTEXITCODE
$MainRepo = (Split-Path $PSScriptRoot -Parent | Split-Path -Parent)
Set-Location $MainRepo

# All worktrees live in <mogan>\gu_mogan_build\worktrees; nothing outside it is ever created or touched.
$WtRoot = Join-Path $MainRepo 'gu_mogan_build\worktrees'

function Get-WtPath([string]$Ref) {
  $name = ($Ref -replace '[\/:*?"<>| ]', '-')
  Join-Path $WtRoot $name
}

# Finds the worktree whose checked-out branch is $Ref, or whose HEAD is the commit $Ref.
function Find-Worktree([string]$Ref) {
  $sha = (git rev-parse --verify --quiet "$Ref^{commit}") 2>$null
  $found = $null; $cur = @{}
  $lines = @(git worktree list --porcelain) + @('')
  foreach ($l in $lines) {
    if ($l -eq '') {
      if ($cur.path -and -not $found) {
        if (($cur.branch -eq "refs/heads/$Ref") -or ($sha -and $cur.head -eq $sha)) { $found = $cur.path }
      }
      $cur = @{}
    } elseif ($l -match '^worktree (.+)$') { $cur.path = $Matches[1] }
    elseif ($l -match '^HEAD (.+)$')     { $cur.head = $Matches[1] }
    elseif ($l -match '^branch (.+)$')   { $cur.branch = $Matches[1] }
  }
  # Only worktrees under $WtRoot are targets (never the main checkout or foreign worktrees).
  if ($found -and -not ((Resolve-Path $found).Path -like ((Resolve-Path $WtRoot -ErrorAction SilentlyContinue).Path + '\*'))) { return $null }
  $found
}
