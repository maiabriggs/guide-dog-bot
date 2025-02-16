#!/bin/bash

# Build the Docker image
docker build -t ros2turtlebot .

# Run the container with the entrypoint script
docker run -dit --name=ros3dog --net=host --ipc=host --pid=host --privileged -v /dev:/dev -v /home/maia:/home/maia -v /home/maia/.bashrc:/home/maia/.bashrc -w /home/maia/turtlebotDocker ros2turtlebot bash


