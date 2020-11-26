#!/usr/bin/env bash

set -e
set -o pipefail

# set -x

# Find all executable files
for f in $(find data -type f -perm +111 -print); do
  # Sign the executable files
  codesign -s - $f
done
