#!/bin/bash

username=$(id -u -n 1000)
dbPassword="Ngzmhr072#"

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

sudo mariadb -e "GRANT ALL ON *.* TO '$username'@'localhost' IDENTIFIED BY '$dbPassword' WITH GRANT OPTION;"
sudo mariadb -e "FLUSH PRIVILEGES;"
sudo systemctl restart mariadb

### PHP:latest
sudo nala install -y php
sudo nala install -y php-json php-ctype php-curl php-mbstring php-xml php-zip php-tokenizer php-tokenizer libpcre3 --no-install-recommends
sudo nala install -y php-mysql
sudo nala install -y php-intl
sudo sh -c "echo ServerName 127.0.0.1 >> /etc/apache2/apache2.conf"
sudo systemctl restart apache2

### Composer
sudo nala install -y php-cli unzip
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH='curl -sS https://composer.github.io/installer.sig'
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo rm /tmp/composer-setup.php

### Symfony CLI
curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
sudo nala install -y symfony-cli

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

# add user to docker group
sudo groupadd docker
sudo usermod -aG docker "$USER"

### Confirmations
echo "MariaDB #######################"
sudo mariadb -e "SELECT user FROM mysql.user;"
echo "Apache syntax #######################"
sudo apachectl configtest 
echo "Symfony #######################"
symfony check:requirements
echo "Docker #######################"
sudo docker run hello-world

### FINISH
echo "REBOOT SYSTEM to enable using docker without sudo"




