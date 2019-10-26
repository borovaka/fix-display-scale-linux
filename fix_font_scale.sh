#!/bin/bash

SCALE_FACTOR=1.4

sleep 3
export DISPLAY=:1
RESOLUTION=$(xrandr --listmonitors | cut -d' ' -f4 | cut -d'/' -f1 | sort -nr | head -n1)

if [[ "$RESOLUTION" -gt "1920" ]]; then 
	bash -c "export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus && gsettings set org.gnome.desktop.interface text-scaling-factor $SCALE_FACTOR"
else
	bash -c "export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus && gsettings set org.gnome.desktop.interface text-scaling-factor 1"
fi

