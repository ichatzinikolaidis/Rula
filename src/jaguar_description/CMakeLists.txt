cmake_minimum_required(VERSION 2.8.3)
project(jaguar_description)

find_package(catkin REQUIRED COMPONENTS roslaunch urdf xacro)

catkin_package(
	CATKIN_DEPENDS urdf xacro
)

install(
	DIRECTORY urdf
        DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
