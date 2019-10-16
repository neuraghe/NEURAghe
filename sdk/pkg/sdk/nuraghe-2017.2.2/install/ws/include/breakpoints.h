#ifndef BREAKPOINTS_H
#define BREAKPOINTS_H

#include <stdbool.h>
#include <stdint.h>
#include <list>

#include "mem.h"
#include "cache.h"

struct bp_insn {
  uint32_t addr;
  uint32_t insn_orig;
  bool is_compressed;
};

class BreakPoints {
  public:
    BreakPoints(MemIF* mem, Cache* cache);

    bool insert(unsigned int addr);
    bool remove(unsigned int addr);

    bool clear();

    bool at_addr(unsigned int addr);

    bool enable_all();
    bool disable_all();

    bool disable(unsigned int addr);
    bool enable(unsigned int addr);

  private:
    std::list<struct bp_insn> m_bp_list;
    MemIF* m_mem;
    Cache* m_cache;
};

#endif
