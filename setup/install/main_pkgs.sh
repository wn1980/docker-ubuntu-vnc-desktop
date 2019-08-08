#!/usr/bin/env bash

set -e
    
apt-get update && apt-get install --no-install-recommends --allow-unauthenticated -y \
	supervisor \
    icewm \
    jwm \
    x11vnc \
    xvfb \
    ttf-ubuntu-font-family \
    firefox \
    build-essential \
    mesa-utils \
    libgl1-mesa-dri \
    dbus-x11 \
    x11-utils \
    xterm \
    pluma \
    nano \
    htop \
    lsb-release \
    usbutils \
    inetutils-ping \
    keyboard-configuration \
    xfonts-thai \
    && rm -rf /var/lib/apt/lists/*

#cp /usr/share/applications/terminator.desktop /root/Desktop

   	#openssh-server \
    #nginx \
    #python-pip python-dev \
    #arc-theme \
    #okular \
    #pinta \
    #gtk2-engines-murrine \
    #gtk2-engines-pixbuf \
    #gtk2-engines-murrine \
    #gnome-themes-standard \
    #terminator \
    #net-tools \
    #lxde \
    #pwgen \
    #vim-tiny \
