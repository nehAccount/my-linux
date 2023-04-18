#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

mkdir -p "$builddir"/docker/mysql
USER=$username UUID=1000 docker-compose up --build







