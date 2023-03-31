#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./script-name.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

### Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo nala install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

### gnome shell
sudo add-apt-repository universe

sudo nala update
sudo nala install neofetch -y
sudo nala install htop -y
sudo nala install ubuntu-restricted-extras -y
sudo nala install chrome-gnome-shell -y

sudo nala install timeshift -y
sudo nala install filezilla -y
sudo nala install mpv -y

sudo nala install gnome-shell-extensions -y
sudo nala install gnome-tweaks -y
sudo nala install geary -y

### copy /home/*
#cp -R my-home/* /home/$username/
# chown -R $username:$username /home/$username




