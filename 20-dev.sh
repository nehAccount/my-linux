#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

### Flutter
sudo snap install flutter --classic
flutter doctor

sudo nala update

### MariaDB
sudo nala install -y mariadb-server
echo "### IMPORTANT "
echo "Enter current password for root (enter for none): PRESS ENTER HERE"
echo "Switch to unix_socket authentication [Y/n] n"
echo "Set root password? [Y/n] n"
echo "Disable remote access for root? [Y/n] Y"
sudo mysql_secure_installation

sudo mariadb -e "GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;"
sudo mariadb -e "FLUSH PRIVILEGES;"
sudo systemctl restart mariadb
sudo mariadb -e "SELECT user FROM mysql.user;"

### Docker
echo "Installing Docker..."
sudo nala install -y ca-certificates gnupg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo nala update
sudo nala install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world

# add user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER
echo "REBOOT SYSTEM to enable use docker without sudo"




