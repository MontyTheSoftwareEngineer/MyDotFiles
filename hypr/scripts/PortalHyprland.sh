#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# For manually starting xdg-desktop-portal-hyprland
#!/bin/bash

# Wait to ensure dbus-update-activation-environment is run
sleep 3

# Kill any possibly broken portal processes
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal

sleep 1

# Restart hyprland-specific portal
if [ -f /usr/lib/xdg-desktop-portal-hyprland ]; then
    /usr/lib/xdg-desktop-portal-hyprland &
elif [ -f /usr/libexec/xdg-desktop-portal-hyprland ]; then
    /usr/libexec/xdg-desktop-portal-hyprland &
fi

sleep 2

# Restart main portal
if [ -f /usr/lib/xdg-desktop-portal ]; then
    /usr/lib/xdg-desktop-portal &
elif [ -f /usr/libexec/xdg-desktop-portal ]; then
    /usr/libexec/xdg-desktop-portal &
fi

