#!/usr/bin/env bash
set -e

echo "🚀 Setting up development environment..."

# repo location
REPO="$HOME/dev/epdevstack"

# 1. Ensure Homebrew exists
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Install packages from Brewfile
echo "Installing Homebrew packages..."
brew bundle --file="$REPO/bootstrap/Brewfile"

# 3. Create config directory if missing
mkdir -p "$HOME/.config"

# 4. Link Neovim config
if [ ! -L "$HOME/.config/nvim" ]; then
  echo "Linking Neovim config..."
  ln -s "$REPO/config/nvim" "$HOME/.config/nvim"
fi

# 5. Link shell configs
if [ ! -L "$HOME/.zshrc" ]; then
  ln -s "$REPO/shell/.zshrc" "$HOME/.zshrc"
fi

if [ ! -L "$HOME/.zprofile" ]; then
  ln -s "$REPO/shell/.zprofile" "$HOME/.zprofile"
fi

# 6. Link git config
if [ ! -L "$HOME/.gitconfig" ]; then
  ln -s "$REPO/git/.gitconfig" "$HOME/.gitconfig"
fi

echo "✅ Dev environment setup complete."
