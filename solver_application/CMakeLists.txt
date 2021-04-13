cmake_minimum_required(VERSION 3.4)
project(solver)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(myExe equation.cpp)

add_library(formatter STATIC ${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib/formatter.cpp)
add_library(formatter_ex STATIC ${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib/formatter_ex.cpp)
add_library(solver_lib STATIC ${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib/solver.cpp)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib)

target_link_libraries(formatter_ex formatter)

target_link_libraries(myExe formatter_ex)
target_link_libraries(myExe solver_lib)
