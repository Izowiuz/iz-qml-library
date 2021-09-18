import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import IzLibrary 1.0

Item {
	id: root

	implicitHeight: 150
	implicitWidth: 42

	property int deadline: 10000

	Component.onCompleted: {
		closeTimer.start();
	}

	IzText {
		anchors.centerIn: parent
		text: qsTr("Aplikacja zostanie samoczynnie zamknięta za ")
			  + Math.floor(closeTimer.left / 1000) + qsTr("s");
	}

	IzCountdownTimer {
		id: closeTimer

		singleShot: true
		deadline: root.deadline

		onTimeout: {
			root.Window.window.close();
		}
	}
}
