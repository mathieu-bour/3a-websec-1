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
include CMakeFiles/sec_web.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sec_web.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sec_web.dir/flags.make

CMakeFiles/sec_web.dir/zoobar-lab/http.c.o: CMakeFiles/sec_web.dir/flags.make
CMakeFiles/sec_web.dir/zoobar-lab/http.c.o: ../zoobar-lab/http.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mathieu/Documents/sec-web/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/sec_web.dir/zoobar-lab/http.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sec_web.dir/zoobar-lab/http.c.o   -c /home/mathieu/Documents/sec-web/zoobar-lab/http.c

CMakeFiles/sec_web.dir/zoobar-lab/http.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sec_web.dir/zoobar-lab/http.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mathieu/Documents/sec-web/zoobar-lab/http.c > CMakeFiles/sec_web.dir/zoobar-lab/http.c.i

CMakeFiles/sec_web.dir/zoobar-lab/http.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sec_web.dir/zoobar-lab/http.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mathieu/Documents/sec-web/zoobar-lab/http.c -o CMakeFiles/sec_web.dir/zoobar-lab/http.c.s

CMakeFiles/sec_web.dir/zoobar-lab/zookd.c.o: CMakeFiles/sec_web.dir/flags.make
CMakeFiles/sec_web.dir/zoobar-lab/zookd.c.o: ../zoobar-lab/zookd.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mathieu/Documents/sec-web/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/sec_web.dir/zoobar-lab/zookd.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sec_web.dir/zoobar-lab/zookd.c.o   -c /home/mathieu/Documents/sec-web/zoobar-lab/zookd.c

CMakeFiles/sec_web.dir/zoobar-lab/zookd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sec_web.dir/zoobar-lab/zookd.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mathieu/Documents/sec-web/zoobar-lab/zookd.c > CMakeFiles/sec_web.dir/zoobar-lab/zookd.c.i

CMakeFiles/sec_web.dir/zoobar-lab/zookd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sec_web.dir/zoobar-lab/zookd.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mathieu/Documents/sec-web/zoobar-lab/zookd.c -o CMakeFiles/sec_web.dir/zoobar-lab/zookd.c.s

CMakeFiles/sec_web.dir/zoobar-lab/zookfs.c.o: CMakeFiles/sec_web.dir/flags.make
CMakeFiles/sec_web.dir/zoobar-lab/zookfs.c.o: ../zoobar-lab/zookfs.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mathieu/Documents/sec-web/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/sec_web.dir/zoobar-lab/zookfs.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sec_web.dir/zoobar-lab/zookfs.c.o   -c /home/mathieu/Documents/sec-web/zoobar-lab/zookfs.c

CMakeFiles/sec_web.dir/zoobar-lab/zookfs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sec_web.dir/zoobar-lab/zookfs.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mathieu/Documents/sec-web/zoobar-lab/zookfs.c > CMakeFiles/sec_web.dir/zoobar-lab/zookfs.c.i

CMakeFiles/sec_web.dir/zoobar-lab/zookfs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sec_web.dir/zoobar-lab/zookfs.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mathieu/Documents/sec-web/zoobar-lab/zookfs.c -o CMakeFiles/sec_web.dir/zoobar-lab/zookfs.c.s

CMakeFiles/sec_web.dir/zoobar-lab/zookld.c.o: CMakeFiles/sec_web.dir/flags.make
CMakeFiles/sec_web.dir/zoobar-lab/zookld.c.o: ../zoobar-lab/zookld.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mathieu/Documents/sec-web/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/sec_web.dir/zoobar-lab/zookld.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sec_web.dir/zoobar-lab/zookld.c.o   -c /home/mathieu/Documents/sec-web/zoobar-lab/zookld.c

CMakeFiles/sec_web.dir/zoobar-lab/zookld.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sec_web.dir/zoobar-lab/zookld.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mathieu/Documents/sec-web/zoobar-lab/zookld.c > CMakeFiles/sec_web.dir/zoobar-lab/zookld.c.i

CMakeFiles/sec_web.dir/zoobar-lab/zookld.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sec_web.dir/zoobar-lab/zookld.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mathieu/Documents/sec-web/zoobar-lab/zookld.c -o CMakeFiles/sec_web.dir/zoobar-lab/zookld.c.s

# Object files for target sec_web
sec_web_OBJECTS = \
"CMakeFiles/sec_web.dir/zoobar-lab/http.c.o" \
"CMakeFiles/sec_web.dir/zoobar-lab/zookd.c.o" \
"CMakeFiles/sec_web.dir/zoobar-lab/zookfs.c.o" \
"CMakeFiles/sec_web.dir/zoobar-lab/zookld.c.o"

# External object files for target sec_web
sec_web_EXTERNAL_OBJECTS =

sec_web: CMakeFiles/sec_web.dir/zoobar-lab/http.c.o
sec_web: CMakeFiles/sec_web.dir/zoobar-lab/zookd.c.o
sec_web: CMakeFiles/sec_web.dir/zoobar-lab/zookfs.c.o
sec_web: CMakeFiles/sec_web.dir/zoobar-lab/zookld.c.o
sec_web: CMakeFiles/sec_web.dir/build.make
sec_web: CMakeFiles/sec_web.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mathieu/Documents/sec-web/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking C executable sec_web"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sec_web.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sec_web.dir/build: sec_web

.PHONY : CMakeFiles/sec_web.dir/build

CMakeFiles/sec_web.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sec_web.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sec_web.dir/clean

CMakeFiles/sec_web.dir/depend:
	cd /home/mathieu/Documents/sec-web/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mathieu/Documents/sec-web /home/mathieu/Documents/sec-web /home/mathieu/Documents/sec-web/cmake-build-debug /home/mathieu/Documents/sec-web/cmake-build-debug /home/mathieu/Documents/sec-web/cmake-build-debug/CMakeFiles/sec_web.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sec_web.dir/depend
