#!/usr/bin/env bash

set -e
    
apt-get update && apt-get install --no-install-recommends --allow-unauthenticated -y \
	supervisor \
	pwgen \
	sudo \
	vim-tiny \
    net-tools \
    lxde \
    icewm \
    jwm \
    x11vnc \
    xvfb \
    gtk2-engines-murrine \
    ttf-ubuntu-font-family \
    firefox \
    build-essential \
    mesa-utils \
    libgl1-mesa-dri \
    gnome-themes-standard \
    gtk2-engines-pixbuf \
    gtk2-engines-murrine \
    dbus-x11 \
    x11-utils \
    xterm \
    terminator \
    pluma \
    nano \
    htop \
    lsb-release \
    usbutils \
    inetutils-ping \
    keyboard-configuration \
    xfonts-thai \
    && rm -rf /var/lib/apt/lists/*

cp /usr/share/applications/terminator.desktop /root/Desktop

   	#openssh-server \
    #nginx \
    #python-pip python-dev \
    #arc-theme \
    #okular \
    #pinta \
