#!/bin/bash

THEME_DIR="$HOME/.config/kitty/profiles"
CURRENT_LINK="$HOME/.config/kitty/current.conf"

case "$1" in
  --light)
    THEME="light.conf"
    ;;
  --dark)
    THEME="dark.conf"
    ;;
  --clear)
    THEME="clear.conf"
    ;;
  *)
    echo "Usage: theme --light | --dark | --clear"
    exit 1
    ;;
  esac

if [[ ! -f "$THEME_DIR/$THEME" ]]; then
  echo "Error: $THEME not found in $THEME_DIR"
  exit 1
fi

ln -sf "$THEME_DIR/$THEME" "$CURRENT_LINK"

kitty @ set-colors -a "$CURRENT_LINK"

echo "Switched to theme: $THEME"
