import QtQuick 2.12
import QtQuick.Controls 2.12

Image {
	id: root

	function resetPosition() {
		pinchArea.m_zoom1 = 1.0;
		pinchArea.m_zoom2 = 1.0;
		pinchArea.m_x1 = 0;
		pinchArea.m_x2 = 0;
		pinchArea.m_y1 = 0;
		pinchArea.m_y2 = 0;
		root.x = (parent.width - root.width) / 2;
		root.y = (parent.height - root.height) / 2;
	}

	fillMode: Image.PreserveAspectFit
	asynchronous: false
	smooth: true
	mipmap: true

	transform: Scale {
		id: scaler

		origin.x: pinchArea.m_x2
		origin.y: pinchArea.m_y2
		xScale: pinchArea.m_zoom2
		yScale: pinchArea.m_zoom2
	}

	BusyIndicator {
		anchors.centerIn: parent
		visible: root.status === Image.Loading
	}

	PinchArea {
		id: pinchArea

		anchors.fill: parent

		property real m_x1: 0
		property real m_y1: 0
		property real m_y2: 0
		property real m_x2: 0
		property real m_zoom1: 1
		property real m_zoom2: 1
		property real m_max: 10
		property real m_min: 0.1

		MouseArea {
			id: dragArea

			hoverEnabled: true
			anchors.fill: parent
			drag.target: root
			drag.filterChildren: true

			onWheel: {
				pinchArea.m_x1 = scaler.origin.x;
				pinchArea.m_y1 = scaler.origin.y;
				pinchArea.m_zoom1 = scaler.xScale;

				pinchArea.m_x2 = mouseX;
				pinchArea.m_y2 = mouseY;

				var newZoom = 0.0;
				if (wheel.angleDelta.y > 0) {
					newZoom = pinchArea.m_zoom1+0.1;
					if (newZoom <= pinchArea.m_max) {
						pinchArea.m_zoom2 = newZoom;
					} else {
						pinchArea.m_zoom2 = pinchArea.m_max;
					}
				} else {
					newZoom = pinchArea.m_zoom1-0.1;
					if (newZoom >= pinchArea.m_min) {
						pinchArea.m_zoom2 = newZoom;
					} else {
						pinchArea.m_zoom2 = pinchArea.m_min;
					}
				}
				root.x = root.x + (pinchArea.m_x1-pinchArea.m_x2) * (1-pinchArea.m_zoom1);
				root.y = root.y + (pinchArea.m_y1-pinchArea.m_y2) * (1-pinchArea.m_zoom1);
			}

			onDoubleClicked: {
				root.resetPosition();
			}
		}
	}
}
