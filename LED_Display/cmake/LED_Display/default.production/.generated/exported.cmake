set(DEPENDENT_MP_BIN2HEXLED_Display_default_Wi2_Ame7 "/Applications/microchip/xc32/v6.00/bin/xc32-bin2hex")
set(DEPENDENT_DEPENDENT_TARGET_ELFLED_Display_default_Wi2_Ame7 ${CMAKE_CURRENT_LIST_DIR}/../../../../out/LED_Display/production/default-production.elf)
set(DEPENDENT_TARGET_DIRLED_Display_default_Wi2_Ame7 ${CMAKE_CURRENT_LIST_DIR}/../../../../out/LED_Display/production)
set(DEPENDENT_BYPRODUCTSLED_Display_default_Wi2_Ame7 ${DEPENDENT_TARGET_DIRLED_Display_default_Wi2_Ame7}/${sourceFileNameLED_Display_default_Wi2_Ame7}.c)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRLED_Display_default_Wi2_Ame7}/${sourceFileNameLED_Display_default_Wi2_Ame7}.c
    COMMAND ${DEPENDENT_MP_BIN2HEXLED_Display_default_Wi2_Ame7} --image ${DEPENDENT_DEPENDENT_TARGET_ELFLED_Display_default_Wi2_Ame7} --image-generated-c ${sourceFileNameLED_Display_default_Wi2_Ame7}.c --image-generated-h ${sourceFileNameLED_Display_default_Wi2_Ame7}.h --image-copy-mode ${modeLED_Display_default_Wi2_Ame7} --image-offset ${addressLED_Display_default_Wi2_Ame7} 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRLED_Display_default_Wi2_Ame7}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFLED_Display_default_Wi2_Ame7})
add_custom_target(
    dependent_produced_source_artifactLED_Display_default_Wi2_Ame7 
    DEPENDS ${DEPENDENT_TARGET_DIRLED_Display_default_Wi2_Ame7}/${sourceFileNameLED_Display_default_Wi2_Ame7}.c
    )
