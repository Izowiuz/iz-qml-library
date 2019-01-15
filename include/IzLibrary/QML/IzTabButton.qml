import QtQuick 2.12
import QtQuick.Controls 2.12

TabButton {
	id: root

	contentItem: IzText {
		text: root.text
		font: root.font
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
		elide: Text.ElideRight
	}
}
