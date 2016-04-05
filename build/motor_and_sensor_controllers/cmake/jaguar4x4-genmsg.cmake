# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "jaguar4x4: 5 messages, 0 services")

set(MSG_I_FLAGS "-Ijaguar4x4:/home/iordanis/Roula/src/motor_and_sensor_controllers/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(jaguar4x4_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorDataArray.msg" NAME_WE)
add_custom_target(_jaguar4x4_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "jaguar4x4" "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorDataArray.msg" "jaguar4x4/MotorData:std_msgs/Header"
)

get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfo.msg" NAME_WE)
add_custom_target(_jaguar4x4_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "jaguar4x4" "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfo.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorData.msg" NAME_WE)
add_custom_target(_jaguar4x4_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "jaguar4x4" "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorData.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfoArray.msg" NAME_WE)
add_custom_target(_jaguar4x4_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "jaguar4x4" "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfoArray.msg" "std_msgs/Header:jaguar4x4/MotorBoardInfo"
)

get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/GPSInfo.msg" NAME_WE)
add_custom_target(_jaguar4x4_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "jaguar4x4" "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/GPSInfo.msg" "std_msgs/Header"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorDataArray.msg"
  "${MSG_I_FLAGS}"
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorData.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jaguar4x4
)
_generate_msg_cpp(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfoArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jaguar4x4
)
_generate_msg_cpp(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jaguar4x4
)
_generate_msg_cpp(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/GPSInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jaguar4x4
)
_generate_msg_cpp(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jaguar4x4
)

### Generating Services

### Generating Module File
_generate_module_cpp(jaguar4x4
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jaguar4x4
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(jaguar4x4_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(jaguar4x4_generate_messages jaguar4x4_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorDataArray.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_cpp _jaguar4x4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfo.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_cpp _jaguar4x4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorData.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_cpp _jaguar4x4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfoArray.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_cpp _jaguar4x4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/GPSInfo.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_cpp _jaguar4x4_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jaguar4x4_gencpp)
add_dependencies(jaguar4x4_gencpp jaguar4x4_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jaguar4x4_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorDataArray.msg"
  "${MSG_I_FLAGS}"
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorData.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jaguar4x4
)
_generate_msg_lisp(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfoArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jaguar4x4
)
_generate_msg_lisp(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jaguar4x4
)
_generate_msg_lisp(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/GPSInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jaguar4x4
)
_generate_msg_lisp(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jaguar4x4
)

### Generating Services

### Generating Module File
_generate_module_lisp(jaguar4x4
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jaguar4x4
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(jaguar4x4_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(jaguar4x4_generate_messages jaguar4x4_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorDataArray.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_lisp _jaguar4x4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfo.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_lisp _jaguar4x4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorData.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_lisp _jaguar4x4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfoArray.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_lisp _jaguar4x4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/GPSInfo.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_lisp _jaguar4x4_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jaguar4x4_genlisp)
add_dependencies(jaguar4x4_genlisp jaguar4x4_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jaguar4x4_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorDataArray.msg"
  "${MSG_I_FLAGS}"
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorData.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jaguar4x4
)
_generate_msg_py(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfoArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jaguar4x4
)
_generate_msg_py(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jaguar4x4
)
_generate_msg_py(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/GPSInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jaguar4x4
)
_generate_msg_py(jaguar4x4
  "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jaguar4x4
)

### Generating Services

### Generating Module File
_generate_module_py(jaguar4x4
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jaguar4x4
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(jaguar4x4_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(jaguar4x4_generate_messages jaguar4x4_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorDataArray.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_py _jaguar4x4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfo.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_py _jaguar4x4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorData.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_py _jaguar4x4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/MotorBoardInfoArray.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_py _jaguar4x4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/iordanis/Roula/src/motor_and_sensor_controllers/msg/GPSInfo.msg" NAME_WE)
add_dependencies(jaguar4x4_generate_messages_py _jaguar4x4_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(jaguar4x4_genpy)
add_dependencies(jaguar4x4_genpy jaguar4x4_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS jaguar4x4_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jaguar4x4)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/jaguar4x4
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(jaguar4x4_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jaguar4x4)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/jaguar4x4
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(jaguar4x4_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jaguar4x4)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jaguar4x4\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/jaguar4x4
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(jaguar4x4_generate_messages_py std_msgs_generate_messages_py)
