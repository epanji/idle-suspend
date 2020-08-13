#!/bin/bash

# Author: Panji Kusuma <epanji at gmail dot com>
#
# Temporary usage:
# watch -n 1 idle-suspend
#
# Permanently add to crontab:
# crontab -e
# * * * * * idle-suspend &>/dev/null

SECONDS=300

PREFIX=/usr
BINARY_NAME=idle-seconds
BINARY=$PREFIX/bin/$BINARY_NAME

if [ -x "$BINARY" ]; then
    IDLE_SECONDS=`$BINARY`
    if [ "$IDLE_SECONDS" -ge "$SECONDS" ]; then
        dbus-send --system --print-reply --dest='org.freedesktop.UPower' /org/freedesktop/UPower org.freedesktop.UPower.Suspend
    else
        echo $(expr $SECONDS - $IDLE_SECONDS) "seconds before suspended."
    fi
else
    echo "Binary $BINARY_NAME can not be found."
fi

exit 0
