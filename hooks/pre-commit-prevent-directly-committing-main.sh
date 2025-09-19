#!/bin/bash
NO_COMMIT_BRANCHES=("main" "develop" "development" "release/latest")
CURRENT="$(git rev-parse --abbrev-ref HEAD)"

# Prevent direct commits to the main branch
if [[ " ${NO_COMMIT_BRANCHES[*]} " =~ " ${CURRENT} " ]]; then
  echo "Direct commits to ${CURRENT} are not allowed. Please use feature branches and pull requests." >&2
  exit 1
fi