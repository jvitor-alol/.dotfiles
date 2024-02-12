#!/bin/sh
# Symlink to /etc/python/pythonrc

if  [ ! -d "/etc/python" ]; then
	sudo mkdir /etc/python/
fi
sudo ln -s $XDG_CONFIG_HOME/python/pythonrc /etc/python/pythonrc
echo "OK"
