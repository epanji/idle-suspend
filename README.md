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
Add this line to crontab and save it.

```sh
* * * * * idle-suspend &>/dev/null
```

## License

Public Domain
