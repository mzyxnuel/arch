#!/bin/bash

# Install yay if not already installed
if ! command -v yay &> /dev/null; then
    sudo pacman -S --needed git base-devel --noconfirm
    cd /
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# Check if PACKAGES file exists
if [ ! -f "PACKAGES" ]; then
    echo "PACKAGES file not found."
    exit 1
fi

# Read package names from PACKAGES file and install them using yay
while IFS= read -r package; do
    yay -S --noconfirm "$package"
done < "PACKAGES"

# Change directory to /.arch/ and run stow 
# Check if stow command is available
if ! command -v stow &> /dev/null; then
    cd /.arch/
    stow bash 
    stow fastfetch
    
    source /.bashrc
else
    echo "stow command not found."
    exit 1
fi


