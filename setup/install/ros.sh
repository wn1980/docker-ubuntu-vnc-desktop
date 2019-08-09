#!/usr/bin/env bash

set -e

# =================================
# install ros (source: https://github.com/osrf/docker_images/blob/5399f380af0a7735405a4b6a07c6c40b867563bd/ros/kinetic/ubuntu/xenial/ros-core/Dockerfile)
# install packages
apt-get update && apt-get install -y --no-install-recommends \
    dirmngr \
    gnupg2 \
    sudo \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# setup keys
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup sources.list
echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list

# install bootstrap tools
apt-get update && apt-get install --no-install-recommends -y \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
rosdep init 

# install ros packages
apt-get update && apt-get install -y \
	ros-kinetic-ros-core=1.3.2-0* \
	ros-kinetic-turtlebot* \
    && rm -rf /var/lib/apt/lists/*

# ros-kinetic-desktop-full=1.3.2-0* \
# ros-kinetic-turtlebot* \
# setup entrypoint
# COPY ./ros_entrypoint.sh /

# =================================
