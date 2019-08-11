ARG tag
FROM wn1980/w-ros-novnc${tag}

USER root

# required for linorobot
RUN apt-get update && apt-get install -y \
	ros-$ROS_DISTRO-roslint \
	ros-$ROS_DISTRO-rosserial \
	ros-$ROS_DISTRO-rosserial-arduino \
	ros-$ROS_DISTRO-imu-filter-madgwick \
	ros-$ROS_DISTRO-gmapping \
	ros-$ROS_DISTRO-map-server \
	ros-$ROS_DISTRO-robot-localization \
	ros-$ROS_DISTRO-tf \
	ros-$ROS_DISTRO-tf2 \
	ros-$ROS_DISTRO-tf2-ros \
    ros-$ROS_DISTRO-xv-11-laser-driver \
    ros-$ROS_DISTRO-rplidar-ros \
    ros-$ROS_DISTRO-urg-node \
    ros-$ROS_DISTRO-lms1xx \
    ros-$ROS_DISTRO-freenect-launch \
    ros-$ROS_DISTRO-depthimage-to-laserscan \
    ros-$ROS_DISTRO-teb-local-planner

# create workspace
USER $USER

ENV ws=$HOME/catkin_ws
ENV src=$ws/src
RUN mkdir -p $src

RUN echo "\nsource $ws/devel/setup.bash\n" >> $HOME/.bashrc
RUN echo "#export GOOGLE_APPLICATION_CREDENTIALS=xxx\n" >> $HOME/.bashrc

# linorobot
WORKDIR $src

RUN git clone https://github.com/linorobot/linorobot && \
	git clone https://github.com/linorobot/imu_calib && \
	git clone https://github.com/linorobot/lino_pid && \
	git clone https://github.com/linorobot/lino_udev && \
	git clone https://github.com/linorobot/lino_msgs && \
	git clone https://github.com/linorobot/lino_visualize && \
	git clone https://github.com/linorobot/lino_setup && \
	git clone https://github.com/EAIBOT/ydlidar

# copy src
#COPY ./setup/src.tar.gz $HOME

#WORKDIR $HOME

#RUN	tar -xzvf src.tar.gz -C $ws && \
#	rm -f src.tar.gz

#RUN /bin/bash -c "source ~/.bashrc && cd $ws && catkin_make"

USER root

ENTRYPOINT ["/opt/docker/bin/startup.sh"]
