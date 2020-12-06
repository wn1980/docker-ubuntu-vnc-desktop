ARG tag
FROM wn1980/w-ros-kinetic${tag}

# prepare libraries files
COPY ./setup/*.tar.gz /opt/
#COPY ./setup/noVNC-1.2.0.tar.gz /opt/
#COPY ./setup/websockify-0.9.0.tar.gz /opt/

#install noVNC
ENV NO_VNC_HOME=/opt/docker/noVNC
WORKDIR /opt
RUN mkdir -p $NO_VNC_HOME/utils/websockify && \
	tar xzfv noVNC-1.2.0.tar.gz --strip 1 -C $NO_VNC_HOME && \
	tar xzfv websockify-0.9.0.tar.gz --strip 1 -C $NO_VNC_HOME/utils/websockify && \
	chmod +x -v $NO_VNC_HOME/utils/*.sh && \
	rm -f noVNC-1.2.0.tar.gz websockify-0.9.0.tar.gz

COPY ./setup/install/chrome.sh /opt/docker/install/
RUN /opt/docker/install/chrome.sh

# install packages
COPY ./setup/install/main_pkgs.sh /opt/docker/install/
RUN /opt/docker/install/main_pkgs.sh

# clean
RUN apt-get autoclean && \
    apt-get autoremove 

# add index.html
COPY ./setup/index.html $NO_VNC_HOME

# add configuation files
COPY ./setup/opt /opt

RUN chmod -Rf 777 /opt/docker/log/

ENV PATH="/opt/docker/bin:${PATH}"

# VNC ports
EXPOSE 5901 6901

ENV SHELL=/bin/bash \
	USER=root \
	HOME=/root
	
WORKDIR $HOME
