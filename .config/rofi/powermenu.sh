#!/usr/bin/env bash
# okoko-lite - power menu (rofi)
choice=$(printf 'lock\nlogout\nreboot\nshutdown\n' | rofi -dmenu -i -p "power")
case "$choice" in
    lock)     xflock4 ;;
    logout)   i3-msg exit ;;
    reboot)   systemctl reboot ;;
    shutdown) systemctl poweroff ;;
esac
