#!/bin/bash
set -e

# Source the ROS 2 setup file
source "/opt/ros/humble/setup.bash"
cd "/home/maia/turtlebotDocker/woofbot_ws"
source "install/setup.bash"
export ROS_DOMAIN_ID=13
echo "Running entrypoint"

# Run systemd-udevd (ensure it's needed)
/lib/systemd/systemd-udevd --daemon

# Optionally copy rules if needed
# cp `ros2 pkg prefix turtlebot3_bringup`/share/turtlebot3_bringup/script/99-turtlebot3-cdc.rules /etc/udev/rules.d/

# Reload udev rules and trigger
udevadm control --reload-rules
udevadm trigger

# Execute the command passed to the script
exec "$@"
