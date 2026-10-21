#!/bin/bash
# okoko-lite installer. Run from the repo folder as your normal user (not root).
set -e
cd "$(dirname "$0")"
[ "$(id -u)" = 0 ] && { echo "run as your normal user, not root"; exit 1; }

sudo apt update
sudo apt install -y i3 i3blocks picom xfce4-terminal rofi feh dunst flameshot thunar \
    xfce4-screensaver papirus-icon-theme unclutter libnotify-bin xfconf \
    spice-vdagent network-manager-applet wget

# JetBrainsMono Nerd Font (icons of the bar, rofi and the terminal), checksum checked
if ! fc-list | grep -qi "JetBrainsMono Nerd Font"; then
    font=$(mktemp)
    wget -q -O "$font" \
        https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.tar.xz
    echo "ef552a3e638f25125c6ad4c51176a6adcdce295ab1d2ffacf0db060caf8c1582  $font" | sha256sum -c -
    mkdir -p ~/.local/share/fonts/JetBrainsMonoNerd
    tar -xf "$font" -C ~/.local/share/fonts/JetBrainsMonoNerd --wildcards '*.ttf'
    rm "$font"
    fc-cache -f
fi

# copy the configs (an existing file is kept as file.~1~)
for d in i3 rofi picom dunst; do
    mkdir -p ~/.config/$d
    cp -r --backup=numbered .config/$d/. ~/.config/$d/
done
chmod +x ~/.config/rofi/powermenu.sh ~/.config/i3/terminal.sh ~/.config/i3/wallpaper.sh

# display scale 1.1 (Xft.dpi), read at login
cp --backup=numbered .Xresources ~/.Xresources

mkdir -p ~/.wallpaper
cp .wallpaper/* ~/.wallpaper/
# same format as feh writes it (absolute path in single quotes): wallpaper.sh reads it back
printf "#!/bin/sh\nfeh --no-fehbg --bg-fill '%s'\n" "$HOME/.wallpaper/01-e8.jpg" > ~/.fehbg
chmod +x ~/.fehbg

echo "Done! Log out, pick i3 on the login screen and log back in."
echo "Super+Enter: terminal - Super+Space: apps - Super+q: next wallpaper - Super+Shift+Escape: power menu"
