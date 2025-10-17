#!/bin/bash
# Power profile → wallpaper switcher for Waybar

# --- config ---
iDIR="$HOME/.config/swaync/images/ja.png"
wallDIR="$HOME/Pictures/wallpapers"
SCRIPTSDIR="$HOME/.config/hypr/scripts"
FPS=30
TYPE="any"
DURATION=1
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"
focused_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

# --- toggle mode if requested ---
if [[ "$1" == "--toggle" ]]; then
  current=$(powerprofilesctl get)
  case "$current" in
    performance) next="balanced" ;;
    balanced) next="power-saver" ;;
    power-saver) next="performance" ;;
    *) next="balanced" ;;
  esac
  powerprofilesctl set "$next"
  exec "$0"
fi

# --- detect profile ---
profile=$(powerprofilesctl get)

# --- icon/label/wallpaper ---
icon="❓"
label="$profile"
wallpaper=""

case "$profile" in
  performance)
    icon="🏎️"
    label="Sport"
    wallpaper="$wallDIR/tesla_sport.png"
    notify-send -i $iDIR "SPORT MODE ACTIVATED"
    ;;
  balanced)
    icon="🚗"
    label="Normal"
    wallpaper="$wallDIR/tesla_normal.png"
    notify-send -i $iDIR "NORMAL MODE ACTIVATED"
    ;;
  power-saver)
    icon="🌱"
    label="Eco"
    wallpaper="$wallDIR/tesla_eco.png"
    notify-send -i $iDIR "ECO MODE ACTIVATED"
    ;;
esac

# --- wallpaper apply ---
if [[ -n "$wallpaper" && -f "$wallpaper" ]]; then
  {
    pkill mpvpaper 2>/dev/null
    pkill swaybg 2>/dev/null
    pkill hyprpaper 2>/dev/null

    if ! pgrep -x "swww-daemon" >/dev/null; then
      swww-daemon --format xrgb &
      sleep 0.5
    fi

    swww img -o "$focused_monitor" "$wallpaper" $SWWW_PARAMS
    "$SCRIPTSDIR/WallustSwww.sh"
    sleep 2
  } >/dev/null 2>&1
fi

# --- JSON output ---
echo "{\"text\": \"$icon $label\", \"tooltip\": \"Power profile: $profile\"}"

