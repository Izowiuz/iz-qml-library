import QtQuick 2.12
import QtQuick.Window 2.12

Rectangle {
	id: root

	property QtObject target: null

	color: "transparent"
	border.width: 2

	PropertyAnimation {
		id: markAnimation

		target: root
		property: "border.color"
		from: root.border.color
		to: "transparent"
		loops: 3
		easing.type: Easing.InExpo
		duration: 1000

		onStopped: {
			root.destroy();
		}
	}

	Connections {
		target: root.target

		onXChanged: {
			var pos = root.parent.mapFromItem(root.target, root.target.x, root.target.y);
			root.x = pos.x - root.target.x;
		}

		onYChanged: {
			var pos = root.parent.mapFromItem(root.target, root.target.x, root.target.y);
			root.y = pos.y - root.target.y;
		}

		onWidthChanged: {
			root.width = root.target.width;
		}

		onHeightChanged: {
			root.height = root.target.height;
		}
	}

	Component.onCompleted: {
		root.parent = Window.contentItem;
		root.height = root.target.height;
		root.width = root.target.width;
		var pos = Window.contentItem.mapFromItem(root.target, root.target.x, root.target.y);
		root.x = pos.x - root.target.x;
		root.y = pos.y - root.target.y;
		markAnimation.start();
	}
}
