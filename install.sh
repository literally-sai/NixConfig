#!/usr/bin/env bash
SOURCE_DIR="./home/wallpapers/"
DEST_DIR="$HOME/.config/img/"

mkdir -p "$DEST_DIR"

cp "${SOURCE_DIR}rofi.png" "${DEST_DIR}"
cp "${SOURCE_DIR}wallpaper.jpg" "${DEST_DIR}"
