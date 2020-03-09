#!/usr/bin/env bash

set -e

rm -rf $src
mkdir -p $src

cd $src

git clone https://github.com/wn1980/linorobot_pkgs && \
git clone https://github.com/wn1980/turtlebot_lidar && \
git clone https://github.com/wn1980/dialogflow_msg && \
git clone https://github.com/wn1980/rf2o_laser_odometry && \
git clone https://github.com/wn1980/rbx1 && \
git clone https://github.com/wn1980/rbx2 && \
git clone https://github.com/wn1980/pi_trees && \
git clone https://github.com/wn1980/dobot 

#git clone https://github.com/wn1980/turtlebot_6wd && \	
# or
#git clone https://github.com/wn1980/ros-dobot

git clone --recursive https://github.com/leggedrobotics/darknet_ros

tar -xzvf /opt/ydlidar-1.3.1.tar.gz -C $src 
