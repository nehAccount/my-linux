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


sudo apt update
sudo apt install nala -y
sudo nala update
sudo nala upgrade -y
sudo nala install git -y
sudo nala install wget -y
sudo nala install curl -y

sudo nala install zsh -y
# zsh
echo "Run: sudo chsh -s /usr/bin/zsh and reboot system"
echo 'RUN WITHOUT SUDO: sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'


