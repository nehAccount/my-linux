#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir

### nala
sudo apt update
sudo apt install nala -y

### system apps
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
sudo nala install ufw -y

### SNAP and snap.service
sudo nala install snapd -y
sudo systemctl start snapd
sudo systemctl enable snapd

### snap core
sudo snap install core

### nextclod
sudo snap install nextcluod

# IMPORTANT - before unable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
#sudo ufw allow http
#sudo ufw allow https

#sudo ufw enable
