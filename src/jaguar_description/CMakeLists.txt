cmake_minimum_required(VERSION 2.8.3)
project(jaguar_description)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz) is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
	urdf
	xacro
	tf
	roscpp
	sensor_msgs
)

## The catkin_package macro generates cmake config files for your package
catkin_package()

## Declare a cpp executable
#add_executable(static_odom_frame src/static_odom_frame.cpp)

## Specify libraries to link a library or executable target against
#target_link_libraries(static_odom_frame ${catkin_LIBRARIES})