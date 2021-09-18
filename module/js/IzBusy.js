.pragma library

function show(parent, name, running) {
	parent.enabled = false;

	for(var i = 0; i < parent.children.length; ++i) {
		if(parent.children[i].objectName === name){
			console.warn("IzBusy [show]: " + parent + " already has a busy indicator with name: " + name);
			return;
		}
	}

	var component = Qt.createComponent("qrc:/include/IzLibrary/QML/IzBusy.qml");
	var object = component.createObject(
				parent,
				{
					"objectName": name,
					"running": running
				}
			);

	if (object === null) {
		console.warn("IzBusy [show]: error creating object.");
	}
}

function hide(parent, name) {
	parent.enabled = true;

	for(var i = 0; i < parent.children.length; ++i) {
		if(parent.children[i].objectName === name){
			parent.children[i].destroy();
			return;
		}
	}
}
