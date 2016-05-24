cmake_minimum_required(VERSION 2.8.3)
project(jaguar_odometry)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz) is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  jaguar4x4
  nav_msgs
  roscpp
  std_msgs
  tf
  message_generation
)

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
catkin_package()

###########
## Build ##
###########
## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(${catkin_INCLUDE_DIRS})

## Declare a cpp executable
add_executable(diff_tf src/diff_tf.cpp)

## Add cmake target dependencies of the executable/library
## as an example, message headers may need to be generated before nodes
add_dependencies(diff_tf jaguar_odometry_generate_messages_cpp ${catkin_EXPORTED_TARGETS})

## Specify libraries to link a library or executable target against
target_link_libraries(diff_tf ${catkin_LIBRARIES})