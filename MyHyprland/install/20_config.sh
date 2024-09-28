#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

# git
git config --global user.name "Nermin Hadzimejlic"
git config --global user.email "nermin.hadzimejlic@gmail.com"
git config --global init.defaultBranch main

sudo pacman -S --needed flatpak

# flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# clean cache
sudo pacman -Sc
sudo pacman -Scc

echo "Done!"



