#!/bin/bash

# notification manager
sudo pacman -S --needed swaync
# KDE Apps and Settings
sudo pacman -S --needed dolphin kate qt5ct qt6ct

# File association in dolphin.
# delete plasma- prefix after copy
# cp /etc/xdg/menus/plasma-applications.menu ~/.config/menus/
# run once: kbuildsycoca6

# fonts
yay nerd-fonts-noto-sans-regular-complete
fc-cache -f -v


