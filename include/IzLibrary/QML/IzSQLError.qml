import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
	id: root

	property string errorTitle: "UNDEFINED"
	property string errorDescription: "UNDEFINED"
	property string actionToTake: "UNDEFINED"
	property string sqlError: "UNDEFINED"

	implicitHeight: 480
	implicitWidth: 640

	Component.onCompleted: {
		root.errorTitle = dialog.parameters["errorTitle"];
		root.errorDescription = dialog.parameters["errorDescription"];
		root.actionToTake = dialog.parameters["actionToTake"];
		root.sqlError = dialog.parameters["sqlError"];
	}

	spacing: 20

	IzBoxContainer {
		Layout.preferredWidth: parent.width
		Layout.preferredHeight: 38

		IzText {
			id: action

			anchors.fill: parent

			text: root.actionToTake
			wrapMode: Text.Wrap
			font.pixelSize: 12
			verticalAlignment: Text.AlignVCenter
			horizontalAlignment: Text.AlignLeft
			leftPadding: 10
		}
	}

	IzBoxContainer {
		Layout.preferredWidth: parent.width
		Layout.fillHeight: true

		Flickable {
			width: parent.width
			height: parent.height

			clip: true
			contentHeight: errorText.height
			boundsBehavior: Flickable.OvershootBounds
			ScrollBar.vertical: ScrollBar { }

			IzTextArea {
				id: errorText

				width: parent.width

				text: root.errorDescription + "\n\n" + root.sqlError
				font.pixelSize: 12
				readOnly: true
				mouseSelectionMode: TextEdit.SelectCharacters
				padding: 10
			}
		}
	}
}
