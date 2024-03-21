#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright Boozt Fashion, AB
# SPDX-License-Identifier: MIT

# Script is a pre-commit hook to check if the staged files
# has the license header from the file license-header.txt or the
# environment variable called LICENSE_HEADER (we only check if
# it's contains).

set -eo pipefail

LICENSE_HEADER=${LICENSE_HEADER:-""}
EXCLUDE_FILES_EXT=${EXCLUDE_FILES_EXT:-"LICENSE|\\.md|\\.gitignore|\\.license-checker.txt|CODEOWNERS|\\.gitattributes|\\.editorconfig|\\.json|\\.lock|\\.toml"}
STAGED_FILES=$(git diff --name-only --diff-filter=d --staged)

# read .license-checker.txt file if exists in the root directory
if [[ -f .license-checker.txt && -z "$LICENSE_HEADER" ]]; then
    # read the file and set the LICENSE_HEADER variable
    LICENSE_HEADER=$(cat .license-checker.txt)
fi

# error message function printing in red color
# usage: error "message"
error() {
    local message=${1:-""}
    echo -e "\033[0;31m${message}\033[0m"
}

# if the LICENSE_HEADER is empty, then exit
if [ -z "$LICENSE_HEADER" ]; then
    error "The LICENSE_HEADER environment variable is empty."
    error "Either create .license-checker.txt file in the root directory or set the LICENSE_HEADER environment variable."
    exit 1
fi

errorCount=0
# Check if the staged files contains the license header.
# Files may be wrapped in comment blocks i.e. /* ... */, #, <!-- ... -->, etc.
for file in $STAGED_FILES; do
    # filter out files that ends with the excluded file extensions
    # which described in the EXCLUDE_FILES_EXT
    if [[ $file =~ ${EXCLUDE_FILES_EXT}$ ]]; then
        continue
    fi

    # check if the file contains the license header
    # at the top of the file (first 5 lines of the file)
    # from the variable of LICENSE_HEADER
    if ! head -n 5 "$file" | grep -q "$LICENSE_HEADER"; then
        error "The file $file does not contain the license header."
        errorCount=$((errorCount + 1))
    fi
done

if [ $errorCount -gt 0 ]; then
    error "\nPlease add the license header to the file(s) above"
    exit 1
fi
