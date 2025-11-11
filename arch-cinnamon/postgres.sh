#!/bin/bash

#username=$(id -u -n 1000)
builddir=$(pwd)

# Skripta za instalaciju i inicijalizaciju PostgreSQL na Arch Linuxu

# Ažuriranje sistema
echo "Ažuriram sistem..."
sudo pacman -Syu

# Instalacija PostgreSQL paketa
echo "Instaliram PostgreSQL..."
sudo pacman -S postgresql

# Inicijalizacija baze podataka
echo "Inicijalizujem bazu podataka..."
sudo -u postgres initdb --locale en_US.UTF-8 -D /var/lib/postgres/data

# Pokretanje PostgreSQL servisa
echo "Pokrećem PostgreSQL servis..."
sudo systemctl start postgresql

# Omogućavanje automatskog pokretanja PostgreSQL-a pri startupu
echo "Omogućavam PostgreSQL da se pokreće pri startupu..."
sudo systemctl enable postgresql

# Kreiranje PostgreSQL korisnika (ako je potrebno, možeš promeniti ime korisnika)
echo "Kreiram PostgreSQL korisnika 'postgres'..."
sudo -i -u postgres psql -c "CREATE USER postgres WITH SUPERUSER PASSWORD 'postgres';"

# Status servisa
echo "Status PostgreSQL servisa:"
sudo systemctl status postgresql

# Poruka o završetku
echo "PostgreSQL je uspešno instaliran i pokrenut!"

flatpak install flathub org.pgadmin.pgadmin4