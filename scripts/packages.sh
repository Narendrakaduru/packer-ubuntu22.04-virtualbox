#!/usr/bin/env bash

apt-get clean
apt-get update
apt-get upgrade -y

# Update to the latest kernel
apt-get install -y linux-generic linux-image-generic

shutdown -r now
sleep 60