import QtQuick 2.12
import QtQuick.Controls 2.12

Switch {
	id: root

	contentItem: IzText {
		text: root.text
		verticalAlignment: Text.AlignVCenter
		leftPadding: root.indicator.width + root.spacing
		bottomPadding: 2
	}
}
