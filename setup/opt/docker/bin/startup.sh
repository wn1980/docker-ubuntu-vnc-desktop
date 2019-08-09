#!/usr/bin/env bash

#mkdir -p /var/run/sshd

#chown -R root:root /root
#mkdir -p /root/.config/pcmanfm/LXDE/
#cp /usr/share/doro-lxde-wallpapers/desktop-items-0.conf /root/.config/pcmanfm/LXDE/

if [ -n "$VNC_PASSWORD" ]; then
    echo -n "$VNC_PASSWORD" > $HOME/.password1
    x11vnc -storepasswd $(cat $HOME/.password1) $HOME/.password2
    chmod 444 $HOME/.password*
    sed -i 's/^command=x11vnc.*/& -rfbauth %(ENV_HOME)s\/.password2/' /opt/docker/supervisord.conf
    export VNC_PASSWORD=
fi

if [ -n "$RESOLUTION" ]; then
    sed -i "s/1024x768/$RESOLUTION/" /opt/docker/bin/xvfb.sh
fi

exec /opt/docker/bin/tini-$(uname -m) -- /usr/bin/supervisord -n -c /opt/docker/supervisord.conf
