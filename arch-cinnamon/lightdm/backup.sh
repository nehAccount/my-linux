#!/bin/bash

builddir=$(pwd)
BACKUP_DIR="$builddir/lightdm-backup"

echo "Creating LightDM backup in $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"

# Glavni konfiguracijski fajlovi
cp -v /etc/lightdm/lightdm.conf "$BACKUP_DIR"/ 2>/dev/null || true
cp -v /etc/lightdm/lightdm-gtk-greeter.conf "$BACKUP_DIR"/ 2>/dev/null || true
cp -v /etc/lightdm/slick-greeter.conf "$BACKUP_DIR"/ 2>/dev/null || true

# Direktori sa konfiguracijama
if [ -d /etc/lightdm/lightdm.conf.d ]; then
    cp -rv /etc/lightdm/lightdm.conf.d "$BACKUP_DIR"/
fi
if [ -d /usr/share/lightdm/lightdm.conf.d ]; then
    cp -rv /usr/share/lightdm/lightdm.conf.d "$BACKUP_DIR"/
fi

# Ostalo: greeteri i teme
if [ -d /usr/share/xgreeters ]; then
    cp -rv /usr/share/xgreeters "$BACKUP_DIR"/
fi

echo "LightDM configuration backup completed."
