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
sudo pacman -S --needed --noconfirm "${generalPackages[@]}"
sudo pacman -S --needed --noconfirm "${appPackages[@]}"
# yay
yay -S --needed --noconfirm "${generalPackagesYay[@]}"
yay -S --needed --noconfirm "${appPackagesYay[@]}"

# ------------------------------------------------------
# Flatpak
# ------------------------------------------------------
sudo pacman -S --needed --noconfirm flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub -y "${flatpakPackages[@]}"

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
# docker setup
# ------------------------------------------------------
# add user to docker group
sudo groupadd docker
sudo usermod -aG docker "$USER"
systemctl enable docker.service

# DESKTOP ENVIRONMENT SETUP

# ------------------------------------------------------
# fonts
# ------------------------------------------------------
sudo cp -a "$builddir"/fonts/* /usr/share/fonts
sudo fc-cache -f -v
fc-cache -f -v

# ------------------------------------------------------
# icons
# ------------------------------------------------------
sudo tar -xvf "$builddir"/icons/Colloid.tar.xz -C /usr/share/icons
sudo cp -a "$builddir"/icons/distro.svg /usr/share/icons

# ------------------------------------------------------
# shares
# ------------------------------------------------------
mkdir -p "$HOME/.local/share"
cp -a "$builddir"/home/local/share/* "$HOME"/.local/share

# ------------------------------------------------------
# config
# ------------------------------------------------------
cp -a "$builddir"/home/config/* "$HOME"/.config

# ------------------------------------------------------
# new file templates
# ------------------------------------------------------
mkdir -p "$HOME/Templates"
sudo cp -a "$builddir"/home/Templates/* "$HOME"/Templates

# ------------------------------------------------------
# dconf setup
# ------------------------------------------------------
# file to load: dconf dump /org/cinnamon/ > org-cinnamon.dconf
# dconf load /org/cinnamon/ < "$builddir"/_cinnamon/org-cinnamon.dconf

dconf dump /org/cinnamon/ > "$HOME"/org-cinnamon-backup-orig.dconf
dconf load /org/cinnamon/ < "$builddir"/org-cinnamon-current.dconf

gsettings set org.cinnamon.muffin placement-mode 'center'

# ------------------------------------------------------
# zsh
# ------------------------------------------------------
sudo cp -a "$builddir"/home/.zshrc "$HOME"
sudo chsh -s /usr/bin/zsh
chsh -s /usr/bin/zsh

# ------------------------------------------------------
# make scripts executable
# ------------------------------------------------------
sudo ln -s "$HOME"/.local/share/cinnamon/my-scripts/send-notification /usr/local/bin/
sudo chmod +x /usr/local/bin/send-notification
sudo ln -s "$HOME"/.local/share/cinnamon/my-scripts/exec-wal /usr/local/bin/
sudo chmod +x /usr/local/bin/exec-wal

# ------------------------------------------------------
# copy wallpapers
# ------------------------------------------------------
cp -a "$builddir"/home/Pictures/wallpapers "$HOME"/Pictures/

# ------------------------------------------------------
# set default wallpaper
# ------------------------------------------------------
file='file:///'$HOME'/Pictures/wallpapers/default.jpg'
gsettings set org.cinnamon.desktop.background picture-uri "$file"

# ------------------------------------------------------
# create dir for Nextcloud
# ------------------------------------------------------
mkdir -p "$HOME/MyCloud"

# ------------------------------------------------------
# clear cache
# ------------------------------------------------------
sudo pacman -Sc --noconfirm
sudo pacman -Scc --noconfirm

# ------------------------------------------------------
# extract colors from wallpaper
# ------------------------------------------------------
exec-wal
send-notification "Installation finished." "System will reboot in 15 seconds!"

# ------------------------------------------------------
# reboot system
# ------------------------------------------------------
sleep 15
sudo reboot








