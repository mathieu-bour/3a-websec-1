# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

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
CMAKE_COMMAND = /snap/clion/100/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/100/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mathieu/Documents/sec-web

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mathieu/Documents/sec-web/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/zookld.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/zookld.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/zookld.dir/flags.make

CMakeFiles/zookld.dir/zoobar-lab/zookld.c.o: CMakeFiles/zookld.dir/flags.make
CMakeFiles/zookld.dir/zoobar-lab/zookld.c.o: ../zoobar-lab/zookld.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mathieu/Documents/sec-web/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/zookld.dir/zoobar-lab/zookld.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zookld.dir/zoobar-lab/zookld.c.o   -c /home/mathieu/Documents/sec-web/zoobar-lab/zookld.c

CMakeFiles/zookld.dir/zoobar-lab/zookld.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zookld.dir/zoobar-lab/zookld.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mathieu/Documents/sec-web/zoobar-lab/zookld.c > CMakeFiles/zookld.dir/zoobar-lab/zookld.c.i

CMakeFiles/zookld.dir/zoobar-lab/zookld.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zookld.dir/zoobar-lab/zookld.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mathieu/Documents/sec-web/zoobar-lab/zookld.c -o CMakeFiles/zookld.dir/zoobar-lab/zookld.c.s

CMakeFiles/zookld.dir/zoobar-lab/http.c.o: CMakeFiles/zookld.dir/flags.make
CMakeFiles/zookld.dir/zoobar-lab/http.c.o: ../zoobar-lab/http.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mathieu/Documents/sec-web/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/zookld.dir/zoobar-lab/http.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zookld.dir/zoobar-lab/http.c.o   -c /home/mathieu/Documents/sec-web/zoobar-lab/http.c

CMakeFiles/zookld.dir/zoobar-lab/http.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zookld.dir/zoobar-lab/http.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mathieu/Documents/sec-web/zoobar-lab/http.c > CMakeFiles/zookld.dir/zoobar-lab/http.c.i

CMakeFiles/zookld.dir/zoobar-lab/http.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zookld.dir/zoobar-lab/http.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mathieu/Documents/sec-web/zoobar-lab/http.c -o CMakeFiles/zookld.dir/zoobar-lab/http.c.s

# Object files for target zookld
zookld_OBJECTS = \
"CMakeFiles/zookld.dir/zoobar-lab/zookld.c.o" \
"CMakeFiles/zookld.dir/zoobar-lab/http.c.o"

# External object files for target zookld
zookld_EXTERNAL_OBJECTS =

zookld: CMakeFiles/zookld.dir/zoobar-lab/zookld.c.o
zookld: CMakeFiles/zookld.dir/zoobar-lab/http.c.o
zookld: CMakeFiles/zookld.dir/build.make
zookld: /usr/lib/x86_64-linux-gnu/libssl.so
zookld: /usr/lib/x86_64-linux-gnu/libcrypto.so
zookld: CMakeFiles/zookld.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mathieu/Documents/sec-web/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable zookld"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/zookld.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/zookld.dir/build: zookld

.PHONY : CMakeFiles/zookld.dir/build

CMakeFiles/zookld.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/zookld.dir/cmake_clean.cmake
.PHONY : CMakeFiles/zookld.dir/clean

CMakeFiles/zookld.dir/depend:
	cd /home/mathieu/Documents/sec-web/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mathieu/Documents/sec-web /home/mathieu/Documents/sec-web /home/mathieu/Documents/sec-web/cmake-build-debug /home/mathieu/Documents/sec-web/cmake-build-debug /home/mathieu/Documents/sec-web/cmake-build-debug/CMakeFiles/zookld.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/zookld.dir/depend
