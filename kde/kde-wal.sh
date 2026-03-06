#!/bin/bash

CONFIG_FILE="$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc"

# Pronađi wallpaper iz config fajla
WALLPAPER_LINE=$(grep -E "Image=file://" "$CONFIG_FILE" | head -1)

# Izdvoji putanju
if [[ "$WALLPAPER_LINE" =~ file://(.*)$ ]]; then
    WALLPAPER="${BASH_REMATCH[1]}"
fi

# Provjeri da li je direktorijum
if [ -d "$WALLPAPER" ]; then
    # Ako je direktorijum, nađi prvu sliku u njemu
    WALLPAPER=$(find "$WALLPAPER" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.bmp" \) | head -1)
fi

# Ako je pronađen wallpaper, pošalji ga pywal-u
if [ -n "$WALLPAPER" ] && [ -f "$WALLPAPER" ]; then
    # wal -i "$WALLPAPER"
    wal -q -i "$WALLPAPER"
    echo "$WALLPAPER"
    # send-notification "Success" "Colors from wallpaper extracted (dark theme)"
else
    echo "Nije pronađen wallpaper fajl"
    exit 1
fi