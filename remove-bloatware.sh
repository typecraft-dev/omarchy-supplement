#!/bin/bash

# Remove bloatware packages from Arch Linux
# This script removes commonly considered bloatware packages

set -e

echo "Removing bloatware packages..."

# List of packages to remove (adjust as needed)
BLOATWARE_PACKAGES=(
    firefox          # Web browser
    thunderbird      # Email client
    libreoffice-fresh # Office suite
    totem            # Video player
    gnome-contacts   # Contacts manager
    gnome-maps       # Maps application
    gnome-weather    # Weather application
    transmission-gtk # BitTorrent client
    hexchat          # IRC client
    pidgin           # Instant messaging client
    empathy          # Communication program
    evolution        # Email and calendar client
    brasero          # CD/DVD burning tool
    sound-juicer     # CD ripping tool
    simple-scan      # Document scanner
    yelp             # Help viewer
    orca             # Screen reader
    accerciser       # Accessibility testing tool
    anjuta           # IDE
    glade            # GUI builder
    nemiver          # Debugger
    vinagre          # VNC client
    remmina          # Remote desktop client
    bijiben          # Note-taking application
    gnome-dictionary # Dictionary
    seahorse         # Password manager
    hey              # Email client (Hey)
)

# Remove packages if they are installed
for package in "${BLOATWARE_PACKAGES[@]}"; do
    # Extract package name (remove comment if present)
    pkg_name=$(echo "$package" | awk '{print $1}')
    if pacman -Q "$pkg_name" &> /dev/null; then
        echo "Removing $pkg_name..."
        sudo pacman -Rns --noconfirm "$pkg_name" || echo "Failed to remove $pkg_name"
    else
        echo "$pkg_name is not installed"
    fi
done

echo "Bloatware removal complete!"