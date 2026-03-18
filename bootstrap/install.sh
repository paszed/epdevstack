#!/usr/bin/env bash
set -e

echo "🚀 Setting up development environment..."

# 1. Ensure Homebrew exists
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Install packages from Brewfile
echo "Installing Homebrew packages..."
brew bundle --file=bootstrap/Brewfile

# 3. Create config directory if missing
mkdir -p ~/.config

# 4. Link Neovim config
if [ ! -L ~/.config/nvim ]; then
  echo "Linking Neovim config..."
  ln -s ~/dev/epdevstack/config/nvim ~/.config/nvim
fi

# 5. Link shell configs
if [ ! -L ~/.zshrc ]; then
  ln -s ~/dev/epdevstack/shell/.zshrc ~/.zshrc
fi

if [ ! -L ~/.zprofile ]; then
  ln -s ~/dev/epdevstack/shell/.zprofile ~/.zprofile
fi

# 6. Link git config
if [ ! -L ~/.gitconfig ]; then
  ln -s ~/dev/epdevstack/git/.gitconfig ~/.gitconfig
fi

echo "✅ Dev environment setup complete."
