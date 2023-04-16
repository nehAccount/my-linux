#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

# users and groups
sudo adduser root www-data
sudo adduser "$username" www-data

cd /var/www || exit

# git clone
echo "Setting permissions for www-data"
sudo chown -R www-data:www-data /var/www
sudo git clone https://github.com/bnpz/app.bnp.git
sudo mv /var/www/app.bnp /var/www/bnp-zenica.com

# IMPORTANT - create roles dir
sudo mkdir /var/www/bnp-zenica.com/public/roles
sudo chmod -R 777 /var/www/bnp-zenica.com/public/roles

# add Read/Write permissions for all users in group
sudo chmod -R  g+rwx bnp-zenica.com
echo "Setting permissions for www-data"
sudo chown -R www-data:www-data /var/www

# symlink to /home/bnp-admin
sudo mkdir -p /home/"$username"/PhpProjects
sudo chown -R $username:$username /home/$username/PhpProjects
sudo ln -s /var/www/bnp-zenica.com /home/"$username"/PhpProjects

# PHP 7.4
#sudo nala install software-properties-common -y
#sudo add-apt-repository ppa:ondrej/php -y
#sudo nala update
#sudo nala install -y php7.4 php7.4-fpm libapache2-mod-php7.4 php7.4-curl php7.4-intl php7.4-zip php7.4-soap php7.4-xml php7.4-gd php7.4-mbstring php7.4-bcmath php7.4-common php7.4-xml php7.4-mysqli

# enable mods on apache
sudo a2enmod ssl
sudo a2enmod rewrite
#sudo a2enmod proxy_fcgi setenvif
#sudo a2enconf php7.4-fpm

# setup php version for symfony
#echo 7.4 > /var/www/bnp-zenica.com/.php-version

# setup site
sudo cp "$builddir"/bnp/bnp-zenica.com.conf /etc/apache2/sites-available/
sudo cp "$builddir"/bnp/.env /var/www/bnp-zenica.com
sudo a2dissite 000-default.conf
sudo a2ensite bnp-zenica.com.conf

# set mariadb user
sudo mariadb -e "GRANT ALL ON *.* TO 'bnp-admin'@'localhost' IDENTIFIED BY 'Ngzmhr072' WITH GRANT OPTION;"
sudo mariadb -e "FLUSH PRIVILEGES;"
sudo systemctl restart mariadb

chown -R www-data:www-data /var/www
chown -R $username:$username /home/$username
### Confirmation
cd /var/www/bnp-zenica.com || exit
sudo systemctl stop apache2
sudo systemctl start apache2
sudo mariadb -e "SELECT user FROM mysql.user;"
php -v
sudo apachectl configtest
sudo update-alternatives --config php
#symfony check:requirements

### FINISH
echo "COPY .env to symfony directory"
echo "RUN composer update"




