#ifndef IZLIBRARY_INTVALIDATOR_H
#define IZLIBRARY_INTVALIDATOR_H

#include <QIntValidator>

namespace IzLibrary
{
	class IntValidator : public QIntValidator
	{
		Q_OBJECT
		Q_DISABLE_COPY(IntValidator)

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

#endif   // IZLIBRARY_INTVALIDATOR_H
