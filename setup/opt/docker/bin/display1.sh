#!/bin/sh

#replace 1024x768 with: 1920x1080 | 1600x900 | 1280x720

exec /usr/bin/Xvfb :1 -screen 0 1024x768x16
