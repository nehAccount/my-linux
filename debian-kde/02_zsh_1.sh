#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd "$builddir" || exit

sudo nala update

### zsh terminal
sudo nala install zsh -y
sudo chsh -s /usr/bin/zsh

### oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Reboot System!!!"




