# okoko-lite

The look of [okoko](https://github.com/unsafeOxOggy/okoko) (dark green theme) with
the bar of [kali-clean](https://github.com/xct/kali-clean) by xct (i3bar + i3blocks),
in plain config files: no theme engine, no CLI, one installer that copies the files.

Palette: https://colorhunt.co/palette/091413285a48408a71b0e4cc

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
| Super+Enter           | terminal (kitty)          |
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
.config/kitty/kitty.conf     terminal + colors
.config/picom/picom.conf     shadows, rounded corners
.config/dunst/dunstrc        notifications
.wallpaper/okoko.jpg         wallpaper (set by ~/.fehbg)
```

To change a color, edit it in these files (same hex codes everywhere).

## Not included (see okoko)

Theme switching, clipboard history, dropdown terminal, zsh/starship setup,
VM display auto-fit (use [kvm-autofit](https://github.com/unsafeOxOggy/kvm-autofit)).

## Credits

Bar after kali-clean by xct. Icons: Nerd Fonts.
