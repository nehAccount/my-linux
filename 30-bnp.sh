#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

##################################################
dirName=/home/$username/PhpProjects
siteName=bnp-zenica.com
rolesDir="$dirName"/"$siteName"/public/roles
##################################################

mkdir -p "$dirName"
cd "$dirName" || exit
git clone https://github.com/bnpz/app.bnp.git
mv "$dirName"/app.bnp "$dirName"/"$siteName"

# IMPORTANT - create roles dir
mkdir -p "$rolesDir"
sudo chmod -R 777 "$rolesDir"

# copy .env file
cp "$builddir"/bnp/.env "$dirName"/"$siteName"
cp "$builddir"/bnp/.env "$dirName"/"$siteName"/.env.local

# set mariadb user
sudo mariadb -e "GRANT ALL ON *.* TO 'bnp-admin'@'localhost' IDENTIFIED BY 'Ngzmhr072' WITH GRANT OPTION;"
sudo mariadb -e "FLUSH PRIVILEGES;"

sudo systemctl restart mariadb

### Confirmation
sudo mariadb -e "SELECT user FROM mysql.user;"





