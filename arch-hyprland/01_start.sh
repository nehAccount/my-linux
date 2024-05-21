#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)
fonts_dir="/usr/share/fonts"
user_fonts_dir="/home/$username/.fonts"

# update system
sudo pacman -Sy
sudo pacman -Syu
sudo pacman -Syyu


sudo pacman -S --needed amd-ucode

# fonts
sudo cp -a "$builddir"/fonts/* "$fonts_dir"
sudo fc-cache -f -v

# weather icons font
mkdir -p "$user_fonts_dir"
#cp -a $builddir/weather-font-icons/* "$user_fonts_dir"

fc-cache -f -v

# git
sudo pacman -S --needed git
git config --global user.name "Nermin Hadzimejlic"
git config --global user.email "nermin.hadzimejlic@gmail.com"
git config --global init.defaultBranch main

# basic aps
sudo pacman -S --needed wget curl neofetch htop zip unzip ncdu stress nmap gwenview

# flatpak
sudo pacman -S --needed flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo pacman -S --needed xdg-desktop-portal-kde xdg-desktop-portal-gnome xdg-desktop-portal-gtk


# clean cache
sudo pacman -Sc
sudo pacman -Scc

echo "Reboot System!!!"

########################
## zsh




