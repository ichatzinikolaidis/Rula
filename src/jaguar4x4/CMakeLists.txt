cmake_minimum_required(VERSION 2.8.3)
project(jaguar4x4)
set(CMAKE_CXX_FLAGS "-std=c++11 -O2")

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz) is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
	roscpp
	std_msgs
	message_generation

	geometry_msgs
)

## System dependencies are found with CMake's conventions
find_package(Boost REQUIRED COMPONENTS system)

#######################################
## Declare ROS messages and services ##
#######################################
## Generate messages in the 'msg' folder
add_message_files(FILES
	MotorBoardInfo.msg
	MotorBoardInfoArray.msg
	MotorData.msg
	MotorDataArray.msg
)

## Generate added messages and services with any dependencies listed here
generate_messages(DEPENDENCIES std_msgs)

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## CATKIN_DEPENDS: catkin_packages dependent projects also need
catkin_package(CATKIN_DEPENDS message_runtime)

###########
## Build ##
###########
## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(include ${catkin_INCLUDE_DIRS})

## Declare a cpp executable
add_executable(jaguar4x4_Controller src/motor_and_sensors_controller.cpp src/DrRobotMotionSensorDriver.cpp)

## Add cmake target dependencies of the executable/library
## as an example, message headers may need to be generated before nodes
add_dependencies(jaguar4x4_Controller jaguar4x4_generate_messages_cpp)

## Specify libraries to link a library or executable target against
target_link_libraries(jaguar4x4_Controller ${catkin_LIBRARIES})