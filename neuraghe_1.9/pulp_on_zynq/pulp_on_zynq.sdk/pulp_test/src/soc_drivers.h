#ifndef __SOC_DRIVERS_H_
#define __SOC_DRIVERS_H_


#include "xparameters.h"

#define NUM_BANKS 32

#define SOC_CTRL_BASE_ADDR XPAR_SOC_AXI_CTRL_V1_0_0_BASEADDR

#define TCDM_BASE_ADDRESS XPAR_ULPSOC_0_BASEADDR
#define L2_BASE_ADDRESS (XPAR_ULPSOC_0_BASEADDR + 0xC000000)

#define EOC_ADDR (SOC_CTRL_BASE_ADDR + 0x4)
#define FETCH_ENABLE_ADDR (SOC_CTRL_BASE_ADDR)

#define CONV_SETUP_ADDR (TCDM_BASE_ADDRESS + 0x3FA00)

#define TCDM_BANK(n) (TCDM_BASE_ADDRESS + 4*n)

#define INTRA_BANK_STRIDE NUM_BANKS  //in words

void conv_setup (int in_f, int out_f, int ih, int iw, int fs);
void load_code ();
void fetch_enable ();
void fetch_disable ();
void wait_eoc ();
void wait_for (long int num);
void read_mem (volatile int *from, int len, int stride);
void lock_ps_regs();
void unlock_ps_regs ();
void read_tcdm ();
void set_fclk_div(int div1, int div2);
void print_clk();
void start_fclk();
void stop_fclk();

#endif
