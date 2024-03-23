#!/bin/bash

# Check input parameters
if [[ $# == 0 ]] then
	echo "usage: $0 messageCommit"
	exit
fi

git add .
git commit -m"$1"
git push
