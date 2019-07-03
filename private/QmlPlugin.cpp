#include "IzLibrary/QmlPlugin.h"

#include <QFontDatabase>
#include <QtQml>

#include "IzLibrary/CountdownTimer.h"
#include "IzLibrary/DoubleValidator.h"
#include "IzLibrary/IntValidator.h"

void IzLibrary::QmlPlugin::registerTypes(const char* uri)
{
	Q_ASSERT(uri == QLatin1String("IzLibrary"));
	qmlRegisterType<CountdownTimer>(uri, 1, 0, "IzCountdownTimer");
	qmlRegisterType<DoubleValidator>(uri, 1, 0, "IzDoubleValidator");
	qmlRegisterType<IntValidator>(uri, 1, 0, "IzIntValidator");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzBoxContainer.qml")), uri, 1, 0, "IzBoxContainer");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzButton.qml")), uri, 1, 0, "IzButton");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzCheckDelegate.qml")), uri, 1, 0, "IzCheckDelegate");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzComboBox.qml")), uri, 1, 0, "IzComboBox");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzFileDialog.qml")), uri, 1, 0, "IzFileDialog");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzItemDelegate.qml")), uri, 1, 0, "IzItemDelegate");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzPopupText.qml")), uri, 1, 0, "IzPopupText");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzRadioButton.qml")), uri, 1, 0, "IzRadioButton");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzSQLError.qml")), uri, 1, 0, "IzSQLError");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzSQLFilter.qml")), uri, 1, 0, "IzSQLFilter");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzText.qml")), uri, 1, 0, "IzText");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzTextField.qml")), uri, 1, 0, "IzTextField");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzTextInput.qml")), uri, 1, 0, "IzTextInput");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzTooltip.qml")), uri, 1, 0, "IzTooltip");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzSpinBox.qml")), uri, 1, 0, "IzSpinBox");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzGroupBox.qml")), uri, 1, 0, "IzGroupBox");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzTabButton.qml")), uri, 1, 0, "IzTabButton");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzDatePicker.qml")), uri, 1, 0, "IzDatePicker");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzSwitch.qml")), uri, 1, 0, "IzSwitch");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzCheckBox.qml")), uri, 1, 0, "IzCheckBox");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzModalBlur.qml")), uri, 1, 0, "IzModalBlur");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzTextArea.qml")), uri, 1, 0, "IzTextArea");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzMenuItem.qml")), uri, 1, 0, "IzMenuItem");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzKillswitch.qml")), uri, 1, 0, "IzKillswitch");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzDraggablePopup.qml")), uri, 1, 0, "IzDraggablePopup");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzInteractiveImage.qml")), uri, 1, 0, "IzInteractiveImage");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/include/IzLibrary/QML/IzRectangle.qml")), uri, 1, 0, "IzRectangle");
}

void IzLibrary::QmlPlugin::initializeEngine(QQmlEngine* engine, const char* uri)
{
	Q_UNUSED(engine)
	Q_ASSERT(uri == QLatin1String("IzLibrary"));
	QFontDatabase::addApplicationFont(QStringLiteral(":/res/font/materialdesignicons-webfont.ttf"));
}
