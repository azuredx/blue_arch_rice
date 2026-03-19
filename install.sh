#!/bin/bash

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

if [ ! -f "packages" ] || [ ! -f "packages_aur" ]; then
    echo -e "${RED}Error: 'packages' or 'packages_aur' not found!${NC}"
    exit 1
fi

sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm - < packages

if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    pushd /tmp/yay
    makepkg -si --noconfirm
    popd
fi

yay -S --needed --noconfirm - < packages_aur

CONFIG_DIR="$HOME/.config"
REPO_DIR="$(pwd)"

mkdir -p "$CONFIG_DIR"

folders=("hypr" "waybar" "kitty" "dunst" "rofi" "glava" "fastfetch" "mako")

for folder in "${folders[@]}"; do
    if [ -d "$REPO_DIR/.config/$folder" ]; then
        if [ -d "$CONFIG_DIR/$folder" ] || [ -L "$CONFIG_DIR/$folder" ]; then
            rm -rf "$CONFIG_DIR/${folder}_bak"
            mv "$CONFIG_DIR/$folder" "$CONFIG_DIR/${folder}_bak"
        fi
        ln -s "$REPO_DIR/.config/$folder" "$CONFIG_DIR/$folder"
    fi
done

if [ -d "$CONFIG_DIR/hypr/scripts" ]; then
    chmod +x "$CONFIG_DIR/hypr/scripts/"*.sh
fi

echo -e "${BLUE}>>> Deployment complete.${NC}"
