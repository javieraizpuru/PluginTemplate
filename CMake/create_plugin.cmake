macro(create_plugin target name companyName manufacturerCode pluginCode)
    juce_add_plugin(${target}
            PLUGIN_MANUFACTURER_CODE ${manufacturerCode}
            PLUGIN_CODE ${pluginCode}
            FORMATS AU VST3 Standalone
            PRODUCT_NAME ${name}
            COMPANY_NAME ${companyName}
            IS_SYNTH FALSE
            NEEDS_MIDI_INPUT FALSE
            COPY_PLUGIN_AFTER_BUILD TRUE)

    juce_generate_juce_header(${target})

    target_compile_definitions(${target}
            PUBLIC
            # JUCE_WEB_BROWSER and JUCE_USE_CURL would be on by default, but you might not need them.
            JUCE_WEB_BROWSER=0  # If you remove this, add `NEEDS_WEB_BROWSER TRUE` to the `juce_add_plugin` call
            JUCE_USE_CURL=0     # If you remove this, add `NEEDS_CURL TRUE` to the `juce_add_plugin` call
            JUCE_VST3_CAN_REPLACE_VST2=0
            JUCE_DISPLAY_SPLASH_SCREEN=0
            DONT_SET_USING_JUCE_NAMESPACE=1
            )

    target_link_libraries(${target}
            PRIVATE
            juce::juce_audio_utils
            juce::juce_build_tools
            juce::juce_audio_plugin_client
            PUBLIC
            juce::juce_recommended_config_flags
            juce::juce_recommended_lto_flags
            juce::juce_recommended_warning_flags)

endmacro()