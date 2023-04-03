#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

### Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo nala install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

sudo apt install software-properties-common
sudo add-apt-repository universe
# ubuntu cleaner repo
sudo add-apt-repository ppa:gerardpuig/ppa -y

sudo nala update

### gnome shell
sudo nala install ubuntu-restricted-extras -y
sudo nala install chrome-gnome-shell -y
sudo nala install gnome-shell-extensions -y
sudo nala install gnome-tweaks -y
sudo nala install geary -y

### utilities
# sudo nala install timeshift -y
sudo nala install mpv -y
sudo nala install ubuntu-cleaner -y
sudo nala install dconf-editor -y
# firewall
sudo nala install gufw -y

echo "### SNAPS ###"
sudo snap remove firefox
# sudo snap install flameshot
sudo snap install photogimp








