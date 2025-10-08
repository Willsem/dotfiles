#!/bin/sh

ICON_BATTERY1=""
ICON_BATTERY2=""
ICON_BATTERY3=""
ICON_BATTERY4=""
ICON_BATTERY5=""
ICON_CHARGING=""

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON=$ICON_BATTERY1
  ;;
  [6-8][0-9]) ICON=$ICON_BATTERY2
  ;;
  [3-5][0-9]) ICON=$ICON_BATTERY3
  ;;
  [1-2][0-9]) ICON=$ICON_BATTERY4
  ;;
  *) ICON=$ICON_BATTERY5
esac

if [[ "$CHARGING" != "" ]]; then
  ICON=$ICON_CHARGING
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
