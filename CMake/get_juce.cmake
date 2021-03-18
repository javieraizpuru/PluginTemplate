include(CMake/get_repository.cmake)
include(Cmake/create_plugin.cmake)
get_repository(JUCE https://github.com/juce-framework/JUCE.git origin/master)
add_subdirectory(${juce_SOURCE_DIR})