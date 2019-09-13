ARG tag
FROM wn1980/w-ros-kinetic${tag}

# prepare libraries files
COPY ./setup/*.tar.gz /opt/

# tini for subreap
#ARG TINI_VERSION=v0.18.0
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64 /bin/tini-x86_64
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 /bin/tini-aarch64
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-armhf /bin/tini-armhf
#RUN chmod +x /bin/tini-*

#COPY ./setup/install/novnc.sh /opt/docker/install/
#RUN /opt/docker/install/novnc.sh
#install noVNC
ENV NO_VNC_HOME=/opt/noVNC
WORKDIR /opt
RUN mkdir -p $NO_VNC_HOME/utils/websockify && \
	tar xzfv noVNC-1.1.0.tar.gz --strip 1 -C $NO_VNC_HOME && \
	tar xzfv websockify-0.8.0.tar.gz --strip 1 -C $NO_VNC_HOME/utils/websockify && \
	chmod +x -v $NO_VNC_HOME/utils/*.sh && \
	ln -s $NO_VNC_HOME/vnc.html $NO_VNC_HOME/index.html && \
	rm -f noVNC-1.1.0.tar.gz websockify-0.8.0.tar.gz

COPY ./setup/install/chrome.sh /opt/docker/install/
RUN /opt/docker/install/chrome.sh

# install packages
COPY ./setup/install/main_pkgs.sh /opt/docker/install/
RUN /opt/docker/install/main_pkgs.sh

# clean
RUN apt-get autoclean && \
    apt-get autoremove 

# add configuation files
COPY ./setup/opt /opt

ENV PATH="/opt/docker/bin:${PATH}"
#RUN set_user_permission.sh /opt/docker $HOME

RUN chmod -Rf 777 /opt/docker/log/

COPY ./setup/ui/jwm/jwm-session /opt/docker/bin/
RUN chmod a+x /opt/docker/bin/jwm-session

#wallpapers
COPY ./setup/ui/wallpapers /opt/docker/wallpapers

#nginx
#COPY ./setup/sites-available-default /etc/nginx/sites-available/default

# VNC ports
EXPOSE 5901 6901

USER $USER

ENV SHELL=/bin/bash

WORKDIR $HOME

#icewm ui
COPY ./setup/ui/icewm $HOME/.icewm
#jwm ui
COPY ./setup/ui/jwm/jwmrc $HOME/.jwm
RUN ln -s $HOME/.jwm/main.jwmrc $HOME/.jwmrc

USER root
