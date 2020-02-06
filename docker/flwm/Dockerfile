#ARG tag
#FROM wn1980/w-ros-kinetic${tag}
FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  flwm wget


#install noVNC
ENV NO_VNC_HOME=/opt/noVNC
WORKDIR /opt
RUN wget https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz
RUN wget https://github.com/novnc/websockify/archive/v0.9.0.tar.gz

RUN mkdir -p $NO_VNC_HOME/utils/websockify && \
	tar xzfv v1.1.0.tar.gz --strip 1 -C $NO_VNC_HOME && \
	tar xzfv v0.9.0.tar.gz --strip 1 -C $NO_VNC_HOME/utils/websockify && \
	chmod +x -v $NO_VNC_HOME/utils/*.sh && \
	ln -s $NO_VNC_HOME/vnc.html $NO_VNC_HOME/index.html && \
	rm -f *.tar.gz

# add configuation files
#COPY ./setup/opt /opt

RUN mkdir -p /opt/docker/install/

ADD setup/install/chrome.sh /opt/docker/install/chrome.sh
RUN /opt/docker/install/chrome.sh

# install packages
COPY ./setup/install/main_pkgs.sh /opt/docker/install/
RUN /opt/docker/install/main_pkgs.sh

# clean
RUN apt-get autoclean && \
    apt-get autoremove 

ENV PATH="/opt/docker/bin:${PATH}"

RUN chmod -Rf 777 /opt/docker/log/

#wallpapers
COPY ./setup/ui/wallpapers /opt/docker/wallpapers

# VNC ports
EXPOSE 5901 6901

USER $USER

ENV SHELL=/bin/bash

WORKDIR $HOME

USER root
