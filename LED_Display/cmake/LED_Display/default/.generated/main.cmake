include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(LED_Display_default_library_list )

set(OUTPUT_SUFFIX elf)
# Handle files with suffix s, for group default-XC32
if(LED_Display_default_default_XC32_FILE_TYPE_assemble)
add_library(LED_Display_default_default_XC32_assemble OBJECT ${LED_Display_default_default_XC32_FILE_TYPE_assemble})
    LED_Display_default_default_XC32_assemble_rule(LED_Display_default_default_XC32_assemble)
    list(APPEND LED_Display_default_library_list "$<TARGET_OBJECTS:LED_Display_default_default_XC32_assemble>")

endif()

# Handle files with suffix S, for group default-XC32
if(LED_Display_default_default_XC32_FILE_TYPE_assembleWithPreprocess)
add_library(LED_Display_default_default_XC32_assembleWithPreprocess OBJECT ${LED_Display_default_default_XC32_FILE_TYPE_assembleWithPreprocess})
    LED_Display_default_default_XC32_assembleWithPreprocess_rule(LED_Display_default_default_XC32_assembleWithPreprocess)
    list(APPEND LED_Display_default_library_list "$<TARGET_OBJECTS:LED_Display_default_default_XC32_assembleWithPreprocess>")

endif()

# Handle files with suffix [cC], for group default-XC32
if(LED_Display_default_default_XC32_FILE_TYPE_compile)
add_library(LED_Display_default_default_XC32_compile OBJECT ${LED_Display_default_default_XC32_FILE_TYPE_compile})
    LED_Display_default_default_XC32_compile_rule(LED_Display_default_default_XC32_compile)
    list(APPEND LED_Display_default_library_list "$<TARGET_OBJECTS:LED_Display_default_default_XC32_compile>")

endif()

# Handle files with suffix cpp, for group default-XC32
if(LED_Display_default_default_XC32_FILE_TYPE_compile_cpp)
add_library(LED_Display_default_default_XC32_compile_cpp OBJECT ${LED_Display_default_default_XC32_FILE_TYPE_compile_cpp})
    LED_Display_default_default_XC32_compile_cpp_rule(LED_Display_default_default_XC32_compile_cpp)
    list(APPEND LED_Display_default_library_list "$<TARGET_OBJECTS:LED_Display_default_default_XC32_compile_cpp>")

endif()

# Handle files with suffix [cC], for group default-XC32
if(LED_Display_default_default_XC32_FILE_TYPE_dependentObject)
add_library(LED_Display_default_default_XC32_dependentObject OBJECT ${LED_Display_default_default_XC32_FILE_TYPE_dependentObject})
    LED_Display_default_default_XC32_dependentObject_rule(LED_Display_default_default_XC32_dependentObject)
    list(APPEND LED_Display_default_library_list "$<TARGET_OBJECTS:LED_Display_default_default_XC32_dependentObject>")

endif()


# Main target for this project
add_executable(LED_Display_default_image_alaSg_Im ${LED_Display_default_library_list})

set_target_properties(LED_Display_default_image_alaSg_Im PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    RUNTIME_OUTPUT_DIRECTORY "${LED_Display_default_output_dir}")
target_link_libraries(LED_Display_default_image_alaSg_Im PRIVATE ${LED_Display_default_default_XC32_FILE_TYPE_link})
# Add the link options from the rule file.
LED_Display_default_link_rule( LED_Display_default_image_alaSg_Im)

# Add bin2hex target for converting built file to a .hex file.
string(REGEX REPLACE [.]elf$ .hex LED_Display_default_image_name_hex ${LED_Display_default_image_name})
add_custom_target(LED_Display_default_Bin2Hex ALL
    COMMAND ${MP_BIN2HEX} \"${LED_Display_default_output_dir}/${LED_Display_default_image_name}\"
    DEPENDS "${LED_Display_default_output_dir}/${LED_Display_default_image_name}"
    BYPRODUCTS ${LED_Display_default_output_dir}/${LED_Display_default_image_name_hex}
    COMMENT "Convert built file to .hex")
add_dependencies(LED_Display_default_Bin2Hex LED_Display_default_image_alaSg_Im)




