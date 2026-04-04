#!/bin/bash

# Install xrdp for RDP remote desktop access
if ! command -v xrdp &>/dev/null; then
    echo "Installing xrdp..."
    yay -S --noconfirm --needed xrdp xorgxrdp

    # Enable and start xrdp service
    sudo systemctl enable xrdp
    sudo systemctl start xrdp

    echo "xrdp installed and started. You can now connect from your Mac using Microsoft Remote Desktop or another RDP client."
    echo "Use the IP address of this machine and port 3389."
else
    echo "xrdp is already installed"
fi