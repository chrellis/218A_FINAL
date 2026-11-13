set(DEPENDENT_MP_BIN2HEXLED_Display_default_alaSg_Im "/Applications/microchip/xc32/v6.00/bin/xc32-bin2hex")
set(DEPENDENT_DEPENDENT_TARGET_ELFLED_Display_default_alaSg_Im ${CMAKE_CURRENT_LIST_DIR}/../../../../out/LED_Display/default.elf)
set(DEPENDENT_TARGET_DIRLED_Display_default_alaSg_Im ${CMAKE_CURRENT_LIST_DIR}/../../../../out/LED_Display)
set(DEPENDENT_BYPRODUCTSLED_Display_default_alaSg_Im ${DEPENDENT_TARGET_DIRLED_Display_default_alaSg_Im}/${sourceFileNameLED_Display_default_alaSg_Im}.c)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRLED_Display_default_alaSg_Im}/${sourceFileNameLED_Display_default_alaSg_Im}.c
    COMMAND ${DEPENDENT_MP_BIN2HEXLED_Display_default_alaSg_Im} --image ${DEPENDENT_DEPENDENT_TARGET_ELFLED_Display_default_alaSg_Im} --image-generated-c ${sourceFileNameLED_Display_default_alaSg_Im}.c --image-generated-h ${sourceFileNameLED_Display_default_alaSg_Im}.h --image-copy-mode ${modeLED_Display_default_alaSg_Im} --image-offset ${addressLED_Display_default_alaSg_Im} 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRLED_Display_default_alaSg_Im}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFLED_Display_default_alaSg_Im})
add_custom_target(
    dependent_produced_source_artifactLED_Display_default_alaSg_Im 
    DEPENDS ${DEPENDENT_TARGET_DIRLED_Display_default_alaSg_Im}/${sourceFileNameLED_Display_default_alaSg_Im}.c
    )
