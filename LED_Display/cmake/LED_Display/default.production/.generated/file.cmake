# The following variables contains the files used by the different stages of the build process.
set(LED_Display_default_default_XC32_FILE_TYPE_assemble)
set_source_files_properties(${LED_Display_default_default_XC32_FILE_TYPE_assemble} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${LED_Display_default_default_XC32_FILE_TYPE_assemble})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(LED_Display_default_default_XC32_FILE_TYPE_assembleWithPreprocess)
set_source_files_properties(${LED_Display_default_default_XC32_FILE_TYPE_assembleWithPreprocess} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${LED_Display_default_default_XC32_FILE_TYPE_assembleWithPreprocess})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(LED_Display_default_default_XC32_FILE_TYPE_compile
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Src/Examples/display_example1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Src/Examples/display_example2.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Src/Examples/display_example3.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Src/Examples/display_example4.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Src/Examples/display_example5.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Src/Examples/display_example6.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Src/Examples/display_template.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../Src/displayDriver/displayDriver.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../main.c")
set_source_files_properties(${LED_Display_default_default_XC32_FILE_TYPE_compile} PROPERTIES LANGUAGE C)
set(LED_Display_default_default_XC32_FILE_TYPE_compile_cpp)
set_source_files_properties(${LED_Display_default_default_XC32_FILE_TYPE_compile_cpp} PROPERTIES LANGUAGE CXX)
set(LED_Display_default_default_XC32_FILE_TYPE_link)
set(LED_Display_default_image_name "default-production.elf")
set(LED_Display_default_image_base_name "default-production")

# The output directory of the final image.
set(LED_Display_default_output_dir "${CMAKE_CURRENT_SOURCE_DIR}/../../../out/LED_Display/production")

# The full path to the final image.
set(LED_Display_default_full_path_to_image ${LED_Display_default_output_dir}/${LED_Display_default_image_name})
