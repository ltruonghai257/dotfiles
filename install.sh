#!/bin/bash
set -e
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
plugins=(
  ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
  ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting"
  ["fzf-tab"]="https://github.com/Aloxaf/fzf-tab"
  ["zsh-completions"]="https://github.com/zsh-users/zsh-completions"
)

for plugin in "${!plugins[@]}"; do
  dest="$ZSH_CUSTOM/plugins/$plugin"
  if [ ! -d "$dest" ]; then
    echo "Installing plugin: $plugin"
    git clone "${plugins[$plugin]}" "$dest"
  fi
done

if ! command -v fzf >/dev/null 2>&1; then
  echo "Installing fzf..."
  if command -v brew >/dev/null 2>&1; then
    brew install fzf && $(brew --prefix)/opt/fzf/install
  elif command -v apt >/dev/null 2>&1; then
    sudo apt update && sudo apt install -y fzf
  else
    echo "Please install fzf manually."
  fi
fi

echo "✅ Dotfiles installed. Run 'source ~/.zshrc'"
