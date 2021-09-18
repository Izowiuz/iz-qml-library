import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import IzLibrary 1.0

Item {
	id: root

	QtObject {
		id: internal

		property bool isInitialized: false
		property string initValue: ""
	}

	signal valueSet(string newValue)

	property string value: ""
	property double from: 0
	property double to: 10000
	property int decimals: 3
	property bool isValid: textInput.acceptableInput

	MouseArea {
		anchors.fill: parent

		onClicked: {
			textInput.forceActiveFocus();
		}

		onDoubleClicked: {
			textInput.selectAll();
		}
	}

	activeFocusOnTab: true

	onActiveFocusChanged: {
		if (activeFocus) {
			textInput.forceActiveFocus();
		}
	}

	IzTextInput {
		id: textInput

		anchors.centerIn: parent

		text: root.value
		horizontalAlignment: Qt.AlignHCenter
		verticalAlignment: Qt.AlignVCenter
		inputMethodHints: Qt.ImhFormattedNumbersOnly
		font.pointSize: 8

		validator: IzDoubleValidator {
			bottom: root.from
			top: root.to
			decimals: root.decimals
			notation: DoubleValidator.StandardNotation
		}

		onTextChanged: {
			if (!internal.isInitialized) {
				internal.isInitialized = true;
			}
			if (acceptableInput && (root.value !== text)) {
				root.valueSet(text);
			}
		}

		onActiveFocusChanged: {
			if (!activeFocus && !acceptableInput) {
				this.text = internal.initValue;
				this.text = Qt.binding(function() {return root.value});
			}
		}
	}

	Rectangle {
		height: 2
		anchors {
			left: parent.left
			leftMargin: 5
			right: parent.right
			rightMargin: 5
			bottom: parent.bottom
			bottomMargin: 3
		}

		color: textInput.activeFocus === true ? Material.accent : Material.color(Material.Grey)
	}
}
