import QtQuick
import QtQuick.Window
import QtQuick.Layouts

import IzLibrary

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("IzLibrary Example App")

    IzText {
        anchors.centerIn: parent
        text: qsTr("a")
    }
}
