#!/bin/sh

wal -i ~/Pictures/Wallpapers/ -n
killall swaybg
swaybg -m fill -i $(cat /home/rednik/.cache/wal/wal) &
hyprctl reload

