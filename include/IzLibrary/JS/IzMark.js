.pragma library
.import QtQml 2.0 as Qml

function mark(target, color) {
	var component = Qt.createComponent("qrc:/include/IzLibrary/QML/IzMark.qml");

	if (component.status === Qml.Component.Ready) {
		finishCreation(component, target, color);
	} else {
		component.statusChanged.connect(finishCreation(component, target, color));
	}
}

function finishCreation(component, target, color) {
	if (component.status === Qml.Component.Ready) {
		var object = component.createObject(target,
											{
												"target": target,
												"border.color": color
											});

		if (object === null) {
			console.log("Error creating mark.");
		}
	} else if (component.status === Qml.Component.Error) {
		console.log("Error loading mark:", component.errorString());
	}
}
