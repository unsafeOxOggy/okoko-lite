#!/bin/sh
# okoko-lite - xfce4-terminal look: font and the terminal colors of kali-clean (xct).
# xfce4-terminal keeps its settings in xfconf, not in a file: i3 runs this at login
# (xfconf needs the session bus) and open windows update at once.
command -v xfconf-query >/dev/null || exit 0
set_() { # set_ <property> <type> <value>: update, or create when missing
    xfconf-query -c xfce4-terminal -p "$1" -s "$3" 2>/dev/null ||
        xfconf-query -c xfce4-terminal -p "$1" -n -t "$2" -s "$3"
}
set_ /font-use-system bool false
set_ /font-name string "JetBrainsMono Nerd Font 10"
set_ /misc-menubar-default bool false
set_ /misc-borders-default bool false
set_ /scrolling-bar string TERMINAL_SCROLLBAR_NONE
set_ /scrolling-lines uint 20000
set_ /misc-cursor-shape string TERMINAL_CURSOR_SHAPE_BLOCK
set_ /misc-confirm-close bool false
set_ /misc-bell bool false
set_ /background-mode string TERMINAL_BACKGROUND_SOLID
set_ /color-use-theme bool false
set_ /color-foreground string "#EAEAEA"
set_ /color-background string "#000000"
set_ /color-cursor-use-default bool false
set_ /color-cursor string "#EAEAEA"
set_ /color-cursor-foreground string "#000000"
set_ /color-bold-use-default bool true
# xct's alacritty palette (Tomorrow Night Bright): normal 0-7, bright 8-15
set_ /color-palette string "#000000;#D54E53;#B9CA4A;#E6C547;#7AA6DA;#C397D8;#70C0BA;#EAEAEA;#666666;#FF3334;#9EC400;#E7C547;#7AA6DA;#B77EE0;#54CED6;#FFFFFF"
