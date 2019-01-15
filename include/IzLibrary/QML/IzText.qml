import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls.Material 2.12

Text {
	id: root

	text: qsTr("UNDEFINED TEXT")
	verticalAlignment: Text.AlignVCenter
	horizontalAlignment: Text.AlignLeft
	renderType: Text.NativeRendering
	elide: Text.ElideRight
	color: Material.theme === Material.Dark ? "#FFFFFF" : "#000000"
	opacity: Material.theme === Material.Dark ? 0.7 : 1
	// WARNING: hack na klikanie przez tekst :[
	enabled: false
}
