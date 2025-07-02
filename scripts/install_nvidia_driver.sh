#!/bin/bash

line="deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware"
echo "$line" | sudo tee /etc/apt/sources.list.d/bookworm.list

sudo apt update

sudo apt install -y build-essential git gcc htop tmux
# $(uname -r)
sudo apt install -y linux-headers-$(uname -r) dkms

sudo apt install -y nvidia-driver firmware-misc-nonfree

echo "reboot needed for nvidia driver"
