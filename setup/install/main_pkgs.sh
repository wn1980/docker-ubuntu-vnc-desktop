#!/usr/bin/env bash

set -e
    
apt-get update && apt-get install --no-install-recommends --allow-unauthenticated -y \
	supervisor \
	pwgen \
	sudo \
	vim-tiny \
    net-tools \
    lxde \
    x11vnc \
    xvfb \
    gtk2-engines-murrine \
    ttf-ubuntu-font-family \
    firefox \
   	#openssh-server \
    #nginx \
    #python-pip python-dev \
    
    build-essential \
    mesa-utils \
    libgl1-mesa-dri \
    gnome-themes-standard \
    gtk2-engines-pixbuf \
    gtk2-engines-murrine \
    pinta \
    arc-theme \
    dbus-x11 \
    x11-utils \
    
# user tools
    terminator \
    gedit \
    okular \
    nano \
    htop \
    lsb-release \
    usbutils \
    inetutils-ping \
    keyboard-configuration \
    xfonts-thai \
    && rm -rf /var/lib/apt/lists/*

cp /usr/share/applications/terminator.desktop /root/Desktop
