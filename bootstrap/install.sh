#!/usr/bin/env bash
set -e

echo "🚀 Setting up development environment..."

# Resolve repo root (works no matter where script is run from)
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "📁 Repo path: $REPO"

# 1. Ensure Homebrew exists
if ! command -v brew >/dev/null 2>&1; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Ensure brew is available (Linux fix)
if ! command -v brew >/dev/null 2>&1; then
  echo "⚙️ Configuring Homebrew PATH..."
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# 3. Install packages from Brewfile
if [ -f "$REPO/bootstrap/Brewfile" ]; then
  echo "📦 Installing Homebrew packages..."
  brew bundle --file="$REPO/bootstrap/Brewfile"
else
  echo "❌ Brewfile not found at $REPO/bootstrap/Brewfile"
  exit 1
fi

# 4. Create config directory
mkdir -p "$HOME/.config"

# 5. Link Neovim config
echo "🔗 Linking Neovim config..."
ln -sf "$REPO/config/nvim" "$HOME/.config/nvim"

# 6. Link shell configs
echo "🔗 Linking shell configs..."
ln -sf "$REPO/shell/.zshrc" "$HOME/.zshrc"
ln -sf "$REPO/shell/.zprofile" "$HOME/.zprofile"

# 7. Link git config
echo "🔗 Linking git config..."
ln -sf "$REPO/git/.gitconfig" "$HOME/.gitconfig"

# 8. Persist Homebrew PATH (Linux only)
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
  if ! grep -q "brew shellenv" "$HOME/.bashrc"; then
    echo "💾 Adding Homebrew to PATH permanently..."
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.bashrc"
  fi
fi

echo "✅ Dev environment setup complete."
