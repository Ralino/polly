# Copyright (c) 2015, 2017 Alexandre Pretyman
# All rights reserved.

if(DEFINED POLLY_RASPBERRYPI3_CXX14_CMAKE)
  return()
else()
  set(POLLY_RASPBERRYPI3_CXX14_CMAKE 1)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_init.cmake")

polly_init(
    "RaspberryPi 3 Cross Compile / C++14"
    "Unix Makefiles"
)

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_common.cmake")

include(polly_clear_environment_variables)

include("${CMAKE_CURRENT_LIST_DIR}/flags/cxx14.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/compiler/gcc-cross-compile-raspberry-pi.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/os/raspberry-pi3.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/os/raspberry-pi-hardfloat.cmake")

set(THREADS_PTHREAD_ARG 0 CACHE STRING "Result from TRY_RUN" FORCE)

file(GLOB Qt_bin /usr/bin)
find_program(QT_MOC_EXECUTABLE qt_moc moc PATHS ${Qt_bin})
add_executable(Qt5::moc IMPORTED)
set_property(TARGET Qt5::moc PROPERTY IMPORTED_LOCATION ${QT_MOC_EXECUTABLE})
find_program(QT_UIC_EXECUTABLE qt_uic uic PATHS ${Qt_bin})
add_executable(Qt5::uic IMPORTED)
set_property(TARGET Qt5::uic PROPERTY IMPORTED_LOCATION ${QT_UIC_EXECUTABLE})
