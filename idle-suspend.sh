#!/bin/sh

# Author: Panji Kusuma <epanji at gmail dot com>
#
# Temporary usage:
# watch -n 1 idle-suspend
#
# Permanently add to crontab:
# crontab -e
# * * * * * env - DISPLAY=:0.0 /usr/bin/idle-suspend &> /dev/null

SECONDS=300

if [ -n $1 ]; then
    REGEX='^[0-9]+$'
    if [[ $1 =~ $REGEX ]]; then
        SECONDS=$1
    fi
fi

PREFIX=/usr
BINARY_NAME=idle-seconds
BINARY=$PREFIX/bin/$BINARY_NAME

AWK_ACTION='{
  if ($4 ~ /days/) {
    split($4,d,"days");
    print d[1]*86400;
  } else if ( $4 ~ /:|s/) {
    if ($4 ~/s/) {
      sub(/s/,"",$4);
      split($4,s,".");
      print s[1];
    } else if ( $4 ~/m/) {
      split($4,m,":");
      print (m[1]*60+m[2])*60
    } else {
      split($4,m,":");
      print m[1]*60+m[2];
    }
  } else {
    print $4;
  }
}'

if [ -x $BINARY ]; then
    IDLE_SECONDS=$($BINARY)
    if [ $? -ne 0 ]; then
        IDLE_SECONDS=$(w -sh | awk "$AWK_ACTION" | sort -n | head -n 1)
    fi
    if [ $IDLE_SECONDS -ge $SECONDS ]; then
        dbus-send --system --print-reply --dest='org.freedesktop.UPower' /org/freedesktop/UPower org.freedesktop.UPower.Suspend
    else
        echo $(expr $SECONDS - $IDLE_SECONDS) "seconds before suspended."
    fi
else
    echo "Binary" $BINARY_NAME "can not be found."
fi

exit 0
