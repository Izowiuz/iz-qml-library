import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
	id: root

	property string popupText: "LONG_UNDEFINED_TEXT"

	implicitHeight: 30
	implicitWidth: 250

	clip: true

	TextMetrics {
		id: textMetrics

		text: popupText
		elideWidth: root.width
	}

	IzText {
		id: textElement
		anchors.verticalCenter: parent.verticalCenter

		width: root.width
		text: textMetrics.text
	}

	IzTooltip {
		id: toolTip

		text: textElement.text
		delay: 1000
		visible: false
	}

	MouseArea {
		anchors.fill: parent

		hoverEnabled: true
		onEntered: {
			if (textMetrics.width > root.width) {
				toolTip.visible = true;
			}
		}
		onExited: {
			if (toolTip.visible === true) {
				toolTip.visible = false;
			}
		}
	}
}
