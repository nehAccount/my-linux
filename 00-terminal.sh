#!/bin/bash

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
sudo nala install git -y
sudo nala install wget -y
sudo nala install curl -y
sudo nala install neofetch -y
sudo nala install htop -y
sudo nala install zip -y
sudo nala install unzip -y
sudo nala install xz-utils -y
sudo nala install htop -y

sudo nala install zsh -y
# zsh
echo "Run: sudo chsh -s /usr/bin/zsh and reboot system"
echo 'RUN WITHOUT SUDO: sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'


