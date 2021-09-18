import QtQuick 2.12
import Qt.labs.platform 1.0

FileDialog {
	id: root

	property bool saveMode: false

	title: "Wybierz ścieżkę i nazwę pliku"
	folder: StandardPaths.writableLocation(StandardPaths.DesktopLocation)
	fileMode: root.saveMode ? FileDialog.SaveFile : FileDialog.OpenFile

	Component.onCompleted: {
		visible = false;
	}
}
