#!/usr/bin/env bash

set -e

if command -v paru >/dev/null; then
    echo "✓ Paru ya está instalado."
    exit 0
fi

echo "Instalando paru..."

sudo pacman -S --needed base-devel git

rm -rf /tmp/paru

git clone https://aur.archlinux.org/paru.git /tmp/paru

cd /tmp/paru

makepkg -si --noconfirm

cd /

rm -rf /tmp/paru

echo "✓ Paru instalado."
