# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/corvin/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/corvin/catkin_ws/build

# Include any dependencies generated for this target.
include vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/depend.make

# Include the progress variables for this target.
include vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/progress.make

# Include the compile flags for this target's objects.
include vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/flags.make

vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/src/vrpn_client_node.cpp.o: vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/flags.make
vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/src/vrpn_client_node.cpp.o: /home/corvin/catkin_ws/src/vrpn_client_ros/src/vrpn_client_node.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/corvin/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/src/vrpn_client_node.cpp.o"
	cd /home/corvin/catkin_ws/build/vrpn_client_ros && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vrpn_client_node.dir/src/vrpn_client_node.cpp.o -c /home/corvin/catkin_ws/src/vrpn_client_ros/src/vrpn_client_node.cpp

vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/src/vrpn_client_node.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vrpn_client_node.dir/src/vrpn_client_node.cpp.i"
	cd /home/corvin/catkin_ws/build/vrpn_client_ros && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/corvin/catkin_ws/src/vrpn_client_ros/src/vrpn_client_node.cpp > CMakeFiles/vrpn_client_node.dir/src/vrpn_client_node.cpp.i

vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/src/vrpn_client_node.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vrpn_client_node.dir/src/vrpn_client_node.cpp.s"
	cd /home/corvin/catkin_ws/build/vrpn_client_ros && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/corvin/catkin_ws/src/vrpn_client_ros/src/vrpn_client_node.cpp -o CMakeFiles/vrpn_client_node.dir/src/vrpn_client_node.cpp.s

# Object files for target vrpn_client_node
vrpn_client_node_OBJECTS = \
"CMakeFiles/vrpn_client_node.dir/src/vrpn_client_node.cpp.o"

# External object files for target vrpn_client_node
vrpn_client_node_EXTERNAL_OBJECTS =

/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/src/vrpn_client_node.cpp.o
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/build.make
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /home/corvin/catkin_ws/devel/lib/libvrpn_client_ros.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/libtf2_ros.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/libactionlib.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/libmessage_filters.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/libroscpp.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /usr/lib/aarch64-linux-gnu/libpthread.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /usr/lib/aarch64-linux-gnu/libboost_chrono.so.1.71.0
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /usr/lib/aarch64-linux-gnu/libboost_filesystem.so.1.71.0
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/librosconsole.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /usr/lib/aarch64-linux-gnu/liblog4cxx.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /usr/lib/aarch64-linux-gnu/libboost_regex.so.1.71.0
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/libtf2.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/librostime.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /usr/lib/aarch64-linux-gnu/libboost_date_time.so.1.71.0
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/libcpp_common.so
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /usr/lib/aarch64-linux-gnu/libboost_system.so.1.71.0
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /usr/lib/aarch64-linux-gnu/libboost_thread.so.1.71.0
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /usr/lib/aarch64-linux-gnu/libconsole_bridge.so.0.4
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/libvrpn.a
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: /opt/ros/noetic/lib/libquat.a
/home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node: vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/corvin/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node"
	cd /home/corvin/catkin_ws/build/vrpn_client_ros && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vrpn_client_node.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/build: /home/corvin/catkin_ws/devel/lib/vrpn_client_ros/vrpn_client_node

.PHONY : vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/build

vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/clean:
	cd /home/corvin/catkin_ws/build/vrpn_client_ros && $(CMAKE_COMMAND) -P CMakeFiles/vrpn_client_node.dir/cmake_clean.cmake
.PHONY : vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/clean

vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/depend:
	cd /home/corvin/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/corvin/catkin_ws/src /home/corvin/catkin_ws/src/vrpn_client_ros /home/corvin/catkin_ws/build /home/corvin/catkin_ws/build/vrpn_client_ros /home/corvin/catkin_ws/build/vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vrpn_client_ros/CMakeFiles/vrpn_client_node.dir/depend

