#!/bin/bash

# Check if asdf is installed
if ! command -v asdf &>/dev/null; then
    echo "asdf is not installed. Please run ./install-asdf.sh first."
    exit 1
fi

# Install nodejs build dependencies
yay -S --noconfirm --needed base-devel openssl zlib

# Install nodejs plugin for asdf if not already installed
if ! asdf plugin list | grep -q nodejs; then
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi

# Install latest LTS nodejs if no nodejs version is installed
if ! asdf list nodejs &>/dev/null || [ -z "$(asdf list nodejs 2>/dev/null)" ]; then
    asdf install nodejs latest:20
    asdf set -u nodejs latest:20
fi
