#ifndef CACHE_H
#define CACHE_H

#include "mem.h"
#include "debug_if.h"
#include <list>

class Cache {
  public:
    Cache(MemIF* mem, std::list<DbgIF*>* dbgIfList) { m_mem = mem; p_dbgIfList = dbgIfList; }

    virtual bool flush() { flushCores(); return true; }
    void flushCores();

  protected:
    MemIF* m_mem;
    std::list<DbgIF*>* p_dbgIfList;
};

class PulpCache : public Cache {
  public:
    PulpCache(MemIF* mem, std::list<DbgIF*>* p_dbgIfList, unsigned int addr);

    virtual bool flush();

  protected:
    unsigned int m_addr;
};

class GAPCache : public PulpCache {
  public:
    GAPCache(MemIF* mem, std::list<DbgIF*>* p_dbgIfList, unsigned int addr, unsigned int fc_addr);

    virtual bool flush();

  protected:
    unsigned int m_fc_addr;
};

#endif
