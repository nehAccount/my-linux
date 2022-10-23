#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./script-name.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir

### copy zsh files
cp /zsh/fino-nermin.zsh-theme /home/$username/.oh-my-zsh/themes/
cp /zsh/.zshrc /home/$username/
chown -R $username:$username /home/$username

echo "Restart terminal"



