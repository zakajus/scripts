#!/bin/bash

if [ "$EUID" -eq 0 ]; then
    echo "Please do not run this script as root."
    exit 1
fi

echo "Updating the system..."
sudo pacman -Syu --noconfirm


echo "Cloning the paru repository..."
git clone https://aur.archlinux.org/paru.git

cd paru || { echo "Failed to enter paru directory"; exit 1; }

echo "Building and installing paru..."
makepkg -si --noconfirm

cd ..
rm -rf paru

echo "Paru has been installed successfully!"

