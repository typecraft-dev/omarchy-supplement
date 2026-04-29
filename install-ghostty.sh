#!/bin/bash

# Install ghostty terminal emulator
yay -S --noconfirm --needed ghostty

# make ghostty the default terminal
xdg-settings set default-terminal ghostty
