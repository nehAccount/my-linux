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
# source ./_packages.sh
packages=(
  vulkan-mesa-layers
);

packagesYay=(

);

# pacman
sudo pacman -S --needed "${packages[@]}"
# yay
yay -S --needed "${packagesYay[@]}"





