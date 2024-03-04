#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright Boozt Fashion, AB
# SPDX-License-Identifier: MIT

# Run commitlint.sh script to lint commit messages
# based on the conventional commits specification.
# https://www.conventionalcommits.org/en/v1.0.0/
# 
# Create a new .commitlint configuration environment file
# in the root project to override the default configuration.

set -euo pipefail

# error message function printing in red color
# usage: error "message"
error() {
    local message=${1:-""}
    echo -e "\033[0;31m${message}\033[0m"
}

commitTitle=$(head -n1 "${1}")
configurationFile=".commitlint"

# source configuration environment file if exists
if [ -f "$configurationFile" ]; then
    # shellcheck source=/dev/null
    source "$configurationFile"
fi

# default values for environment variables
export MAX_COMMIT_MESSAGE_LENGTH=${MAX_COMMIT_MESSAGE_LENGTH:-80}
# valid commit prefix types for semantic versioning
export VALID_COMMIT_PREFIXES=${VALID_COMMIT_PREFIXES:-"build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test"}

# check commit message length
if [ ${#commitTitle} -gt "${MAX_COMMIT_MESSAGE_LENGTH}" ]; then
    error "Your commit message is too long: ${#commitTitle} characters"
    exit 1
fi

# check if the commit message contains Merge Branch to skip the commit message check
if echo "$commitTitle" | grep -qE 'Merge branch'; then
    echo "Skipping commit message check for merge commits"
    exit 0
fi

# check if the commit message is valid for semantic versioning
if ! echo "$commitTitle" | grep -qE '^('"${VALID_COMMIT_PREFIXES}"')(\([a-z0-9\s\-\_\,]+\))?!?:\s\w'; then
    error "Your commit message is not valid for semantic versioning: \"$commitTitle\""

    echo
    echo "Format: <type>(<scope>): <subject>"
    echo "Scope: optional"
    echo "Example: feat(auth): add login feature"
    echo
    echo "Exclamation mark (!) is optional and can be used to indicate breaking changes."
    echo "Use it before colon (:). i.e. feat(auth)!: add login feature"
    echo
    echo "Valid types: ${VALID_COMMIT_PREFIXES//|/,}"
    echo

    exit 1
fi
