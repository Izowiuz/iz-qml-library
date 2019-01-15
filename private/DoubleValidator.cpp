#include "IzLibrary/DoubleValidator.h"

IzLibrary::DoubleValidator::DoubleValidator(QObject* parent)
	: QDoubleValidator(parent)
	, m_loc(QLocale::C)
{
	// locale setup
	setLocale(m_loc);
}

QValidator::State IzLibrary::DoubleValidator::validate(QString& s, int& position) const
{
	Q_UNUSED(position)

	// allow minus sign and empty value
	if (s.isEmpty() || s.startsWith(QStringLiteral("-"))) {
		return QValidator::Intermediate;
	}
	// check length of decimal places
	QChar point = m_loc.decimalPoint();
	if (s.indexOf(point) != -1) {
		int lengthDecimals = s.length() - s.indexOf(point) - 1;
		if (lengthDecimals > decimals()) {
			return QValidator::Invalid;
		}
	}
	// check range of value
	bool isNumber;
	double value = m_loc.toDouble(s, &isNumber);
	if (isNumber && bottom() <= value && value <= top()) {
		return QValidator::Acceptable;
	}
	return QValidator::Invalid;
}
