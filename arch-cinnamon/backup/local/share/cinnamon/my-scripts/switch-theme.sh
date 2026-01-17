#!/bin/bash

theme_light="my-orchis-Light"
theme_light_path="$HOME/.themes/my-orchis-Light"
icon_light="MacTahoe-light"

theme_dark="my-orchis-Dark-Nord"
theme_dark_path="$HOME/.themes/my-orchis-Dark-Nord"
icon_dark="MacTahoe-dark"

# trenutno postavljena GTK tema
current_theme=$(gsettings get org.cinnamon.desktop.interface gtk-theme | tr -d "'")

# toggle logika
if [[ "$current_theme" == "$theme_light" ]]; then
    selected_theme="$theme_dark"
    selected_theme_path="$theme_dark_path"
    icon_theme="$icon_dark"
elif [[ "$current_theme" == "$theme_dark" ]]; then
    selected_theme="$theme_light"
    selected_theme_path="$theme_light_path"
    icon_theme="$icon_light"
else
    echo "Nepoznata trenutna tema: $current_theme"
    echo "Postavljam Light kao default."
    selected_theme="$theme_light"
    selected_theme_path="$theme_light_path"
    icon_theme="$icon_light"
fi

echo "Switching to theme: $selected_theme"

# GTK 4 reset
rm -rf ~/.config/gtk-4.0/assets
rm -f ~/.config/gtk-4.0/gtk.css
rm -f ~/.config/gtk-4.0/gtk-dark.css

# GTK 4 sync
cp -r "$selected_theme_path/gtk-4.0/assets" ~/.config/gtk-4.0/
cp "$selected_theme_path/gtk-4.0/gtk.css" ~/.config/gtk-4.0/
cp "$selected_theme_path/gtk-4.0/gtk-dark.css" ~/.config/gtk-4.0/

# GTK / Cinnamon tema
gsettings set org.cinnamon.desktop.interface gtk-theme "$selected_theme"
gsettings set org.cinnamon.theme name "$selected_theme"
gsettings set org.gnome.desktop.interface gtk-theme "$selected_theme"

# system light/dark (ZA ZED, GTK4, libadwaita, itd)
if [[ "$selected_theme" == "$theme_dark" ]]; then
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
else
    gsettings set org.gnome.desktop.interface color-scheme 'default'
fi

# icon theme
gsettings set org.cinnamon.desktop.interface icon-theme "$icon_theme"
gsettings set org.gnome.desktop.interface icon-theme "$icon_theme"

# pywal
exec-wal
