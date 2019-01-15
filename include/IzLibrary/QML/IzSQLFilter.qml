import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

IzTextField {
	id: root

	QtObject {
		id: internal

		property string filterValue: ""

		// used to remove filter
		function removeFilter() {
			if (internal.filterValue !== "") {
				root.filterEnabled = false;
				filter.visible = false;
				internal.filterValue = "";
				root.text = "";
				root.filterRemoved(filterID);
			}
		}
	}

	property bool filterEnabled:false
	property int filterID: -1
	property string databaseTable: "UNDEFINED"
	property string databaseColumn: "UNDEFINED"

	signal filterChanged(int filterID, string databaseTable, string databaseColumn, string filterText)
	signal filterRemoved(int filterID)

	// cleans filter without emiting filterRemoved signal
	function clearFilter() {
		filter.visible = false;
		filterEnabled = false;
		root.text = "";
	}

	Component.onCompleted: {
		filterEnabled = false
	}

	Keys.onEscapePressed: {
		if (filter.visible == true) {
			internal.removeFilter();
		}
	}

	onEditingFinished: {
		if (root.text !== "") {
			if (internal.filterValue !== text) {
				root.filterEnabled = true;
				internal.filterValue = text;
				root.filterChanged(filterID, databaseTable, databaseColumn, root.text);
				filter.visible = true;
			}
		} else {
			internal.removeFilter();
		}
	}

	IzButton {
		id: filter

		anchors {
			right: parent.right
			verticalCenter: parent.verticalCenter
			topMargin: 2
			rightMargin: 2
		}
		height: 23
		width: 23

		visible: false
		fontIcon: "\uf1c0"

		onReleased: {
			internal.removeFilter();
		}
	}
}
