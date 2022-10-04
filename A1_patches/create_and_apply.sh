#!/bin/bash

diff -u $1 $2 > patch
patch $1 < patch
rm patch
