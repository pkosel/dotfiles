export EDITOR=nvim

# automatically start x server at login
if [ "$(tty)" = "/dev/tty1" ]
then
	exec startx
fi

