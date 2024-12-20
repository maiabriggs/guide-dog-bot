#!/bin/bash

colcon build --symlink-install

source install/setup.bash
echo "sourced install"