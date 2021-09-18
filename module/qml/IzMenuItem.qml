import QtQuick 2.12
import QtQuick.Controls 2.12

MenuItem {
	id: root

	implicitHeight: 28
	font.pointSize: 9

	contentItem: IzText {
		text: root.text
		font: root.font
		opacity: root.enabled ? 1.0 : 0.3
		enabled: root.enabled
	}
}
