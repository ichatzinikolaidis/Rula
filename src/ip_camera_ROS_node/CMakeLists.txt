cmake_minimum_required(VERSION 2.8.3)
project(ip_camera_node)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz) is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
    roscpp
    sensor_msgs
    cv_bridge
)
find_package(OpenCV 3.1.0 REQUIRED)

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
include_directories(${catkin_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS})

## Declare a cpp executable
add_executable(${PROJECT_NAME} src/ip_camera_node.cpp)

## Specify libraries to link a library or executable target against
target_link_libraries(${PROJECT_NAME} ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})