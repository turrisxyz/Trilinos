ADD_DEFINITIONS(-DBuild64)

IF (${PROJECT_NAME}_ENABLE_Fortran)
  include(FortranCInterface)
  if ("${FortranCInterface_GLOBAL_SUFFIX}" STREQUAL "_")
    ADD_DEFINITIONS(-DADDC_)
  ENDIF()
ENDIF()

IF ("${CMAKE_Fortran_COMPILER_ID}" MATCHES "GNU")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fcray-pointer -fdefault-real-8 -fdefault-integer-8 -fno-range-check")
ELSEIF ("${CMAKE_Fortran_COMPILER_ID}" MATCHES "XL")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -WF,-D__XLF__ -qintsize=8 -qrealsize=8 -qfixed")
ELSEIF ("${CMAKE_Fortran_COMPILER_ID}" MATCHES "Cray")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -sdefault64")
ELSE()
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -r8 -i8")
ENDIF()
