#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

sudo nala install php
sudo nala install php-json php-ctype php-curl php-mbstring php-xml php-zip php-tokenizer php-tokenizer libpcre3 --no-install-recommends
sudo nala install php-mysql
sudo nala install php-intl


curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
sudo apt install symfony-cli

symfony check:requirements 





