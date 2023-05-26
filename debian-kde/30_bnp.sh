#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

##################################################
dirName=/home/$username/PhpstormProjects
siteName=bnp-zenica.com
rolesDir="$dirName"/"$siteName"/public/roles
##################################################

mkdir -p "$dirName"
cd "$dirName" || exit
git clone git@github.com:bnpz/app.bnp.git
mv "$dirName"/app.bnp "$dirName"/"$siteName"

# IMPORTANT - create roles dir
mkdir -p "$rolesDir"
sudo chmod -R 777 "$rolesDir"

# copy .env file
cp "$builddir"/bnp/.env "$dirName"/"$siteName"
cp "$builddir"/bnp/.env.local "$dirName"/"$siteName"







