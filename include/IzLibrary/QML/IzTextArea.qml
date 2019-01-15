import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

TextArea {
	id: root

	color: Material.theme === Material.Dark ? "#FFFFFF" : "#000000"
	opacity: Material.theme === Material.Dark ? 0.7 : 1
	renderType: Text.NativeRendering
	wrapMode: TextInput.Wrap
	persistentSelection: true
	selectByMouse: true

	background: Item {}

	onReleased: {
		if (event.button === Qt.RightButton) {
			menuLoader.x = event.x;
			menuLoader.y = event.y;
			menuLoader.sourceComponent = (root.readOnly ? readonlyMenu : editableMenu);
		}
	}

	Loader {
		id: menuLoader

		property int positionX: 0
		property int positionY: 0
	}

	Component {
		id: editableMenu

		Menu {
			x: menuLoader.positionX
			y: menuLoader.positionY
			visible: true

			IzMenuItem {
				text: qsTr("Wytnij")

				onTriggered: {
					root.cut();
				}
			}

			IzMenuItem {
				text: qsTr("Kopiuj")

				onTriggered: {
					root.copy();
				}
			}

			IzMenuItem {
				text: qsTr("Wklej")

				onTriggered: {
					root.paste();
				}
			}

			IzMenuItem {
				text: qsTr("Wyczyść")

				onTriggered: {
					root.clear();
				}
			}

			IzMenuItem {
				text: qsTr("Zaznacz wszystko")

				onTriggered: {
					root.selectAll();
				}
			}

			onClosed: {
				menuLoader.sourceComponent = undefined;
			}
		}
	}

	Component {
		id: readonlyMenu

		Menu {
			x: menuLoader.positionX
			y: menuLoader.positionY
			visible: true

			IzMenuItem {
				text: qsTr("Kopiuj")

				onTriggered: {
					root.copy();
				}
			}

			IzMenuItem {
				text: qsTr("Zaznacz wszystko")

				onTriggered: {
					root.selectAll();
				}
			}

			onClosed: {
				menuLoader.sourceComponent = undefined;
			}
		}
	}
}
