#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)
fonts_dir="/usr/share/fonts"

# update system
sudo pacman -Syu

sudo pacman -S --needed nautilus gnome-text-editor
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
#sudo pacman -S --needed img2pdf
#sudo pacman -S --needed handbrake
#sudo pacman -S --needed intellij-idea-community-edition

flatpak install flathub com.viber.Viber -y
flatpak install flathub no.mifi.losslesscut -y

# PhpStorm
yay -S --needed phpstorm phpstorm-jre

# Docker
sudo pacman -S --needed docker docker-buildx docker-compose

# add user to docker group
sudo groupadd docker
sudo usermod -aG docker "$USER"

systemctl enable docker.service

echo "DONE!"
echo "REBOOT SYSTEM to enable using docker without sudo"






