execute_process(
  COMMAND "${LINKER}" /dump /directives "${LIBRARY}"
  OUTPUT_VARIABLE directives
  COMMAND_ERROR_IS_FATAL ANY
)
string(TOUPPER "${directives}" directives)
if(directives MATCHES "DEFAULTLIB:\"?(LIBCMT|LIBCPMT|MSVCRTD|MSVCPRTD)([.\" \t\r\n]|$)"
   OR directives MATCHES "RUNTIMELIBRARY=(MT|MDD)_" )
  message(FATAL_ERROR "tgfx.lib contains objects that use a static or debug MSVC CRT.")
endif()
if(NOT directives MATCHES "DEFAULTLIB:\"?MSVCRT([.\" \t\r\n]|$)")
  message(FATAL_ERROR "No release dynamic CRT directives found in tgfx.lib.")
endif()
