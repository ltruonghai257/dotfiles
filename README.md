# Dotfiles for Fullstack Developer (macOS + WSL Compatible)

## Setup (first time)
chmod +x bootstrap.sh
./bootstrap.sh

## Clone on another machine
git clone --bare git@github.com:yourusername/dotfiles.git $HOME/.dotfiles.git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

## Install Zsh plugins
chmod +x install.sh
./install.sh
source ~/.zshrc

## Font
Install MesloLGS NF: https://github.com/romkatv/powerlevel10k\#meslo-nerd-font-patched-for-powerlevel10k
