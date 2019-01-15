import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12

T.TextField {
	id: control

	implicitHeight: 30
	implicitWidth: 250
	font {
		pointSize: 8
		family: "MS Shell Dlg2"
	}
	selectByMouse: true
	bottomPadding: 0
	topPadding: 0
	rightPadding: 0
	leftPadding: 5
	color: Material.theme === Material.Dark ? "#FFFFFF" : "#000000"
	selectionColor: Material.accentColor
	selectedTextColor: Material.primaryHighlightedTextColor
	horizontalAlignment: Text.AlignLeft
	verticalAlignment: Text.AlignVCenter
	renderType: Text.NativeRendering
	opacity: Material.theme === Material.Dark ? 0.7 : 1
	hoverEnabled: true

	background: Rectangle {
		color: control.activeFocus ? (Material.theme === Material.Dark ?
										  Material.color(Material.Grey, Material.Shade700)
										: Material.color(Material.Grey, Material.Shade100))
								   : (Material.theme === Material.Dark ?
										  Material.color(Material.Grey, Material.Shade800)
										: "white")
		border {
			width: 1
			color: control.activeFocus ? Material.color(Material.Grey, Material.Shade500)
									  : (Material.theme === Material.Dark ?
											 Material.color(Material.Grey, Material.Shade700)
										   : Material.color(Material.Grey, Material.Shade300))
		}

		Rectangle {
			y: control.height - height
			width: control.width
			height: control.activeFocus ? 2 : 1
			color: control.activeFocus ? Material.accentColor : Material.hintTextColor
		}
	}

	PlaceholderText {
		id: placeholder
		x: control.leftPadding
		y: control.topPadding
		width: control.width - (control.leftPadding + control.rightPadding)
		height: control.height - (control.topPadding + control.bottomPadding)
		text: control.placeholderText
		font: control.font
		color: control.color
		opacity: 0.75
		verticalAlignment: control.verticalAlignment
		elide: Text.ElideRight
		visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
		renderType: Text.NativeRendering
	}
}
