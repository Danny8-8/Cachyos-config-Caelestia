#!/usr/bin/env bash

set -e

ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "========================================"
echo " CachyOS Configuration Installer"
echo "========================================"
echo

bash "$ROOT/scripts/install-paru.sh"

bash "$ROOT/scripts/install-packages.sh"

bash "$ROOT/scripts/restore-dotfiles.sh"

bash "$ROOT/post-install.sh"

echo
echo "Instalación completada."
