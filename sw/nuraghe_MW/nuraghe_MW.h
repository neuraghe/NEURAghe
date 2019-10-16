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
 * Project:        NEURAGHE                                                   *
 * File:           neuraghe_MW.h                                              *
 * Description:    HWCE hardware abstraction layer                            *
 *                                                                            *
 ******************************************************************************/

#ifndef _MW_H
#define _MW_H

#define INLINE_FUNCT

#include "pulp.h"
#include "utils.h"
#include "events.h"
#include "events_ids.h"
#include "string_lib.h"
#include "timer.h"
#include <stdint.h>
#include <stdbool.h>
#include "bar.h"

#include "default_settings.h"

// uncomment the following lines to print debug strings

//#define _DEBUG_MAIN_
//#define _DEBUG_MW_
//#define _DEBUG_HWCE_
//#define _DEBUG_DMA_

//#define _DEBUG_FLAG_WAVES_
//#define _DEBUG_MW_POINTERS_

#ifdef _DEBUG_MAIN_
	#define _dbgm_printf_(...) if(*((volatile int*)CLUSTID_ADDR) == 0) printf(__VA_ARGS__)
#else
	#define _dbgm_printf_(...) do{}while(0)
#endif

#ifdef _DEBUG_MW_
	#define _dbgmw_printf_(...) printf(__VA_ARGS__)
#else
	#define _dbgmw_printf_(...) do{}while(0)
#endif

#ifdef _DEBUG_HWCE_
	#define _dbghwce_printf_(...) printf(__VA_ARGS__)
#else
	#define _dbghwce_printf_(...) do{}while(0)
#endif

#ifdef _DEBUG_DMA_
	#define _dbgdma_printf_(...) printf(__VA_ARGS__)
#else
	#define _dbgdma_printf_(...) do{}while(0)
#endif

#ifdef _DEBUG_MW_POINTERS_
	#define _dbgmwptr_printf_(...) printf(__VA_ARGS__)
#else
	#define _dbgmwptr_printf_(...) do{}while(0)
#endif

#ifdef _DEBUG_FLAG_WAVES_
	#define _dbg_flag_(...) modelsim_wave_flag(__VA_ARGS__)
#else
	#define _dbg_flag_(...) do{}while(0)
#endif



//#define NEU_TCN

//#define ZEDBOARD
#define ZC706
//#define US5x5
//#define US4x5
//#define ZC7062x4
//#define ZC7062x4_4096

#ifdef ZEDBOARD
  #ifdef NEU_TCN
    #define N_ROW     4
    #define N_COL     12
  #else
    #define N_ROW     2
    #define N_COL     2
  #endif
  #define BANK_SIZE 4096
#endif  

#ifdef ZC706
  #ifdef NEU_TCN
    #define N_ROW     4
    #define N_COL     12
    #define BANK_SIZE 4096
  #else
    #define N_ROW     4
    #define N_COL     4
    #define BANK_SIZE 8192
  #endif
  
#endif

#ifdef ZC7062x2

  #define N_ROW     2
  #define N_COL     2
  #define BANK_SIZE 8192
#endif 

#ifdef ZC7062x4

  #define N_ROW     4
  #define N_COL     2
  #define BANK_SIZE 8192
#endif 

#ifdef ZC7062x4_4096

  #define N_ROW     4
  #define N_COL     2
  #define BANK_SIZE 4096
#endif

#ifdef ZC7062x2_4096

  #define N_ROW     4
  #define N_COL     2
  #define BANK_SIZE 4096
#endif 

#ifdef US5x5

  #define N_ROW     5
  #define N_COL     5
  #define BANK_SIZE 8192
  
#endif

#ifdef US4x5

  #define N_COL     4
  #define N_ROW     5
  #define BANK_SIZE 8192
  
#endif

#define CONV_WIDTH 16 // to be removed

#ifdef NEU_TCN
	#define WEI_MEM_BANK_SIZE 1024//512//1024//2048//4096   //NOTA PER TCN: dimensiono come se avessi banchi con word da 64
#else
	#define WEI_MEM_BANK_SIZE 2048
#endif
                          

#ifdef NEU_TCN
  #define SHR 0
#else
  #define SHR 2
#endif

//#define PxW   (32/CONV_WIDTH)
//#define BxP   (CONV_WIDTH/8)
//#define BxWei (CONV_WIDTH/8)

#ifdef NEU_TCN
  #define NPF 1
#else
  #define NPF 3
#endif

#define WL_PORTS ( N_ROW*N_COL )

#define WEI_MEM_BANK_SIZE_B (WEI_MEM_BANK_SIZE*8)   //NOTA PER TCN: dimensiono come se avessi banchi con word da 64
#define WEI_MEM_SIZE_B (WEI_MEM_BANK_SIZE_B*N_ROW*N_COL)

#ifdef NEU_TCN
  #define BANKS_Y        2*N_ROW
#else
  #define BANKS_Y        20
#endif  

#define YSLOTSxSUBPART (BANKS_Y / N_ROW)

#define MAX_YS 100

#define WORD_SIZE_BYTE      4
#define XMEM_SIZE (N_COL*NPF*BANK_SIZE*WORD_SIZE_BYTE)
//#define NUM_BANKS           32

//#define BANKS_FOR_WEIGHTS   8
//#define BYTES_FOR_WG        N_ROW*N_COL*WS_SIZE*BxWei

//#define WORD_PER_WG         (BYTES_FOR_WG/(BANKS_FOR_WEIGHTS*4))

//#define CORE_RESERVED       256


#define DDR_BASE_ADDR       0x80000000
#define SRAM_BASE_ADDRESS   0x10000000

#define BYTE_PER_BANK       (BANK_SIZE * WORD_SIZE_BYTE) 
#define BANK_STRIDE         BYTE_PER_BANK

#define CONV_SETUP_ADDR     (SRAM_BASE_ADDRESS + 0x7AD4) // this address must be the same chosen in ARM code


#define OFFLOAD_READY (CONV_SETUP_ADDR + 4*11)
#define JOB_ID_ADDR   (CONV_SETUP_ADDR + 4*1)
#define MW_READY_ADDR (CONV_SETUP_ADDR + 4*2)
//#define MW_READY_ADDR DDR_BASE_ADDR
#define EOC_RETURN_ADDR   (EOC_UNIT_BASE_ADDR)

#define CONV_DONE 0x6
#define MW_READY  0x2
#define EOC_RETURN_RESET 0x0

#define CLUSTID_ADDR (CONV_SETUP_ADDR + 0xFC)

//(DDR_BASE_ADDR)
// ( CONV_SETUP_ADDR + 4*16)





#define N_MANDATORY_REGS   8
#define N_RESERVED_REGS    1
#define N_GENERIC_REGS     4
#define N_MAX_GENERIC_REGS  4


// stream IDs
#define HWCE_Y_OUT 0
#define HWCE_Y_IN  1
#define HWCE_X_IN  2

// this value depends on settings in hwce_wrapper_slave.sv module.
#define HWCE_PARAMS_START_REG (32-5)




/* LOW-LEVEL HAL */
#define HWCE_ADDR_BASE  HWCE_BASE_ADDR
#define HWCE_ADDR_SPACE 0x00000100


#define DUAL_DMA
#define WEI_DMA_FREQ_RATIO 2


#define MCHAN_COMMAND_QUEUE   ( MCHAN_BASE_ADDR + 0x0 )
#define MCHAN_STATUS_REGISTER ( MCHAN_BASE_ADDR + 0x4 )


#ifdef DUAL_DMA
  #define MCHAN_WEI_COMMAND_QUEUE   ( 0x10300000 + 0x0 )
  #define MCHAN_WEI_STATUS_REGISTER ( 0x10300000 + 0x4 )
#else
  #define MCHAN_WEI_COMMAND_QUEUE   MCHAN_COMMAND_QUEUE
  #define MCHAN_WEI_STATUS_REGISTER MCHAN_STATUS_REGISTER
#endif




#define MCHAN_LEN_WIDTH 16

#define TX 0x0
#define RX 0x1

#define FIX 0x0
#define INC 0x1

#define LIN 0x0
#define TWD 0x1

#define MCHAN_TRANSF_SIZE  16384 //4096 //32767 //65535 //16384


typedef struct Stores {
   unsigned int tcdm_ptr;
   unsigned int ext_ptr;
   unsigned int size_B;
   unsigned int batch_size;
} Store;

typedef struct Tiles {
   unsigned int ih;
   unsigned int iw; 
   unsigned int isize_B;
   unsigned int ibase_addr;
     
   unsigned int oh;
   unsigned int ow;
   unsigned int osize_B; 
   unsigned int obase_addr;     
   
   unsigned char nb_nt_zp; // {no bottom, no top, zp}: bottom_tile: 0b01-, top: 0b10- or middle: 0b11-     '-' is 1 if zp is enable else 0.
} Tile;

typedef struct Conv_params {
  uint32_t IF;
  uint32_t OF;
  uint32_t IH;
  uint32_t IW;
  uint32_t FS_h;
  uint32_t FS_w;
  uint32_t MAX_OG;
  uint32_t max_stores;
  uint32_t w_ext;
  uint32_t x_ext;
  uint32_t y_ext;
  uint32_t rectifier_activ;
  uint32_t pooling_hw;
  uint32_t qf;
  uint32_t precision8;
  uint32_t zero_padding;
  uint32_t dil_h;
  uint32_t dil_w;
  uint32_t run;
} Conv_params;

/*

██████╗ ███╗   ███╗ █████╗     ██╗  ██╗ █████╗ ██╗     
██╔══██╗████╗ ████║██╔══██╗    ██║  ██║██╔══██╗██║     
██║  ██║██╔████╔██║███████║    ███████║███████║██║     
██║  ██║██║╚██╔╝██║██╔══██║    ██╔══██║██╔══██║██║     
██████╔╝██║ ╚═╝ ██║██║  ██║    ██║  ██║██║  ██║███████╗
╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
                                                      



*/





// ########################### NEW DMA HAL  ##########################################




#ifdef NEU_TCN
  #define SH 3
#else
  #define SH 0
#endif

#define PLP_DMA_SIZE_BIT    0
#define PLP_DMA_SIZE_WIDTH  16 + SH
#define PLP_DMA_TYPE_BIT   (PLP_DMA_SIZE_WIDTH)
#define PLP_DMA_INCR_BIT   (PLP_DMA_SIZE_WIDTH + 1)
#define PLP_DMA_2D_BIT     (PLP_DMA_SIZE_WIDTH + 2)
#define PLP_DMA_ELE_BIT    (PLP_DMA_SIZE_WIDTH + 3)
#define PLP_DMA_ILE_BIT    (PLP_DMA_SIZE_WIDTH + 4)
#define PLP_DMA_BLE_BIT    (PLP_DMA_SIZE_WIDTH + 5)
#define PLP_DMA_2D_TCDM_BIT 22 + SH


static inline int mchan_alloc_mw_load(char id){

int mchan_reg=0;
 if (id==0)
   mchan_reg = MCHAN_COMMAND_QUEUE | 0x10;
 else
   mchan_reg = MCHAN_WEI_COMMAND_QUEUE;
 
  return *(volatile int*) mchan_reg;
}

static inline int mchan_alloc_mw(char id){

int mchan_reg=0;
 if (id==0)
   mchan_reg = MCHAN_COMMAND_QUEUE;
 else
   mchan_reg = MCHAN_WEI_COMMAND_QUEUE;
 
  return *(volatile int*) mchan_reg;
}

/*
static inline void mchan_transfer_mw(unsigned int len, char type, char incr, char twd, char ele, char ile, char ble, unsigned int ext_addr, 
                                  unsigned int tcdm_addr, unsigned short int count, unsigned short int stride)
{
 *(volatile int*) MCHAN_COMMAND_QUEUE = len | (type<<PLP_DMA_TYPE_BIT) | ( incr<<PLP_DMA_INCR_BIT) | 
                                                                         (twd <<PLP_DMA_2D_BIT) | (ele<<PLP_DMA_ELE_BIT) | (ile <<PLP_DMA_ILE_BIT) | (ble <<PLP_DMA_BLE_BIT);
 *(volatile int*) MCHAN_COMMAND_QUEUE = tcdm_addr;
 *(volatile int*) MCHAN_COMMAND_QUEUE = ext_addr;

 if (twd == 1) *(volatile int*) MCHAN_COMMAND_QUEUE = count | (stride << 16);
}

*/


static inline void mchan_twd_transfer(char id, unsigned int single_tr_len_b, char type, unsigned int ext_addr, 
                                               unsigned int tcdm_addr, unsigned int ext_stride, unsigned int tcdm_stride, unsigned int tot_transf,
                                               unsigned int dummy, unsigned int num_batch_stores, unsigned int batch_size)
{
  int mchan_reg=0;
   if (id==0)
     mchan_reg = MCHAN_COMMAND_QUEUE;
   else
     mchan_reg = MCHAN_WEI_COMMAND_QUEUE;
 
 int single_tr_len;
 #ifdef NEU_TCN
  single_tr_len = single_tr_len_b;
 #else
  single_tr_len = single_tr_len_b>>3;
 #endif
 int max_prog_size, last_prog_size;
 int total_tr_size = tot_transf*single_tr_len;
 int tr_per_batch_size = batch_size*single_tr_len;
 
 if(total_tr_size > tr_per_batch_size)
    last_prog_size = total_tr_size - (tr_per_batch_size*(num_batch_stores-1));
 else
    last_prog_size = total_tr_size;
 
 int ofxbatch_size = batch_size*ext_stride;

 int num_tr_in_batch = 1;
 max_prog_size = tr_per_batch_size; 
 
 int ext_stride_bis  = ext_stride  >> SHR;
 int tcdm_stride_bis = tcdm_stride >> SHR;
 
  
 *(volatile int*) mchan_reg = max_prog_size | (type<<PLP_DMA_TYPE_BIT) | ( 1<<PLP_DMA_INCR_BIT) | 
                                              (1 <<PLP_DMA_2D_BIT) | (0<<PLP_DMA_ELE_BIT) | (0 <<PLP_DMA_ILE_BIT) | (0 <<PLP_DMA_BLE_BIT) | 
                                              (1 << PLP_DMA_2D_TCDM_BIT);
                                              
 _dbgdma_printf_("\n\r prog_data 0x%x\n\r",max_prog_size | (type<<PLP_DMA_TYPE_BIT) | ( 1<<PLP_DMA_INCR_BIT) | 
                                              (1 <<PLP_DMA_2D_BIT) | (0<<PLP_DMA_ELE_BIT) | (0 <<PLP_DMA_ILE_BIT) | (0 <<PLP_DMA_BLE_BIT) | 
                                              (1 << PLP_DMA_2D_TCDM_BIT));

 *(volatile int*) mchan_reg = tcdm_addr;                                _dbgdma_printf_("\n\r tcdm_addr 0x%x\n\r",tcdm_addr);
 *(volatile int*) mchan_reg = ext_addr;                                 _dbgdma_printf_("\n\r ext_addr 0x%x\n\r",ext_addr);
 
 *(volatile int*) mchan_reg = single_tr_len_b | (ext_stride_bis << 15);     _dbgdma_printf_("\n\r ext_stride 0x%x\n\r",single_tr_len_b | (ext_stride << 15));
 *(volatile int*) mchan_reg = single_tr_len_b | (tcdm_stride_bis << 15);    _dbgdma_printf_("\n\r tcdm_stride 0x%x\n\r",single_tr_len_b | (tcdm_stride << 15));
 
 if(id==0){
   *(volatile int*) mchan_reg = dummy | (num_tr_in_batch << 16);
   *(volatile int*) mchan_reg = last_prog_size | (num_batch_stores << 16+SH);
   *(volatile int*) mchan_reg = ofxbatch_size;
  }
   
}



static inline void mchan_twd_transfer_store (char id, unsigned int single_tr_len_b, char type, unsigned int ext_addr, 
                                               unsigned int tcdm_addr, unsigned int ext_stride, unsigned int tcdm_stride, unsigned int tot_transf, 
                                               unsigned int bank_slot_size_y, unsigned int num_batch_stores, unsigned int batch_size)
{
 
 int mchan_reg = 0; 
 mchan_reg = MCHAN_COMMAND_QUEUE;
 
 int max_prog_size, last_prog_size, single_tr_len;
 
 #ifdef NEU_TCN
  single_tr_len = single_tr_len_b;
 #else
  single_tr_len = single_tr_len_b>>3;
 #endif
 
 int total_tr_size = tot_transf*single_tr_len;
 
    //printf("\n\rtotal_tr_size, %x, tot_transf %x, single_tr_len %x\n\r",total_tr_size,tot_transf,single_tr_len);
 
 int tr_per_batch_size = batch_size*single_tr_len;
 
 if(total_tr_size > tr_per_batch_size){
    last_prog_size = total_tr_size - (tr_per_batch_size*(num_batch_stores-1));}
 else{
    last_prog_size = total_tr_size;
    tr_per_batch_size = total_tr_size;}
    
    //printf("\n\rlast_prog_size %x, total_tr_size  %x,tr_per_batch_size  %x,num_batch_stores  %x\n\r",last_prog_size,total_tr_size,tr_per_batch_size,num_batch_stores);
 
 
 
 int ofxbatch_size = batch_size*ext_stride;

 int num_tr_in_batch = 1;
 max_prog_size = tr_per_batch_size;
 
 if(tr_per_batch_size <= MCHAN_TRANSF_SIZE){
    max_prog_size = tr_per_batch_size;
    num_tr_in_batch = 1;
   } 
 else
    do
    { 
      single_tr_len = single_tr_len/2;
      max_prog_size = max_prog_size/2;                _dbgdma_printf_("\n\rmax_prog_size %d\t", max_prog_size);
      num_tr_in_batch = num_tr_in_batch * 2;          _dbgdma_printf_("\tnum_tr_in_batch %d\t", num_tr_in_batch);
      bank_slot_size_y = bank_slot_size_y/2;          _dbgdma_printf_("\tbank_slot_size_y %d\t", bank_slot_size_y);
      //num_batch_stores = num_batch_stores*2;
      last_prog_size = last_prog_size/2;              _dbgdma_printf_("\tlast_prog_size %d\t", last_prog_size);
      single_tr_len_b = single_tr_len_b/2;            _dbgdma_printf_("\tsingle_tr_len_b %d\n\r", single_tr_len_b);
    }while(max_prog_size > MCHAN_TRANSF_SIZE);
 
// printf("\n\rlast_prog_size %x, total_tr_size  %x,tr_per_batch_size  %x,num_batch_stores  %x, num_tr_in_batch %x\n\r"
//                                                          ,last_prog_size,total_tr_size,tr_per_batch_size,num_batch_stores,num_tr_in_batch);
  
 *(volatile int*) mchan_reg = max_prog_size | (type<<PLP_DMA_TYPE_BIT) | ( 1<<PLP_DMA_INCR_BIT) | 
                                              (1 <<PLP_DMA_2D_BIT) | (0<<PLP_DMA_ELE_BIT) | (0 <<PLP_DMA_ILE_BIT) | (0 <<PLP_DMA_BLE_BIT) | 
                                              (1 << PLP_DMA_2D_TCDM_BIT);
                                              
 _dbgdma_printf_("\n\rprog_data 0x%x\n\r",max_prog_size | (type<<PLP_DMA_TYPE_BIT) | ( 1<<PLP_DMA_INCR_BIT) | 
                                              (1 <<PLP_DMA_2D_BIT) | (0<<PLP_DMA_ELE_BIT) | (0 <<PLP_DMA_ILE_BIT) | (0 <<PLP_DMA_BLE_BIT) | 
                                              (1 << PLP_DMA_2D_TCDM_BIT));


  int ext_stride_bis  = ext_stride  >> SHR;
  int tcdm_stride_bis = tcdm_stride >> SHR;
 *(volatile int*) mchan_reg = tcdm_addr;                                   _dbgdma_printf_("\n\rtcdm_addr 0x%x\n\r",tcdm_addr); 
 *(volatile int*) mchan_reg = ext_addr;                                    _dbgdma_printf_("\n\rext_addr 0x%x\n\r",ext_addr);
 
 *(volatile int*) mchan_reg = single_tr_len_b | (ext_stride_bis << 15);        _dbgdma_printf_("\n\rsingle_tr_len_b | (ext_stride << 15) 0x%x\n\r",single_tr_len_b | (ext_stride << 15));  
 *(volatile int*) mchan_reg = single_tr_len_b | (tcdm_stride_bis << 15);       _dbgdma_printf_("\n\rsingle_tr_len_b | (tcdm_stride << 15) 0x%x\n\r",single_tr_len_b | (tcdm_stride << 15));
 
 *(volatile int*) mchan_reg = bank_slot_size_y | (num_tr_in_batch << 16);  _dbgdma_printf_("\n\rbank_slot_size_y | (num_tr_in_batch << 16) 0x%x\n\r",bank_slot_size_y | (num_tr_in_batch << 16));
 *(volatile int*) mchan_reg = last_prog_size | (num_batch_stores << 16+SH);   _dbgdma_printf_("\n\rlast_prog_size | (num_batch_stores << 16) 0x%x\n\r",last_prog_size | (num_batch_stores << 16));
 
 *(volatile int*) mchan_reg = ofxbatch_size;                               _dbgdma_printf_("\n\rofxbatch_size 0x%x\n\r",ofxbatch_size);
 
}


static inline void mchan_lin_multi_transfer(char id, unsigned int len, char type, char incr, unsigned int ext_addr, unsigned int tcdm_addr, unsigned int ext_ptr_inc, unsigned int n_transf)
{
 
   int mchan_reg=0;
   if (id==0)
     mchan_reg = MCHAN_COMMAND_QUEUE;
   else
     mchan_reg = MCHAN_WEI_COMMAND_QUEUE;
 
 
 if (len<=MCHAN_TRANSF_SIZE){  
   *(volatile int*) mchan_reg = len | (type<<PLP_DMA_TYPE_BIT) | ( incr<<PLP_DMA_INCR_BIT) | (0 <<PLP_DMA_2D_BIT) | (0<<PLP_DMA_ELE_BIT) | (0 <<PLP_DMA_ILE_BIT) | (0 <<PLP_DMA_BLE_BIT);
   *(volatile int*) mchan_reg = tcdm_addr;
   *(volatile int*) mchan_reg = ext_addr;
   *(volatile int*) mchan_reg = ext_ptr_inc | (n_transf << 27);/**/
 }
 else{
   int l           = (int)len;
   int transf_len  = 0;
   int transf_done = 0;
   while (l>0){
     if (l>MCHAN_TRANSF_SIZE)
       transf_len= MCHAN_TRANSF_SIZE;
     else
       transf_len = l;
     
   //  printf ("l: %d transf_len %d     transf_done %d\n\r",l, transf_len, transf_done);
       
     *(volatile int*) mchan_reg = transf_len | (type<<PLP_DMA_TYPE_BIT) | ( incr<<PLP_DMA_INCR_BIT) | 
                                               (0 <<PLP_DMA_2D_BIT) | (0<<PLP_DMA_ELE_BIT) | (0 <<PLP_DMA_ILE_BIT) | (0 <<PLP_DMA_BLE_BIT);
     *(volatile int*) mchan_reg = tcdm_addr + transf_done;
     *(volatile int*) mchan_reg = ext_addr  + transf_done;
     *(volatile int*) mchan_reg = ext_ptr_inc | (n_transf << 27);/**/
      
     transf_done += transf_len;
     /*if ((tcdm_addr + transf_done)%16>0){
       printf ("aaaa: 0x%x %d\n\r", tcdm_addr , transf_done);
       while(1);
     }*/
     l = l-transf_len;
   }
 
 
 }
}





static inline void mchan_lin_transfer(char id, unsigned int len, char type, char incr, unsigned int ext_addr, unsigned int tcdm_addr)
{

 

   int mchan_reg=0;
   if (id==0)
     mchan_reg = MCHAN_COMMAND_QUEUE;
   else
     mchan_reg = MCHAN_WEI_COMMAND_QUEUE;
 
 
 if (len<=MCHAN_TRANSF_SIZE){ 
  // *(volatile int*) (mchan_reg + 0x10) = 0x100;
    
   *(volatile int*) mchan_reg = len | (type<<PLP_DMA_TYPE_BIT) | ( incr<<PLP_DMA_INCR_BIT) | (0 <<PLP_DMA_2D_BIT) | (0<<PLP_DMA_ELE_BIT) | (0 <<PLP_DMA_ILE_BIT) | (0 <<PLP_DMA_BLE_BIT);
   *(volatile int*) mchan_reg = tcdm_addr;
   *(volatile int*) mchan_reg = ext_addr;
   
 }
 else{
   int l           = (int)len;
   int transf_len  = 0;
   int transf_done = 0;
   while (l>0){
     if (l>MCHAN_TRANSF_SIZE)
       transf_len= MCHAN_TRANSF_SIZE;
     else
       transf_len = l;
     
   //  printf ("l: %d transf_len %d     transf_done %d\n\r",l, transf_len, transf_done);
       
     *(volatile int*) mchan_reg = transf_len | (type<<PLP_DMA_TYPE_BIT) | ( incr<<PLP_DMA_INCR_BIT) | 
                                               (0 <<PLP_DMA_2D_BIT) | (0<<PLP_DMA_ELE_BIT) | (0 <<PLP_DMA_ILE_BIT) | (0 <<PLP_DMA_BLE_BIT);
     *(volatile int*) mchan_reg = tcdm_addr + transf_done;
     *(volatile int*) mchan_reg = ext_addr  + transf_done; 
      
     transf_done += transf_len;
     /*if ((tcdm_addr + transf_done)%16>0){
       printf ("aaaa: 0x%x %d\n\r", tcdm_addr , transf_done);
       while(1);
     }*/
     l = l-transf_len;
   }
 
 
 }
}




static inline void mchan_lin_transfer_original(char id, unsigned int len, char type, char incr, unsigned int ext_addr, unsigned int tcdm_addr)
{



 int mchan_reg=0;
 if (id==0)
   mchan_reg = MCHAN_COMMAND_QUEUE;
 else
   mchan_reg = MCHAN_WEI_COMMAND_QUEUE;
 
 *(volatile int*) mchan_reg = len | (type<<PLP_DMA_TYPE_BIT) | ( incr<<PLP_DMA_INCR_BIT) | (0 <<PLP_DMA_2D_BIT) | (0<<PLP_DMA_ELE_BIT) | (0 <<PLP_DMA_ILE_BIT) | (0 <<PLP_DMA_BLE_BIT);
 *(volatile int*) mchan_reg = tcdm_addr;
 *(volatile int*) mchan_reg = ext_addr;

}

static inline void mchan_barrier_mw(char id_dma, int id) {
  int mchan_reg=0;
 if (id_dma==0)
   mchan_reg = MCHAN_STATUS_REGISTER;
 else
   mchan_reg = MCHAN_WEI_STATUS_REGISTER;
 
 while(((*(volatile int*)(mchan_reg)) >> id ) & 0x1 ) {}
}


static inline void mchan_barrier_mw_load(char id_dma, int id) {
  int mchan_reg=0;
 if (id_dma==0)
   mchan_reg = MCHAN_STATUS_REGISTER | 0x10;
 else
   mchan_reg = MCHAN_WEI_STATUS_REGISTER;
 
 while(((*(volatile int*)(mchan_reg)) >> id ) & 0x1 ) {}
}

static inline void mchan_free_mw(char id_dma, int id) {
   int mchan_reg=0;
 if (id_dma==0)
   mchan_reg = MCHAN_STATUS_REGISTER;
 else
   mchan_reg = MCHAN_WEI_STATUS_REGISTER;
 
 *(volatile int*) mchan_reg = 0x1 << id;
}

// ########################### END NEW DMA HAL  ##########################################




static 
#ifdef INLINE_FUNCT
inline 
#endif
int mchan_lin_transfer_hwce(unsigned int len, char type, char incr, unsigned int ext_addr, unsigned int tcdm_addr){
  
  int id = *(volatile int*) MCHAN_COMMAND_QUEUE;  
  
 // *(volatile int*) (0x1A111030) = 0x55;
  *(volatile int*) MCHAN_COMMAND_QUEUE = len | (type << MCHAN_LEN_WIDTH) | ( incr <<  (MCHAN_LEN_WIDTH + 1) ); //min 34 cycles
//  *(volatile int*) (0x1A111030) = 0x56;
  *(volatile int*) MCHAN_COMMAND_QUEUE = tcdm_addr;
  *(volatile int*) MCHAN_COMMAND_QUEUE = ext_addr;
  
  return id;
  
}




/*


██╗  ██╗██╗    ██╗ ██████╗███████╗    ██╗  ██╗ █████╗ ██╗     
██║  ██║██║    ██║██╔════╝██╔════╝    ██║  ██║██╔══██╗██║     
███████║██║ █╗ ██║██║     █████╗      ███████║███████║██║     
██╔══██║██║███╗██║██║     ██╔══╝      ██╔══██║██╔══██║██║     
██║  ██║╚███╔███╔╝╚██████╗███████╗    ██║  ██║██║  ██║███████╗
╚═╝  ╚═╝ ╚══╝╚══╝  ╚═════╝╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
                                                              




*/





static  
#ifdef INLINE_FUNCT
inline 
#endif
 void hwce_ll_hal_writecfg(unsigned int reg, unsigned int datum) {
  *(volatile unsigned int *)(HWCE_ADDR_BASE + (reg<<2)) = datum;
}

static  
#ifdef INLINE_FUNCT
inline 
#endif
 unsigned int hwce_ll_hal_readcfg(unsigned int reg) {
  return *(volatile unsigned int *)(HWCE_ADDR_BASE + (reg<<2));
}

/* HWPE-like HAL */

// Triggers the HWCE execution
static  
#ifdef INLINE_FUNCT
inline 
#endif
 void hwce_trigger() {
   hwce_ll_hal_writecfg(0,1);
}

// Reads status register, returns 1 if working, 0 if finished
static  
#ifdef INLINE_FUNCT
inline 
#endif
 unsigned int hwce_status() {
  return hwce_ll_hal_readcfg(3);
}

// Reads ID of the running job
static  
#ifdef INLINE_FUNCT
inline 
#endif
 unsigned int hwce_running_job() {
  return hwce_ll_hal_readcfg(4);
}

// Reads the context_id register and, if HW sync is active, initiates the setting phase
// returns -1 if no context available, or context_id if one is available
static  
#ifdef INLINE_FUNCT
inline 
#endif
 unsigned int hwce_acquire() {
  return hwce_ll_hal_readcfg(1);
}

// Sets the synchronization mode (0=polling, 1=events)
static  
#ifdef INLINE_FUNCT
inline 
#endif
 void hwce_set_sync(unsigned int sync_mode) {
   hwce_ll_hal_writecfg(2, sync_mode);
}

// Sets one of the generic registers (valid regs: 0 to N_GENERIC_REGS-1)
static  
#ifdef INLINE_FUNCT
inline 
#endif
 void hwce_set_generic(unsigned int reg, unsigned int value) {
  hwce_ll_hal_writecfg(N_MANDATORY_REGS+N_RESERVED_REGS + reg, value);
}

// Sets one of the IO registers (valid regs: 0 to N_IO_REGS-1)
static  
#ifdef INLINE_FUNCT
inline 
#endif
 void hwce_set_IOReg(unsigned int reg, unsigned int value) {
  hwce_ll_hal_writecfg(N_MANDATORY_REGS+N_RESERVED_REGS+N_MAX_GENERIC_REGS + reg, value);
}

// Sets the trans_size reg
static  
#ifdef INLINE_FUNCT
inline 
#endif
 void hwce_set_trans_size(unsigned char stream, unsigned int value) {
  unsigned int reg;
  reg = stream*4 + 0; // 4: Num. di registri per stream, quindi 4 per x_in, y_in e y_out.
  hwce_set_IOReg(reg, value);
}

// Sets the line_param reg (stride is in bytes)
static  
#ifdef INLINE_FUNCT
inline 
#endif
 void hwce_set_line_params(unsigned char stream, unsigned short int length, unsigned short int stride) {
  unsigned int reg;
  unsigned int value;
  reg = stream*4 + 1;
  value = (stride << 16) | length;
  hwce_set_IOReg(reg, value);
}

// Sets the feat_param reg (stride is in bytes)
static  
#ifdef INLINE_FUNCT
inline 
#endif
 void hwce_set_feat_params(unsigned char stream, unsigned short int length, unsigned short int stride) {
  unsigned int reg;
  unsigned int value;
  reg = stream*4 + 2;
  value = (stride << 16) | length;
  hwce_set_IOReg(reg, value);
}

// Sets the base_addr reg
static  
#ifdef INLINE_FUNCT
inline 
#endif
 void hwce_set_base_addr(unsigned char stream, unsigned int value) {
  unsigned int reg;
  reg = stream*4 + 3;
  hwce_set_IOReg(reg, value);
}
/*
// Sets the base_addr reg
static  
#ifdef INLINE_FUNCT
inline 
#endif
void hwce_set_base_addr_multi_og(unsigned char stream, int16_t ** value, unsigned int num) { //stream = 0 -> yout; stream = 1 -> yin
// *(volatile int*) (0x1A111030) = stream;
// *(volatile int*) (0x1A111030) = num;
  unsigned int reg;
  unsigned int i;
  for (i=0; i<num; i++){
    reg = stream + 12 + i*2;
    hwce_set_IOReg(reg, (unsigned int)value[i]);
  }
}

*/
/*


██╗  ██╗██╗    ██╗ ██████╗███████╗    ███████╗███████╗████████╗██╗   ██╗██████╗ 
██║  ██║██║    ██║██╔════╝██╔════╝    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
███████║██║ █╗ ██║██║     █████╗      ███████╗█████╗     ██║   ██║   ██║██████╔╝
██╔══██║██║███╗██║██║     ██╔══╝      ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝ 
██║  ██║╚███╔███╔╝╚██████╗███████╗    ███████║███████╗   ██║   ╚██████╔╝██║     
╚═╝  ╚═╝ ╚══╝╚══╝  ╚═════╝╚══════╝    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝     
                                                                                


*/





static  
#ifdef INLINE_FUNCT
inline 
#endif
 void hwce_setup(unsigned char input_buffer, unsigned int y_in_ptr, unsigned int y_out_ptr, int part_base_addr, int last_addr, int slot_size,
                              unsigned int n_og, Tile tile, unsigned int width_hwce, short int fw_h, short int fw_w, short int dil_h, short int dil_w, short int ws_size_B, 
                              short int qf, unsigned int precision8, 
                              short int sum_over_constant, short int rectifier_activ, int pooling_hw, unsigned int PxW, 
                              unsigned int iwidth_w, unsigned int owidth_w) {

#ifndef NEU_TCN
	fw_w = 0;
#endif


// width is scaled down by a factor of two because image is 16-bit based
       
  //  hwce_set_IOReg       (HWCE_PARAMS_START_REG + 0, weight_ptr); // pointer to the weights array
    
    hwce_set_IOReg       (HWCE_PARAMS_START_REG + 1, (fw_h << 16) | (fw_w << 24) | ((0x0000ffff) & 0)); // effective size of filter and number of mask
    
    hwce_set_IOReg       (HWCE_PARAMS_START_REG + 2, ((qf&0xF) << 28) | ((precision8&0x1) << 26)  | ((0&0x1F) << 25)  |  (pooling_hw&0xF) <<21 |(tile.nb_nt_zp&0x7) << 18 | (input_buffer&1) << 15 |
                         (sum_over_constant&1) << 14 |  (rectifier_activ&1) << 13 | (/*(width_hwce/PxW)*/owidth_w&0xFFF));
    
    hwce_set_IOReg       (HWCE_PARAMS_START_REG + 3, (last_addr&0xFFFF)<<16 | (slot_size&0xFFFF)); // last_addr are the 16 LSB of the address of the last slot
    
    
    hwce_set_IOReg       (HWCE_PARAMS_START_REG + 4, part_base_addr); // pointer to the partition base address


 _dbg_flag_( 0x701);
 
      int pool_div;
      
       switch(pooling_hw&0x3){
        case 1: pool_div=2;
                break;
        case 3: pool_div=4;
                break;
        default: pool_div=1;
                 break;                 
        } 
                                           
      _dbg_flag_( 0x702);                                              
 

  // Yout streams
  /*
      hwce_set_base_addr            (0, y_out_ptr);                                       // hwce_set_base_addr    
      hwce_set_trans_size           (0, n_og*tile.oh*owidth_w);  //words
      hwce_set_line_params          (0, owidth_w, 4*owidth_w);  // words, bytes
      hwce_set_feat_params          (0, tile.oh  , 4*tile.oh*owidth_w);   // rows, bytes
  */
     
      _dbg_flag_( 0x703);
     
     int A = (owidth_w)/pool_div;
     int B = tile.oh/pool_div;
     int uno = 0;
     int By_per_w;
     
     #ifdef NEU_TCN
        By_per_w = 2; 
     #else
        By_per_w = 4;
     #endif
     
      _dbg_flag_( 0x704);
     
     if((owidth_w)%pool_div!=0){
          uno=1;
     }
     else{
          uno=0;
     }
     A+=uno;
  
   _dbg_flag_( 0x705);
  
      hwce_set_base_addr            (0, y_out_ptr );                                       // hwce_set_base_addr    
      hwce_set_trans_size           (0, (n_og*A*B));  //words
      hwce_set_line_params          (0, (owidth_w)/pool_div+uno, (By_per_w*A));  // words, bytes
      hwce_set_feat_params          (0, tile.oh/pool_div  , (By_per_w*A*B));   // rows, bytes

 _dbg_flag_( 0x706);

 // Yin streams
      hwce_set_base_addr            (1,  y_in_ptr );                                      // hwce_set_base_addr  
      hwce_set_trans_size           (1,  n_og*tile.oh*owidth_w);  //words
      hwce_set_line_params          (1,  owidth_w , By_per_w*owidth_w); // words, bytes
      hwce_set_feat_params          (1,  tile.oh   , By_per_w*tile.oh*owidth_w);// rows, bytes
    
     _dbg_flag_( 0x707);
   
// Xin streams
//    hwce_set_base_addr            (2,  x_in_ptr );     
//    hwce_set_IOReg                (11, x_in_ptr);                                             // hwce_set_base_addr 


      #ifdef NEU_TCN
      
        hwce_set_trans_size           (2,  n_og*tile.oh*owidth_w);                              
        hwce_set_line_params          (2,  owidth_w, By_per_w*iwidth_w); // words, bytes    
        hwce_set_feat_params          (2,  tile.oh , By_per_w*tile.ih*iwidth_w);// rows, bytes
                                                                                               //without padding only lenghts change, strides are the same
        _dbg_flag_( 0x708);
        
        hwce_set_IOReg                (2*4 + 3, (fw_h*fw_w) | (dil_h << 16) | (dil_w << 20) | ws_size_B << 24);
        
        _dbg_flag_( 0x709);
        
        hwce_set_IOReg                (2*4 + 4, dil_h*By_per_w*iwidth_w  << 16 | dil_w*By_per_w); //  word_stride*dil_w | line_stride*dil_h
        
      #else
      
        hwce_set_trans_size           (2,  n_og*tile.ih*iwidth_w);  // words
        hwce_set_line_params          (2,  iwidth_w , By_per_w*iwidth_w); // words, bytes
        hwce_set_feat_params          (2,  tile.ih   , By_per_w*tile.ih*iwidth_w);// rows, bytes
        
      #endif
 
}









/* Higher level HWCE APIs */ 

void hwce_wait(int offload_id); 


inline void modelsim_wave_flag (int f);

void load_l2(int ih, int iw, int fw);
void load();
void print_bank (int16_t * start_addr, int len);
int  checksum (int16_t * wi_start_addr, int len);
void dispose_weights_5x5 (int16_t *w_lin, int16_t *w_disp);
void create_pointers();
void  
#ifdef INLINE_FUNCT
inline 
#endif
 wait_for_offload();
void  
#ifdef INLINE_FUNCT
inline 
#endif
 conv_done();

void  
#ifdef INLINE_FUNCT
inline 
#endif
 wait_for_offload_ddr();
void  
#ifdef INLINE_FUNCT
inline 
#endif
 conv_done_ddr();
 void  
#ifdef INLINE_FUNCT
inline 
#endif
mw_ready();

void load_h();
void load_h_mw(short int * w_h, short int * x_h, unsigned int ih, unsigned int iw, unsigned int lite);
void print_interl (int num_feat, short int * stream, int size, int len, int offset );
void hwce_offload_ext ( int ih, int iw, int fw_h, int fw_w, int dil_h, int dil_w, int feat_per_IG);


 
 /* NOTE:
 
 /sw/ref/crt0.or1k.S è stato modificato per lo stack dei core
 
 hack in ulpcluster to disable hwce interrupts
  
 */ 






#endif
