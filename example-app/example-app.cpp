#include <QDebug>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // import path for internal qml files
    engine.addImportPath(QStringLiteral(":/"));

    // import path for development module
    engine.addImportPath(QStringLiteral(DEV_LPUGIN_PATH));

    // qml entry point
    const QUrl url(QStringLiteral("qrc:/ExampleApp/MainWindow.qml"));

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
