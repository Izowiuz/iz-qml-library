import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12

import IzLibrary 1.0

AbstractButton {
	id: root

	implicitHeight: display === AbstractButton.IconOnly ? 26 : buttonContent.implicitHeight
	implicitWidth: display === AbstractButton.IconOnly ? 26 : buttonContent.implicitWidth

	property color currentColor: root.Material.theme === Material.Dark
								 ? root.Material.color(Material.Grey)
								 : root.Material.color(Material.Grey, Material.Shade700)
	property string fontIcon
	property string tooltip

	focus: true
	font.pointSize: 8
	display: AbstractButton.IconOnly
	ToolTip.visible: root.hovered
	ToolTip.text: root.tooltip === "" ? root.text : root.tooltip
	ToolTip.delay: 1500

	contentItem: GridLayout {
		id: buttonContent

		rows: display === AbstractButton.TextUnderIcon ? 2 : 1
		columns: display === AbstractButton.TextBesideIcon ? 2 : 1
		rowSpacing: 0
		columnSpacing: 0

		Text {
			Layout.alignment: Qt.AlignCenter

			visible: display === AbstractButton.TextOnly ? false : true
			text: root.fontIcon
			textFormat: Qt.PlainText
			font.family: "Material Design Icons"
			font.pixelSize: display === AbstractButton.IconOnly ? root.height : 26
			color: root.currentColor
			antialiasing: false
		}

		IzText {
			Layout.alignment: Qt.AlignCenter

			visible: display === AbstractButton.IconOnly ? false : true
			text: root.text
			font: root.font
			opacity: root.enabled ? 1.0 : 0.3
			color: root.currentColor
			horizontalAlignment: Text.AlignHCenter
			verticalAlignment: Text.AlignVCenter
			elide: Text.ElideRight
		}
	}

	states: [
		State {
			name: "active"
			when: root.activeFocus && !root.pressed && !root.hovered
			PropertyChanges {
				target: root
				currentColor: root.Material.accent
			}
		},
		State {
			name: "pressed"
			when: root.pressed
			PropertyChanges {
				target: root
				currentColor: Material.color(Material.Grey, Material.Shade700)
			}
		},
		State {
			name: "hovered"
			when: root.hovered && root.enabled
			PropertyChanges {
				target: root
				currentColor: root.Material.accent
			}
		},
		State {
			name: "disabled"
			when: !root.enabled
			PropertyChanges {
				target: root
				currentColor: root.Material.theme === Material.Dark
							  ? Material.color(Material.Grey, Material.Shade700)
							  : Material.color(Material.Grey)
			}
		},
		State {
			name: "checked"
			when: root.checked
			PropertyChanges {
				target: root
				currentColor: root.Material.accent
			}
		}
	]

	transitions: [
		Transition {
			from: "disabled"; to: ""
			PropertyAnimation { properties: "currentColor"; duration: 0 }
		},
		Transition {
			from: ""; to: "disabled"
			PropertyAnimation { properties: "currentColor"; duration: 0 }
		},
		Transition {
			from: "checked"; to: "disabled"
			PropertyAnimation { properties: "currentColor"; duration: 0 }
		},
		Transition {
			from: "focused"; to: "pressed"
			PropertyAnimation { easing.type: Easing.Linear; properties: "currentColor"; duration: 100 }
		},
		Transition {
			PropertyAnimation { easing.type: Easing.Linear; properties: "currentColor"; duration: 100 }
		}
	]
}
