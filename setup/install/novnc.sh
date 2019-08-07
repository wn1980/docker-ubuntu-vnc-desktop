#!/usr/bin/env bash

set -e

apt-get update && apt-get install --no-install-recommends  -y \
    software-properties-common \
    curl \
    wget 
    #&& sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list" \
    #&& curl -SL http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key | apt-key add - \
    #&& add-apt-repository ppa:fcwu-tw/ppa 

### Install noVNC - HTML5 based VNC viewer (noVNC v1.1.0 & websockify v0.8.0)
export NO_VNC_HOME=/opt/noVNC
mkdir -p $NO_VNC_HOME/utils/websockify
wget -qO- https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME
wget -qO- https://github.com/novnc/websockify/archive/v0.8.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify
chmod +x -v $NO_VNC_HOME/utils/*.sh && \
	ln -s $NO_VNC_HOME/vnc.html $NO_VNC_HOME/index.html
