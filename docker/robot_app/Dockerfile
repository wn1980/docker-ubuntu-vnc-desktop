ARG tag
#FROM wn1980/w-ros-novnc${tag}
FROM wn1980/gzweb${tag}

# Configure user
ARG user=robot
ARG passwd=robot
ARG uid=1000
ARG gid=1000

ENV USER=$user \
	PASSWD=$passwd \
	UID=$uid \
	GID=$gid

RUN groupadd $USER && \
    useradd --create-home --no-log-init -g $USER $USER && \
    usermod -aG sudo $USER && \
    echo "$PASSWD:$PASSWD" | chpasswd && \
    chsh -s /bin/bash $USER && \
    usermod  --uid $UID $USER && \
    groupmod --gid $GID $USER

ENV HOME=/home/$USER
ENV ws=$HOME/catkin_ws
ENV src=$ws/src

WORKDIR $HOME
    
COPY ./setup/install/config.sh /opt/docker/install/
COPY ./setup/install/ws_clone.sh /opt/docker/install/
COPY ./setup/install/ws_make.sh /opt/docker/install/
COPY ./setup/install/ros_pkgs.sh /opt/docker/install/

USER $USER

RUN rosdep fix-permissions && rosdep update

RUN /opt/docker/install/config.sh

# install NodeJS 
#ENV NODE_VERSION=6.17.1
ENV NODE_VERSION=12.20.1
ENV NVM_DIR=$HOME/.nvm

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="$NVM_DIR/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version && npm --version

USER root

RUN usermod -aG audio $USER && \
	usermod -aG video $USER && \
	usermod -aG dialout $USER  && \
	usermod -aG plugdev $USER 

# clean
RUN apt-get autoclean \
    && apt-get autoremove 
