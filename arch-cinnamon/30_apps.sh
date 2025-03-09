#!/bin/bash

#username=$(id -u -n 1000)
builddir=$(pwd)

# update system
sudo pacman -Syu --noconfirm

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
sudo pacman -S --needed --noconfirm "${appPackages[@]}"
# yay
yay -S --needed --noconfirm "${appPackagesYay[@]}"

# ------------------------------------------------------
# Flatpak
# ------------------------------------------------------
flatpak install flathub -y "${flatpakPackages[@]}"

# ------------------------------------------------------
# docker setup
# ------------------------------------------------------
# add user to docker group
sudo groupadd docker
sudo usermod -aG docker "$USER"
systemctl enable docker.service

send-notification "Apps installation finished." "System will reboot in 15 seconds!"
sleep 15
sudo reboot




