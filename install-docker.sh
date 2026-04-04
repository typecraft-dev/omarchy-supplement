#!/bin/bash

# Install Docker
if ! command -v docker &>/dev/null; then
    echo "Installing Docker..."
    yay -S --noconfirm --needed docker docker-compose

    # Start and enable Docker service
    sudo systemctl start docker
    sudo systemctl enable docker

    # Add user to docker group (requires logout/login to take effect)
    sudo usermod -aG docker "$USER"
    echo "Added $USER to docker group. Please log out and log back in for changes to take effect."
else
    echo "Docker is already installed"
fi