ARG tag
FROM wn1980/w-ros-novnc${tag}

# custom packages
COPY ./setup/install/ros_pkgs.sh /opt/docker/install/
RUN /opt/docker/install/ros_pkgs.sh
