FROM wn1980/w-ros-kinetic

# tini for subreap
ARG TINI_VERSION=v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64 /bin/tini-x86_64
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 /bin/tini-aarch64
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-armhf /bin/tini-armhf
RUN chmod +x /bin/tini-*

# add configuation files
ADD ./setup/image /

COPY ./setup/ui/wallpapers /opt/wallpapers
#icewm ui
COPY ./setup/ui/icewm /root/.icewm
#jwm ui
COPY ./setup/ui/jwm/jwmrc /root/.jwm
RUN ln -s $HOME/.jwm/main.jwmrc /root/.jwmrc
COPY ./setup/ui/jwm/jwm-session /usr/bin/
RUN chmod a+x /usr/bin/jwm-session

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

EXPOSE 6901

WORKDIR /root

ENV HOME=/home/ubuntu \
    SHELL=/bin/bash

ENTRYPOINT ["/opt/bin/startup.sh"]
