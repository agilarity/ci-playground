#!/bin/bash

# Test Data
files=".github/workflows/tj-flow.yml examples/project-a/r1 examples/project-b/README.md examples/project-a/r2 examples/project-b/r1 examples/project-a/r2"

if [ ! -z $1 ]; then
    files=$@
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

for dir in ${!unique_example_directories[@]}; do
    echo "Verifying $dir"
done
