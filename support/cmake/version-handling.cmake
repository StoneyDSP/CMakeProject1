# CMake requirements.
cmake_minimum_required(VERSION 3.7...3.24.2)

# set version using external "VERSION" file
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/VERSION.txt LOCAL_VERSION)
string(REGEX MATCH "([0-999]*).[0-999].[0-999].[0-999]" _ ${LOCAL_VERSION})
set(LOCAL_VERSION_MAJOR ${CMAKE_MATCH_1})
string(REGEX MATCH "[0-999].([0-999]*).[0-999].[0-999]" _ ${LOCAL_VERSION})
set(LOCAL_VERSION_MINOR ${CMAKE_MATCH_1})
string(REGEX MATCH "[0-999].[0-999].([0-999]*).[0-999]" _ ${LOCAL_VERSION})
set(LOCAL_VERSION_PATCH ${CMAKE_MATCH_1})
string(REGEX MATCH "[0-999].[0-999].[0-999].([0-999]*)" _ ${LOCAL_VERSION})
set(LOCAL_VERSION_TWEAK ${CMAKE_MATCH_1})
set(_ "")

message(STATUS "detected local version: v${LOCAL_VERSION_MAJOR}.${LOCAL_VERSION_MINOR}.${LOCAL_VERSION_PATCH}.${LOCAL_VERSION_TWEAK}")
