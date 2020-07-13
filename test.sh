#!/bin/bash

# Overlays neofetch stats on a blurred lock screen

# Define image locations
FOLDER=`dirname "$BASH_SOURCE"`
ICON=/tmp/lock.png
TMPBG=/tmp/screen.png

# Makes the neofetch, and scrots it (delay there for proccesing, change it to your pc's speed)

# urxvt +th -e sh -c "i3-msg floating enable > /dev/zero;neofetch --w3m ~/Wallpaper/lock-icon/129771.jpg;scrot -o -u -d 4 /tmp/lock.png;sleep 2"&sleep &
urxvt -depth 0 -bg "#141c21" -e sh -c "i3-msg floating enable > /dev/zero;neofetch --w3m ~/Wallpaper/lock-icon/129771.jpg;scrot -o -u /tmp/lock.png;sleep 2"&sleep 3 &

# takes a screenshot
scrot -o /tmp/screen.png

# blurs it and overlays 
convert $TMPBG -blur 0x10 $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG

# actually locks it
i3lock -u -i $TMPBG
