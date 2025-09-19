:: Creates a file larger than the pre-commit hook should allow and then tries to commit it

set LARGEFILE=bigfile.log

:: Make the large file
fsutil file createnew %LARGEFILE% 31457280

:: add the file (force, because we made it a file extension that's normally git ignored)
git add %LARGEFILE% -f

:: trigger the error by attempting to commit
git commit -m "adding a file that's way too large"

:: Remove the offending file from the commit staging
git restore --staged %LARGEFILE%

:: remove the file
del %LARGEFILE%