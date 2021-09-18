# Qt's modules
find_package(Qt6 COMPONENTS Core Quick REQUIRED)

# executable
qt_add_executable(
    example-app
    example-app.cpp
)

# qml module
qt_add_qml_module(
    example-app
VERSION
    1.0
URI
    ExampleApp
QML_FILES
    MainWindow.qml
)

# target compile definitions
target_compile_definitions(
    example-app
PRIVATE
    -DDEV_LPUGIN_PATH=\"${QT_QML_OUTPUT_DIRECTORY}\"
)

# target links
target_link_libraries(
    example-app
PUBLIC
    Qt6::Core
    Qt6::Quick
)
