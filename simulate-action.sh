#!/bin/bash

# Support local testing
files=".github/workflows examples/project-a examples/project-b"

if [ ! -z $1 ]; then
    files=$@
else
    echo Verifying with test data
fi

example_file_directories=$(
    for file in $files; do
        echo $file | grep -o1 -Ei "^examples\/.*\/"
    done
)

declare -a example_directories=($example_file_directories)
declare -A unique_example_directories
for dir in "${example_directories[@]}"; do
    unique_example_directories[$dir]=0
done

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
