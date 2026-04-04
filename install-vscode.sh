#!/bin/bash

# Install Visual Studio Code
if ! command -v code &>/dev/null; then
    echo "Installing Visual Studio Code..."
    yay -S --noconfirm --needed visual-studio-code-bin
else
    echo "Visual Studio Code is already installed"
fi

# Install VS Code extensions
echo "Installing VS Code extensions..."

# Note: Gemini Code Assist requires manual installation after signing into VS Code
# code --install-extension google.geminicodeassist