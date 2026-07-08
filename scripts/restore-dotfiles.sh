#!/usr/bin/env bash

set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "========================================"
echo " Restaurando dotfiles..."
echo "========================================"

if [ -d "$ROOT/dotfiles/config" ]; then
    rsync -av "$ROOT/dotfiles/config/" "$HOME/.config/"
    echo "✓ .config restaurado"
fi

if [ -d "$ROOT/dotfiles/local" ]; then
    rsync -av "$ROOT/dotfiles/local/" "$HOME/.local/"
    echo "✓ .local restaurado"
fi

if [ -d "$ROOT/dotfiles/home" ]; then
    rsync -av "$ROOT/dotfiles/home/" "$HOME/"
    echo "✓ Home restaurado"
fi

echo
echo "Restauración completada."
