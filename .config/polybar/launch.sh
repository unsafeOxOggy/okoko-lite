#!/usr/bin/env bash
# okoko-lite - start the four polybar islands on every monitor.
#   launch.sh          (re)start the bars
#   launch.sh --watch  stay running and restart them when the screen size changes
#                      (VM window resized, fullscreen...)

BARS="icons workspaces title status"

launch() {
    pkill -x polybar
    while pgrep -x polybar >/dev/null; do sleep 0.2; done
    for m in $(polybar --list-monitors | cut -d: -f1); do
        for b in $BARS; do
            MONITOR=$m polybar -q "$b" -c ~/.config/polybar/config.ini >/dev/null 2>&1 &
        done
    done
}

if [ "$1" = --watch ]; then
    while i3-msg -t get_version >/dev/null 2>&1; do    # ends with the i3 session
        while read -r _; do
            while read -r -t 1 _; do :; done   # wait for the burst of events to end
            launch
            ~/.fehbg                            # rescale the wallpaper too
        done < <(i3-msg -t subscribe -m '["output"]')
        sleep 1                                 # i3 restarted: subscribe again
    done
else
    launch
fi
