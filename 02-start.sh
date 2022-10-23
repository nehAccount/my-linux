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
### ubuntu cleaner
add-apt-repository ppa:gerardpuig/ppa

nala update
nala upgrade -y
nala install neofetch htop ubuntu-restricted-extras -y
nala install chrome-gnome-shell gnome-shell-extension gnome-tweak-tool dconf-editor -y
nala install ubuntu-cleaner timeshift filezilla mpv -y

cd $builddir
cp -R microsoft/* /home/$username/.local/share/applications/
chown -R $username:$username /home/$username


