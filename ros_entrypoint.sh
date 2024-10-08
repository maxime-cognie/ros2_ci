#!/bin/bash

source /ros_ws/install/setup.bash
source /ros2_ws/install/setup.bash

# Execute the command passed into this entrypoint
exec "$@"