@echo off
rem Wrapper for worktree-add.ps1; forwards all arguments.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0worktree-add.ps1" %*
exit /b %errorlevel%
