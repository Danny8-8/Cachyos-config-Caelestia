#!/usr/bin/env bash

set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Exportando información del sistema..."

# Paquetes oficiales
pacman -Qqe > "$ROOT/manifests/pacman-explicit.txt"

# Paquetes AUR
paru -Qm > "$ROOT/manifests/aur.txt"

# Flatpak
flatpak list > "$ROOT/manifests/flatpak.txt"

# Información del sistema
{
echo "===== Fecha ====="
date

echo
echo "===== Sistema ====="
uname -a

echo
echo "===== OS ====="
cat /etc/os-release

echo
echo "===== CPU ====="
lscpu

echo
echo "===== Memoria ====="
free -h

echo
echo "===== GPU ====="
lspci | grep -Ei "vga|3d|display"

} > "$ROOT/manifests/system-info.txt"

# Servicios habilitados
systemctl list-unit-files --state=enabled > "$ROOT/manifests/services.txt"

# Sistemas de archivos
lsblk -f > "$ROOT/manifests/filesystems.txt"

echo
echo "Inventario actualizado correctamente."
