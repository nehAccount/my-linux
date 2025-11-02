#!/bin/bash

theme1_name="my-orchis-Light"
theme1_path="$HOME/.themes/my-orchis-Light"
theme2_name="my-orchis-Dark-Nord"
theme2_path="$HOME/.themes/my-orchis-Dark-Nord"

icon_theme="MacTahoe"

# Prikazivanje opcija korisniku
echo "::"
echo "1. $theme1_name"
echo "2. $theme2_name"

# Čitanje korisničkog unosa
read -p "Izaberi temu (1-2): " opcija

# Definisanje varijable za odabrani string
selected_option=""

# Provera izbora korisnika
case $opcija in
    1)
        selected_theme=$theme1_name
        selected_theme_path=$theme1_path
        icon_theme="MacTahoe-light"
        ;;
    2)
        selected_theme=$theme2_name
        selected_theme_path=$theme2_path
        icon_theme="MacTahoe-dark"
        ;;
    *)
        echo "Pogrešan unos."
        exit 1
        ;;
esac

# delete current data from GTK-4.0
rm -rf ~/.config/gtk-4.0/assets
rm -f ~/.config/gtk-4.0/gtk.css
rm -f ~/.config/gtk-4.0/gtk-dark.css

# copy data from theme path to GTK-4.0
cp -r $selected_theme_path/gtk-4.0/assets ~/.config/gtk-4.0/
cp $selected_theme_path/gtk-4.0/gtk.css ~/.config/gtk-4.0/
cp $selected_theme_path/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/

# set desktop theme
gsettings set org.cinnamon.desktop.interface gtk-theme "$selected_theme"
gsettings set org.cinnamon.theme name "$selected_theme"
gsettings set org.gnome.desktop.interface gtk-theme "$selected_theme"

# set icon theme
gsettings set org.cinnamon.desktop.interface icon-theme "$icon_theme"
gsettings set org.gnome.desktop.interface icon-theme "$icon_theme"

# run script to get colors from wallpaper
exec-wal

