#!/bin/sh
# okoko-lite - next wallpaper from ~/.wallpaper (Super+q). feh writes ~/.fehbg, so the
# choice survives a restart.
cur=$(grep -o "'[^']*'" "$HOME/.fehbg" 2>/dev/null | tail -1 | tr -d "'")
first="" next="" seen=0
for f in "$HOME"/.wallpaper/*.png "$HOME"/.wallpaper/*.jpg; do
    [ -f "$f" ] || continue
    [ -n "$first" ] || first=$f
    if [ "$seen" = 1 ]; then next=$f; break; fi
    [ "$f" = "$cur" ] && seen=1
done
[ -n "${next:-$first}" ] && feh --bg-fill "${next:-$first}"
