# Autostart X server

if [ "$(tty)" = "/dev/tty1" ]; then
  exec startx ~/.config/xorg/xinitrc
fi

