cmake_minimum_required(VERSION 3.20)
project(tgfx_smoke LANGUAGES CXX)

enable_testing()
add_executable(tgfx_smoke smoke.cpp)
target_compile_features(tgfx_smoke PRIVATE cxx_std_17)
target_include_directories(tgfx_smoke PRIVATE "${TGFX_PACKAGE}/include")
target_compile_definitions(tgfx_smoke PRIVATE ANGLE_STATIC=1 ANGLE_EXPORT= EGLAPI= GL_APICALL= GL_API=)
file(STRINGS "${TGFX_PACKAGE}/ANGLE-BUILD-INFO.txt" angle_link_line REGEX "^Windows libraries: ")
string(REGEX REPLACE "^Windows libraries: " "" angle_link_line "${angle_link_line}")
separate_arguments(angle_system_libraries WINDOWS_COMMAND "${angle_link_line}")
target_link_libraries(tgfx_smoke PRIVATE "${TGFX_PACKAGE}/lib/tgfx.lib" ${angle_system_libraries})
add_test(NAME tgfx_smoke COMMAND tgfx_smoke)
add_test(NAME tgfx_static_angle
  COMMAND "${CMAKE_COMMAND}" "-DLINKER=${CMAKE_LINKER}" "-DEXE=$<TARGET_FILE:tgfx_smoke>"
          -P "${CMAKE_CURRENT_SOURCE_DIR}/check-imports.cmake")
add_test(NAME tgfx_dynamic_crt
  COMMAND "${CMAKE_COMMAND}" "-DLINKER=${CMAKE_LINKER}" "-DLIBRARY=${TGFX_PACKAGE}/lib/tgfx.lib"
          -P "${CMAKE_CURRENT_SOURCE_DIR}/check-crt.cmake")
