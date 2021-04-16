# cmake minumum version
cmake_minimum_required(VERSION 3.10)

# gnu directories
include(GNUInstallDirs)

# project name and version
project(IzLibrary VERSION 1.0 LANGUAGES CXX)

# project architecture
if(${CMAKE_SIZEOF_VOID_P} EQUAL 8)
    set(PLATFORM_TARGET "x64")
else()
    set(PLATFORM_TARGET "x86")
endif()

# Qt's modules
find_package(Qt6 COMPONENTS Quick Qml REQUIRED)

# enable autogeneration of moc files
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# library definition
add_library(
    IzLibraryPlugin
SHARED
    ""
)

target_sources(
    IzLibraryPlugin
PRIVATE
    "private/QmlPlugin.cpp"
    "private/CountdownTimer.cpp"
    "private/DoubleValidator.cpp"
    "private/IntValidator.cpp"
    "include/IzLibrary/CountdownTimer.h"
    "include/IzLibrary/DoubleValidator.h"
    "include/IzLibrary/IntValidator.h"
    "include/IzLibrary/IzLibrary_Enums.h"
    "include/IzLibrary/QmlPlugin.h"
)

set_target_properties(
    IzLibraryPlugin
PROPERTIES
    PREFIX ""
)

# include directories for target
target_include_directories(
    IzLibraryPlugin
PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/private
)

# target compile features
target_compile_features(
    IzLibraryPlugin
PRIVATE
    cxx_std_17
)

# target links
target_link_libraries(
    IzLibraryPlugin
PUBLIC
    Qt6::Quick
    Qt6::Qml
)

# target compile definitions
target_compile_definitions(
    IzLibraryPlugin
PRIVATE
    QT_USE_QSTRINGBUILDER
)

# installs
include(GNUInstallDirs)
install(
    TARGETS IzLibraryPlugin
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/${CMAKE_BUILD_TYPE}/${Qt5Core_VERSION}/${CMAKE_CXX_COMPILER_ID}/${PLATFORM_TARGET}/IzLibrary
)

install(
    FILES "${CMAKE_CURRENT_SOURCE_DIR}/include/IzLibrary/qmldir"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/${CMAKE_BUILD_TYPE}/${Qt5Core_VERSION}/${CMAKE_CXX_COMPILER_ID}/${PLATFORM_TARGET}/IzLibrary
)

#TODO: hack #1 - przekazywanie zmiennych do skryptu instalacyjnego
install(CODE "set(PROJECT_NAME \"IzLibrary\")")
install(CODE "set(PROJECT_VERSION \"${PROJECT_VERSION}\")")
install(CODE "set(CMAKE_BUILD_TYPE \"${CMAKE_BUILD_TYPE}\")")
install(CODE "set(Qt5Core_VERSION \"${Qt5Core_VERSION}\")")
install(CODE "set(CMAKE_CXX_COMPILER_ID \"${CMAKE_CXX_COMPILER_ID}\")")
install(CODE "set(PLATFORM_TARGET \"${PLATFORM_TARGET}\")")
install(CODE "set(QT_QMAKE_EXECUTABLE \"${QT_QMAKE_EXECUTABLE}\")")
install(SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/QmlPluginDump.cmake")
