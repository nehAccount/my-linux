#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./script-name.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir

### copy css for terminal pading
mkdir -p /home/$username/.config
cp -R config/gtk-* /home/$username/.config/
chown -R $username:$username /home/$username


apt update
apt install nala -y
nala update
nala upgrade -y
nala install git -y
nala install wget -y
nala install curl -y

### load profiles
dconf load /org/gnome/terminal/ < terminal_settings.txt

nala install zsh -y
zsh
echo "Run: sudo chsh -s /usr/bin/zsh and reboot system"
echo 'RUN WITHOUT SUDO: sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'


