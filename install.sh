#!/usr/bin/env bash
# Installer for Omarchy / Arch + Hyprland
set -euo pipefail
cd "$(dirname "$0")"
BIN="$HOME/.local/bin"

echo "==> Installing dependencies"
sudo pacman -S --needed python-evdev tk

echo "==> Setting up /dev/uinput access"
echo uinput | sudo tee /etc/modules-load.d/uinput.conf >/dev/null
sudo modprobe uinput
echo 'KERNEL=="uinput", GROUP="input", MODE="0660"' | sudo tee /etc/udev/rules.d/99-uinput.rules >/dev/null
sudo usermod -aG input "$USER"
sudo udevadm control --reload && sudo udevadm trigger

echo "==> Installing speedclicker-gui"
install -Dm755 speedclicker-gui "$BIN/speedclicker-gui"
mkdir -p "$HOME/.local/share/applications"
sed "s|@BIN@|$BIN|" speedclicker.desktop > "$HOME/.local/share/applications/speedclicker.desktop"

echo
echo "Done. Log out and back in (needed for the 'input' group), then launch"
echo "'Speed AutoClicker' from the app launcher or run: speedclicker-gui"
