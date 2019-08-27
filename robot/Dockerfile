ARG tag
FROM wn1980/w-ros-novnc${tag}

COPY ./setup/install/ros_pkgs.sh /opt/docker/install/
RUN /opt/docker/install/ros_pkgs.sh

# custom packages
RUN apt-get install -y \
	libffi-dev \
	libqt5serialport5-dev

# update required modules	
RUN pip install --upgrade pyasn1 && \
	pip install --upgrade pyasn1-modules && \
	pip install --upgrade cryptography && \
	python -m easy_install --upgrade pyOpenSSL

RUN pip install pyaudio pyusb click pixel-ring spidev pydub beautifulsoup4 gTTS-token dialogflow==0.6.0 gTTS==2.0.3 

# create workspace
USER $USER

ENV ws=$HOME/catkin_ws
ENV src=$ws/src
RUN mkdir -p $src

RUN echo "\n#workspace setting\nsource $ws/devel/setup.bash\n" >> $HOME/.bashrc
RUN echo "\n#Google Cloud API setting\n#export GOOGLE_APPLICATION_CREDENTIALS='$HOME/path/file.json'\n" >> $HOME/.bashrc

# linorobot
WORKDIR $src

RUN git clone https://github.com/linorobot/lino_msgs && \
	git clone https://github.com/linorobot/lino_pid && \
	git clone https://github.com/linorobot/lino_udev && \
	git clone https://github.com/linorobot/imu_calib && \
	git clone https://github.com/linorobot/lino_visualize && \
	git clone https://github.com/wn1980/linorobot && \
	git clone https://github.com/wn1980/turtlebot_lidar && \
	git clone https://github.com/wn1980/rbx1 && \
	git clone https://github.com/wn1980/rbx2 && \
	git clone https://github.com/wn1980/pi_trees && \
	git clone https://github.com/wn1980/dobot
	
#	git clone https://github.com/wn1980/turtlebot_6wd && \
# or
#RUN git clone https://github.com/wn1980/ros-dobot

RUN git clone --recursive https://github.com/leggedrobotics/darknet_ros.git

# copy ydlidar to src
WORKDIR /opt

RUN	tar -xzvf ydlidar-1.3.1.tar.gz -C $src 

#COPY ./setup/linorobot/keyboard_teleop.launch $src/linorobot/launch/
#COPY ./setup/linorobot/webcam.launch $src/linorobot/launch/
#COPY ./setup/linorobot/ydlidar.launch $src/linorobot/launch/include/lidar
COPY ./setup/asoundrc.txt $HOME/.asoundrc

#USER root
#RUN bash $src/rbx1/rbx1-prereq.sh && \
#	bash $src/rbx2/rbx2-prereq.sh

USER $USER

RUN /bin/bash -c "source /opt/ros/$ROS_DISTRO/setup.bash && cd $ws && catkin_make -DCMAKE_BUILD_TYPE=Release"

USER root

RUN rm -f ydlidar-1.3.1.tar.gz

RUN usermod -aG audio $USER && \
	usermod -aG video $USER && \
	usermod -aG dialout $USER  && \
	usermod -aG plugdev $USER 
	 
# ROS master port
EXPOSE 11311

WORKDIR $HOME

#ENTRYPOINT ["/opt/docker/bin/startup.sh"]
