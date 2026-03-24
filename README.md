# epdevstack

Reproducible development environment.

This repository defines my personal development setup, including editor, shell, and tooling configuration. It allows me to quickly bootstrap a new machine with a consistent environment.

## FEATURES

- Neovim configuration
- Shell configuration (.zshrc, .zprofile)
- Git configuration
- Homebrew package management
- Automated bootstrap script
- Portable via symlink

## SETUP

Clone the repository:

git clone https://github.com/paszed/epdevstack.git
cd epdevstack
chmod +x bootstrap/install.sh
./bootstrap/install.sh

## HOW IT WORKS

Configuration files are stored in this repository and linked to standard system locations:

~/.config/nvim  →  ~/dev/epdevstack/config/nvim
~/.zshrc        →  ~/dev/epdevstack/shell/.zshrc
~/.gitconfig    →  ~/dev/epdevstack/git/.gitconfig

This keeps everything version-controlled and portable

## STRUCTURE

epdevstack/
├── bootstrap/
├── config/
├── shell/
├── git/
├── README.md
└── LICENSE

## PLATFORM

- macOS
- Linux
- Windows (use WSL)

## NOTES

- On Linux, some Homebrew packages (casks) are skipped automatically.
- Neovim plugoins are installed on first launch.

## QUICK CHECK

After setup, verify:

nvim
git --version
rg test
fzf

## GOAL

A clean, portable, and reproducible developer environment.


