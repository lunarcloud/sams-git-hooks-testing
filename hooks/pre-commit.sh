#!/bin/sh

# the directory of the current running script, so that file paths are absolute from the script's location
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Redirect output to stderr.
exec 1>&2

$SCRIPT_DIR/pre-commit-prevent-large-files
$SCRIPT_DIR/pre-commit-prevent-directly-committing-main
$SCRIPT_DIR/pre-commit-prevent-nonascii-files
