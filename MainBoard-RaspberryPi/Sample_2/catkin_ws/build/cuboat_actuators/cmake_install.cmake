# Install script for directory: /home/corvin/catkin_ws/src/cuboat_actuators

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/corvin/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cuboat_actuators/msg" TYPE FILE FILES
    "/home/corvin/catkin_ws/src/cuboat_actuators/msg/propeller.msg"
    "/home/corvin/catkin_ws/src/cuboat_actuators/msg/dock.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cuboat_actuators/action" TYPE FILE FILES "/home/corvin/catkin_ws/src/cuboat_actuators/action/servo.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cuboat_actuators/msg" TYPE FILE FILES
    "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoAction.msg"
    "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionGoal.msg"
    "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionResult.msg"
    "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoActionFeedback.msg"
    "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoGoal.msg"
    "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoResult.msg"
    "/home/corvin/catkin_ws/devel/share/cuboat_actuators/msg/servoFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cuboat_actuators/cmake" TYPE FILE FILES "/home/corvin/catkin_ws/build/cuboat_actuators/catkin_generated/installspace/cuboat_actuators-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/corvin/catkin_ws/devel/include/cuboat_actuators")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/corvin/catkin_ws/devel/share/roseus/ros/cuboat_actuators")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/corvin/catkin_ws/devel/share/common-lisp/ros/cuboat_actuators")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/corvin/catkin_ws/devel/share/gennodejs/ros/cuboat_actuators")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/corvin/catkin_ws/devel/lib/python3/dist-packages/cuboat_actuators")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/corvin/catkin_ws/devel/lib/python3/dist-packages/cuboat_actuators")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/corvin/catkin_ws/build/cuboat_actuators/catkin_generated/installspace/cuboat_actuators.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cuboat_actuators/cmake" TYPE FILE FILES "/home/corvin/catkin_ws/build/cuboat_actuators/catkin_generated/installspace/cuboat_actuators-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cuboat_actuators/cmake" TYPE FILE FILES
    "/home/corvin/catkin_ws/build/cuboat_actuators/catkin_generated/installspace/cuboat_actuatorsConfig.cmake"
    "/home/corvin/catkin_ws/build/cuboat_actuators/catkin_generated/installspace/cuboat_actuatorsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cuboat_actuators" TYPE FILE FILES "/home/corvin/catkin_ws/src/cuboat_actuators/package.xml")
endif()

