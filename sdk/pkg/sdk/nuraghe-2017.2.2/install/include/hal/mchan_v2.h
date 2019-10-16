#ifndef MCHAN_H
#define MCHAN_H

#include <pulp.h>
#include <archi/mchan_v2.h>

#define TCDM_ADDR_REG      ( MCHAN_BASE_ADDR + TCDM_ADDR_REG_OFFSET )
#define EXT_ADDR_REG       ( MCHAN_BASE_ADDR + EXT_ADDR_REG_OFFSET )
#define CMD_QUEUE          ( MCHAN_BASE_ADDR + CMD_QUEUE_OFFSET )
#define CMD_QUEUE_BUSY_REG ( MCHAN_BASE_ADDR + CMD_QUEUE_BUSY_REG_OFFSET )

#define set_ext_addr(addr)		        \
  *(volatile int*)EXT_ADDR_REG = addr;

#define set_tcdm_addr(addr)			\
  *(volatile int*)TCDM_ADDR_REG = addr;

#define push_cmd(cmd)				\
  *(volatile int*)CMD_QUEUE = cmd;

#define dma_barrier()				\
    while(*(volatile int*)CMD_QUEUE_BUSY_REG); 

#endif
