.pragma library
.import QtQml 2.0 as Qml

function show(parent, message, messageType) {
	var component = Qt.createComponent("qrc:/include/IzLibrary/QML/IzToast.qml");

	if (component.status === Qml.Component.Ready) {
		finishCreation(component, parent, message, messageType);
	} else {
		component.statusChanged.connect(finishCreation(component, parent, message, messageType));
	}
}

function finishCreation(component, parent, message, messageType) {
	if (component.status === Qml.Component.Ready) {
		var object = component.createObject(parent,
											{
												"message": message,
												"messageType": messageType
											});
		if (object === null) {
			console.log("Error creating toast message.");
		} else {
			object.onClosed.connect(object.destroy);
			object.open();
		}
	} else if (component.status === Qml.Component.Error) {
		console.log("Error loading toast message:", component.errorString());
	}
}
