#!/bin/bash

# NON-AUR PACKAGES ONLY!
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_with_package_names>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 1
fi

echo "Installing packages from $1..."
sudo pacman -S --needed - < "$1"

echo "Packages installed."

