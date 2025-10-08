#!/bin/sh

LABEL=""
CURRENT_LANGUAGE="$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | awk -F' ' '{print $4}' | sed 's/.$//')"
case "${CURRENT_LANGUAGE}" in
  Russian) LABEL="RU"
  ;;
  ABC) LABEL="EN"
esac

options=(
  icon.drawing=off
  update_freq=10
  label="${LABEL}"
)

sketchybar --set $NAME "${options[@]}"
