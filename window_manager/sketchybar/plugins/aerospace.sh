#!/bin/sh

source ./colors.sh

PADDING_LEFT=0
PADDING_RIGHT=0

case "$1" in
  1) PADDING_LEFT=8
  ;;
  10) PADDING_RIGHT=8
esac

LABEL="$1"
case "$1" in
  1) LABEL=""
  ;;
  2) LABEL=""
  ;;
  3) LABEL=""
  ;;
  4) LABEL=""
  ;;
  5) LABEL=""
esac

options=(
  label="${LABEL}"
  click_script="aerospace workspace $1"
  padding_left="${PADDING_LEFT}"
  padding_right="${PADDING_RIGHT}"
)

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" label.color=$TEXT_SELECTED_COLOR "${options[@]}"
else
  sketchybar --set "$NAME" label.color=$TEXT_COLOR "${options[@]}"
fi
