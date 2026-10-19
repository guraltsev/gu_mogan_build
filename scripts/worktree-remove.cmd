@echo off
rem Wrapper for worktree-remove.ps1; forwards all arguments.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0worktree-remove.ps1" %*
exit /b %errorlevel%
