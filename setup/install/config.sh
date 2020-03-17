#!/usr/bin/env bash

set -e

sh -c 'echo "\n###### ROS config. ######" >> $HOME/.bashrc' 
sh -c 'echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> $HOME/.bashrc'

sh -c ' echo "\n# ROS workspace setting" >> $HOME/.bashrc'
sh -c ' echo "if [ ! -f $ws/devel/setup.bash ]; then" >> $HOME/.bashrc'
sh -c ' echo "    sh /opt/docker/install/ws_make.sh" >> $HOME/.bashrc'
sh -c ' echo "fi" >> $HOME/.bashrc'
sh -c ' echo "\nsource $ws/devel/setup.bash\n" >> $HOME/.bashrc'

sh -c 'echo "#export ROS_MASTER_URI=http://localhost:11311" >> $HOME/.bashrc' 
sh -c 'echo "#export ROS_HOSTNAME=\$HOSTNAME\n" >> $HOME/.bashrc'

sh -c 'echo "\n# TurtleBot settings" >> $HOME/.bashrc' 

sh -c 'echo "#export TURTLEBOT_MAP_FILE=~/Documents/map.yaml\n" >> $HOME/.bashrc'

sh -c 'echo "#export TURTLEBOT_BASE=create" >> $HOME/.bashrc'
sh -c 'echo "#export TURTLEBOT_STACKS=circles" >> $HOME/.bashrc'
sh -c 'echo "#export TURTLEBOT_3D_SENSOR=kinect" >> $HOME/.bashrc'
sh -c 'echo "#export TURTLEBOT_SERIAL_PORT=/dev/create1\n" >> $HOME/.bashrc'
	
sh -c 'echo "\n# linorobot settings" >> $HOME/.bashrc'
	
sh -c 'echo "#export LINOLIDAR=ydlidar" >> $HOME/.bashrc'
sh -c 'echo "#export LINOBASE=2wd\n" >> $HOME/.bashrc'

sh -c 'echo "\n###### ROS config. end here ######\n" >> $HOME/.bashrc' 
