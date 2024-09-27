#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

# update system
sudo pacman -Syu


sudo pacman -S --needed amd-ucode git wget curl fastfetch htop zip unzip ncdu stress nmap bat btop xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-wlr xdg-desktop-portal-kde xdg-desktop-portal-gnome xdg-desktop-portal-gtk xdg-user-dirs polkit-gnome 

sudo pacman -S --needed nautilus gnome-text-editor gnome-disk-utility


echo "Done!"




