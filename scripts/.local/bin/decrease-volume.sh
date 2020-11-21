#!/bin/bash

amixer -q sset Master 5%-
notify-send "Volume Decreased" "$(awk -F'[][]' '/dB/ { print $2 }' <(amixer sget Master))"

