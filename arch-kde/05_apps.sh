#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

sudo pacman -Syu

sudo pacman -S --needed nextcloud-client
sudo pacman -S --needed chromium
sudo pacman -S --needed thunderbird systray-x-kde
sudo pacman -S --needed libreoffice-fresh
sudo pacman -S --needed gimp
sudo pacman -S --needed mpv
sudo pacman -S --needed flameshot
sudo pacman -S --needed timeshift
sudo pacman -S --needed ufw gufw
sudo pacman -S --needed partitionmanager
sudo pacman -S --needed pandoc-cli
sudo pacman -S --needed img2pdf
sudo pacman -S --needed handbrake
sudo pacman -S --needed intellij-idea-community-edition

flatpak install flathub com.viber.Viber -y
flatpak install flathub no.mifi.losslesscut -y
flatpak install flathub com.jgraph.drawio.desktop -y
flatpak install flathub com.jetbrains.PhpStorm -y


# clean cache
sudo pacman -Sc
sudo pacman -Scc



