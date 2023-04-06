#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)
sudo mysql -u root -e "SELECT user FROM mysql. user;"
sudo mysql -u root -e "show databases;"





