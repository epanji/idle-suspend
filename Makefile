#!/bin/sh

# Author: Panji Kusuma <epanji at gmail dot com>
#
# Temporary usage:
# watch -n 1 idle-suspend
#
# Permanently add to crontab:
# crontab -e
# * * * * * env - DISPLAY=:0.0 /usr/bin/idle-suspend &> /dev/null

PREFIX=/usr
BINARY_NAME=idle-seconds
SCRIPT_NAME=idle-suspend

BINARY_DIR=$(PREFIX)/bin
FLAGS=-lX11 -lXext -lXss

default::
	# make [ build | clean | install | uninstall ]

build::
	gcc $(BINARY_NAME).c -o $(BINARY_NAME) $(FLAGS)
	cp $(SCRIPT_NAME).sh $(SCRIPT_NAME)

clean::
	rm $(BINARY_NAME)
	rm $(SCRIPT_NAME)

install::
	install -m 755 $(BINARY_NAME) $(BINARY_DIR)
	install -m 755 $(SCRIPT_NAME) $(BINARY_DIR)

uninstall::
	rm $(BINARY_DIR)/$(BINARY_NAME)
	rm $(BINARY_DIR)/$(SCRIPT_NAME)
