#!/bin/sh

pkill sxhkd
pkill polybar
sleep 0.1

xrdb -merge ~/.cache/wal/colors.Xresources

sxhkd &
polybar topbar &

setxkbmap -model pc105 -layout de
xsetroot -cursor_name left_ptr

feh --bg-fill ~/Pictures/Wallpapers/48954138922_8bd7c544b4_6k.jpg

