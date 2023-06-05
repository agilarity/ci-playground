#!/bin/bash

# Support local testing
files=".github/workflows examples/project-a examples/project-b"

if [ ! -z $1 ]; then
    files="$@"
else
    echo Verifying with test data
fi

working_directory=$(pwd)
echo Simulate actions from $(pwd)
for dir in $files; do
    echo
    echo Performing pwd action for $dir
    cd $dir
    pwd
    cd $working_directory
done
echo
