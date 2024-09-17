#!/usr/bin/env bash

sudo apt-get clean
sudo apt-get update
sudo apt-get upgrade -y

shutdown -r now
sleep 60