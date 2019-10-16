#ifndef __ICACHE_CTRL_H__
#define __ICACHE_CTRL_H__

#include "hal/pulp.h"
#include "hal/utils.h"


// Enable All Icache Banks api 
static inline void enable_all_icache_banks ( )
{
  *(volatile int*) (ICACHE_CTRL_BASE_ADDR) = 0xFFFFFFFF;
}

// Disable all icache banks routine
static inline void disable_all_icache_banks ( )
{
  *(volatile int*) (ICACHE_CTRL_BASE_ADDR) = 0x00000000;
}



// Reset the statistic counters in each icache banks
static inline void reset_all_icache_stat_regs()
{
    *(volatile int*) (ICACHE_CTRL_BASE_ADDR+0x10) = 0xFFFFFFFF;
}


// Enable all the statisctic counters in all icache banks availabe
static inline void start_all_icache_stat_regs()
{
    *(volatile int*) (ICACHE_CTRL_BASE_ADDR+0x14) = 0xFFFFFFFF;
}

// Disable all the statisctic counters in all icache banks availabe
static inline void stop_all_icache_stat_regs()
{
    *(volatile int*) (ICACHE_CTRL_BASE_ADDR+0x14) = 0x00000000;
}


static inline int read_hit_icache_reg( )
{
  volatile int reg_status;
  reg_status = *(volatile int*) (ICACHE_CTRL_BASE_ADDR+0x40);
  return reg_status;
}


static inline int read_trans_icache_reg( )
{
  volatile int reg_status;
  //FIXME we need to know how many banks are used
  reg_status = *(volatile int*) (ICACHE_CTRL_BASE_ADDR +0x44);
  return reg_status;
}



static inline void flush_all_icache_banks ( )
{
  *(volatile int*) (ICACHE_CTRL_BASE_ADDR+0x4) = 1;
}


static inline void selective_flush_icache_addr (unsigned int address )
{
  *(volatile int*) (ICACHE_CTRL_BASE_ADDR+0x8) = address; // write 4'b1111 in the flush reg
}


static inline int read_enable_icache_reg(  )
{
  volatile int reg_status;
  reg_status = *(volatile int*) (ICACHE_CTRL_BASE_ADDR + 0x0C); 
  return reg_status;
}






static inline int read_status_icache_reg(  )
{
  volatile int reg_status;

  reg_status = *(volatile int*) (ICACHE_CTRL_BASE_ADDR+0x08);

  return reg_status;
}
#endif
