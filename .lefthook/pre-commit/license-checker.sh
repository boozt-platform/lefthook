#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright Boozt Fashion, AB
# SPDX-License-Identifier: MIT

# Script is a pre-commit hook to check if the staged files
# has the license header from the file license-header.txt (we only check if it's contains).

set -eo pipefail

# include .license-checker file if exists in the root directory
if [ -f .license-checker ]; then
    # shellcheck source=/dev/null
    source .license-checker
fi

EXCLUDE_FILES_EXT=${EXCLUDE_FILES_EXT:-"LICENSE|\\.md|\\.gitignore|\\.license-checker|CODEOWNERS|\\.gitattributes|\\.editorconfig|\\.json|\\.lock|\\.toml"}
STAGED_FILES=$(git diff --name-only --diff-filter=d --staged)

# error message function printing in red color
# usage: error "message"
error() {
    local message=${1:-""}
    echo -e "\033[0;31m${message}\033[0m"
}

# if the LICENSE_HEADER is empty, then exit
if [ -z "$LICENSE_HEADER" ]; then
    error "The LICENSE_HEADER environment variable is empty."
    error "Either create .license-checker file in the root directory or set the LICENSE_HEADER environment variable."
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
