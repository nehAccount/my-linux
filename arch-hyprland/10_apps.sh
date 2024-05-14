#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)
fonts_dir="/usr/share/fonts"

# update system
sudo pacman -Sy
sudo pacman -Syu
sudo pacman -Syyu

sudo pacman -S --needed nautilus gnome-text-editor

echo "DONE!"

########################
## zsh




