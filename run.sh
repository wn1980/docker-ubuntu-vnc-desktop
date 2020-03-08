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

if [ -f "$PWD/catkin_ws" ]
then
	mkdir -p "PWD/catkin_ws"
fi

if [ "$1" == 'gpu' ]; then
  GPU='--gpus all'
  echo 'Running with GPU'
else
  GPU=
fi

#Build new iamge
docker build -t wn1980/w-ros-d${tag} \
	--build-arg uid=$(id -u) \
	--build-arg gid=$(id -g) \
	-f docker/robot_app/Dockerfile.user .

NAME=w-ros-daemon

docker rm -f $NAME

docker system prune -f

docker run -d --name $NAME $GPU \
	--network host \
	--privileged \
	--restart unless-stopped \
	-v /dev:/dev \
	-v /run/systemd:/run/systemd \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	-v $PWD/Documents:/home/rosuser/Documents:rw \
	-v $PWD/catkin_ws:/home/rosuser/catkin_ws:rw \
	-e VNC_PASSWORD=vnc123 \
	-e VNC_RESOLUTION=$p1080 \
	wn1980/w-ros-d${tag} startup.sh
