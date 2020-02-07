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

#RUN pip install pyaudio pyusb click pixel-ring spidev pydub beautifulsoup4 gTTS-token dialogflow==0.6.0 gTTS==2.0.3 

ENV ws=$HOME/catkin_ws
ENV src=$ws/src

USER $USER

#COPY ./setup/asoundrc.txt $HOME/.asoundrc

RUN echo "\n#workspace setting\nsource $ws/devel/setup.bash\n" >> $HOME/.bashrc
RUN echo "\n#Google Cloud API setting\n#export GOOGLE_APPLICATION_CREDENTIALS='$HOME/path/file.json'\n" >> $HOME/.bashrc

USER root

RUN usermod -aG audio $USER && \
	usermod -aG video $USER && \
	usermod -aG dialout $USER  && \
	usermod -aG plugdev $USER 

WORKDIR $HOME
