#!/usr/bin/env bash

p1080=1920x1080
p720=1280x720
p169=1600x900

if [ $(uname -m) == 'x86_64' ] 
then
	docker-compose down
	docker system prune -f
	docker-compose up -d --build ros-master ros-novnc ros-joystick
elif [ $(uname -m) == 'aarch64' ] 
then 
	docker-compose -f docker-compose-arm64.yml down
	docker system prune -f
	docker-compose -f docker-compose-arm64.yml up -d --build ros-master ros-novnc ros-joystick
else
	echo 'not matched platform!'
	exit 0
fi
