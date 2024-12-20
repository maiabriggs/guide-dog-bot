#Ubuntu Base Image
FROM ubuntu:22.04

# Set environment variables to non-interactive to avoid any prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary tools and dependencies
RUN apt-get update && \
    apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    nano \
    udev \
    python3-pip \
    gdb \
    locales && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Add the ROS 2 GPG key
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

# Add the ROS 2 repository
RUN sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

# Install ROS 2 packages and X11 dependencies
RUN apt-get update && \
    apt-get install --fix-missing -y \
    ros-humble-ros-base 

RUN apt-get install -y ros-dev-tools \
    libgl1-mesa-glx \
    gh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y \
    python3-argcomplete python3-colcon-common-extensions libboost-system-dev build-essential \
    ros-humble-hls-lfcd-lds-driver \
    ros-humble-turtlebot3-msgs \
    ros-humble-dynamixel-sdk \
    libudev-dev \
    x11-apps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#Libcamera dependencies
RUN apt-get update && \
    apt-get install -y \
    meson ninja-build \
    python3 -ply \
    python3-jinja2 \
    openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/maia/turtlebotDocker

# Add the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Source the ROS 2 setup script
RUN echo "source /opt/ros/humble/setup.bash" >> /etc/bash.bashrc

# Expose any necessary ports (e.g., for remote connections or web interfaces)
EXPOSE 11311

CMD ["/bin/bash"]