#!/bin/bash

amixer -q sset Master 5%+
notify-send "Volume Increased" "$(awk -F'[][]' '/dB/ { print $2 }' <(amixer sget Master))"

