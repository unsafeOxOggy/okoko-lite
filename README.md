# okoko-lite

The look of [kali-clean](https://github.com/xct/kali-clean) by xct (i3bar + i3blocks,
his colors everywhere) with the layout of [okoko](https://github.com/unsafeOxOggy/okoko),
in plain config files: no theme engine, no CLI, one installer that copies the files.

Colors (from xct's configs): background `#1C1D2B`, surface `#282A3E`, focused window
`#82C8FF`, other windows `#333333`, text `#E6FFF5`, VPN `#3BB92D`, urgent `#900000`;
terminal: his alacritty palette (Tomorrow Night Bright) on `#000000`.

## Installation

```
git clone https://github.com/unsafeOxOggy/okoko-lite.git
cd okoko-lite
./install.sh
```

Run it as your normal user (it asks for sudo). Then log out, pick **i3** on the
login screen and log back in. Existing configs are kept as `file.~1~`.

## Keys

| Key                   | Action                    |
|-----------------------|---------------------------|
| Super+Enter           | terminal (xfce4-terminal) |
| Super+q               | next wallpaper            |
| Super+Space           | applications (rofi)       |
| Super+Tab             | switch window             |
| Super+w               | close window              |
| Super+1..9            | workspace                 |
| Super+Shift+1..9      | move window to workspace  |
| Super+f               | fullscreen                |
| Super+Shift+Space     | floating                  |
| Super+r               | resize mode               |
| Super+Escape          | lock (Kali screen locker) |
| Super+Shift+Escape    | power menu                |
| Print                 | screenshot (flameshot)    |
| Super+Shift+r         | restart i3                |

## Files

```
.config/i3/config            i3 (colors, gaps, keys, bar, autostart)
.config/i3/i3blocks.conf     bar blocks: cpu, ram, disk, traffic, tun0 ip, date
.config/rofi/config.rasi     launcher theme
.config/rofi/powermenu.sh    lock / logout / reboot / shutdown
.config/i3/terminal.sh       terminal font + colors (xfce4-terminal keeps them in xfconf)
.config/i3/wallpaper.sh      next wallpaper (Super+q)
.config/picom/picom.conf     shadows, rounded corners
.config/dunst/dunstrc        notifications
.wallpaper/                  7 wallpapers (set by ~/.fehbg)
.Xresources                  display scale 1.1 (Xft.dpi 106), edit it to change the size
```

To change a color, edit it in these files (same hex codes everywhere).

## Wallpapers

Six geometric wallpapers in xct's blues, drawn with okoko's generator
(`lib/wallgen.py`): exact figures, computed projections, never stretched.

| File | Figure |
|---|---|
| `01-e8.jpg` | Gosset 4_21 polytope (E8 roots, 240 vertices, 6720 edges), Coxeter plane |
| `02-h4.jpg` | 600-cell, H4 Coxeter plane (30-gon Petrie polygon) |
| `03-stereo.jpg` | 24-cell, stereographic projection (edges become arcs) |
| `04-hopf.jpg` | Hopf fibration (Villarceau circles on nested tori) |
| `05-penrose.jpg` | Penrose P3 tiling from de Bruijn's pentagrid |
| `06-kali.jpg` | 5-cube (penteract) and the Kali shell prompt |

Plus `okoko.jpg`, the grayscale illustration of the first okoko-lite.

## Why xfce4-terminal

In a VM with 3D acceleration off, kitty (OpenGL) renders on the CPU: about 74 ms from
key press to screen. xfce4-terminal needs no OpenGL: about 25 ms (measured).

## Not included (see okoko)

Theme switching, clipboard history, dropdown terminal, zsh/starship setup,
VM display auto-fit (use [kvm-autofit](https://github.com/unsafeOxOggy/kvm-autofit)).

## Credits

Colors and bar after kali-clean by xct. Icons: Nerd Fonts. Wallpapers 01-06: drawn by
okoko's `lib/wallgen.py` (MIT, same author).
