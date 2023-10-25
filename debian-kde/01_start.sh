#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

sudo apt update

### nala
sudo apt update
sudo apt install nala -y

### system apps
sudo nala update
sudo nala install git -y
git config --global user.name "Nermin Hadzimejlic"
git config --global user.email "nermin.hadzimejlic@gmail.com"
sudo nala install wget -y
sudo nala install curl -y
sudo nala install neofetch -y
sudo nala install htop -y
sudo nala install zip -y
sudo nala install unzip -y
sudo nala install xz-utils -y
sudo nala install htop -y
# stress --cpu 12
sudo nala install stress -y
#sudo nala install gparted -y

# kde specific
sudo nala install fonts-roboto -y
sudo nala install fonts-inter -y
sudo nala install firefox-esr -y
sudo nala install kio-gdrive -y

# printer settings
sudo nala install print-manager -y
sudo usermod -aG lpadmin "$username"

### copy css for terminal padding
#mkdir -p /home/$username/.config
#cp -R config/gtk-* /home/$username/.config/
#chown -R $username:$username /home/$username

### zsh terminal
sudo nala install zsh -y
sudo chsh -s /usr/bin/zsh

### flatpak init
sudo nala install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Reboot System!!!"
echo '### AFTER REBOOT, RUN WITHOUT SUDO: sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
