#!/bin/bash

# Install Zsh
if ! command -v zsh &>/dev/null; then
    yay -S --noconfirm --needed zsh
fi

# Create ~/.zshrc if it doesn't exist to prevent zsh-newuser-install prompt
if [ ! -f ~/.zshrc ]; then
    touch ~/.zshrc
fi