#!/bin/bash
set -e
DOTFILES_DIR="$HOME/.dotfiles.git"

if [ ! -d "$DOTFILES_DIR" ]; then
  git init --bare "$DOTFILES_DIR"
fi

alias dotfiles="/usr/bin/git --git-dir=$DOTFILES_DIR --work-tree=$HOME"
echo ".dotfiles.git" >> ~/.gitignore
/usr/bin/git --git-dir=$DOTFILES_DIR --work-tree=$HOME config status.showUntrackedFiles no

/usr/bin/git --git-dir=$DOTFILES_DIR --work-tree=$HOME add .zshrc .p10k.zsh .gitconfig install.sh bootstrap.sh README.md
/usr/bin/git --git-dir=$DOTFILES_DIR --work-tree=$HOME commit -m "Initial dotfiles setup"
echo "✅ Dotfiles Git repo ready!"
