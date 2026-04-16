#!/bin/bash

# Install all packages in order
# Validate sudo credentials once at the beginning
sudo -v

./install-zsh.sh
./install-openssh.sh
./install-oh-my-zsh.sh
./install-asdf.sh
./install-sdkman.sh
./install-nodejs.sh
./install-docker.sh
./install-tigervnc.sh
./install-ghostty.sh
./install-tmux.sh
./install-stow.sh
./setup-dotfiles.sh
./install-hyprland-overrides.sh
./disable-notifications.sh
./set-shell.sh
