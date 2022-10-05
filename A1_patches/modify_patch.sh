#!/bin/bash

# Author: Raul Suarez
# Date Created: 10/05/22
# Last modified: 10/05/22

# Description
# Updates a patch file

# Usage
# ./modify_patch.sh file.patch

if [ $# -lt 1 ]; then
    echo "You need to provide a patch name"
    echo "usage: ./modify_patch.sh file.patch"
    exit 1
fi

file_1=$(head -n3 $1 | tail -n1 | sed 's.--- a/..')
file_2=$(head -n4 $1 | tail -n1 | sed 's.+++ b/..')

git diff --no-index $file_1 $file_2 > temp.patch

if diff $1 temp.patch > /dev/null; then
    echo "Your patch is upto date"
    rm temp.patch
else
    git diff --no-index $file_1 $file_2 > $1
    rm temp.patch
    echo "Your patch $1 has been updated"
fi


