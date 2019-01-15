import QtQuick 2.12
import QtQuick.Controls 2.12

RadioButton {
	id: control

	text: qsTr("RadioButton")
	checked: false

	font.pointSize: 9.5

	contentItem: IzText {
		text: control.text
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
		leftPadding: control.indicator.width + control.spacing
	}
}
