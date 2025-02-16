#!/bin/bash

# Build the Docker image
docker build -t ros2turtlebot .

# Run the container with the entrypoint script
docker run -dit --name=ros2dog --ipc=host --pid=host --net=host --privileged -v /dev:/dev -v /home/maia:/home/maia -v /home/maia/.bashrc:/home/maia/.bashrc -w /home/maia/turtlebotDocker ros2turtlebot bash


