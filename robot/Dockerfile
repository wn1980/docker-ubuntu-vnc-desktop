ARG tag
FROM wn1980/w-ros-novnc${tag}

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
    ros-$ROS_DISTRO-teb-local-planner \
    ros-$ROS_DISTRO-teleop-twist-keyboard \
	ros-$ROS_DISTRO-teleop-twist-joy

# custom packages
RUN apt-get --reinstall install -y \
	libffi-dev
	
#	python-pyasn1 \
#	python-pyasn1-modules 

RUN pip install --upgrade pyasn1 && \
	pip install --upgrade pyasn1-modules && \
	pip install --upgrade cryptography && \
	python -m easy_install --upgrade pyOpenSSL

RUN pip install pyaudio pyusb click pixel-ring pydub beautifulsoup4 gTTS-token dialogflow==0.6.0 gTTS==2.0.3 

# create workspace
USER $USER

ENV ws=$HOME/catkin_ws
ENV src=$ws/src
RUN mkdir -p $src

RUN echo "\n#workspace setting\nsource $ws/devel/setup.bash\n" >> $HOME/.bashrc
RUN echo "\n#Google Cloud API setting\n#export GOOGLE_APPLICATION_CREDENTIALS='$HOME/path/file.json'\n" >> $HOME/.bashrc

# linorobot
WORKDIR $src

RUN git clone https://github.com/linorobot/linorobot && \
	git clone https://github.com/linorobot/imu_calib && \
	git clone https://github.com/linorobot/lino_pid && \
	git clone https://github.com/linorobot/lino_udev && \
	git clone https://github.com/linorobot/lino_msgs && \
	git clone https://github.com/linorobot/lino_visualize

COPY ./setup/linorobot/keyboard_teleop.launch $src/linorobot/launch/
COPY ./setup/linorobot/webcam.launch $src/linorobot/launch/
COPY ./setup/linorobot/ydlidar.launch $src/linorobot/launch/include/lidar
COPY ./setup/asoundrc.txt $HOME/.asoundrc

# copy ydlidar to src
WORKDIR /opt

RUN	tar -xzvf ydlidar-1.3.1.tar.gz -C $src 

#RUN /bin/bash -c "source ~/.bashrc && cd $ws && catkin_make"

USER root

RUN rm -f ydlidar-1.3.1.tar.gz

RUN usermod -aG audio $USER && \
	usermod -aG video $USER && \
	usermod -aG dialout $USER   

# ROS master port
EXPOSE 11311

WORKDIR $HOME

#ENTRYPOINT ["/opt/docker/bin/startup.sh"]
