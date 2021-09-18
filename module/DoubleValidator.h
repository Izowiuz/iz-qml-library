#pragma once

#include <QDoubleValidator>
#include <qqml.h>

namespace IzLibrary
{
    class DoubleValidator : public QDoubleValidator
    {
        Q_OBJECT
        Q_DISABLE_COPY(DoubleValidator)
        QML_ELEMENT

    public:
        // ctor
        explicit DoubleValidator(QObject* parent = nullptr);

        // QValidator interface
        State validate(QString& s, int& position) const override;

    private:
        // validator's locale
        QLocale m_loc;
    };
}   // namespace IzLibrary
