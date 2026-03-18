# epdevstack

Personal development environment stack.

This repository stores the configuration and tooling required to recreate my development environment on a new machine.

## What This Repo Contains

- Neovim configuration
- Shell configuration (.zshrc, .zprofile)
- Git configuration
- Homebrew package list
- Bootstrap script

## Setup on a New Machine

Clone the repository:

git clone git@github.com:paszed/epdevstack.git
cd epdevstack

Run bootstrap:

./bootstrap/install.sh

This will:
- install Homebrew if needed
- install CLI tools from Brewfile
- link configs
- recreate the development environment
