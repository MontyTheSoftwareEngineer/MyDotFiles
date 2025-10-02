#!/bin/bash

if [[ "$1" == "--toggle" ]]; then
  current=$(powerprofilesctl get)
  case "$current" in
    performance)
      powerprofilesctl set balanced
      ;;
    balanced)
      powerprofilesctl set power-saver
      ;;
    power-saver)
      powerprofilesctl set performance
      ;;
  esac
  exit 0
fi

profile=$(powerprofilesctl get)
case "$profile" in
  performance)
    icon="󱐋"
    label="P"
    ;;
  balanced)
    icon="󰾅"
    label="N"
    ;;
  power-saver)
    icon="🌱"
    label="E"
    ;;
  *)
    icon="❓"
    label="$profile"
    ;;
esac

echo "{\"text\": \"$icon $label\", \"tooltip\": \"Power profile: $profile\"}"

