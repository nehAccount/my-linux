#!/bin/bash

# username=$(id -u -n 1000)
# builddir=$(pwd)

sudo pacman -Syu

echo "Instaliram PostgreSQL..."
sudo pacman -S postgresql

echo "Inicijalizujem bazu podataka..."
sudo -u postgres initdb --locale en_US.UTF-8 -D /var/lib/postgres/data

echo "Pokrećem servis..."
sudo systemctl start postgresql
sudo systemctl enable postgresql

echo "Kreiram korisnika 'postgres'..."
sudo -i -u postgres psql -c "CREATE USER postgres WITH SUPERUSER PASSWORD 'postgres';"

echo "Status servisa:"
sudo systemctl status postgresql

echo "Instaliram pgAdmin:"
flatpak install flathub org.pgadmin.pgadmin4

echo "PostgreSQL je uspešno instaliran i pokrenut!"