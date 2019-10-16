/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 *          EOLAB @ DIEE - Università degli studi di Cagliari                 *
 *                      Via marengo 2 - 09123                                 *
 *                              Cagliari                                      *
 *                                                                            *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                 Gianfranco Deriu - gian.deriu@gmail.com                    *
 *                                                                            *
 * Project:        NURAGHE                                         *
 * File:           conv_hwce.h                                                     *
 * Description:    HWCE hardware abstraction layer                            *
 *                                                                            *
 ******************************************************************************/

#ifndef _CONV16_H
#define _CONV16_H

#define NO_HWCE_EVENTS


#include "pulp.h"
#include "utils.h"
#include "events.h"
#include "events_ids.h"

#include "bar.h"

#define NUM_IF 4
#define NUM_OF 4

#define N_MANDATORY_REGS   7
#define N_RESERVED_REGS    1
#define N_GENERIC_REGS     (8 - 4)
#define N_MAX_GENERIC_REGS (8 - 4)


#define BANK_SIZE 4096

#define IF_HW NUM_IF  // number of input features per group
#define OF_HW NUM_OF // number of output features per group


#define HWCE_PARAMS (OF_HW*2+IF_HW)

// stream IDs
#define HWCE_Y_OUT 0
#define HWCE_Y_IN  1
#define HWCE_X_IN  2

// linebuffer width in 32-bit words
#define HWCE_LBSIZE 64

/* LOW-LEVEL HAL */
#define HWCE_ADDR_BASE  HWCE_BASE_ADDR
#define HWCE_ADDR_SPACE 0x00000100

#define NUM_BANKS           32
#define WORD_SIZE_BYTE      4

#define DDR_BASE_ADDR       0x80000000
#define SRAM_BASE_ADDRESS   0x10000000
#define HEAPL2_BASE_ADDRESS 0x1C008000 // The start address of Heap ram is set in linker script. see sw/ref/linnk.common.ld
#define BYTE_PER_BANK       (BANK_SIZE * WORD_SIZE_BYTE) 
#define BANK_STRIDE         BYTE_PER_BANK
#define WI_BANK_STRIDE      NUM_BANKS * WORD_SIZE_BYTE

#define CONV_SETUP_ADDR (SRAM_BASE_ADDRESS + 0x3FA00) // this address must be the same chosen in ARM code

//#define MAX_ROW  ( 60 ) 

#define NUM_Y_GROUPS ((NUM_BANKS-12)*2/4) // minimum (#nbanks - #xbanks) * 2partition[pingpong]/#OGperOG

// Expressions for address remapping from HWCE address-map to DMA address-map
/*
//16 bank 4096 words
#define DMA_ADDR_5_4(A)  ((((int)A)>>4)&0x3)
#define DMA_ADDR_17_6(A) ((((int)A)>>6)&0xFFF) 
//#define DMA_ADDR_18_6(A) ((((int)A)>>6)&0x1FFF)
#define DMA_ADDR(A)      ((int)A&0xFFF8000F|DMA_ADDR_5_4(A)<<17|DMA_ADDR_17_6(A)<<4)
*/

//32 bank 4096 words
#define DMA_ADDR_6_4(A)  ((((int)A)>>4)&0x7)
#define DMA_ADDR_18_7(A) ((((int)A)>>7)&0xFFF) 
#define DMA_ADDR(A)      ((int)A&0xFFF8000F|DMA_ADDR_6_4(A)<<16|DMA_ADDR_18_7(A)<<4)


//#define DMA_ADDR(A)      ((int)A&0xFFF8000F|DMA_ADDR_5_4(A)<<18|DMA_ADDR_18_6(A)<<4)

#define BYTE_ADDR(A) (A&0x3)

#define SRAM_BIT(A)     (A&(BANK_SIZE*WORD_SIZE_BYTE*NUM_BANKS-1))
#define W_NO_INTRL(A)   ((SRAM_BIT(A)/WORD_SIZE_BYTE) % BANK_SIZE)
#define B_NO_INTRL(A)   (SRAM_BIT(A) / BYTE_PER_BANK)
#define W_INTRL_ADDR(A) ((int16_t*)(((W_NO_INTRL((int)A)*NUM_BANKS + B_NO_INTRL((int)A))*4)|SRAM_BASE_ADDRESS|BYTE_ADDR((int)A))) //given a no interleaved addr returns a interleaved addr

#define OFFLOAD_READY (CONV_SETUP_ADDR + NUM_BANKS*4*11)
#define CONV_DONE     (DDR_BASE_ADDR)










static inline int mchan_transfer_hwce(unsigned int len, char type, char incr, char twd, unsigned int ext_addr, unsigned int tcdm_addr, unsigned short int count, unsigned short int stride){
  
  int id = *(volatile int*) MCHAN_COMMAND_QUEUE;
  
  *(volatile int*) MCHAN_COMMAND_QUEUE = len | (type << MCHAN_LEN_WIDTH) | ( incr <<  (MCHAN_LEN_WIDTH + 1) ) | ( twd <<  (MCHAN_LEN_WIDTH + 2) );
  *(volatile int*) MCHAN_COMMAND_QUEUE = tcdm_addr;
  *(volatile int*) MCHAN_COMMAND_QUEUE = ext_addr;
  
  if (twd == 1)
    *(volatile int*) MCHAN_COMMAND_QUEUE = count | (stride << 16);
  
  return id;
  
}




static inline void hwce_ll_hal_writecfg(unsigned int hwce_id, unsigned int reg, unsigned int datum) {
  *(volatile unsigned int *)(HWCE_ADDR_BASE + HWCE_ADDR_SPACE*hwce_id + (reg<<2)) = datum;
}

static inline unsigned int hwce_ll_hal_readcfg(unsigned int hwce_id, unsigned int reg) {
  return *(volatile unsigned int *)(HWCE_ADDR_BASE + HWCE_ADDR_SPACE*hwce_id + (reg<<2));
}

/* HWPE-like HAL */

// Triggers the HWCE execution
static inline void hwce_trigger(unsigned int hwce_id) {
   hwce_ll_hal_writecfg(hwce_id, 0,1);
}

// Reads status register, returns 1 if working, 0 if finished
static inline unsigned int hwce_status(unsigned int hwce_id) {
  return hwce_ll_hal_readcfg(hwce_id, 3);
}

// Reads ID of the running job
static inline unsigned int hwce_running_job(unsigned int hwce_id) {
  return hwce_ll_hal_readcfg(hwce_id, 4);
}

// Reads the context_id register and, if HW sync is active, initiates the setting phase
// returns -1 if no context available, or context_id if one is available
static inline unsigned int hwce_acquire(unsigned int hwce_id) {
  return hwce_ll_hal_readcfg(hwce_id, 1);
}

// Sets the synchronization mode (0=polling, 1=events)
static inline void hwce_set_sync(unsigned int hwce_id, unsigned int sync_mode) {
   hwce_ll_hal_writecfg(hwce_id, 2, sync_mode);
}

// Sets one of the generic registers (valid regs: 0 to N_GENERIC_REGS-1)
static inline void hwce_set_generic(unsigned int hwce_id, unsigned int reg, unsigned int value) {
  hwce_ll_hal_writecfg(hwce_id, N_MANDATORY_REGS+N_RESERVED_REGS + reg, value);
}

// Sets one of the IO registers (valid regs: 0 to N_IO_REGS-1)
static inline void hwce_set_IOReg(unsigned int hwce_id, unsigned int reg, unsigned int value) {
  hwce_ll_hal_writecfg(hwce_id, N_MANDATORY_REGS+N_RESERVED_REGS+N_MAX_GENERIC_REGS + reg, value);
}

// Sets the base_addr reg
static inline void hwce_set_base_addr(unsigned int hwce_id, unsigned char stream, unsigned int value) {
  unsigned int reg;
  reg = stream*4 + 0;
  hwce_set_IOReg(hwce_id, reg, value);
}

// Sets the trans_size reg
static inline void hwce_set_trans_size(unsigned int hwce_id, unsigned char stream, unsigned int value) {
  unsigned int reg;
  reg = stream*4 + 1;
  hwce_set_IOReg(hwce_id, reg, value);
}

// Sets the line_param reg (stride is in bytes)
static inline void hwce_set_line_params(unsigned int hwce_id, unsigned char stream, unsigned short int length, unsigned short int stride) {
  unsigned int reg;
  unsigned int value;
  reg = stream*4 + 2;
  value = (stride << 16) | length;
  hwce_set_IOReg(hwce_id, reg, value);
}

// Sets the feat_param reg (stride is in bytes)
static inline void hwce_set_feat_params(unsigned int hwce_id, unsigned char stream, unsigned short int length, unsigned short int stride) {
  unsigned int reg;
  unsigned int value;
  reg = stream*4 + 3;
  value = (stride << 16) | length;
  hwce_set_IOReg(hwce_id, reg, value);
}




static inline void hwce_setup(unsigned int hwce_id, unsigned int weight_ptr, unsigned int x_in_ptr, unsigned int y_in_ptr, unsigned int y_out_ptr,
                              unsigned int n_feat, unsigned int height, unsigned int width_total, unsigned int width_hwce, short int fw_hw, short int fw_eff,
                              //short int bias0, short int bias1, short int bias2, short int bias3,
                              short int sum_over_constant, int first_of_set, short int rectifier_activ) {
  // width is scaled down by a factor of two because image is 16-bit based
  //int fw_hwce; 
  int fw_eff_hwce;
    
  int i=0;
  
  if (first_of_set) {
    //each new offload inherits the parameters values from the previous programming. You have to overwrite only the values the change.
    //first_of_set must be assert for the first programming in a set of IG*OG total programmings. 
  
   // fw_hwce = fw_hw-1;
    fw_eff_hwce = fw_eff-1;
    
    hwce_set_IOReg       (hwce_id, HWCE_PARAMS + 0, weight_ptr); // pointer to the weights array
    
    hwce_set_IOReg       (hwce_id, HWCE_PARAMS + 1, (fw_eff << 16) | ((0x0000ffff) & 0)); // effective size of filter and number of mask
    hwce_set_IOReg       (hwce_id, HWCE_PARAMS + 2, (n_feat << 16) | (0) << 15 | (sum_over_constant&1) << 14 | (rectifier_activ&1) << 13 | ((width_hwce/2)&0xFFF)); // number of features, is_unsigned, sum_over_constant,rectifier_activ,width_hwce
       
  // Yout streams
      hwce_set_base_addr   (hwce_id, 0, y_out_ptr + BANK_SIZE*4*i);      
      hwce_set_trans_size  (hwce_id, 0, n_feat*(height-fw_eff_hwce)*(width_hwce/2-fw_eff_hwce/2));
      hwce_set_line_params (hwce_id, 0, width_hwce/2-fw_eff_hwce/2, 4*(width_total/2-fw_eff_hwce/2));
      hwce_set_feat_params (hwce_id, 0, (height-fw_eff_hwce)  , 4*(height-fw_eff_hwce)*(width_total/2-fw_eff_hwce/2));   

  // Yin streams
      hwce_set_base_addr   (hwce_id, 1,  y_in_ptr + BANK_SIZE*4*i);
      hwce_set_trans_size  (hwce_id, 1,  n_feat*(height-fw_eff_hwce)*(width_hwce/2-fw_eff_hwce/2));
      hwce_set_line_params (hwce_id, 1,  width_hwce/2-fw_eff_hwce/2, 4*(width_total/2-fw_eff_hwce/2));
      hwce_set_feat_params (hwce_id, 1,  (height-fw_eff_hwce), 0);

  // Xin streams
      hwce_set_base_addr   (hwce_id, 2,  x_in_ptr + BANK_SIZE*4*i);
      hwce_set_trans_size  (hwce_id, 2,  n_feat*height*width_hwce/2);
      hwce_set_line_params (hwce_id, 2,  width_hwce/2    , 4*width_total/2);
      hwce_set_feat_params (hwce_id, 2,  height          , 4*height*width_total/2);
    
    }
    else {
      // fw_hwce = fw_hw-1;
      fw_eff_hwce = fw_eff-1;
      
      hwce_set_IOReg       (hwce_id, HWCE_PARAMS + 0, weight_ptr); // pointer to the weights array
      
      hwce_set_IOReg       (hwce_id, HWCE_PARAMS + 2, (n_feat << 16) | (0) << 15 | (sum_over_constant&1) << 14 | (rectifier_activ&1) << 13 | ((width_hwce/2)&0xFFF));
                                                // number of features, is_unsigned, sum_over_constant,             rectifier_activ,               width_hwce
          
    // Yout streams
        hwce_set_base_addr   (hwce_id, 0, y_out_ptr + BANK_SIZE*4*i); 

    // Yin streams
        hwce_set_base_addr   (hwce_id, 1,  y_in_ptr + BANK_SIZE*4*i);

    // Xin streams
        hwce_set_base_addr   (hwce_id, 2,  x_in_ptr + BANK_SIZE*4*i);    
    
    }

}

/* Higher level HWCE APIs */ 

void hwce_wait(int offload_id); 

int  hwce_conv16_async(short int *W, short int *x, short int *y_in, short int *y_out, int h, int w, int nif, int fs, short int test_bias, short int rectifier_activation);
void hwce_conv16     (short int *W, short int *x, short int *y_in, short int *y_out, int h, int w, int nif, int fs, short int test_bias, short int rectifier_activation);

//void hwce_conv16_L2(short int *x_L2, short int *y_L2, int h, int w, int nif, int a);

int  hwce_offload(short int *W_ptr, short int *x_ptr, short int *y_in_ptr, short int *y_out_ptr, unsigned int fw_hw,
        unsigned int fw_eff, unsigned int h, unsigned int w, unsigned int nif, unsigned int ow, short int test_bias, short int rectifier_activation);






void hwce_offload_ext(int ih, int iw, int fw);
void load_l2(int ih, int iw, int fw);
void load();
void print_bank (int16_t * start_addr, int len);
int  checksum (int16_t * wi_start_addr, int len);
void dispose_weights_5x5 (int16_t *w_lin, int16_t *w_disp);
void create_pointers();
void inline wait_for_offload();
void inline conv_done();
void load_h();
void load_h_mw();
void print_interl (int num_feat, short int * stream, int size, int len, int offset );






















#endif
