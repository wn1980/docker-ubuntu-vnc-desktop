FROM ros:kinetic-ros-core

RUN apt-get update && apt-get install -y \ 
	ros-$ROS_DISTRO-rosbridge-server \
	ros-$ROS_DISTRO-tf2-web-republisher 

# 	ntp \
#	iputils-ping \
#	netatalk \
#	avahi-daemon

#RUN update-rc.d avahi-daemon defaults && \
#	/etc/init.d/dbus start && \
#	/etc/init.d/avahi-daemon start

COPY ./root/ /root/
RUN /bin/bash -c 'source /opt/ros/$ROS_DISTRO/setup.bash && cd ~/catkin_ws && catkin_make -DCMAKE_BUILD_TYPE=Release'

#RUN /bin/bash -c 'echo "\n#workspace setting\nsource ~/catkin_ws/devel/setup.bash\n" >> ~/.bashrc'

COPY ./ros_entrypoint.sh /
COPY ./start.launch /
EXPOSE 9090 11311
