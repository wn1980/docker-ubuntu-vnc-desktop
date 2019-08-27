#!/usr/bin/env bash

if [ $(uname -m) == 'x86_64' ] 
then
	tag=
elif [ $(uname -m) == 'aarch64' ] 
then 
	tag=:rpi
else
	echo 'not matched platform!'
	exit 0
fi

docker system prune -f

docker pull wn1980/w-ros${tag}

./run.sh
