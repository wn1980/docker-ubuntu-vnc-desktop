#!/usr/bin/env bash

set -e

if [ -z "$1" ]; then
	echo -e "\n usage: $0 /dev/sd* \n fdisk -l # to check"
	exit 1
fi

name=ubuntu18.04-docker-rpi-`date +%d%m%y`.img.gz

dd bs=4M if="$1" status=progress | gzip > $name
chmod 666 $name
