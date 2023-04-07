#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

sudo apt install php

curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
sudo apt install symfony-cli


