#!/bin/bash

# Terminate already running bar instances
killall -q active-window.sh
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x active-window.sh >/dev/null; do sleep 1; done
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
$HOME/.config/polybar/active-window.sh &
polybar mybar &

