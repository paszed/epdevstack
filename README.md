# epdevstack

Reproducible development environment.

Defines my personal development setup (editor, shell, tooling) and allows bootstrapping a new machine quickly.

## FEATURES

 - Neovim config
 - Shell config (.zshrc, .zprofile)
 - Git config
 - Homebrew package management
 - Bootstrap script
 - Symlink-based setup

## Setup

```bash
git clone https://github.com/paszed/epdevstack.git
cd epdevstack
chmod +x bootstrap/install.sh
./bootstrap/install.sh

## How it works

Configs are stored in this repo and symlinked to standard locations:

~/.config/nvim  →  ~/dev/epdevstack/config/nvim
~/.zshrc        →  ~/dev/epdevstack/shell/.zshrc
~/.gitconfig    →  ~/dev/epdevstack/git/.gitconfig

Everything stays version-controlled and portable

## Structure

epdevstack/
├── bootstrap/
├── config/
├── shell/
├── git/
├── README.md
└── LICENSE

## Platforms

 - macOS
 - Linux
 - Windows (WSL)

## Notes

 - Linux skips unsupported Homebrew casks 
 - Neovim plugins install on first launch.

## Quick Check

After setup, verify:

```bash
nvim
git --version
rg test
fzf

## Goal

Clean, portable, reproducible dev environment.


