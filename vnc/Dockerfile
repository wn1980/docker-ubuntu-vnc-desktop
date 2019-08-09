ARG tag
FROM wn1980/w-ros-kinetic${tag}

# install packages
COPY ./setup/install/novnc.sh /opt/install/
RUN /opt/install/novnc.sh

COPY ./setup/install/main_pkgs.sh /opt/install/
RUN /opt/install/main_pkgs.sh

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

COPY ./setup/ui/jwm/jwm-session /opt/bin/
RUN chmod a+x /opt/bin/jwm-session

#wallpapers
COPY ./setup/ui/wallpapers /opt/wallpapers


# ROS master port
EXPOSE 11311

#noVNC port
EXPOSE 6901

RUN chmod -Rf 777 /opt/log/

USER $USER

ENV SHELL=/bin/bash

WORKDIR $HOME

#icewm ui
COPY ./setup/ui/icewm $HOME/.icewm
#jwm ui
COPY ./setup/ui/jwm/jwmrc $HOME/.jwm
RUN ln -s $HOME/.jwm/main.jwmrc $HOME/.jwmrc

USER root

ENTRYPOINT ["/opt/bin/startup.sh"]
