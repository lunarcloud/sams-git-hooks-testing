#!/bin/bash
# shellcheck disable=SC2086

# the directory of the current running script, so that file paths are absolute from the script's location
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install() {
    
    # ensure the script exists
    if [ ! -f "$SCRIPT_DIR/hooks/$1.sh" ]; then
        echo Script "$1".sh doesn\'t exist in $SCRIPT_DIR/hooks! 1>&2
        exit 1
    fi
    
    # put it in the right folder without the extension
    cp -i "$SCRIPT_DIR/hooks/$1.sh" "$SCRIPT_DIR/.git/hooks/$1"
    
    # ensure the script is executable
    if [ ! -x "$SCRIPT_DIR/.git/hooks/$1" ]; then
        sudo chmod a+x "$SCRIPT_DIR/.git/hooks/$1"
    fi
}

# Copies the hooks to the git folder
install pre-commit-prevent-large-files
install prevent-merge
install pre-commit