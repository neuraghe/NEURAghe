#ifndef DEBUG_IF_H
#define DEBUG_IF_H

#include "mem.h"
#include "log.h"

#include <unistd.h>
#include <stdint.h>
#include <stdbool.h>

#define DBG_CTRL_REG  0x0
#define DBG_HIT_REG   0x4
#define DBG_IE_REG    0x8
#define DBG_CAUSE_REG 0xC
#define DBG_NPC_REG   0x2000
#define DBG_PPC_REG   0x2004

#define DBG_CAUSE_BP  0x3

class DbgIF {
  public:
    DbgIF(MemIF* mem, unsigned int base_addr, LogIF *log);

    void flush();

    bool halt();
    bool resume(bool step);
    bool is_stopped();

    bool write(unsigned int addr, uint32_t wdata);
    bool read(unsigned int addr, uint32_t* rdata);

    bool gpr_write(unsigned int addr, uint32_t wdata);
    bool gpr_read_all(uint32_t* data);
    bool gpr_read(unsigned int addr, uint32_t* data);

    bool csr_write(unsigned int addr, uint32_t wdata);
    bool csr_read(unsigned int addr, uint32_t* rdata);

    unsigned int get_thread_id() { return m_thread_id; }

    void get_name(char* str, size_t len);

  private:
    unsigned int m_base_addr;

    unsigned int m_thread_id;

    MemIF* m_mem;
    LogIF *log;
};

#endif
