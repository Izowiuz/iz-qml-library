import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12

Popup {
	id: root

	property bool isDragging: false

	background: Rectangle {
		radius: 2
		color: root.Material.dialogColor

		layer.enabled: root.Material.elevation > 0
		layer.effect: ElevationEffect {
			elevation: root.Material.elevation
		}

		MouseArea {
			anchors.fill: parent

			cursorShape: root.isDragging ? Qt.ClosedHandCursor : Qt.OpenHandCursor
			pressAndHoldInterval: 50

			onReleased: {
				root.isDragging = false;
			}

			onPressAndHold: {
				root.isDragging = true;
			}

			onMouseXChanged: {
				if (root.isDragging) {
					var relPosX = root.background.mapToItem(Overlay.overlay, root.background.x, root.background.y).x;
					if (relPosX + mouseX < 0) {
						root.x = root.parent.mapFromItem(Overlay.overlay, 0, 0).x;
					} else if (relPosX + mouseX > Overlay.overlay.width - root.width) {
						root.x = root.parent.mapFromItem(Overlay.overlay, Overlay.overlay.width, 0).x - root.width;
					} else {
						root.x += mouseX;
					}
				}
			}

			onMouseYChanged: {
				if (root.isDragging) {
					var relPosY = root.background.mapToItem(Overlay.overlay, root.background.x, root.background.y).y;
					if (relPosY + mouseY < 0) {
						root.y = root.parent.mapFromItem(Overlay.overlay, 0, 0).y;
					} else if (relPosY + mouseY > Overlay.overlay.height - root.height) {
						root.y = root.parent.mapFromItem(Overlay.overlay, 0, Overlay.overlay.height).y - root.height;
					} else {
						root.y += mouseY;
					}
				}
			}
		}
	}
}
