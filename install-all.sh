#!/bin/bash

# Install all packages in order
./install-zsh.sh
./install-asdf.sh
./install-nodejs.sh
./install-ghostty.sh
./install-tmux.sh
./install-stow.sh
./install-dotfiles.sh
./install-hyprland-overrides.sh

./set-shell.sh
