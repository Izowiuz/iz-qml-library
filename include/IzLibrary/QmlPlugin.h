#ifndef IZLIBRARY_QMLPLUGIN_H
#define IZLIBRARY_QMLPLUGIN_H

#include <QQmlExtensionPlugin>

namespace IzLibrary
{
	class QmlPlugin : public QQmlExtensionPlugin
	{
		Q_OBJECT
		// WARNING: bez CMake można skorzystać z DEFINE: QQmlExtensionInterface_iid
		Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface/1.0")

	public:
		// QQmlTypesExtensionInterface interface
		void registerTypes(const char* uri) override;
		void initializeEngine(QQmlEngine* engine, const char* uri) override;
	};
}   // namespace IzLibrary

#endif   // IZLIBRARY_QMLPLUGIN_H
