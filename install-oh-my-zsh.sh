#!/bin/bash

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed"
fi

# Activate z and git plugins in .zshrc
ZSHRC="$HOME/.zshrc"
if [ -f "$ZSHRC" ]; then
    echo "Activating z and git plugins..."
    # Check if plugins line exists and update it
    if grep -q "^plugins=(" "$ZSHRC"; then
        # Replace the plugins line to include git and z
        sed -i 's/^plugins=(.*)/plugins=(git z)/' "$ZSHRC"
    else
        # Add plugins line if not present
        echo "plugins=(git z)" >> "$ZSHRC"
    fi
    echo "Plugins activated. Reload your shell with 'source ~/.zshrc' to apply changes."
else
    echo "Warning: .zshrc not found. Plugins not activated."
fi