#!/bin/bash

# Author: Raul Suarez
# Date Created: 10/05/22
# Last modified: 10/05/22

# Description
# Applies a patch file 

# Usage
# ./apply_patch.sh file_1 file_2

if [ "$#" -lt 2 ]; then
    echo "Not enough arguments were provided"
    echo "usage: ./apply_patch.sh file_1 file_2"
    exit -1
fi

diff -u $1 $2 > patch
patch $1 < patch
rm patch

exit 0

