#!/usr/bin/env bash
set -euo pipefail

if ! command -v adb >/dev/null 2>&1; then
  echo "Error: adb no está instalado o no está en PATH." >&2
  exit 1
fi

if ! adb get-state >/dev/null 2>&1; then
  echo "Error: no hay dispositivo ADB disponible. Revisa USB debugging y autorización." >&2
  exit 1
fi

MODE="${1:-install}"

usage() {
  cat <<'USAGE'
Uso:
  ./scripts/modo_resonancia_pad6.sh install # Instala/aplica perfil resonancia (por defecto)
  ./scripts/modo_resonancia_pad6.sh on      # Activa modo resonancia
  ./scripts/modo_resonancia_pad6.sh off     # Desactiva y restaura ajustes
  ./scripts/modo_resonancia_pad6.sh status  # Muestra estado actual
USAGE
}

set_resonancia_on() {
  echo "Activando modo resonancia..."
  adb shell settings put system screen_brightness_mode 0
  adb shell settings put system screen_brightness 70
  adb shell settings put global zen_mode 1
  adb shell settings put secure night_display_activated 1
  adb shell settings put secure ui_night_mode 2
  echo "Modo resonancia activado."
}

set_resonancia_off() {
  echo "Desactivando modo resonancia..."
  adb shell settings put global zen_mode 0
  adb shell settings put system screen_brightness_mode 1
  adb shell settings put secure night_display_activated 0
  adb shell settings put secure ui_night_mode 1
  echo "Modo resonancia desactivado."
}

status_resonancia() {
  echo "Estado actual (valores Android):"
  printf "  zen_mode: "
  adb shell settings get global zen_mode
  printf "  screen_brightness_mode: "
  adb shell settings get system screen_brightness_mode
  printf "  screen_brightness: "
  adb shell settings get system screen_brightness
  printf "  night_display_activated: "
  adb shell settings get secure night_display_activated
  printf "  ui_night_mode: "
  adb shell settings get secure ui_night_mode
}

install_profile() {
  echo "Instalando perfil resonancia directamente en la Xiaomi Pad 6..."
  set_resonancia_on
  status_resonancia
  echo "Instalación completada."
}

case "$MODE" in
  install)
    install_profile
    ;;
  on)
    set_resonancia_on
    ;;
  off)
    set_resonancia_off
    ;;
  status)
    status_resonancia
    ;;
  *)
    usage
    exit 1
    ;;
esac
