#!/bin/bash
FORBIDDEN_BRANCHES=("uat" "support" "develop" "origin/uat" "origin/support" "origin/develop")
FROM_BRANCH="null"

MSG=`cat .git/MERGE_MSG`

[[ $MSG =~ ^'Merge branch '(.*) ]] && FROM_BRANCH=${BASH_REMATCH[1]}

if test $FROM_BRANCH != "null"
then
	FROM_BRANCH=$(echo $FROM_BRANCH | cut -f 1 -d " ")
	eval BRANCH=$FROM_BRANCH
else
    [[ $MSG =~ ^'Merge remote-tracking branch '(.*) ]] && FROM_BRANCH=${BASH_REMATCH[1]}
	FROM_BRANCH=$(echo $FROM_BRANCH | cut -f 1 -d " ")
	eval BRANCH=$FROM_BRANCH
fi

if test $FROM_BRANCH != "null"
then
	for i in ${!FORBIDDEN_BRANCHES[@]}; do
	  if test ${FORBIDDEN_BRANCHES[$i]} = $BRANCH
	  then
		echo "Merging from $BRANCH is forbidden"
		echo "Reset your branch using \"git reset --merge\""
		exit 1
	  fi
	done
else
	"NOT COMITTING: FROM_BRANCH = $FROM_BRANCH"
fi