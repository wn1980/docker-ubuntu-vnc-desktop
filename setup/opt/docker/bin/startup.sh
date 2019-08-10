#!/usr/bin/env bash

set -e

if [ -n "$VNC_PASSWORD" ]; then
	mkdir -p "$HOME/.vnc"
    echo -n "$VNC_PASSWORD" > $HOME/.vnc/password1
    x11vnc -storepasswd $(cat $HOME/.vnc/password1) $HOME/.vnc/password2
    chmod 444 $HOME/.vnc/password*
    sed -i 's/^command=x11vnc.*/& -rfbauth %(ENV_HOME)s\/\.vnc\/password2/' /opt/docker/supervisord.conf
    export VNC_PASSWORD=
fi

if [ -n "$RESOLUTION" ]; then
    sed -i "s/1024x768/$RESOLUTION/" /opt/docker/bin/xvfb.sh
fi

exec /opt/docker/bin/tini-$(uname -m) -- /usr/bin/supervisord -n -c /opt/docker/supervisord.conf
