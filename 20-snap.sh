#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd "$builddir" ||exit

sudo snap install libreoffice
sudo snap install flameshot
sudo snap install photogimp
sudo snap install postman
sudo snap install phpstorm --classic
sudo snap install intellij-idea-community --classic
sudo snap install code --classic
sudo snap install flutter --classic



