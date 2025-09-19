# Creates a file larger than the pre-commit hook should allow and then tries to commit it

large_file=bigfile.log

# Make the large file
truncate -s 30M $large_file

# add the file (force, because we made it a file extension that's normally git ignored)
git add $large_file -f

# trigger the error by attempting to commit
git commit -m "adding a file that's way too large"

# Remove the offending file from the commit staging
git restore --staged $large_file

# remove the file
rm $large_file