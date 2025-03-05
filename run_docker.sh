#!/bin/bash

# docker run -dit    \
#     --name=ros2dog \
#     --net=host     \
#     --privileged   \
#     -v /dev:/dev   \
#     -v /home/maia:/home/maia  \
#     -v /home/maia/.bashrc:/home/maia/.bashrc \
#     -v /run/udev/:/run/udev/ \
#     -w /home/maia/turtlebotDocker ros2turtlebot bash 

docker run -dit    \
    --name=ros2dog \
    --net=host     \
    --privileged   \
    -v /dev:/dev   \
    -v /home/maia:/home/maia  \
    -v /home/maia/.bashrc:/home/maia/.bashrc \
    -w /home/maia/turtlebotDocker ros2turtlebot bash 