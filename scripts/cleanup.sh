#!/usr/bin/env bash

apt-get autoremove -y
apt-get clean

# Zero out the free space to save space in the final image:
echo "Zeroing device to make space..."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY