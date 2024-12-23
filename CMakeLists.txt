cmake_minimum_required(VERSION 3.16)

project(RaylibGame VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SRC_DIR ${CMAKE_SOURCE_DIR}/src)

set(RAYLIB_DIR ${CMAKE_SOURCE_DIR}/vendor/raylib)

add_subdirectory(${RAYLIB_DIR})
if (APPLE)
    set(CMAKE_OSX_ARCHITECTURES "arm64")
endif()

file(GLOB_RECURSE SOURCES ${SRC_DIR}/*.cpp)

add_executable(${PROJECT_NAME} ${SOURCES})

target_link_libraries(${PROJECT_NAME} raylib)

target_include_directories(${PROJECT_NAME} 
    PRIVATE ${SRC_DIR}
    PRIVATE ${RAYLIB_DIR}/src
)

if (CMAKE_SYSTEM_NAME STREQUAL "Linux")
    target_link_libraries(${PROJECT_NAME} m)
endif()

message(STATUS "Project: ${PROJECT_NAME}")
message(STATUS "Using raylib from: ${RAYLIB_DIR}")
message(STATUS "Source directory: ${SRC_DIR}")
