#pragma once

#include <QIntValidator>
#include <qqml.h>

namespace IzLibrary
{
    class IntValidator : public QIntValidator
    {
        Q_OBJECT
        Q_DISABLE_COPY(IntValidator)
        QML_ELEMENT

    public:
        // ctor
        explicit IntValidator(QObject* parent = nullptr);

        // QValidator interface
        State validate(QString& s, int& position) const override;

    private:
        // validator's locale
        QLocale m_loc;
    };
}   // namespace IzLibrary
