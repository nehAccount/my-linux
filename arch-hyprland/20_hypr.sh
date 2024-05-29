#!/bin/bash

# notification manager
sudo pacman -S --needed swaync
# KDE Apps and Settings
sudo pacman -S --needed dolphin kate qt5ct qt6ct

# fonts
yay nerd-fonts-noto-sans-regular-complete
fc-cache -f -v


