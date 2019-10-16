#ifndef __PIPE_STAGE_H__
#define __PIPE_STAGE_H__

#include "pulp.h"

#define REC_PIPE_REQ_BASE_ADDR       (REC_PIPE_STARGE_BASE_ADDR + 0x0)
#define REC_PIPE_RESP_BASE_ADDR      (REC_PIPE_STARGE_BASE_ADDR + 0x4)

static inline void set_req_pipe(int conf)
{
#ifdef REC_PIPE_STARGE_BASE_ADDR
  *(volatile int*) (REC_PIPE_REQ_BASE_ADDR) = conf;
#endif
}


static inline void set_resp_pipe(int conf)
{
#ifdef REC_PIPE_STARGE_BASE_ADDR
  *(volatile int*) (REC_PIPE_RESP_BASE_ADDR) = conf;
#endif
}




static inline int read_req_pipe_reg(  )
{
#ifdef REC_PIPE_STARGE_BASE_ADDR
  volatile int reg_status;

  reg_status = *(volatile int*) (REC_PIPE_REQ_BASE_ADDR);

  return reg_status;
#else
  return 0;
#endif
}


static inline int read_resp_pipe_reg(  )
{
#ifdef REC_PIPE_STARGE_BASE_ADDR
  volatile int reg_status;

  reg_status = *(volatile int*) (REC_PIPE_RESP_BASE_ADDR);

  return reg_status;
#else
  return 0;
#endif
}



#endif
