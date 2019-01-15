import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import IzLibrary 1.0

// TODO: stany przepisac na normalne enum'y!
Popup {
	id: root

	property string messageType: ""
	property string message: ""

	function setBorderColor() {
		switch(root.messageType) {
		case "ok":
			return Material.color(Material.Green);
		case "alert":
			return Material.color(Material.Orange);
		case "error":
			return Material.color(Material.Red);
		default:
			return Material.color(Material.Blue)
		}
	}

	implicitHeight: 80
	implicitWidth: 450
	padding: 0
	margins: 0

	Timer {
		id: killTimer

		interval: 3000

		onTriggered: {
			root.destroy();
		}
	}

	Connections {
		target: root.parent

		onWidthChanged: {
			root.x = (root.parent.width - root.width) / 2;
		}

		onHeightChanged: {
			root.y = (root.parent.height - root.height) / 2;
		}
	}

	Component.onCompleted: {
		root.x = (root.parent.width - root.width) / 2
		root.y = (root.parent.height - root.height) / 2
		killTimer.start();
	}

	contentItem: Rectangle {
		id: backgroundRectangle

		color: root.parent.Material.theme === Material.Dark ?
			   Material.color(Material.Grey, Material.Shade800)
			 : "white"
		border.color: root.setBorderColor()

		IzText {
			anchors.centerIn: parent

			text: root.message
			font.bold: true
		}

		ColorAnimation on color {
			id: backgroundAnimator

			from: backgroundRectangle.border.color
			to: backgroundRectangle.color
			duration: 500
		}

		MouseArea {
			anchors.fill: parent

			onReleased: {
				root.close();
			}
		}
	}

	background: Item {}
}
