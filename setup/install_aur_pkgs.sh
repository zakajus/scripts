#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_with_aur_package_names>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 1
fi

mapfile -t packages < "$1"

# Install the packages using paru
echo "Installing AUR packages from $1..."
paru -S --needed "${packages[@]}"

echo "All AUR packages installed."

