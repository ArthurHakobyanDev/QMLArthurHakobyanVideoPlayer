#include "runsl.h"
#include "screenlock.h"

runsl::runsl(QObject *parent)
    : QObject{parent}
{

}

void runsl::callLock()
{

#if defined(Q_OS_IOS)
   ScreenLock::setDisabled(true);
#endif

}

void runsl::callUnlock()
{

#if defined(Q_OS_IOS)
    ScreenLock::setDisabled(false);
#endif

}
