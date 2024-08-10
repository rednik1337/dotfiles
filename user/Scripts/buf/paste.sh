#!/bin/sh


active_window=$(hyprctl activewindow | awk '/class:/ {print $2}')

if [[ "$active_window" == "footclient" ]] || [[ "$active_window" == "dev.zed.Zed" ]]; then
    wtype -M ctrl -M shift v -m ctrl -m shift
else
    wtype -M ctrl v -m ctrl
fi
