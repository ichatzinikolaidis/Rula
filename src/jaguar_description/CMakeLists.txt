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