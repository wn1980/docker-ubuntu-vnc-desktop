#!/usr/bin/env bash

set -e

#dynamically add user
#USER=${USER:-root}
#PASSWORD=$VNC_PASSWORD
#HOME=/root

#if [ "$USER" != "root" ]; then
#	if [ $(getent passwd $USER) ] ; then
#		echo user $USER exists
#	else
#		echo "* enable custom user: $USER"
#		useradd --create-home --shell /bin/bash --user-group --groups adm,sudo $USER
#		if [ -z "$PASSWORD" ]; then
#			echo "  set default password to \"ubuntu\""
#			PASSWORD=ubuntu
#		fi
#		HOME=/home/$USER
#		echo "$USER:$PASSWORD" | chpasswd
#		[ -d "/dev/snd" ] && chgrp -R adm /dev/snd
#	fi
#fi

# set VNC password
if [ -n "$VNC_PASSWORD" ]; then
	mkdir -p "$HOME/.vnc"
    echo -n "$VNC_PASSWORD" > $HOME/.vnc/password1
    x11vnc -storepasswd $(cat $HOME/.vnc/password1) $HOME/.vnc/password2
    chmod 444 $HOME/.vnc/password*
    sed -i 's/^command=x11vnc.*/& -rfbauth %(ENV_HOME)s\/\.vnc\/password2/' /opt/docker/custom-supervisord.conf
    export VNC_PASSWORD=
fi

# set VNC resolution
if [ -n "$VNC_RESOLUTION" ]; then
    sed -i "s/1024x768/$VNC_RESOLUTION/" /opt/docker/bin/display1.sh
else
	export VNC_RESOLUTION=1024x768
fi

# Chrome browser
/opt/docker/bin/chrome-init.sh

# nginx web server
#/usr/sbin/nginx

# the rest of alls
exec /opt/docker/bin/tini-$(uname -m) -- /usr/bin/supervisord -n -c /opt/docker/custom-supervisord.conf
