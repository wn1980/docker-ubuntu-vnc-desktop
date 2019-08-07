#!/usr/bin/env bash

set -e

# user tools
apt-get update && apt-get install -y \
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
    
apt-get update \
    && apt-get install -y --no-install-recommends --allow-unauthenticated \
        supervisor \
        openssh-server pwgen sudo vim-tiny \
        net-tools \
        lxde x11vnc xvfb \
        gtk2-engines-murrine ttf-ubuntu-font-family \
        firefox \
        nginx \
        python-pip python-dev build-essential \
        mesa-utils libgl1-mesa-dri \
        gnome-themes-standard gtk2-engines-pixbuf gtk2-engines-murrine pinta arc-theme \
        dbus-x11 x11-utils \
        terminator \
        && rm -rf /var/lib/apt/lists/*

cp /usr/share/applications/terminator.desktop /root/Desktop
