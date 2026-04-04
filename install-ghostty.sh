#!/bin/bash

# Install ghostty terminal emulator
yay -S --noconfirm --needed ghostty

# Configure ghostty with larger font size
CONFIG_DIR="$HOME/.config/ghostty"
CONFIG_FILE="$CONFIG_DIR/config"

mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Creating ghostty config with larger font size..."
    echo "font-size = 14" > "$CONFIG_FILE"
else
    # Check if font-size is already set
    if ! grep -q "^font-size" "$CONFIG_FILE"; then
        echo "Adding font-size to existing ghostty config..."
        echo "font-size = 14" >> "$CONFIG_FILE"
    else
        echo "Font size already configured in ghostty config"
    fi
fi