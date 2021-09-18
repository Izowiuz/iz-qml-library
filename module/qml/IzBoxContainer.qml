import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.5

// TODO: na ENUM'y elementState!
Pane {
	id: root

	// true if container is in global 'selected' state
	property bool selected: false

	// state of the element
	// [normal, added, deleted ]
	property string elementState: "normal"

	// default elevation of the container
	property int elevation: Material.theme === Material.Dark ? 4 : 2

	// default 'selected' state colors
	property color selectedBackgroundColor: Material.theme === Material.Dark ?
												Material.color(Material.Grey, Material.Shade700)
											  : Material.color(Material.Grey, Material.Shade100)

	property color selectedBorderColor: Material.color(Material.Grey, Material.Shade500)

	// default 'normal' state colors
	property color normalBackgroundColor: Material.theme === Material.Dark ?
											  Material.color(Material.Grey, Material.Shade800)
											: "white"

	property color normalBorderColor: Material.theme === Material.Dark ?
										  Material.color(Material.Grey, Material.Shade700)
										: Material.color(Material.Grey, Material.Shade300)

	// default 'added' state color
	property color addedBorderColor: Material.color(Material.Green)

	// default 'deleted' state color
	property color deletedBorderColor: Material.color(Material.Red)

	// default 'undefined' state color
	property color undefinedBorderColor: Material.color(Material.Blue)

	antialiasing: false
	implicitHeight: 100
	implicitWidth: 250

	//layer.enabled: root.Material.elevation > 0
	layer.enabled: false
	layer.effect: ElevationEffect {
		elevation: root.Material.elevation
	}

	padding: 0
	background: Rectangle {
		id: backgroundRectangle

		antialiasing: false
		color: root.selected ? root.selectedBackgroundColor : root.normalBackgroundColor
		border {
			width: 1
			color:root.selected ? root.selectedBorderColor : root.normalBorderColor
		}
	}

	Material.elevation: root.elevation
	Material.background: root.selected ? root.selectedBackgroundColor : root.normalBackgroundColor

	states: [
		State {
			name: "deleted"
			when: root.elementState === 'deleted'
			PropertyChanges {
				target: backgroundRectangle
				border.color: root.deletedBorderColor
			}
		},
		State {
			name: "selected"
			when: root.elementState === 'selected'
			PropertyChanges {
				target: backgroundRectangle
				border.color: root.selectedBorderColor
			}
		},
		State {
			name: "changed"
			when: root.elementState === 'changed'
			PropertyChanges {
				target: backgroundRectangle
				border.color: Material.color(Material.Blue)
			}
		},
		State {
			name: "added"
			when: root.elementState === 'added'
			PropertyChanges {
				target: backgroundRectangle
				border.color: root.addedBorderColor
			}
		}
	]
}
