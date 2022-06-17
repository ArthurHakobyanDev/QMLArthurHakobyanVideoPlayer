#ifndef RUNSL_H
#define RUNSL_H

#include <QObject>

class runsl : public QObject
{
    Q_OBJECT
public:
    explicit runsl(QObject *parent = nullptr);

signals:

public slots:
    void callLock();
    void callUnlock();

};

#endif // RUNSL_H
