cmake_minimum_required(VERSION 2.8.3)
project(jaguar_description)

find_package(catkin REQUIRED COMPONENTS roslaunch urdf xacro tf roscpp sensor_msgs geometry_msgs)

catkin_package(
	CATKIN_DEPENDS urdf xacro sensor_msgs
)

install(
	DIRECTORY urdf
        DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

#add_executable(static_odom_frame src/static_odom_frame.cpp)

#target_link_libraries(static_odom_frame ${catkin_LIBRARIES})