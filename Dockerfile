FROM ubuntu:16.04

# tini for subreap
ARG TINI_VERSION=v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64 /bin/tini
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 /bin/tini
RUN chmod +x /bin/tini

# setup environment
ENV DEBIAN_FRONTEND noninteractive \
	LANG C.UTF-8 \
	LC_ALL C.UTF-8 \
	ROS_DISTRO kinetic

# add configuation files
ADD image /

# install packages
COPY ./setup/install/requirement.sh /opt/install/
RUN /opt/install/requirement.sh

COPY ./setup/install/ros.sh /opt/install/
RUN /opt/install/ros.sh

COPY ./setup/install/main_pkgs.sh /opt/install/
RUN /opt/install/main_pkgs.sh

COPY ./setup/install/config.sh /opt/install/
RUN /opt/install/config.sh

# clean
RUN apt-get autoclean \
    && apt-get autoremove 

# ROS master port
EXPOSE 11311

EXPOSE 6081

WORKDIR /root

ENV HOME=/home/ubuntu \
    SHELL=/bin/bash

ENTRYPOINT ["/opt/startup.sh"]
