#!/bin/bash
clear

username=$(id -u -n 1000)
builddir=$(pwd)

echo "This will apply my settings to dotfiles."
echo ""
while true; do
    read -p "Do you really want to APPLY SETTINGS? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
		cp -a $builddir/dotfiles /home/$username
		cp -a $builddir/.config/. /home/$username/.config/
		echo "Done."
		break;;
        [Nn]* ) 
	    echo "Nothig is copied."
            exit
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done