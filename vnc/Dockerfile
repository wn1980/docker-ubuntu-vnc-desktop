FROM wn1980/w-ros-kinetic

# tini for subreap
ARG TINI_VERSION=v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64 /bin/tini-x86_64
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 /bin/tini-aarch64
RUN chmod +x /bin/tini-*

# add configuation files
ADD image /

# install packages
COPY ./setup/install/novnc.sh /opt/install/
RUN /opt/install/novnc.sh

COPY ./setup/install/main_pkgs.sh /opt/install/
RUN /opt/install/main_pkgs.sh

# clean
RUN apt-get autoclean && \
    apt-get autoremove 

# ROS master port
EXPOSE 11311

EXPOSE 6081

WORKDIR /root

ENV HOME=/home/ubuntu \
    SHELL=/bin/bash

ENTRYPOINT ["/opt/bin/startup.sh"]
