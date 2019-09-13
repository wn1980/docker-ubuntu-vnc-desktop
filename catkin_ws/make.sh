#!/usr/bin/env bash

set -e

/bin/bash -c "source /opt/ros/$ROS_DISTRO/setup.bash && cd $ws && catkin_make -DCMAKE_BUILD_TYPE=Release"
