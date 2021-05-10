#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "solver_lib" for configuration ""
set_property(TARGET solver_lib APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(solver_lib PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libsolver_lib.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS solver_lib )
list(APPEND _IMPORT_CHECK_FILES_FOR_solver_lib "${_IMPORT_PREFIX}/lib/libsolver_lib.a" )

# Import target "formatter" for configuration ""
set_property(TARGET formatter APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(formatter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libformatter.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS formatter )
list(APPEND _IMPORT_CHECK_FILES_FOR_formatter "${_IMPORT_PREFIX}/lib/libformatter.a" )

# Import target "formatter_ex" for configuration ""
set_property(TARGET formatter_ex APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(formatter_ex PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libformatter_ex.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS formatter_ex )
list(APPEND _IMPORT_CHECK_FILES_FOR_formatter_ex "${_IMPORT_PREFIX}/lib/libformatter_ex.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
