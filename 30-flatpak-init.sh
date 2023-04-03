#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

sudo nala install flatpak -y
sudo nala install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "Reboot System"
