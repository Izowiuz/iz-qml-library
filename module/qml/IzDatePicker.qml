import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import Qt.labs.calendar 1.0

import IzLibrary 1.0

Popup {
	id: root

	QtObject {
		id: internal

		property bool dateWasSelected: false
	}

	property date currentDate: new Date()
	property date from: new Date()
	property date to: new Date()

	property bool isValid: true

	signal dateSelected(date date)

	// zeros out time part of the date
	function sanitizeDate(date) {
		var tmpdate = date;
		tmpdate.setHours(0, 0, 0, 0);
		return tmpdate;
	}

	// compares two dates, returns true if dates are equal
	function compareDates(date1, date2) {
		return date1.getFullYear() === date2.getFullYear()
				&& date1.getDate() === date2.getDate()
				&& date1.getMonth() === date2.getMonth();
	}

	contentWidth: mainLayout.implicitWidth
	contentHeight: mainLayout.implicitHeight

	onAboutToShow: {
		if (root.sanitizeDate(root.from) > root.sanitizeDate(root.to) || root.sanitizeDate(root.to) < root.sanitizeDate(root.from)) {
			root.from = root.to;
			root.isValid = false;
		}

		if (root.sanitizeDate(root.currentDate) > root.sanitizeDate(root.to) || root.sanitizeDate(root.currentDate) < root.sanitizeDate(root.from)) {
			root.from = root.to;
			root.currentDate = root.to;
			root.isValid = false;
		}

		if (monthGrid.month !== root.currentDate.getMonth()) {
			monthGrid.month = root.currentDate.getMonth();
		}

		if (monthGrid.year !== root.currentDate.getFullYear()) {
			monthGrid.year = root.currentDate.getFullYear();
		}
	}

	onAboutToHide: {
		internal.dateWasSelected = false;
	}

	background: Rectangle {
		color: Qt.lighter(root.Material.background)
		border.color: root.Material.accent
	}

	contentItem: ColumnLayout {
		id: mainLayout

		RowLayout {
			Layout.preferredHeight: 40
			Layout.preferredWidth: 280
			Layout.fillHeight: false
			Layout.fillWidth: false

			SpinBox {
				id: monthSB

				Layout.fillHeight: true
				Layout.fillWidth: true

				from: 1
				to: 12
				enabled: root.isValid

				Binding {
					target: monthSB
					property: "value"
					value: monthGrid.month + 1
				}

				onValueChanged: {
					if (root.isValid) {
						monthGrid.month = value - 1;
					}
				}
			}

			SpinBox {
				id: yearSB

				Layout.fillHeight: true
				Layout.fillWidth: true

				from: root.from.getFullYear()
				to: root.to.getFullYear()

				Binding {
					target: yearSB
					property: "value"
					value: monthGrid.year
				}

				onValueChanged: {
					if (root.isValid) {
						monthGrid.year = value;
					}
				}
			}
		}

		DayOfWeekRow {
			Layout.column: 1
			Layout.preferredWidth: 280
			Layout.fillHeight: true
			Layout.fillWidth: false

			delegate: IzText {
				text: model.shortName
				horizontalAlignment: Text.AlignHCenter
				font.bold: true
			}
		}

		MonthGrid {
			id: monthGrid

			property date lastSelectedDate: new Date()

			Layout.preferredWidth: 280
			Layout.fillWidth: false
			Layout.fillHeight: true

			Binding {
				target: monthGrid
				property: "month"
				value: root.currentDate.getMonth()
			}

			Binding {
				target: monthGrid
				property: "year"
				value: root.currentDate.getFullYear()
			}

			delegate: IzText {
				text: model.day
				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter
				font.bold: root.compareDates(root.currentDate, model.date)
				opacity: model.month === monthGrid.month
						 ? ( root.sanitizeDate(model.date) <= root.sanitizeDate(root.to) && root.sanitizeDate(model.date) >= root.sanitizeDate(root.from) ? 1 : 0.23 )
						 : 0

				Rectangle {
					anchors.fill: parent
					color: root.compareDates(root.currentDate, model.date) ? root.Material.accent : root.Material.foreground
					opacity: 0.3
				}
			}

			onClicked: {
				if (!root.isValid || internal.dateWasSelected) {
					return;
				}

				if (root.sanitizeDate(date) > root.sanitizeDate(root.to) || root.sanitizeDate(date) < root.sanitizeDate(root.from)) {
					return;
				}

				root.currentDate = root.sanitizeDate(date);

				if (root.compareDates(monthGrid.lastSelectedDate, root.currentDate)) {
					root.dateSelected(root.currentDate);
					internal.dateWasSelected = true;
					root.close();
				} else {
					monthGrid.lastSelectedDate = root.currentDate;
				}
			}
		}

		RowLayout {
			Layout.preferredHeight: 35
			Layout.preferredWidth: 280
			Layout.fillHeight: false
			Layout.fillWidth: false

			IzText {
				Layout.fillWidth: true
				Layout.fillHeight: true
				Layout.leftMargin: 5

				font.bold: true
				verticalAlignment: Text.AlignVCenter

				text: Qt.formatDateTime(root.currentDate, "dd-MM-yyyy")
			}

			Item {
				Layout.fillHeight: true
				Layout.fillWidth: true
			}

			IzButton {
				Layout.preferredHeight: 25
				Layout.preferredWidth: 25
				Layout.rightMargin: 5

				fontIcon: "\uf12c"
				tooltip: qsTr("Wybierz datę")

				onReleased: {
					if (root.isValid) {
						root.dateSelected(root.currentDate);
					}
					root.close();
				}
			}
		}
	}
}
