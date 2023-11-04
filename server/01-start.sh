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
