# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "cuboat_actuators: 9 messages, 0 services")

set(MSG_I_FLAGS "-Icuboat_actuators:/home/corvin/catkin_ws/src/cuboat_actuators/msg;-Icuboat_actuators:/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(cuboat_actuators_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg" NAME_WE)
add_custom_target(_cuboat_actuators_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cuboat_actuators" "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg" ""
)

get_filename_component(_filename "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg" NAME_WE)
add_custom_target(_cuboat_actuators_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cuboat_actuators" "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg" ""
)

get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg" NAME_WE)
add_custom_target(_cuboat_actuators_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cuboat_actuators" "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:cuboat_actuators/servoFeedback:cuboat_actuators/servoActionGoal:cuboat_actuators/servoGoal:cuboat_actuators/servoResult:cuboat_actuators/servoActionResult:std_msgs/Header:cuboat_actuators/servoActionFeedback"
)

get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg" NAME_WE)
add_custom_target(_cuboat_actuators_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cuboat_actuators" "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg" "actionlib_msgs/GoalID:std_msgs/Header:cuboat_actuators/servoGoal"
)

get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg" NAME_WE)
add_custom_target(_cuboat_actuators_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cuboat_actuators" "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg" "actionlib_msgs/GoalID:std_msgs/Header:cuboat_actuators/servoResult:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg" NAME_WE)
add_custom_target(_cuboat_actuators_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cuboat_actuators" "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg" "actionlib_msgs/GoalID:std_msgs/Header:actionlib_msgs/GoalStatus:cuboat_actuators/servoFeedback"
)

get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg" NAME_WE)
add_custom_target(_cuboat_actuators_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cuboat_actuators" "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg" ""
)

get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg" NAME_WE)
add_custom_target(_cuboat_actuators_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cuboat_actuators" "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg" ""
)

get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg" NAME_WE)
add_custom_target(_cuboat_actuators_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cuboat_actuators" "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(cuboat_actuators
  "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_cpp(cuboat_actuators
  "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_cpp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_cpp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_cpp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_cpp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_cpp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_cpp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_cpp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cuboat_actuators
)

### Generating Services

### Generating Module File
_generate_module_cpp(cuboat_actuators
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cuboat_actuators
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(cuboat_actuators_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(cuboat_actuators_generate_messages cuboat_actuators_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_cpp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_cpp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_cpp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_cpp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_cpp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_cpp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_cpp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_cpp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_cpp _cuboat_actuators_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cuboat_actuators_gencpp)
add_dependencies(cuboat_actuators_gencpp cuboat_actuators_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cuboat_actuators_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(cuboat_actuators
  "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_eus(cuboat_actuators
  "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_eus(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_eus(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_eus(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_eus(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_eus(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_eus(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_eus(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cuboat_actuators
)

### Generating Services

### Generating Module File
_generate_module_eus(cuboat_actuators
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cuboat_actuators
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(cuboat_actuators_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(cuboat_actuators_generate_messages cuboat_actuators_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_eus _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_eus _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_eus _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_eus _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_eus _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_eus _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_eus _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_eus _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_eus _cuboat_actuators_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cuboat_actuators_geneus)
add_dependencies(cuboat_actuators_geneus cuboat_actuators_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cuboat_actuators_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(cuboat_actuators
  "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_lisp(cuboat_actuators
  "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_lisp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_lisp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_lisp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_lisp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_lisp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_lisp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_lisp(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cuboat_actuators
)

### Generating Services

### Generating Module File
_generate_module_lisp(cuboat_actuators
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cuboat_actuators
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(cuboat_actuators_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(cuboat_actuators_generate_messages cuboat_actuators_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_lisp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_lisp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_lisp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_lisp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_lisp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_lisp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_lisp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_lisp _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_lisp _cuboat_actuators_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cuboat_actuators_genlisp)
add_dependencies(cuboat_actuators_genlisp cuboat_actuators_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cuboat_actuators_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(cuboat_actuators
  "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_nodejs(cuboat_actuators
  "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_nodejs(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_nodejs(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_nodejs(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_nodejs(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_nodejs(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_nodejs(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_nodejs(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cuboat_actuators
)

### Generating Services

### Generating Module File
_generate_module_nodejs(cuboat_actuators
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cuboat_actuators
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(cuboat_actuators_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(cuboat_actuators_generate_messages cuboat_actuators_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_nodejs _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_nodejs _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_nodejs _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_nodejs _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_nodejs _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_nodejs _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_nodejs _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_nodejs _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_nodejs _cuboat_actuators_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cuboat_actuators_gennodejs)
add_dependencies(cuboat_actuators_gennodejs cuboat_actuators_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cuboat_actuators_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(cuboat_actuators
  "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_py(cuboat_actuators
  "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_py(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_py(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_py(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_py(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_py(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_py(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators
)
_generate_msg_py(cuboat_actuators
  "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators
)

### Generating Services

### Generating Module File
_generate_module_py(cuboat_actuators
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(cuboat_actuators_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(cuboat_actuators_generate_messages cuboat_actuators_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_py _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_py _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_py _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_py _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_py _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_py _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_py _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_py _cuboat_actuators_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg" NAME_WE)
add_dependencies(cuboat_actuators_generate_messages_py _cuboat_actuators_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cuboat_actuators_genpy)
add_dependencies(cuboat_actuators_genpy cuboat_actuators_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cuboat_actuators_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cuboat_actuators)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cuboat_actuators
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(cuboat_actuators_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(cuboat_actuators_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cuboat_actuators)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cuboat_actuators
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(cuboat_actuators_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(cuboat_actuators_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cuboat_actuators)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cuboat_actuators
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(cuboat_actuators_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(cuboat_actuators_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cuboat_actuators)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cuboat_actuators
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(cuboat_actuators_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(cuboat_actuators_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cuboat_actuators
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(cuboat_actuators_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(cuboat_actuators_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
