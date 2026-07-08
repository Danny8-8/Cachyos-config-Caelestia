#!/usr/bin/env bash

set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LIST="$ROOT/config/backup-list.txt"

echo "========================================"
echo " Respaldando dotfiles..."
echo "========================================"

while IFS= read -r line || [ -n "$line" ]; do

    [[ -z "$line" || "$line" =~ ^# ]] && continue

    SRC="$HOME/$line"

    case "$line" in
        .config/*)
            DEST="$ROOT/dotfiles/config/${line#.config/}"
            ;;
        .local/*)
            DEST="$ROOT/dotfiles/local/${line#.local/}"
            ;;
        .*)
            DEST="$ROOT/dotfiles/home/${line#.}"
            ;;
        *)
            echo "Ruta no soportada: $line"
            continue
            ;;
    esac

    if [ -e "$SRC" ]; then

        mkdir -p "$(dirname "$DEST")"

        rsync \
    -a \
    --delete \
    --exclude-from="$ROOT/config/rsync-excludes.txt" \
    "$SRC/" \
    "$DEST/"

        printf "✓ %s\n" "$line"

    else
        printf "⚠ No existe: %s\n" "$line"
    fi

done < "$LIST"

echo
echo "Respaldo terminado."
