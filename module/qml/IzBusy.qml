import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

Item {
	id: root

	property bool running: false

	anchors.fill: parent

	Component.onCompleted: {
		opacityAnimation.start();
	}

	Rectangle {
		id: background

		anchors.fill: parent
		color: Material.color(Material.Grey)
		opacity: 0.0

		PropertyAnimation {
			id: opacityAnimation

			target: background
			property: "opacity"
			from: 0.0
			to: 0.35
			duration: 150
		}

		MouseArea {
			anchors.fill: parent
			propagateComposedEvents: false
			preventStealing: true
		}
	}

	BusyIndicator {
		id: spinner

		anchors.centerIn: parent
		running: root.running
		opacity: 1.0
	}
}
