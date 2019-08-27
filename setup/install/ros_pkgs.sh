#!/usr/bin/env bash

set -e

# required for linorobot
apt-get update && apt-get install -y \
	ros-$ROS_DISTRO-roslint \
	ros-$ROS_DISTRO-rosserial \
	ros-$ROS_DISTRO-rosserial-arduino \
	ros-$ROS_DISTRO-imu-filter-madgwick \
	ros-$ROS_DISTRO-gmapping \
	ros-$ROS_DISTRO-map-server \
	ros-$ROS_DISTRO-robot-localization \
	ros-$ROS_DISTRO-hector-slam \
	ros-$ROS_DISTRO-tf \
	ros-$ROS_DISTRO-tf2 \
	ros-$ROS_DISTRO-tf2-ros \
    ros-$ROS_DISTRO-xv-11-laser-driver \
    ros-$ROS_DISTRO-rplidar-ros \
    ros-$ROS_DISTRO-urg-node \
    ros-$ROS_DISTRO-lms1xx \
    ros-$ROS_DISTRO-freenect-launch \
    ros-$ROS_DISTRO-depthimage-to-laserscan \
    ros-$ROS_DISTRO-teb-local-planner \
    ros-$ROS_DISTRO-multirobot-map-merge \
    ros-$ROS_DISTRO-explore-lite \
    ros-$ROS_DISTRO-usb-cam \
    ros-$ROS_DISTRO-teleop-twist-keyboard \
	ros-$ROS_DISTRO-teleop-twist-joy 
	
# Install the prerequisites for the ROS By Example code, Volume 1
apt-get update && apt-get install -y ros-kinetic-turtlebot-bringup \
ros-kinetic-openni-* ros-kinetic-openni2-* \
ros-kinetic-freenect-* ros-kinetic-usb-cam \
ros-kinetic-audio-common gstreamer1.0-pocketsphinx \
ros-kinetic-slam-gmapping ros-kinetic-laser-* \
ros-kinetic-joystick-drivers python-rosinstall \
ros-kinetic-orocos-kdl ros-kinetic-python-orocos-kdl \
python-setuptools ros-kinetic-dynamixel-motor-* \
libopencv-dev python-opencv ros-kinetic-vision-opencv \
ros-kinetic-depthimage-to-laserscan ros-kinetic-arbotix \
ros-kinetic-turtlebot-teleop ros-kinetic-navigation \
git mercurial

# Install the prerequisites for the ROS By Example code, Volume 2
apt-get update && apt-get install -y ros-kinetic-arbotix ros-kinetic-openni-camera \
ros-kinetic-dynamixel-motor ros-kinetic-rosbridge-suite \
ros-kinetic-web-video-server ros-kinetic-rgbd-launch \
ros-kinetic-moveit ros-kinetic-manipulation-msgs \
ros-kinetic-turtlebot-* ros-kinetic-kobuki-* ros-kinetic-moveit-python \
python-pygraph python-pygraphviz python-easygui \
mini-httpd ros-kinetic-laser-pipeline ros-kinetic-ar-track-alvar \
ros-kinetic-laser-filters \
ros-kinetic-depthimage-to-laserscan ros-kinetic-shape-msgs \
ros-kinetic-gazebo-ros ros-kinetic-gazebo-ros-pkgs \
ros-kinetic-gazebo-msgs ros-kinetic-gazebo-plugins \
ros-kinetic-gazebo-ros-control ros-kinetic-cmake-modules \
ros-kinetic-kobuki-gazebo-plugins ros-kinetic-kobuki-gazebo \
ros-kinetic-smach ros-kinetic-smach-ros ros-kinetic-grasping-msgs \
ros-kinetic-executive-smach ros-kinetic-smach-viewer \
ros-kinetic-robot-pose-publisher ros-kinetic-tf2-web-republisher \
ros-kinetic-move-base-msgs ros-kinetic-fake-localization \
graphviz-dev libgraphviz-dev gv python-scipy liburdfdom-tools \
ros-kinetic-laptop-battery-monitor ros-kinetic-ar-track-alvar* \
ros-kinetic-map-server ros-kinetic-move-base* \
ros-kinetic-simple-grasping
