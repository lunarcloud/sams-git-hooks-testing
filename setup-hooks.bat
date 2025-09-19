:: Sets up all git hooks
@echo off

:: Copies the hooks to the git folder
CALL :INSTALL .\hooks\pre-commit-prevent-large-files.sh
CALL :INSTALL .\hooks\prevent-merge.sh

:: Exit cleanly
GOTO :EOF

:: Pseudo-Fuction (Label) to copy scripts to the git hooks folder
:INSTALL
    @echo off
    setlocal

    :: put it in the right folder
    copy /V /-Y %~1 .\.git\hooks\

    :: strip the extension
    cd .\.git\hooks\
    move %~nx1 %~n1
    
    :: Ensure its executable for git (uses git bash)
    bash -c "chmod a+x %~n1"

    :: Exit cleanly
    GOTO :EOF
