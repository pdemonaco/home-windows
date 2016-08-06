#!/bin/sh
# If Xresources is present, load it
[[ -f ~/.Xresources ]] && xrdb ~merge ~/.Xresources

# Trivial setting to enable video offloading
# See https://wiki.archlinux.org/index.php/PRIME
xrandr --setprovideroffloadsink radeon Intel

# Turn on numlock
numlockx &

# Start X with consolekit
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
