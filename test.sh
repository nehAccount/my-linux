#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)
sudo nala update
sudo nala install -y mariadb-server
echo "### IMPORTANT "
echo "Enter current password for root (enter for none): PRESS ENTER HERE"
echo "Switch to unix_socket authentication [Y/n] n"
echo "Set root password? [Y/n] n"
sudo mysql_secure_installation

#sudo mariadb -e "GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;"
#sudo mariadb -e "FLUSH PRIVILEGES;"
#sudo systemctl restart mariadb
#sudo mariadb -e "SELECT user FROM mysql.user;"






