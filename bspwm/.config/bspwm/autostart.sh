#! /bin/sh

pkill sxhkd
pkill polybar
sleep 0.1

xrdb -merge ~/.cache/wal/colors.Xresources

sxhkd &
polybar topbar &

xsetroot -cursor_name left_ptr

feh --bg-fill ~/Pictures/Wallpapers/michael-durana-sYegwYtIqJg-unsplash.jpg

