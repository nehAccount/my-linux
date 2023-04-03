#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

sudo snap install flutter --classic
flutter doctor





