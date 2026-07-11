#!/usr/bin/env bash

set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

command -v pacman >/dev/null || {
    echo "Error: pacman no está instalado."
    exit 1
}

command -v sudo >/dev/null || {
    echo "Error: sudo no está instalado."
    exit 1
}

echo "========================================"
echo " Instalando paquetes"
echo "========================================"
echo

# ------------------------------------
# Paquetes oficiales
# ------------------------------------

if [ -f "$ROOT/packages/official.txt" ]; then

    echo "Instalando paquetes oficiales..."

    mapfile -t PKGS < <(
    grep -vE '^\s*($|#)' "$ROOT/packages/official.txt"
)

    if [ "${#PKGS[@]}" -gt 0 ]; then
        sudo pacman -S --needed "${PKGS[@]}"
    fi

fi

echo

# ------------------------------------
# Paquetes AUR
# ------------------------------------

if command -v paru >/dev/null && [ -f "$ROOT/packages/aur.txt" ]; then

    echo "Instalando paquetes AUR..."

    mapfile -t AUR < <(
    grep -vE '^\s*($|#)' "$ROOT/packages/aur.txt"
)

   if [ "${#AUR[@]}" -gt 0 ]; then
    paru \
        --needed \
        --noconfirm \
        --skipreview \
        --batchinstall \
        -S \
        "${AUR[@]}"
fi

fi

echo

# ------------------------------------
# Flatpak
# ------------------------------------

if command -v flatpak >/dev/null && [ -f "$ROOT/packages/flatpak.txt" ]; then

    echo "Instalando aplicaciones Flatpak..."

    while read -r app; do

        flatpak install -y flathub "$app"

    done < <(

        grep -vE '^\s*($|#)' "$ROOT/packages/flatpak.txt"

    )

fi

echo
echo "Instalación de paquetes finalizada."
