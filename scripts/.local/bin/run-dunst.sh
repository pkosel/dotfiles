#!/bin/sh

# colors
bg=$(xrdb ~/.config/xorg/Xresources -query all | grep background | awk '{print $2}')
fg=$(xrdb ~/.config/xorg/Xresources -query all | grep foreground | awk '{print $2}')

dunst \
  -geom "240x46-6+46" \
  -sep_height 0 \
  -padding 22 \
  -horizontal_padding 22 \
  -fn "JetBrains Mono 8" \
  -format "<b>%s</b>\n%b" \
  -key "ctrl+space" \
  -all_key "ctrl+shift+space" \
  -lb "$bg" \
  -lf "$fg" \
  -nb "$bg" \
  -nf "$fg" \
  -cb "$bg" \
  -cf "$fg" \

