#pragma once

#include <QElapsedTimer>
#include <QObject>
#include <QTimer>
#include <qqml.h>

namespace IzLibrary
{
    class CountdownTimer : public QObject
    {
        Q_OBJECT
        Q_DISABLE_COPY(CountdownTimer)

        Q_PROPERTY(qint64 deadline READ getDeadline WRITE setDeadline NOTIFY deadlineChanged)
        Q_PROPERTY(qint64 interval READ getInterval WRITE setInterval NOTIFY intervalChanged)
        Q_PROPERTY(bool singleShot READ getSingleShot WRITE setSingleShot NOTIFY singleShotChanged)
        Q_PROPERTY(bool running READ isRunning NOTIFY runningChanged)
        Q_PROPERTY(qint64 elapsed READ elapsed NOTIFY elapsedChanged)
        Q_PROPERTY(qint64 left READ left NOTIFY elapsedChanged)
        QML_ELEMENT

    public:
        explicit CountdownTimer(QObject* parent = nullptr);

        qint64 getDeadline() const;
        void setDeadline(const qint64 deadline);
        void setInterval(qint64 interval);
        qint64 getInterval() const;
        bool getSingleShot() const;
        void setSingleShot(bool singleShot);
        Q_INVOKABLE bool isRunning() const;
        Q_INVOKABLE void start();
        Q_INVOKABLE void stop();
        Q_INVOKABLE void restart();
        Q_INVOKABLE qint64 elapsed() const;
        Q_INVOKABLE qint64 left() const;

    private:
        QTimer m_timer;
        QElapsedTimer m_elapsedTimer;
        bool m_singleShot{ false };
        qint64 m_deadline{ 10000 };
        qint64 m_timerInterval{ 50 };
        qint64 m_startPoint{ 0 };
        qint64 m_elapsed{ 0 };

    signals:
        void runningChanged();
        void intervalChanged();
        void singleShotChanged();
        void elapsedChanged();
        void deadlineChanged();
        void timeout();
    };
}   // namespace IzLibrary
