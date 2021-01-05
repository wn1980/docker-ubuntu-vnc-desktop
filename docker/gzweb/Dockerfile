#REF (v9): https://github.com/osrf/docker_images/blob/master/gazebo/9/ubuntu/xenial/gzweb9/Dockerfile
#REF (v7): https://github.com/osrf/docker_images/blob/master/gazebo/7/ubuntu/xenial/gzweb7/Dockerfile

# This is an auto generated Dockerfile for gazebo:gzweb9
# generated from docker_images/create_gzweb_image.Dockerfile.em
#FROM gazebo:libgazebo9-xenial
#FROM gazebo:libgazebo7-xenial

ARG tag
FROM wn1980/w-ros-novnc${tag}

# install packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \
    imagemagick \
    libboost-all-dev \
    libgts-dev \
    libjansson-dev \
    libtinyxml-dev \
    git \
    curl \
    pkg-config \
    psmisc \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# install gazebo packages
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    libgazebo9-dev=9.16.0-1* \
#    && rm -rf /var/lib/apt/lists/*
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    libgazebo7-dev=7.16.1-1* \
#    && rm -rf /var/lib/apt/lists/*
    
# install NodeJS 
#ENV NODE_VERSION=6.17.1
ENV NODE_VERSION=8.17.0
#ENV NODE_VERSION=12.20.1
ENV NVM_DIR=$HOME/.nvm

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="$NVM_DIR/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version && npm --version
	
# clone gzweb
ENV GZWEB_WS /opt/docker/gzweb
RUN git clone http://github.com/osrf/gzweb $GZWEB_WS
WORKDIR $GZWEB_WS

# make a missing folder
CMD mkdir ${GZWEB_WS}/http/client/assets
    
# build gzweb
#RUN git checkout gzweb_1.4.1 
RUN xvfb-run -s "-screen 0 1280x1024x24" bash -c "source /usr/share/gazebo/setup.sh && ./deploy.sh -m -t"

# setup environment
EXPOSE 8080 7681

# run gzserver and gzweb
#CMD gzserver --verbose & npm start
