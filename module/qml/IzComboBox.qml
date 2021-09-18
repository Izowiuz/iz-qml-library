// NOTICE: uwaga, zmiany pod 5.12+
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

ComboBox {
	id: root

	property bool isValid: false
	property bool allowNewValues: false
	property string visibleValue: ""
	signal valueSet(string value)

	topInset: 0
	bottomInset: 0
	leftInset: 0
	rightInset: 0
	padding: 0
	font.pointSize: 8

	onActivated: {
		if (root.editable) {
			root.valueSet(Array.isArray(root.model) ? root.model[root.currentIndex][root.textRole]
													: root.model.get(root.currentIndex)[root.textRole]);
		}
	}

	Component.onDestruction: {
		root.popup.close();
	}

	delegate: IzItemDelegate {
		width: root.width
		height: root.height
		font: root.font
		text: root.textRole ? (Array.isArray(root.model) ? modelData[root.textRole] : model[root.textRole]) : modelData
		highlighted: root.highlightedIndex === index
	}

	contentItem: TextField {
		id: cbTF

		bottomPadding: 0
		topPadding: 0
		rightPadding: 0
		leftPadding: 5
		text: root.editable ? root.visibleValue : root.displayText
		enabled: root.editable
		autoScroll: root.editable
		inputMethodHints: root.inputMethodHints
		validator: root.validator
		font: root.font
		color: root.Material.theme === root.Material.Dark ? "#FFFFFF" : "#000000"
		selectionColor: root.Material.accentColor
		selectedTextColor: root.Material.primaryHighlightedTextColor
		horizontalAlignment: Text.AlignLeft
		verticalAlignment: Text.AlignVCenter
		renderType: Text.NativeRendering
		opacity: root.Material.theme === root.Material.Dark ? 0.7 : 1
		selectByMouse: true

		background: Rectangle {
			y: root.height - height
			implicitWidth: 120
			height: root.editable ? ( root.activeFocus ? 2 : 1 ) : 0
			color: root.activeFocus ? root.Material.accentColor : root.Material.hintTextColor
		}

		onEditingFinished: {
			if (this.text === root.visibleValue) {
				return;
			}
			if (root.allowNewValues) {
				root.valueSet(text);
				return;
			}
			var idx = root.find(text);
			if (idx !== -1) {
				root.valueSet(text);
			} else {
				// koszmarny hack
				cbTF.text = root.editText;
				cbTF.text = Qt.binding(function(){ return root.visibleValue; });
			}
		}
	}

	background: Rectangle {
		height: root.height
		width: root.width
		color: root.Material.theme === root.Material.Dark ?
				   root.Material.color(root.Material.Grey, root.Material.Shade800)
				 : "white"
		border {
			width: 1
			color: root.Material.theme === root.Material.Dark ?
					   !root.activeFocus ? root.Material.color(root.Material.Grey, root.Material.Shade700)
											: root.Material.color(root.Material.Grey, root.Material.Shade500)
					 : !root.activeFocus ? root.Material.color(root.Material.Grey, root.Material.Shade300)
											: root.Material.color(root.Material.Grey, root.Material.Shade500)
		}
	}
}
