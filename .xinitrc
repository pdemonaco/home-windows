#!/bin/sh
# Start dropbox
dropbox-cli start

# Start Gnome-keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export GNOME_KEYRING_PID
export GNOME_KEYRING_SOCKET
export SSH_AUTH_SOCK
export GPG_AGENT_INFO

# If Xresources is present, load it
[[ -f ~/.Xresources ]] && xrdb ~merge ~/.Xresources

# Trivial setting to enable video offloading
# See https://wiki.archlinux.org/index.php/PRIME
xrandr --setprovideroffloadsink radeon Intel

# Turn on numlock
numlockx &

# Start X with consolekit
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
