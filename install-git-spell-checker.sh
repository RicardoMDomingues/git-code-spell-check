#!/bin/bash


DIR="$(cd -P "$(dirname "$0")" && pwd)"
if [[ -L "$0" ]]; then
  DIR="$(cd "$DIR/$(dirname "$(readlink "$0")")" && pwd)"
fi

function exit_with_error_msg
{
    >&2 printf '%s\n' "$*"
    exit 1
}

if [ ! -f $DIR/pre-commit ]; then
    exit_with_error_msg "$DIR/pre-commit: not found"
fi

function install_hook
{
    local git_folder=$(git rev-parse --git-dir 2> /dev/null);
    if [ $? -ne 0 ]; then
        exit_with_error_msg "Current directory is not a git repo"
    fi

    if [ -f $git_folder/hooks/pre-commit ]; then
        exit_with_error_msg "Already exist a pre-commit hook in this repo"
    fi

    ln -s $DIR/pre-commit $git_folder/hooks/pre-commit
}

install_hook