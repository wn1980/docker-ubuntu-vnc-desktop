#!/usr/bin/env bash

set -e
    
apt-get update && apt-get install --no-install-recommends --allow-unauthenticated -y \
    software-properties-common \
    curl \
    wget \
	supervisor \
    icewm \
    jwm \
    x11vnc \
    xvfb \
    ttf-ubuntu-font-family \
    build-essential \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    mesa-utils \
    dbus-x11 \
    x11-utils \
    x11-apps \
    xterm \
    xauth \
    xinit \
    geany \
    nano \
    htop \
    usbutils \
    inetutils-ping \
    net-tools \
    alsa \
    alsa-utils \
    audacity \
    portaudio19-dev \
    python-pip \
    python3-pip \
    keyboard-configuration \
    xfonts-base \
    xfonts-thai \
    && rm -rf /var/lib/apt/lists/*

#cp /usr/share/applications/terminator.desktop /root/Desktop

   	#openssh-server \
    #nginx \
    #arc-theme \
    #okular \
    #pinta \
    #gtk2-engines-murrine \
    #gtk2-engines-pixbuf \
    #gtk2-engines-murrine \
    #gnome-themes-standard \
    #terminator \
    #lxde \
    #pwgen \
    #vim-tiny \
