#!/usr/bin/env bash

set -e

# set VNC password
if [ -n "$VNC_PASSWORD" ]; then
	mkdir -p "$HOME/.vnc"
    echo -n "$VNC_PASSWORD" > $HOME/.vnc/password1
    x11vnc -storepasswd $(cat $HOME/.vnc/password1) $HOME/.vnc/password2
    chmod 444 $HOME/.vnc/password*
    vnc_str="-rfbauth ${HOME}/.vnc/password2"
    export VNC_PASSWORD=
else
	vnc_str=
fi

cat > "/opt/docker/bin/vnc.sh" <<EOF
#!/usr/bin/env bash

set -e

x11vnc -display :1 -xkb -forever -shared -repeat -rfbport 5901 ${vnc_str}
EOF

chmod a+x /opt/docker/bin/vnc.sh

# set VNC resolution
if [ ! -n "$VNC_RESOLUTION" ]; then
	export VNC_RESOLUTION=1024x768
fi

cat > "/opt/docker/bin/display1.sh" <<EOF
#!/usr/bin/env bash

set -e

Xvfb :1 -screen 0 ${VNC_RESOLUTION}x24
EOF

chmod a+x /opt/docker/bin/display1.sh

# Chrome browser
/opt/docker/bin/chrome-init.sh

# the rest of alls
exec /opt/docker/bin/tini-$(uname -m) -- /usr/bin/supervisord -n -c /opt/docker/custom-supervisord.conf
