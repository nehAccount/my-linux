#!/bin/bash

#username=$(id -u -n 1000)
builddir=$(pwd)

# Check if backup folder exists
if [ -d "backup" ]; then
    echo "Folder 'backup' already exists."
    read -p "Do you want to delete existing folder and create a new one? (y/n): " answer
    
    if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
        echo "Deleting existing 'backup' folder..."
        rm -rf backup
        echo "Creating new 'backup' folder..."
        mkdir backup
        echo "Folder 'backup' successfully created."
    else
        echo "Exiting script."
        exit 0
    fi
else
    echo "Folder 'backup' does not exist. Creating new one..."
    mkdir backup
    echo "Folder 'backup' successfully created."
fi

# Continue with the rest of the script...
# folders to backup from /home/nermin/.config/
configFolders=(
  alacritty
  cinnamon
  fastfetch
  "gtk-2.0"
  "gtk-3.0"
  "gtk-4.0"
  libreoffice
  nemo
  rofi
  starship
  wal
  zed
);

configFiles=(
  mimeapps.list
  starship.toml
);


# Create backup/config directory
mkdir -p "$builddir/backup/config"

# Copy config folders to backup
echo "*** Backing up config folders..."
for folder in "${configFolders[@]}"; do
    if [ -d "$HOME/.config/$folder" ]; then
        # echo "Copying $folder..."
        cp -a "$HOME/.config/$folder" "$builddir/backup/config/"
    else
        echo "Warning: $folder does not exist in ~/.config/"
    fi
done

# Copy all config files to backup
echo "*** Backing up config files..."
for file in "${configFiles[@]}"; do
    if [ -f "$HOME/.config/$file" ]; then
        # echo "Copying $file..."
        cp -a "$HOME/.config/$file" "$builddir/backup/config/"
    else
        echo "Warning: $file does not exist in ~/.config/"
    fi
done

echo "*** Config backup completed."
#####################################

# folders to backup from /home/nermin/.local/share
shareFolders=(
  applications
  cinnamon
);

# Create backup/local/share directory
mkdir -p "$builddir/backup/local/share"

# Copy .local/share folders to backup
echo "*** Backing up ./local/share folders..."
for folder in "${shareFolders[@]}"; do
    if [ -d "$HOME/.local/share/$folder" ]; then
        # echo "Copying $folder..."
        cp -a "$HOME/.local/share/$folder" "$builddir/backup/local/share/"
    else
        echo "Warning: $folder does not exist in ~/.local/share/"
    fi
done

echo "*** Share backup completed."
################################

cp "$HOME/.zshrc" "$builddir/backup/"
cp "$HOME/.zsh_history" "$builddir/backup/"
echo "*** zshrc backup completed."
#################################

dconf dump /org/cinnamon/ > "$builddir/backup/org-cinnamon-current.dconf"
echo "*** dconf backup completed."