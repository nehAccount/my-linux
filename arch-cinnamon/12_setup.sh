#!/bin/bash

#username=$(id -u -n 1000)
builddir=$(pwd)

# ------------------------------------------------------
# copy fonts
# ------------------------------------------------------
sudo cp -a "$builddir"/fonts/* /usr/share/fonts
sudo fc-cache -f -v
fc-cache -f -v

# ------------------------------------------------------
# copy new file templates
# ------------------------------------------------------
mkdir -p "$HOME/Templates"
sudo cp -a "$builddir"/Templates/* "$HOME"/Templates

# icons
sudo tar -xvf "$builddir"/icons/Colloid.tar.xz -C /usr/share/icons

# distro icon
sudo cp -a "$builddir"/icons/distro.svg /usr/share/icons

# scripts
cp -a "$builddir"/my-scripts "$HOME"/.local/share/cinnamon

# make scripts executable
sudo ln -s "$HOME"/.local/share/cinnamon/my-scripts/send-notification /usr/local/bin/
sudo chmod +x /usr/local/bin/send-notification

sudo ln -s "$HOME"/.local/share/cinnamon/my-scripts/exec-wal /usr/local/bin/
sudo chmod +x /usr/local/bin/exec-wal

# config
cp -a "$builddir"/config/* "$HOME"/.config

# default wallpaper

# set wallpaper

echo "Done!"




