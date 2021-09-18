#ifndef IZLIBRARY_QMLPLUGIN_H
#define IZLIBRARY_QMLPLUGIN_H

#include <QQmlEngineExtensionPlugin>

namespace IzLibrary
{
    class QmlPlugin : public QQmlEngineExtensionPlugin
    {
        Q_OBJECT
        Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid)

    public:
        // QQmlEngineExtensionPlugin -->

        //        void registerTypes(const char* uri) override;
        void initializeEngine(QQmlEngine* engine, const char* uri) override;

        // QQmlEngineExtensionPlugin <--
    };
}   // namespace IzLibrary

#endif   // IZLIBRARY_QMLPLUGIN_H
