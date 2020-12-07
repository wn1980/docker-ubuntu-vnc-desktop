#!/usr/bin/env bash

#pre-defined constant (do not change)
p1080=1920x1080
p720=1280x720
p169=1600x900

#please adjust this user settings
user=robot
passwd=robot
vnc_password=vnc123
vnc_resolution=$p1080

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
  runtime='nvidia'
  GPU='--gpus all'
  echo 'Running with GPU'
else
  runtime='runc'
  GPU=
fi

#Generate .env file
cat > "$PWD/.env" <<EOF
tag=$tag
runtime=$runtime
user=$user
vnc_password=$vnc_password
vnc_resolution=$vnc_resolution
EOF

#echo Update image

#docker pull wn1980/w-ros${tag}
echo Build user image

#Build new iamge
docker build -t wn1980/w-ros-d${tag} \
	--build-arg tag=$tag \
	--build-arg user=$user \
	--build-arg passwd=$passwd \
	--build-arg uid=$(id -u) \
	--build-arg gid=$(id -g) \
	-f docker/robot_app/Dockerfile .

docker-compose down
docker system prune -f
docker-compose up -d --build ros-master ros-webui ros-joystick



echo All done!
