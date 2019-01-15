import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

ToolTip {
	id: control

	padding: 10
	text: "UNDEFINED TOOLTIP TEXT"

	contentItem: IzText {
		text: control.text
		font {
			pointSize: 9.5
		}
	}

	background: Rectangle {
		color: Material.color(Material.Grey, Material.Shade700)
	}
}
