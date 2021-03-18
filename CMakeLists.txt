cmake_minimum_required(VERSION 3.17)

project(PluginProject VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 17)

include(CMake/get_juce.cmake)

include_directories(Source)

# create_plugin(MyPlugin "My plugin" "Company Name" COMPANY_ID PLUGIN_ID)
create_plugin(${PROJECT_NAME} ${PROJECT_NAME} "F-Audio Labs" Falb Plgn)

target_sources(${PROJECT_NAME}
        PRIVATE
        Source/PluginProcessor.cpp
        Source/PluginEditor.cpp
        )
