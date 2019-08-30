#!/usr/bin/env bash

set -e
    
apt-get update && apt-get install --no-install-recommends --allow-unauthenticated -y \
    software-properties-common \
    build-essential \
    curl \
    wget \
	supervisor \
    icewm \
    jwm \
    x11vnc \
    xvfb \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    mesa-utils \
    dbus-x11 \
    x11-utils \
    x11-apps \
    xfe \
    xterm \
    xauth \
    xinit \
    geany \
    nano \
    htop \
    usbutils \
    inetutils-ping \
    net-tools \
    netatalk \
    alsa \
    alsa-utils \
    alsa-tools \
    ffmpeg \
    audacity \
    portaudio19-dev \
    python-pip \
    python3-pip \
    keyboard-configuration \
    ttf-ubuntu-font-family \
    xfonts-base \
    xfonts-thai \
    git-cola \
    tk \
    kazam \
    && rm -rf /var/lib/apt/lists/*
