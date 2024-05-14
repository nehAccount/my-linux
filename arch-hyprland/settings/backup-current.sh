#!/bin/bash
clear

username=$(id -u -n 1000)
builddir=$(pwd)

mkdir -p "$builddir/dotfiles"
mkdir -p "$builddir/dotfiles/.settings"
mkdir -p "$builddir/.config"


# Stephan Raabe dotfiles
dotfiles_dir="/home/$username/dotfiles"


# My files
dotfiles_nermin_dir="$builddir/dotfiles"
dotfiles_nermin_settings_dir="$builddir/dotfiles/.settings"
hypr_conf_dir="$dotfiles_nermin_dir/hypr/conf"

echo "This will backup my changes in dotfiles."
echo ""
while true; do
    read -p "Do you really want to backup settings? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
		echo "Custom conf"	    	
		mkdir -p $hypr_conf_dir
		cp $dotfiles_dir/hypr/conf/custom.conf $hypr_conf_dir/

		echo "Alacritty"
		mkdir -p $dotfiles_nermin_dir/alacritty
		cp $dotfiles_dir/alacritty/alacritty.toml $dotfiles_nermin_dir/alacritty/

		echo "Hyprland changes: borders, blur..."		
		mkdir -p "$builddir/.config/ml4w-hyprland-settings"
		cp /home/$username/.config/ml4w-hyprland-settings/hyprctl.json $builddir/.config/ml4w-hyprland-settings/

		cp $dotfiles_dir/.settings/* $dotfiles_nermin_settings_dir
        break;;
        [Nn]* ) 
	    echo "Nothig is copied."
            exit
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done