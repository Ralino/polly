# Copyright (c) 2017, NeroBurner
# All rights reserved.

if(DEFINED POLLY_LINUX_MINGW_W64_)
  return()
else()
  set(POLLY_LINUX_MINGW_W64_ 1)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_init.cmake")

polly_init(
    "Windows / mingw-w64 / x86_64 / c++11 support / static"
    "Unix Makefiles"
)

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_common.cmake")

# need to set system name for cross compiling from linux to windows
set(CMAKE_SYSTEM_NAME Windows)
set(CROSS_COMPILE_TOOLCHAIN_PREFIX "x86_64-w64-mingw32")

set(TOOLCHAIN_PREFIX x86_64-w64-mingw32)

include(
    "${CMAKE_CURRENT_LIST_DIR}/compiler/gcc-cross-compile-simple-layout.cmake"
)
include("${CMAKE_CURRENT_LIST_DIR}/flags/cxx11.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/flags/static.cmake")

# set fortran compiler (part of mingw-w64)
set(CMAKE_Fortran_COMPILER "${TOOLCHAIN_PATH_AND_PREFIX}-gfortran" CACHE PATH "gfortran" )
# set RC compiler
set(CMAKE_RC_COMPILER    "${TOOLCHAIN_PATH_AND_PREFIX}-windres" CACHE PATH "windres" )
