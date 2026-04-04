#!/bin/bash

# Install SDKMAN (Software Development Kit Manager)
if ! command -v sdk &>/dev/null; then
    echo "Installing SDKMAN..."
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
else
    echo "SDKMAN is already installed"
fi