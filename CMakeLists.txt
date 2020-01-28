cmake_minimum_required(VERSION 3.15)
project(sec_web C)

set(CMAKE_C_STANDARD 99)
set(COMPILE_FLAGS "-m32 -g -std=c99 -fno-stack-protector -Wall -D_GNU_SOURCE")

include_directories(zoobar-lab)

find_package(OpenSSL REQUIRED)

add_executable(zookld zoobar-lab/zookld.c zoobar-lab/http.h zoobar-lab/http.c)
add_executable(zookd zoobar-lab/zookd.c zoobar-lab/http.h zoobar-lab/http.c)
add_executable(zookfs zoobar-lab/zookfs.c zoobar-lab/http.h zoobar-lab/http.c)

target_link_libraries(zookld OpenSSL::SSL)
