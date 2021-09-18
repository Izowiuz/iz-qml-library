import QtQuick 2.12
import QtQuick.Controls 2.12

ItemDelegate {
	id: control

	contentItem: IzText {
		anchors.fill: parent
		rightPadding: control.spacing
		leftPadding: 5
		text: control.text
		font: control.font
		elide: Text.ElideRight
		visible: control.text
		horizontalAlignment: Text.AlignLeft
		verticalAlignment: Text.AlignVCenter
	}
}
