#!/usr/bin/env bash

set -e

sh -c 'echo "\n### ROS config." >> $HOME/.bashrc' 
sh -c 'echo "source /opt/ros/$ROS_DISTRO/setup.bash\n" >> $HOME/.bashrc'

sh -c 'echo "#export ROS_MASTER_URI=http://localhost:11311" >> $HOME/.bashrc' 
sh -c 'echo "#export ROS_HOSTNAME=\$HOSTNAME\n" >> $HOME/.bashrc'

sh -c 'echo "\n# TurtleBot settings" >> $HOME/.bashrc' 

sh -c 'echo "#export TURTLEBOT_MAP_FILE=~/my_map.yaml\n" >> $HOME/.bashrc'

sh -c 'echo "#export TURTLEBOT_BASE=create" >> $HOME/.bashrc'
sh -c 'echo "#export TURTLEBOT_STACKS=circles" >> $HOME/.bashrc'
sh -c 'echo "#export TURTLEBOT_3D_SENSOR=kinect" >> $HOME/.bashrc'
sh -c 'echo "#export TURTLEBOT_SERIAL_PORT=/dev/create1\n" >> $HOME/.bashrc'
	
sh -c 'echo "\n# linorobot settings" >> $HOME/.bashrc'
	
sh -c 'echo "#export LINOLIDAR=ydlidar" >> $HOME/.bashrc'
sh -c 'echo "#export LINOBASE=2wd\n" >> $HOME/.bashrc'
