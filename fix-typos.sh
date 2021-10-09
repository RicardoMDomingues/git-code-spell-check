#!/bin/bash

function exit_with_error_msg
{
    >&2 printf '%s\n' "$*"
    exit 1
}

function fix_staged_typos
{
    git rev-parse --git-dir > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        exit_with_error_msg "Current directory is not a git repo"
    fi

    pushd $(git rev-parse --git-dir 2> /dev/null)/.. > /dev/null
    typos $(git diff --name-only --cached --diff-filter=d) --write-changes
    popd > /dev/null
}

fix_staged_typos