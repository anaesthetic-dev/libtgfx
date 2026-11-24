execute_process(
  COMMAND "${LINKER}" /dump /imports "${EXE}"
  OUTPUT_VARIABLE imports
  COMMAND_ERROR_IS_FATAL ANY
)
string(TOLOWER "${imports}" imports)
if(imports MATCHES "lib(egl|glesv2)[.]dll")
  message(FATAL_ERROR "The TGFX smoke executable imports an ANGLE DLL.")
endif()
