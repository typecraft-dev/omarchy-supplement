#!/bin/bash

# Install and enable OpenSSH for SSH access
if ! command -v sshd &>/dev/null; then
    echo "Installing OpenSSH..."
    yay -S --noconfirm --needed openssh

    # Enable and start SSH service
    sudo systemctl enable sshd
    sudo systemctl start sshd

    echo "OpenSSH installed and started. SSH server is now running on port 22."
    echo "From your Mac, connect with: ssh username@<IP-address>"
else
    echo "OpenSSH is already installed"
    # Ensure service is running
    sudo systemctl enable sshd
    sudo systemctl start sshd
fi