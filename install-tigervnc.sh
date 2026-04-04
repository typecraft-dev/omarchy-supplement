#!/bin/bash

# Install TigerVNC for VNC remote desktop access
if ! command -v vncserver &>/dev/null; then
    echo "Installing TigerVNC..."
    yay -S --noconfirm --needed tigervnc

    echo "TigerVNC installed. To set up a VNC session:"
    echo "1. Run 'vncpasswd' to set a password"
    echo "2. Start VNC server with 'vncserver :1' (or another display number)"
    echo "3. Connect from your Mac using a VNC client like RealVNC Viewer to <IP>:5901"
else
    echo "TigerVNC is already installed"
fi