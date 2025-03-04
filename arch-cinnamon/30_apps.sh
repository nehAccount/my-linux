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
appPackages=(
    chromium
    timeshift
);
appPackagesYay=(
    losslesscut-bin
);
flatpakPackages=(
    com.viber.Viber
    com.github.unrud.VideoDownloader
);
# pacman
sudo pacman -S --needed --noconfirm "${appPackages[@]}"
# yay
yay -S --needed --noconfirm "${appPackagesYay[@]}"

# ------------------------------------------------------
# Flatpak
# ------------------------------------------------------
flatpak install flathub -y "${flatpakPackages[@]}"


send-notification "Apps installation finished." "Reboot system!"




