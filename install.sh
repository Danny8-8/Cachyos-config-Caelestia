#!/usr/bin/env bash

set -e

ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "========================================"
echo " CachyOS Configuration Installer"
echo "========================================"
echo

echo "Comprobando dependencias..."

if ! command -v pacman >/dev/null; then
    echo "Error: pacman no encontrado."
    exit 1
fi

echo "✓ Pacman"

if command -v paru >/dev/null; then
    echo "✓ Paru"
else
    echo "⚠ Paru no instalado."
fi

if command -v flatpak >/dev/null; then
    echo "✓ Flatpak"
else
    echo "⚠ Flatpak no instalado."
fi

echo
echo "Comprobación finalizada."
