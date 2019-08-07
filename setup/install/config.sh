#!/usr/bin/env bash

set -e

sh -c 'echo "\n### ROS config." >> ~/.bashrc' 
sh -c 'echo "source /opt/ros/\$ROS_DISTRO/setup.bash\n" >> ~/.bashrc'

sh -c 'echo "#export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc' 
sh -c 'echo "#export ROS_HOSTNAME=\$HOSTNAME\n" >> ~/.bashrc'

sh -c 'echo "\n# TurtleBot settings" >> $HOME/.bashrc' 

sh -c 'echo "#export TURTLEBOT_MAP_FILE=~/my_map.yaml\n" >> ~/.bashrc'

sh -c 'echo "#export TURTLEBOT_BASE=create" >> ~/.bashrc'
sh -c 'echo "#export TURTLEBOT_STACKS=circles" >> ~/.bashrc'
sh -c 'echo "#export TURTLEBOT_3D_SENSOR=kinect" >> ~/.bashrc'
sh -c 'echo "#export TURTLEBOT_SERIAL_PORT=/dev/create1\n" >> ~/.bashrc'
	
sh -c 'echo "\n# linorobot settings" >> ~/.bashrc'
	
sh -c 'echo "#export LINOLIDAR=ydlidar" >> ~/.bashrc'
sh -c 'echo "#export LINOBASE=2wd\n" >> ~/.bashrc'
