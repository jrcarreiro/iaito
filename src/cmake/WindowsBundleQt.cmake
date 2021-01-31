message("Running windeployqt")
execute_process(COMMAND windeployqt r2cutter.exe
        --plugindir "qtplugins"
        --no-translations # r2cutter currently isn't loading Qt translation file
    WORKING_DIRECTORY ${CMAKE_INSTALL_PREFIX}
    RESULT_VARIABLE SCRIPT_RESULT)
if (SCRIPT_RESULT)
    message(FATAL_ERROR "Failed to bundle python")
endif()
file(WRITE "${CMAKE_INSTALL_PREFIX}/qt.conf" "[PATHS]\nPlugins = qtplugins")
