FROM ros:kinetic-ros-base
RUN apt-get update && apt-get install -y \ 
	ros-kinetic-rosbridge-server \
	ros-kinetic-tf2-web-republisher \
	ntp \
	netatalk
COPY ./start.launch /
EXPOSE 9090 11311
COPY ./root/ /root/
RUN /bin/bash -c 'source /opt/ros/$ROS_DISTRO/setup.bash && cd ~/catkin_ws && catkin_make -DCMAKE_BUILD_TYPE=Release'
RUN /bin/bash -c 'echo "\n#workspace setting\nsource ~/catkin_ws/devel/setup.bash\n" >> ~/.bashrc'
