# CachyOS Config - Caelestia

Configuración completa de mi entorno de escritorio basada en **CachyOS**, **Arch Linux**, **Hyprland** y **Caelestia**.

Este repositorio permite reconstruir automáticamente mi sistema en una instalación limpia mediante un único comando.

---

# Instalación

```bash
git clone https://github.com/Danny8-8/Cachyos-config-Caelestia.git
cd Cachyos-config-Caelestia
chmod +x install.sh
./install.sh
```

---

# ¿Qué instala?

El instalador realiza automáticamente las siguientes tareas:

- Instala `paru` si no está instalado.
- Instala todos los paquetes oficiales.
- Instala todos los paquetes del AUR.
- Instala las aplicaciones Flatpak.
- Restaura toda la configuración personal.
- Activa los servicios necesarios.
- Ejecuta la post-instalación.

---

# Componentes principales

- CachyOS / Arch Linux
- Hyprland
- Caelestia Shell
- Fish
- Kitty
- Foot
- Fastfetch
- Fuzzel
- Spotify
- Spicetify
- Vesktop
- Joplin
- Zen Browser

---

# Estructura del repositorio

```
config/         Archivos de configuración del proyecto
docs/           Documentación
dotfiles/       Configuración personal
fonts/          Fuentes
manifests/      Inventario del sistema
packages/       Listas de paquetes
scripts/        Scripts de instalación y respaldo
themes/         Temas
wallpapers/     Fondos de pantalla
```

---

# Actualizar el respaldo

Después de realizar cambios en la configuración:

```bash
./scripts/backup-dotfiles.sh
./update.sh
```

---

# Restaurar el sistema

En una instalación nueva de CachyOS o Arch Linux:

```bash
git clone https://github.com/Danny8-8/Cachyos-config-Caelestia.git
cd Cachyos-config-Caelestia
./install.sh
```

---

# Objetivo

Que una instalación completamente limpia pueda convertirse en mi entorno de trabajo habitual ejecutando únicamente:

```bash
git clone https://github.com/Danny8-8/Cachyos-config-Caelestia.git
cd Cachyos-config-Caelestia
./install.sh
```
