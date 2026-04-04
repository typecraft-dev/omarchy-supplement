#!/bin/bash

# Install Visual Studio Code
if ! command -v code &>/dev/null; then
    echo "Installing Visual Studio Code..."
    yay -S --noconfirm --needed visual-studio-code-bin
else
    echo "Visual Studio Code is already installed"
fi