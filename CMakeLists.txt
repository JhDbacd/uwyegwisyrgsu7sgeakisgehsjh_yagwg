project(MyModMenu)

cmake_minimum_required(VERSION 3.4.1)

set(CMAKE_ANDROID_STL_TYPE "none")

add_library(native-lib SHARED src/native-lib.cpp)

#include_directories(include)

find_library(log-lib log)

target_link_libraries(native-lib ${log-lib})
