import QtQuick
import QtQuick.Controls.Material

Text {
    id: root

    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignLeft
    renderType: Text.NativeRendering
    elide: Text.ElideRight
    color: Material.theme === Material.Dark ? "#FFFFFF" : "#000000"
    opacity: Material.theme === Material.Dark ? 0.7 : 1
}
