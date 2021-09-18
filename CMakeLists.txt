# cmake minumum version
cmake_minimum_required(VERSION 3.18)

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
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# output directory for qt files
set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)

# library definition
qt_add_library(
    IzLibrary
    SHARED
)

# qml module
qt_add_qml_module(
    IzLibrary
VERSION
    1.0
URI
    IzLibrary
QML_FILES
    module/qml/IzText.qml
)

# target compile definitions
target_compile_definitions(
    IzLibrary
PRIVATE
    QT_USE_QSTRINGBUILDER
    cxx_std_17
)

# installs
install(
    TARGETS IzLibrary
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/${CMAKE_BUILD_TYPE}/Qt-${Qt6Core_VERSION}/${CMAKE_CXX_COMPILER_ID}/${PLATFORM_TARGET}/IzLibrary
)

# add example app
add_subdirectory(example-app)
