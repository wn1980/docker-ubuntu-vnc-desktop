#!/usr/bin/env bash

p1080=1920x1080
p720=1280x720
p169=1600x900

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

if [[ -f "~/rosuser_home" ]]
then
	mkdir -p "~/rosuser_home"
	chmod -Rf 777 "~/rosuser_home"
fi

NAME=w-ros-daemon

docker rm -f $NAME

docker run -d --name $NAME --gpus all \
	--network host \
	--privileged \
	--restart unless-stopped \
	-v /dev:/dev \
	-v /run/systemd:/run/systemd \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v ~/rosuser_home:$HOME \
	-e VNC_PASSWORD=vnc123 \
	-e VNC_RESOLUTION=$p1080 \
	wn1980/w-ros${tag} startup.sh
