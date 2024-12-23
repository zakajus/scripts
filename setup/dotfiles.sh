#!/bin/bash
# Inspired by blogpost:
# https://home.codevoid.de/posts/2019-04-27_Manage_dotfiles_with_git.html

DOTFILES_REPO="git@github.com:zakajus/dotfiles.git"

# Clone the dotfiles repository as a bare repository
git --no-replace-objects clone --bare --depth 1 \
    "$DOTFILES_REPO" "$HOME/.cfg"

# Configure Git to not show untracked files
git --git-dir="$HOME/.cfg" config --local status.showUntrackedFiles no

# Checkout the dotfiles into the home directory
git --git-dir="$HOME/.cfg" checkout -f
