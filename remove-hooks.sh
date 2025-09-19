#!/bin/bash

# the directory of the current running script, so that file paths are absolute from the script's location
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function uninstall() {
    if [  -f "$SCRIPT_DIR/.git/hooks/$1" ]; then
        echo Removing \"$1\"
        rm "$SCRIPT_DIR/.git/hooks/$1"
    fi    
}

# Copies the hooks to the git folder
uninstall pre-commit-prevent-large-files
uninstall pre-commit-prevent-directly-committing-main
uninstall pre-commit-prevent-nonascii-files
uninstall pre-commit
uninstall pre-merge-commit

echo Uninstall complete