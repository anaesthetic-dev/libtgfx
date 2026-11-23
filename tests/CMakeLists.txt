cmake_minimum_required(VERSION 3.20)
project(tgfx_smoke LANGUAGES CXX)

enable_testing()
add_executable(tgfx_smoke smoke.cpp)
target_compile_features(tgfx_smoke PRIVATE cxx_std_17)
target_include_directories(tgfx_smoke PRIVATE "${TGFX_PACKAGE}/include")
target_link_libraries(tgfx_smoke PRIVATE "${TGFX_PACKAGE}/lib/tgfx.lib")
add_test(NAME tgfx_smoke COMMAND tgfx_smoke)
