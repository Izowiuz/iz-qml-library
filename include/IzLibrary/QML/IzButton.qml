import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

AbstractButton {
	id: root

	implicitHeight: 40
	implicitWidth: 40

	property color currentColor: root.Material.theme === Material.Dark
								 ? root.Material.color(Material.Grey)
								 : root.Material.color(Material.Grey, Material.Shade700)
	property string fontIcon: ""
	property string tooltip: ""

	focus: true
	ToolTip.visible: root.hovered
	ToolTip.text: root.tooltip
	ToolTip.delay: 1500

	indicator: Text {
		text: root.fontIcon
		textFormat: Qt.PlainText
		font.family: "Material Design Icons"
		font.pixelSize: root.height
		color: root.currentColor
		antialiasing: false
	}

	ColorOverlay {
		id: indicatorOverlay

		anchors.fill: indicator
		source: indicator
		color: root.currentColor
		smooth: true
	}

	states: [
		State {
			name: "active"
			when: root.activeFocus && !root.pressed
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
