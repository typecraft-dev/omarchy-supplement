#!/bin/bash

# Check if asdf is installed
if ! command -v asdf &>/dev/null; then
    echo "asdf is not installed. Please run ./install-asdf.sh first."
    exit 1
fi

# Install Ruby build dependencies
echo "Installing Ruby build dependencies..."
yay -S --noconfirm --needed base-devel gcc make openssl readline zlib libyaml libffi

# Install ruby plugin for asdf if not already installed
if ! asdf plugin list | grep -q ruby; then
    asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

# Install latest stable Ruby if no ruby version is installed
if ! asdf list ruby &>/dev/null || [ -z "$(asdf list ruby 2>/dev/null)" ]; then
    echo "Installing Ruby..."
    asdf install ruby latest
    asdf set -u ruby latest
fi

echo "Ruby installation complete!"
