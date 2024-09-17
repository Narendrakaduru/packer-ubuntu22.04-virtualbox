#!/usr/bin/env bash

# Without libdbus virtualbox would not start automatically after compile
# apt-get -y install --no-install-recommends libdbus-1-3

# Install Linux headers and compiler toolchain
apt-get -y install dkms build-essential linux-headers-$(uname -r) virtualbox-guest-additions-iso

# Install the VirtualBox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions.iso
mount -o loop $VBOX_ISO /mnt
yes | sh /mnt/VBoxLinuxAdditions.run
umount /mnt

#Cleanup VirtualBox
#rm $VBOX_ISO

shutdown -r now
sleep 60