#!/bin/bash

# Setup dotfiles using GNU Stow
# This script links the dotfiles from this repo to the home directory

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if stow is installed
if ! command -v stow &>/dev/null; then
    echo "GNU Stow is not installed. Please run ./install-stow.sh first."
    exit 1
fi

# Stow the dotfiles
echo "Setting up dotfiles..."

# Stow .config
if [ -d ".config" ]; then
    cd "$REPO_DIR"
    stow --adopt -t "$HOME" .config
fi

# Stow .zshrc
if [ -f ".zshrc" ]; then
    cd "$REPO_DIR"
    stow --adopt -t "$HOME" .
fi

echo "Dotfiles setup complete!"