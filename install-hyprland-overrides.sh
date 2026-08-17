#!/bin/bash

set -e

HYPRLAND_CONFIG="$HOME/.config/hypr/hyprland.lua"
LEGACY_CONFIG="$HOME/.config/hypr/hyprland.conf"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OVERRIDES_CONFIG="$SCRIPT_DIR/hyprland-overrides.lua"
SOURCE_LINE="dofile(\"$OVERRIDES_CONFIG\")"
LEGACY_SOURCE_LINE="source = $SCRIPT_DIR/hyprland-overrides.conf"

# Check if hyprland config exists
if [ ! -f "$HYPRLAND_CONFIG" ]; then
    echo "Hyprland config not found at $HYPRLAND_CONFIG"
    echo "Please install hyprland first (Omarchy configures Hyprland in Lua)"
    exit 1
fi

# Check if overrides config exists
if [ ! -f "$OVERRIDES_CONFIG" ]; then
    echo "Overrides config not found at $OVERRIDES_CONFIG"
    exit 1
fi

# Drop the pre-Lua source line, which points at a file that no longer exists
if [ -f "$LEGACY_CONFIG" ] && grep -Fxq "$LEGACY_SOURCE_LINE" "$LEGACY_CONFIG"; then
    echo "Removing legacy source line from $LEGACY_CONFIG"
    cp "$LEGACY_CONFIG" "$LEGACY_CONFIG.bak.$(date +%s)"
    grep -Fxv "$LEGACY_SOURCE_LINE" "$LEGACY_CONFIG" > "$LEGACY_CONFIG.tmp"
    mv "$LEGACY_CONFIG.tmp" "$LEGACY_CONFIG"
fi

# Check if dofile line already exists in hyprland.lua
if grep -Fxq "$SOURCE_LINE" "$HYPRLAND_CONFIG"; then
    echo "Overrides are already loaded from $HYPRLAND_CONFIG"
else
    echo "Adding overrides to $HYPRLAND_CONFIG"
    echo "" >> "$HYPRLAND_CONFIG"
    echo "-- Personal overrides from omarchy-supplement" >> "$HYPRLAND_CONFIG"
    echo "$SOURCE_LINE" >> "$HYPRLAND_CONFIG"
    echo "Overrides added successfully"
fi

echo "Hyprland overrides setup complete!"
