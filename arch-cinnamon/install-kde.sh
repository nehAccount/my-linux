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
    exit 1
fi

# ------------------------------------------------------
# packages
# ------------------------------------------------------
kdePackages=(
    plasma-meta
    dolphin
    konsole
    okular
    gwenview
    ark
    kde-gtk-config
    breeze-gtk
    kdeconnect
);
kdePackagesYay=(
  darkly-bin
);

# pacman
sudo pacman -S --needed "${kdePackages[@]}"
# yay
yay -S --needed "${kdePackagesYay[@]}"

echo ":: OK :: All packages installed!"








