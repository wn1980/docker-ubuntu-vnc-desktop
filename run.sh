#!/usr/bin/env bash

#pre-defined constant (do not change)
p1080=1920x1080
p720=1280x720
p169=1600x900

#please adjust this user settings
user=robot
passwd=robot
vnc_password=vnc123
vnc_resolution=$p720

#===== do not change following lines, if you do not know exactly what it is. =====
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

if [ ! -d "$PWD/catkin_ws/src" ]
then
	echo create folder with command: 'mkdir -p $PWD/catkin_ws/src'
	mkdir -p $PWD/catkin_ws/src
fi

if [ ! -d "$PWD/Documents" ]
then
	echo create folder with command: 'mkdir -p $PWD/Documents'
	mkdir -p $PWD/Documents
fi

if [ "$1" == 'gpu' ]; then
  GPU='--gpus all'
  echo 'Running with GPU'
else
  GPU=
fi

echo Update image

docker pull wn1980/w-ros${tag}

echo Build user image

#Build new iamge
docker build -t wn1980/w-ros-d${tag} \
	--build-arg tag=$tag \
	--build-arg user=$user \
	--build-arg passwd=$passwd \
	--build-arg uid=$(id -u) \
	--build-arg gid=$(id -g) \
	-f docker/robot_app/Dockerfile.user .

NAME=w-ros-daemon

echo Remove existing container

docker rm -f $NAME

docker system prune -f

docker run -d --name $NAME $GPU \
	-p 6901:6901 \
	--net=host \
	--privileged \
	--restart unless-stopped \
	-v /dev:/dev \
	-v /run/systemd:/run/systemd \
	-v /etc/localtime:/etc/localtime \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	-v $PWD/Documents:/home/$user/Documents:rw \
	-v $PWD/catkin_ws:/home/$user/catkin_ws:rw \
	-v $PWD/config/wmx:/home/$user/.wmx:rw \
	-v $PWD/config/asoundrc.txt:/home/$user/.asoundrc:rw \
	-v $PWD/config/Xresources.txt:/home/$user/.Xresources:rw \
	-e VNC_PASSWORD=$vnc_password \
	-e VNC_RESOLUTION=$vnc_resolution \
	wn1980/w-ros-d${tag} startup.sh

echo All done!
