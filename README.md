# Pre commit spell checker to git repositories

This repo contains a pre-commit git hook that runs two different spell checkers, `typos` and `scspell` that verifies the typos for the changed files. 

The reason why we using two spell checker is `typos` is not based in dictionary and only detects an error if it has a fix. The fix can be applied by executing `typos --write-changes`.

`typos` provide a fast way to fix the issues but it is incapable of catch most of the issues. Then we also use `scspell` which detects error for every word that is not present in the dictionary.



## Installation

To install `typos` follow the instruction at https://github.com/crate-ci/typos

To install `scspell` follow the instruction at https://github.com/myint/scspell

# How to use

The most convenient way to use this scripts is put repo directory in your `PATH`. Once you have the script available in your terminal, you can change directory to your repo and run:
```
install-git-spell-checker.sh
```

This will create a symbolic link of `pre-commit` in git hooks of your repository.

Because sometimes a project use words that are very specific and they don't have a meaning in a different project, scspell configures a dictionary by repository but if you want to use the same dictionary shouldn't be much difficult change the `pre-commit` script.

When `typos` detects errors, you can fix them by executing `fix-typos.sh`.
