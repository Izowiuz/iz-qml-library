import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.impl 2.12

TextInput {
	id: root

	property string placeholderText

	color: Material.theme === Material.Dark ? "#FFFFFF" : "#000000"
	opacity: Material.theme === Material.Dark ? 0.7 : 1
	renderType: Text.NativeRendering
	selectionColor: Material.primary
	selectedTextColor: Material.accent
	font.pointSize: 9.5

	onActiveFocusChanged: {
		if (activeFocus === true) {
			selectAll();
		}
	}

	PlaceholderText {
		id: placeholder
		x: root.leftPadding
		y: root.topPadding
		width: root.width - (root.leftPadding + root.rightPadding)
		height: root.height - (root.topPadding + root.bottomPadding)
		text: root.placeholderText
		font: root.font
		color: root.color
		opacity: 0.75
		verticalAlignment: root.verticalAlignment
		elide: Text.ElideRight
		visible: !root.length && !root.preeditText && (!root.activeFocus || root.horizontalAlignment !== Qt.AlignHCenter)
		renderType: Text.NativeRendering
	}
}
