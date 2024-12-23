#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <pkglist.txt> <aur_pkglist.txt>"
    exit 1
fi

PKG_LIST="$1"
AUR_PKG_LIST="$2"

if [ ! -f "$PKG_LIST" ]; then
    echo "File not found: $PKG_LIST"
    exit 1
fi

if [ ! -f "$AUR_PKG_LIST" ]; then
    echo "File not found: $AUR_PKG_LIST"
    exit 1
fi

echo "Installing base-devel..."
sudo pacman -S --needed git base-devel --noconfirm

echo "Cloning dotfiles..."
./dotfiles.sh

echo "Installing regular packages from $PKG_LIST..."
./install_pkgs.sh "$PKG_LIST"

echo "Setting up paru..."
./install_paru.sh

echo "Installing AUR packages from $AUR_PKG_LIST..."
./install_aur_packages.sh "$AUR_PKG_LIST"

echo "Setup completed successfully!"

