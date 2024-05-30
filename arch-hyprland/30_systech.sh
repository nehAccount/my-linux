#!/bin/bash

sudo pacman -S --needed postgresql
sudo pacman -S --needed nodejs npm
sudo pacman -S --needed intellij-idea-community-edition
sudo pacman -S --needed code


######################
# config postgres
#sudo -u postgres -i # login as postgres
#initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data/'

#Success. You can now start the database server using:
# pg_ctl -D /var/lib/postgres/data/ -l logfile start

#exit
#sudo systemctl enable --now postgresql
#sudo systemctl status postgresql # to check for any errors

#psql -U postgres
#postgres=# \password # to set password

####################
# config angular
# from moneta/frontend
# sudo npm install -g @angular/cli