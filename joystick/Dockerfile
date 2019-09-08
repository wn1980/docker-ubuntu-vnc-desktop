FROM ros:kinetic-ros-core

RUN apt-get update && apt-get install -y \ 
	ros-$ROS_DISTRO-teleop-twist-joy \
	ros-$ROS_DISTRO-yujin-ocs \
	joystick

COPY ./root/ /root/
RUN /bin/bash -c 'source /opt/ros/$ROS_DISTRO/setup.bash && cd ~/catkin_ws && catkin_make -DCMAKE_BUILD_TYPE=Release'

COPY ./ros_entrypoint.sh /

