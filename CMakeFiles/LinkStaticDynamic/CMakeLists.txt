# minimum required cmake version
cmake_minimum_required(VERSION 3.12)
 
# set project and ots properties
project(idlrtkInterface)
set_target_properties(idlrtkInterface PROPERTIES LINKER_LANGUAGE CXX)
set (CMAKE_CXX_FLAGS "-fPIC")   #-std=c++11

# update old version cmake policy to be compaible with 3.12
foreach(p
    CMP0042 # CMake 3.0
    CMP0063 # CMake 3.3.2
    )
  if(POLICY ${p})
    cmake_policy(SET ${p} NEW)
  endif()
endforeach()

# set default install path
if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
get_filename_component(PARENT_DIR ${CMAKE_CURRENT_SOURCE_DIR} DIRECTORY)
    set (CMAKE_INSTALL_PREFIX "${PARENT_DIR}/bin" CACHE PATH "default install path" FORCE )
Message("CMAKE_INSTALL_PATH is self-defined!")
endif()

# set build type
if( NOT CMAKE_BUILD_TYPE )
set( CMAKE_BUILD_TYPE Debug CACHE STRING
       "Choose the type of build, options are: None Debug Release RelWithDebInfo
MinSizeRel."
       FORCE )
endif()

# find required packages
find_package (ITK)
if (ITK_FOUND)
	include ( ${ITK_USE_FILE} )
else (ITK_FOUND)
	message (FATAL_ERROR "Cannot build without ITK, Please set ITK_DIR.")
endif (ITK_FOUND)

option(ITK_USE_GPU "GPU acceleration via OpenCL" OFF)
mark_as_advanced(ITK_USE_GPU)

# set paths
set(ARMA_USE_FILE /home/tsun/bin/armadillo-9.400.4/install/include)
set(OPTIM_USE_FILE  /home/tsun/bin/optim-master/install/include/optim)
set(SPLINE_USE_PATH /home/tsun/bin/spline-master/src)

# debug info
Message(STATUS "external libraries:" ${ITK_LIBRARIES})
# cmake_print_variables(MY_VARIABLE)

# set include - valid for all subdirectories!
include_directories(${ARMA_USE_FILE} ${OPTIM_USE_FILE})   

# set link directories to find
link_directories(/home/tsun/bin/armadillo-9.400.4/install/lib64/)

# group all files to be used
# file(GLOB TPC_USE_SOURCE ${CMAKE_CURRENT_SOURCE_DIR})

# add executable, dynamic library, static library
add_executable (idlrtkInterface idlrtkInterface.cxx idlrtkInterface.h)
add_library(idlrtkInterface_so SHARED idlrtkInterface.cxx idlrtkInterface.h )
add_library(idlrtkInterface_a STATIC idlrtkInterface.cxx idlrtkInterface.h )

# include headers - only for target!
# target_include_directories (idlrtkInterface PRIVATE ${ARMA_USE_FILE} 
# ${OPTIM_USE_FILE} ${SPLINE_USE_PATH})

# link dynamic libraries
target_link_libraries(idlrtkInterface_so  ${ITK_LIBRARIES} 
armadillo 
gomp)		 

#link shared libraries
target_link_libraries(idlrtkInterface_a  ${ITK_LIBRARIES_STATIC})	

