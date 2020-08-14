# IDLE-SUSPEND

Command line application to get X11 idle time and to suspending OS via send-dbus.
Ensure user have authority on org.freedesktop.upower.policy otherwise suspend won't work.

Author: _Panji Kusuma <epanji@gmail.com>_

## Installation

Run these commands from source directory.

```sh
make build
```

```sh
sudo make install
```

## Usages

Use _watch_ for temporary activation.

```sh
watch -n 1 idle-suspend
```

Use _crontab_ for permanent activation.

```sh
crontab -e
```
For user display _:0.0_, add this line and save it.

```sh
* * * * * env - DISPLAY=:0.0 /usr/bin/idle-suspend &> /dev/null
```

## License

Public Domain
