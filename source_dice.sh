#!/bin/sh

source "/opt/ros/humble/setup.bash"
source "woofbot_ws/install/setup.bash"
export ROS_DOMAIN_ID=13
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export CYCLONEDDS_URI="<Discovery><ParticipantIndex>auto</><Peers><Peer Address='rockruff.inf.ed.ac.uk' /><Peer Address='boronthaflore.inf.ed.ac.uk' /></></><Tracing><Verbosity>config</><Out>stderr</></><General><AllowMulticast>false</></>"

export LDS_MODEL=LDS-01
export TURTLEBOT3_MODEL=burger

echo "ROS DICE configured"
