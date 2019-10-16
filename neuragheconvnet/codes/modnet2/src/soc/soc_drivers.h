/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Author:       Gianfranco Deriu - gian.deriu@gmail.com                      *
 *                                                                            *
 * Project:     NEURAGHE - Accelerator for Convolutional neural network       *
 * File:                                                                      *
 * Description:                                                               *
 *                                                                            *
 ******************************************************************************/
#ifndef __SOC_DRIVERS_H_
#define __SOC_DRIVERS_H_

#include "types.h"
#ifdef US
  #include "xparameters_us.h"
#else
  #include "xparameters.h"
#endif
#include "neumem.h"

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <errno.h>

#ifndef BAREMETAL
 #include <sys/mman.h>
 #include <byteswap.h>
 #define PAGE_SIZE ((size_t)getpagesize())
 #define PAGE_MASK ((int)~(PAGE_SIZE - 1))
#endif


#define NEU_TCN

//#define ZC706_DUAL2x4
//#define US
//#define ZED  
#define ZC706

#define _MAXMEM_ 0x400000

#define NUM_BANKS 32


#ifdef ZED
  #ifdef NEU_TCN
    #define DDR_REMAP 0x18000000
	  #define DDR_SIZE  0x08000000
	  #define _N_COL_ 12
	  #define _N_ROW_ 4
    #define _NCLUSTER_ 1
  #else  
	  #define DDR_REMAP 0x18000000
	  #define DDR_SIZE  0x08000000
	  #define _N_COL_ 2
	  #define _N_ROW_ 2
    #define _NCLUSTER_ 1
  #endif
#endif

#ifdef ZC706
  #ifdef NEU_TCN
	  #define DDR_REMAP 0x30000000
	  #define DDR_SIZE  0x10000000
    #define _N_COL_ 12
    #define _N_ROW_ 4
    #define _NCLUSTER_ 1
  #else
    #define DDR_REMAP 0x30000000
	  #define DDR_SIZE  0x10000000
    #define _N_COL_ 4
    #define _N_ROW_ 4
    #define _NCLUSTER_ 1
  #endif
#endif

#ifdef ZC706_DUAL2x2
	#define DDR_REMAP 0x30000000
	#define DDR_SIZE  0x10000000
  #define _N_COL_ 2
  #define _N_ROW_ 2
  #define _NCLUSTER_ 2
#endif

#ifdef ZC706_DUAL2x4
	#define DDR_REMAP 0x30000000
	#define DDR_SIZE  0x10000000
  #define _N_COL_ 2
  #define _N_ROW_ 4
  #define _NCLUSTER_ 2
#endif



#define USE_HW_POOL 0

#define _DUALCONTROLLER_

#define SOC_CTRL_BASE_ADDR XPAR_SOC_AXI_CTRL_V1_0_0_BASEADDR

#define SOC0_BASE_ADDRESS XPAR_NURAGHE_SOC_0_BASEADDR // the 4 MSBs are used by the ARM to address the SOCs, inside the soc the are replace with 0b0001 with ad hardwired remapping
#define L2_BASE_ADDRESS (SOC0_BASE_ADDRESS + 0x0C000000)

#define EOC_ADDR (SOC_CTRL_BASE_ADDR + 0x4)
#define FETCH_ENABLE_ADDR (SOC_CTRL_BASE_ADDR)

#define CONV_DONE DDR_REMAP
#define CONV_SETUP_ADDR (SOC0_BASE_ADDRESS + 0xF7600) // this address must be the same chosen in PL code

#define TCDM_BANK(n) (SOC0_BASE_ADDRESS + 4*n)

#define INTRA_BANK_STRIDE NUM_BANKS  //in words


#define SOC_PROGR_BASE_ADDR 0x00007AD4 // this address space is use to synchronize the ARM processor and the PL processor

#define SOC_HANDSHAKE_ADDR (SOC_PROGR_BASE_ADDR + 0x00)
#define JOB_ADDR           (SOC_PROGR_BASE_ADDR + 0x04)
#define SOC_READY_ADDR     (SOC_PROGR_BASE_ADDR + 0x08)
#define OFFLOAD_READY_ADDR (SOC_PROGR_BASE_ADDR + 0x2C)
#define CLUSTID_ADDR       (SOC_PROGR_BASE_ADDR + 0xFC)


typedef unsigned long int neuADDR; 

typedef struct Socmap* SOCMAP;

struct Socmap {
	unsigned int id;
	int* soc_addr;
	int* soc_cntr_addr;
	int* ddr_addr;
	int* ps7_slcr_addr;
	Conv_params* task_ptr;
	DATA* in;
	DATA* out;
	DATA* swap;
};


int * addr_linux(neuADDR addr, int size, int fd);

void init_soc(SOCMAP* socs, DATA** wPointer, int MAXMEM, int SWAPMEM, char* bitstream_file);
int mmap_soc (SOCMAP* socs);
int munmap_soc(SOCMAP* socs);
int load_bitstream(char* bitstream_file);
int bitstream_check(void);
int conv_setup (volatile Conv_params * task_ptr, int in_f, int out_f, int ih, int iw, int fs_h, int fs_w, int max_og, int dil_h, int dil_w,
int rectifier_activ, int pooling, int qf, int precision8, int zero_padding, int w_addr, int x_addr, int y_addr);
void load_instr (volatile int * soc_addr);
void fetch_enable (volatile int * soc_cntr_addr);
void fetch_disable (volatile int * soc_cntr_addr);
void wait_eoc (volatile int * soc_cntr_addr);
void wait_for (long int num);
void read_mem (volatile int *from, int len, int stride);
void lock_ps_regs(int* ps7_slcr_addr);
void unlock_ps_regs (int* ps7_slcr_addr);
void read_tcdm (volatile int *from, int nrow);
void set_fclk_div(int* ps7_slcr_addr,int div1, int div2);
void print_clk(int* ps7_slcr_addr);
void start_fclk(int* ps7_slcr_addr);
void stop_fclk(int* ps7_slcr_addr);
void use_default_conv_test(void);
void wait_for_conv_ddr(volatile int * ddr_addr);
void wait_for_mw_ready_ddr(volatile int * ddr_addr);
void wait_for_conv(volatile int * soc_cntr_addr, volatile int * soc_addr);
void wait_for_mw_ready(volatile int * ddr_addr);
void trigger_conv (volatile int * ddr_addr, volatile int * soc_addr);

void *memcpyNEON(void *dst, const void *src, size_t len);
#endif
