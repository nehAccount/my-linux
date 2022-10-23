#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./script-name.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

#nala update
#


### Chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#nala install ./google-chrome-stable_current_amd64.deb
#rm ./google-chrome-stable_current_amd64.deb