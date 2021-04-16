#include "IzLibrary/CountdownTimer.h"

IzLibrary::CountdownTimer::CountdownTimer(QObject* parent)
    : QObject(parent)
{
    connect(&m_timer, &QTimer::timeout, this, [this]() {
        if ((m_elapsedTimer.elapsed() - m_startPoint) >= m_deadline) {
            m_elapsed = m_deadline;
            emit timeout();
            if (m_singleShot) {
                m_timer.stop();
            } else {
                m_elapsedTimer.restart();
                m_startPoint = m_elapsedTimer.elapsed();
            }
        } else {
            m_elapsed = m_elapsedTimer.elapsed() - m_startPoint;
        }
        emit elapsedChanged();
    });
}

qint64 IzLibrary::CountdownTimer::getDeadline() const
{
    return m_deadline;
}

void IzLibrary::CountdownTimer::setDeadline(const qint64 deadline)
{
    m_deadline = deadline;
    emit deadlineChanged();
}

// TODO: o co to chodzi?
void IzLibrary::CountdownTimer::setInterval(qint64 interval)
{
    Q_UNUSED(interval)
    m_timer.setInterval(m_timerInterval);
    emit intervalChanged();
}

qint64 IzLibrary::CountdownTimer::getInterval() const
{
    return m_timer.interval();
}

bool IzLibrary::CountdownTimer::getSingleShot() const
{
    return m_singleShot;
}

void IzLibrary::CountdownTimer::setSingleShot(bool singleShot)
{
    m_singleShot = singleShot;
    emit singleShotChanged();
}

bool IzLibrary::CountdownTimer::isRunning() const
{
    return false;
}

void IzLibrary::CountdownTimer::start()
{
    m_timer.start(m_timerInterval);
    m_elapsedTimer.start();
    m_startPoint = m_elapsedTimer.elapsed();
    emit runningChanged();
    emit elapsedChanged();
}

void IzLibrary::CountdownTimer::stop()
{
    m_timer.stop();
    emit runningChanged();
    emit elapsedChanged();
}

void IzLibrary::CountdownTimer::restart()
{
    m_timer.stop();
    m_timer.start(m_timerInterval);
    m_elapsedTimer.restart();
    m_startPoint = m_elapsedTimer.elapsed();
    emit elapsedChanged();
}

qint64 IzLibrary::CountdownTimer::elapsed() const
{
    return m_elapsed;
}

qint64 IzLibrary::CountdownTimer::left() const
{
    return m_deadline - m_elapsed;
}
