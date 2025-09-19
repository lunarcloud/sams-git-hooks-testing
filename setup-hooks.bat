:: Sets up all git hooks
@echo off

:: Copies the hooks to the git folder
CALL :INSTALL pre-commit-prevent-large-files
CALL :INSTALL prevent-merge
CALL :INSTALL pre-commit

:: Exit cleanly
GOTO :EOF

:: Pseudo-Fuction (Label) to copy scripts to the git hooks folder
:INSTALL
    @echo off
    setlocal

    :: put it in the right folder without extension
    copy /V /-Y .\hooks\%~1.sh .\.git\hooks\%~1

    :: Ensure its executable for git (uses git bash)
    bash -c "chmod a+x .git/hooks/%~1"

    :: Exit cleanly
    GOTO :EOF
