#!/bin/sh

options=(
  icon.drawing=off
  update_freq=5
  label="$(LC_ALL=ru_RU.UTF-8 date '+%a, %d %B %H:%M')"
)

sketchybar --set $NAME "${options[@]}"
