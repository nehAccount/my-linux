#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir

### copy zsh files
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp zsh/*-nermin.zsh-theme /home/$username/.oh-my-zsh/themes/
cp zsh/.zshrc /home/$username/
chown -R $username:$username /home/$username

### load profiles
dconf load /org/gnome/terminal/ < terminal_settings.txt

echo "Restart terminal"



