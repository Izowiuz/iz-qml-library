#include "IzLibrary/IntValidator.h"

#include <QDebug>

IzLibrary::IntValidator::IntValidator(QObject* parent)
    : QIntValidator(parent)
    , m_loc(QLocale::C)
{
}

QValidator::State IzLibrary::IntValidator::validate(QString& s, int& position) const
{
    Q_UNUSED(position)

    // allow minus sign and empty value
    if (s.isEmpty() || s.startsWith(QStringLiteral("-"))) {
        return QValidator::Intermediate;
    }
    // check range of value
    bool isNumber;
    double value = m_loc.toInt(s, &isNumber);
    if (isNumber && bottom() <= value && value <= top()) {
        return QValidator::Acceptable;
    }
    return QValidator::Invalid;
}
