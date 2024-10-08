FROM mcognie/maximecognie-cp22:tortoisebot_base_ros2

WORKDIR /
RUN mkdir -p /ros_ws/src
WORKDIR /ros_ws/src

RUN git clone -b ros2 https://github.com/maxime-cognie/tortoisebot_waypoints.git

RUN sed -i '33d' tortoisebot_waypoints/test/CMakeLists.txt
RUN sed -i '21,28d' tortoisebot_waypoints/test/CMakeLists.txt

WORKDIR /ros_ws/

RUN /bin/bash -c "source /opt/ros/galactic/setup.bash && colcon build"

COPY ./ros_entrypoint.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]