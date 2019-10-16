#ifndef __CLE_DEBUG_H__
#define __CLE_DEBUG_H__
 
#ifdef CLE_ACTIVATE_DEBUG

#include <stdio.h>
#ifdef __ANDROID__
#include <android/log.h>
#endif

extern int cleTraceLevel;
extern int cleActiveWarnings;

#ifdef __ANDROID__
#  define CLE_LOGMSG(x...) __android_log_print(ANDROID_LOG_DEBUG, "sthorm", x)
#else
#  define CLE_LOGMSG(x...) printf(x); 
#endif

#define CLE_MSG(fmt, x...)			\
  do { \
    CLE_LOGMSG("[\033[35mCLE\033[0m] " fmt, ##x);					\
  } while(0)

#define CLE_WARNING(x...)					\
  do {								\
    if (cleActiveWarnings) CLE_MSG("CLE WARNING: "x);	\
  } while(0)

#  define CLE_TRACE(lvl, x...)			\
  do {						\
    if (lvl < cleTraceLevel) CLE_MSG(x);		\
  } while(0)

#define CLE_ASSERT(cond, msg...)		\
  if (!(cond)) {				\
    if (cleActiveWarnings) {			\
      CLE_MSG("CLE ASSERT: "msg);		\
      abort();					\
    }						\
  }

#else

#define CLE_TRACE(x...)
#define CLE_WARNING(x...)
#define CLE_ASSERT(x...)

#endif

#endif
