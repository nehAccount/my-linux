#!/bin/bash

builddir=$(pwd)
BACKUP_DIR="$builddir/lightdm-backup"

if [ ! -d "$BACKUP_DIR" ]; then
    echo "Backup directory not found: $BACKUP_DIR"
    exit 1
fi

echo "Restoring LightDM configuration from $BACKUP_DIR..."

sudo cp -v "$BACKUP_DIR"/lightdm.conf /etc/lightdm/ 2>/dev/null || true
sudo cp -v "$BACKUP_DIR"/lightdm-gtk-greeter.conf /etc/lightdm/ 2>/dev/null || true
sudo cp -v "$BACKUP_DIR"/slick-greeter.conf /etc/lightdm/ 2>/dev/null || true

if [ -d "$BACKUP_DIR/lightdm.conf.d" ]; then
    sudo cp -rv "$BACKUP_DIR/lightdm.conf.d" /etc/lightdm/
fi
if [ -d "$BACKUP_DIR/xgreeters" ]; then
    sudo cp -rv "$BACKUP_DIR/xgreeters" /usr/share/
fi

echo "Restoration done. Restarting LightDM..."
sudo systemctl restart lightdm
