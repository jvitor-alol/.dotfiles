#!/bin/sh
# Symlink to /etc/python/pythonrc

if  [ ! -f "/etc/python/pythonrc" ]; then
	sudo mkdir /etc/python/
	sudo ln -s $XDG_CONFIG_HOME/python/pythonrc /etc/python/pythonrc
	echo "Link created"
else
	echo "Link exists already"
fi
