set(SRC_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../Src")

target_include_directories(LED_Display_default_default_XC32_compile PRIVATE
    "${SRC_DIR}/displayDriver"
    "${SRC_DIR}/Images"
    "${SRC_DIR}/Fonts"
)

get_target_property(PROJECT_SOURCES LED_Display_default_default_XC32_compile SOURCES)
list(FILTER PROJECT_SOURCES EXCLUDE REGEX "/Src/Examples/(display_example([2-9]|[0-9][0-9]+)|display_template)\\.c$")
list(FILTER PROJECT_SOURCES EXCLUDE REGEX "/Src/displayDriver/boards/pic32mx170_hub75_595\\.c$")
set_property(TARGET LED_Display_default_default_XC32_compile PROPERTY SOURCES "${PROJECT_SOURCES}")
