ARG tag
FROM wn1980/w-ros-ubuntu${tag}

# setup environment
ENV DEBIAN_FRONTEND=noninteractive \
	LANG=C.UTF-8 \
	LC_ALL=C.UTF-8 \
	ROS_DISTRO=kinetic

COPY ./setup/install/ros.sh /opt/docker/install/
RUN /opt/docker/install/ros.sh

# Configure user
ARG user=rosuser
ARG passwd=rosuser
ARG uid=1000
ARG gid=1000

ENV USER=$user \
	PASSWD=$passwd \
	UID=$uid \
	GID=$gid
	
ENV HOME=/home/$USER

RUN groupadd $USER && \
    useradd --create-home --no-log-init -g $USER $USER && \
    usermod -aG sudo $USER && \
    echo "$PASSWD:$PASSWD" | chpasswd && \
    chsh -s /bin/bash $USER && \
    # Replace 1000 with your user/group id
    usermod  --uid $UID $USER && \
    groupmod --gid $GID $USER
    
COPY ./setup/install/config.sh /opt/docker/install/

USER $USER

RUN /opt/docker/install/config.sh

RUN rosdep fix-permissions && rosdep update
RUN /bin/bash -c "source ~/.bashrc"

USER root

# clean
RUN apt-get autoclean \
    && apt-get autoremove 
