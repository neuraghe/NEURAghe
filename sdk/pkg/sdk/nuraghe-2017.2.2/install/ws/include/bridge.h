#ifndef BRIDGE_H
#define BRIDGE_H

#include "mem_zynq_spi.h"
#include "mem_zynq_apb_spi.h"
#include "flexible_memif.h"
#include "sim.h"

#include "debug_if.h"
#include "cache.h"
#include "breakpoints.h"
#include "rsp.h"
#include "log.h"
#include "chip.h"

#include "hal/debug.h"

enum Platforms { unknown, PULPino, PULP, GAP, MIA, VIVOSOC2 };

class Bridge : public LogIF {
  public:
    void initBridge(Platforms platform, int portNumber, MemIF *memIF, LogIF *log, int rspPort);
    Bridge(Platforms platform, int portNumber, LogIF *log=NULL, int rspPort=1234);
    Bridge(Platforms platform, MemIF *memIF, LogIF *log=NULL, int rspPort=1234);
    ~Bridge();
    void mainLoop();
    int loadBinary(char *name);
    int loadBinary(char *name, unsigned char **file);
    int flashBinary(char *flasher, char *name);
    void startCores(unsigned int coreMask);
    unsigned int exitLoop();
    unsigned int exitLoopIter();

    void user(char *str, ...);
    void debug(char *str, ...);

    MemIF *getMemIF() { return mem; }

  int nbSections;
  void *elfArray = NULL;
  bool loadToArray = false;
  unsigned int elfDest;
  unsigned int elfSize;
  
  private:
  MemIF* mem;
  std::list<DbgIF*> dbgifs;
  Cache* cache;
  Rsp* rsp;
  BreakPoints* bp;
  LogIF *log;
  Chip *chip;
  unsigned int debugStruct_ptr;
  Platforms platform;
};

#endif
