ARG tag
FROM wn1980/w-ros-kinetic${tag}

# install packages
COPY ./setup/install/novnc.sh /opt/install/
RUN /opt/install/novnc.sh

COPY ./setup/install/main_pkgs.sh /opt/install/
RUN /opt/install/main_pkgs.sh

COPY ./setup/install/rosuser.sh /opt/install/
RUN /opt/install/rosuser.sh

# clean
RUN apt-get autoclean && \
    apt-get autoremove 

# tini for subreap
#ARG TINI_VERSION=v0.18.0
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64 /bin/tini-x86_64
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 /bin/tini-aarch64
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-armhf /bin/tini-armhf
#RUN chmod +x /bin/tini-*

# add configuation files
ADD ./setup/image /

#wallpapers
COPY ./setup/ui/wallpapers /opt/wallpapers
#icewm ui
COPY ./setup/ui/icewm $HOME/.icewm
#jwm ui
COPY ./setup/ui/jwm/jwmrc $HOME/.jwm
RUN ln -s $HOME/.jwm/main.jwmrc $HOME/.jwmrc
COPY ./setup/ui/jwm/jwm-session /usr/bin/
RUN chmod a+x /usr/bin/jwm-session

# ROS master port
EXPOSE 11311

#noVNC port
EXPOSE 6901

USER $USER

WORKDIR $HOME

ENV SHELL=/bin/bash

RUN rosdep fix-permissions && rosdep update

RUN /opt/install/config.sh

ENTRYPOINT ["/opt/bin/startup.sh"]

