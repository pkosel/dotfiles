# start x server
if [ "$(tty)" = "/dev/tty1" ]
then
  exec startx
fi

