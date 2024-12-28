#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd "$builddir" || exit

### zsh terminal
sudo pacman -S zsh
sudo chsh -s /usr/bin/zsh

### oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Reboot System!!!"




