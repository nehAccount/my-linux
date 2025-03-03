#!/bin/bash

#username=$(id -u -n 1000)
builddir=$(pwd)

# update system
sudo pacman -Syu

# ------------------------------------------------------
# Check if yay is installed
# ------------------------------------------------------
if sudo pacman -Qs yay > /dev/null ; then
    echo ":: OK :: yay is installed!"
else
    echo ":: EXIT :: yay is not installed. RUN yay-install.sh first!"
    exit
fi

# ------------------------------------------------------
# Install  packages
# ------------------------------------------------------
source ./_packages.sh

# pacman
sudo pacman -S --needed --noconfirm "${generalPackages[@]}"
# yay
yay -S --needed --noconfirm "${generalPackagesYay[@]}"

# ------------------------------------------------------
# Flatpak
# ------------------------------------------------------
sudo pacman -S --needed --noconfirm flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ------------------------------------------------------
# git config
# ------------------------------------------------------
git config --global user.name "Nermin Hadzimejlic"
git config --global user.email "nermin.hadzimejlic@gmail.com"
git config --global init.defaultBranch main

# ------------------------------------------------------
# start power profiles
# ------------------------------------------------------
sudo systemctl start power-profiles-daemon.service
sudo systemctl enable power-profiles-daemon.service
powerprofilesctl set balanced

# ------------------------------------------------------
# clear cache
# ------------------------------------------------------
sudo pacman -Sc --noconfirm
sudo pacman -Scc --noconfirm

echo "Done!"




