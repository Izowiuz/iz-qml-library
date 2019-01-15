import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import IzLibrary 1.0

GroupBox {
	id: root

	property bool frameEnabled: true

	padding: 5

	label: IzText {
		height: 15
		text: root.title
		font.bold: true
	}

	background: Loader {
		anchors {
			left: parent != null ? parent.left : undefined
			right: parent != null ? parent.right : undefined
			bottom:parent != null ?  parent.bottom : undefined
		}
		height: root.title !== "" ? (root.height - root.label.height - root.padding)
								  : root.height

		sourceComponent: root.frameEnabled ? frame : emptyFrame
	}

	Component {
		id: frame

		Rectangle {
			color: "transparent"
			border.color: root.activeFocus ? Material.accent : (root.Material.theme === Material.Dark ?
							  Material.color(Material.Grey, Material.Shade700)
							: Material.color(Material.Grey, Material.Shade300))
		}
	}

	Component {
		id: emptyFrame

		Item {}
	}
}
