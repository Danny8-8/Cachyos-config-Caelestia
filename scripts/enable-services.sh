#!/usr/bin/env bash

set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

[ -f "$ROOT/manifests/services.txt" ] || exit 0

echo
echo "Habilitando servicios..."

while read -r service; do

    [ -z "$service" ] && continue
    [[ "$service" =~ ^# ]] && continue

    sudo systemctl enable "$service"

done < "$ROOT/manifests/services.txt"

echo "✓ Servicios habilitados."
