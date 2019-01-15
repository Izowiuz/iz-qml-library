import QtQuick 2.12
import QtQuick.Controls 2.12

CheckBox {
	id: root

	contentItem: IzText {
		anchors {
			fill: parent
			leftMargin: root.indicator.width + root.spacing + 6
		}
		text: root.text
		verticalAlignment: Text.AlignVCenter
	}
}
