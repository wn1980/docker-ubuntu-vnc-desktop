FROM wn1980/w-ros-ubuntu

# setup environment
ENV DEBIAN_FRONTEND=noninteractive \
	LANG=C.UTF-8 \
	LC_ALL=C.UTF-8 \
	ROS_DISTRO=kinetic

COPY ./setup/install/ros.sh /opt/install/
RUN /opt/install/ros.sh

COPY ./setup/install/config.sh /opt/install/
RUN /opt/install/config.sh

# clean
RUN apt-get autoclean \
    && apt-get autoremove 
 
