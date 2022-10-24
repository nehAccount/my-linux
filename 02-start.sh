#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./script-name.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

### Chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#nala install ./google-chrome-stable_current_amd64.deb
#rm ./google-chrome-stable_current_amd64.deb

### gnome shell
add-apt-repository universe

nala update
nala install neofetch -y
nala install htop -y
nala install ubuntu-restricted-extras -y
nala install chrome-gnome-shell -y

nala install timeshift -y
nala install filezilla -y
nala install mpv -y

nala install gnome-shell-extensions -y
nala install gnome-tweaks -y
nala install geary -y

### copy /home/*
#cp -R my-home/* /home/$username/
# chown -R $username:$username /home/$username




