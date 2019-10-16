/******************************************************************************
 *                                                                            *
 *          EOLAB @ DIEE - Università degli studi di Cagliari                 *
 *                      Via marengo 2 - 09123                                 *
 *                              Cagliari                                      *
 *                                                                            *
 *                                                                            *
 * Engineer:       Gianfranco Deriu - gian.deriu@gmail.com                    *
 *                                                                            *
 *                                                                            *
 * Project:        NEURAGHE                                                   *
 * File:           nuraghe_MW.c                                               *
 * Description:    convolution layer middleware                               *
 *                                                                            *
 ******************************************************************************/
 
 
#include "nuraghe_MW.h"

#define SIM

//#define MULTITRANSF_PROGR
//#define SINGLETRANSF_PROGR
#define MCHAN_2D

PULP_L1_DATA unsigned int y_addr_hwce    [400]; 
PULP_L1_DATA unsigned int y_in_addr_hwce [400];

PULP_L1_DATA unsigned int y_addr    [400]; 
PULP_L1_DATA unsigned int y_in_addr [400];

PULP_L1_DATA unsigned int OG; // number of groups of NROW output features
PULP_L1_DATA unsigned int IG; // number of groups of NCOL input features
PULP_L1_DATA unsigned int TILEs;
PULP_L1_DATA unsigned int BANK_SLOT_SIZE_Y;
PULP_L1_DATA unsigned int SLOT_SIZE_X;
PULP_L1_DATA unsigned int OW, OH;
PULP_L1_DATA unsigned int SG;


PULP_L1_DATA unsigned int YS; //number of slots for each of the two partion for y area. It depends on max_OG and is limited by TCDM size and output features size.

PULP_L1_DATA unsigned int PxW;
PULP_L1_DATA unsigned int BxP;
PULP_L1_DATA unsigned int BxWei;

PULP_L1_DATA unsigned int CONV_WIDTH;

PULP_L1_DATA unsigned int WS_SIZE;
PULP_L1_DATA unsigned int ws_size_B;



#define MAX_JOBS 15
PULP_L1_DATA Conv_params conv_tasks[MAX_JOBS] = {0};

PULP_L1_DATA Conv_params current_conv;

/************************************/
/* ███╗   ███╗ █████╗ ██╗███╗   ██╗ */
/* ████╗ ████║██╔══██╗██║████╗  ██║ */
/* ██╔████╔██║███████║██║██╔██╗ ██║ */
/* ██║╚██╔╝██║██╔══██║██║██║╚██╗██║ */
/* ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║ */
/* ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ */
/************************************/     

/*
*  This application is for the PULP cores. The app runs the entire MIDDLEWARE that performes the sincronization between ARM and NURAGHE.
*         Images and tests must be read from external memories (for example the DDR memory of the Xilinx Board)
*         Simultaneusly ARM cores must run an application that makes suitables data for NURAGHE.
*         The application for ARM can be a LINUX executable or a baremetal test. You can find both in the repository.
*
*  The variable "simulation" if 1 disables busy waiting for ARM signals. Set it to 1 if you simulate the middleware on ModelSim.
*         During simulations test images, weigths and biases are read from the arrays defined in test_array.h file.
*         Arrays in test_array.h file can be created, starting from user-customized data, with the post-training scripts
*/
int main() {

#ifdef SIM  
  int simulation     = 1;
#else
  int simulation     = 0;
#endif

  if(get_core_id() == 0){

   _dbg_flag_( 0x11); 
  
     
  if (simulation){
    _dbgm_printf_("!!! Running simulation !!! \n This configuration of the MW is not suitable for ARM triggered convolution.\n");
    
    _dbgm_printf_("bank_size   : %d \n", BANK_SIZE);
   // _dbgm_printf_("num_of_banks: %d \n", NUM_BANKS);   
  }        
 
  
 
  int job_id = 0;
  bool ps_ctrl = false;

  if (*((volatile unsigned int*)(CONV_SETUP_ADDR))== 0xA00AB11B) {
    //printf("PS CTRL PRESENT\n");
    ps_ctrl = true;
  }

  // Reuse code location to store tasks table pointer
  //printf("conv_tasks ptr: %x, %d\n", (unsigned int)conv_tasks, (unsigned int)(conv_tasks));
  *((volatile unsigned int*)(CONV_SETUP_ADDR))= (unsigned int)(conv_tasks);
  *((volatile unsigned int*)(JOB_ID_ADDR    ))= job_id;
  //printf("Written ptr: 0x%x at addr 0x%x -> read_check: 0x%x\n", (unsigned int)(conv_tasks), (volatile unsigned int*)(CONV_SETUP_ADDR), *((volatile unsigned int*)(CONV_SETUP_ADDR)));

  mw_ready();
 //   *(volatile int*) (0x100E8250 + 32*4) = 0x11111111;
  
  while (1){
  
_dbgm_printf_("HWCE ready! Waiting for offload...\n");  
  
    _dbg_flag_( 0x115); 
    if (!simulation) {
      //wait_for_offload_ddr();

      _dbgm_printf_("job_id: %d running: %d\n", job_id, conv_tasks[job_id].run);
         
      while(!*(volatile unsigned int*)(&conv_tasks[job_id].run));
    }
     
    _dbg_flag_( 0x12); 
    reset_timer();
    start_timer();
    
    int i, j, fe, og;
             
       
    _dbgm_printf_("Starting test dense layer.\n");
        
                                
    if (ps_ctrl) {
       //one 32bit-word for each parameter. All parameters are stored in the same bank.
      /* current_conv.IF =                          conv_tasks[job_id].IF;
       current_conv.OF =                          conv_tasks[job_id].OF;
       current_conv.IH =                          conv_tasks[job_id].IH;
       current_conv.IW =                          conv_tasks[job_id].IW;
       current_conv.FS =                          conv_tasks[job_id].FS;
       current_conv.MAX_OG =                      conv_tasks[job_id].MAX_OG;
       current_conv.max_stores =                  conv_tasks[job_id].max_stores;
       current_conv.w_ext =           conv_tasks[job_id].w_ext;
       current_conv.x_ext =           conv_tasks[job_id].x_ext;
       current_conv.y_ext =          conv_tasks[job_id].y_ext;
       current_conv.qf    =                       conv_tasks[job_id].qf;
     
       current_conv.rectifier_activ = (short int) conv_tasks[job_id].rectifier_activ;
       current_conv.pooling_hw =      (short int) conv_tasks[job_id].pooling_hw;

       current_conv.zero_padding =    (short int) conv_tasks[job_id].zero_padding;
       
 */
       current_conv = conv_tasks[job_id];
       
       _dbgm_printf_("Setup done.\n");

     }
     else {
 
       _dbgm_printf_("No setup parameters found. Using default.\n");
         
       current_conv.IF              = default_IF;
       current_conv.OF              = default_OF;
       current_conv.IH              = default_IH;
       current_conv.IW              = default_IW;
       current_conv.FS_h            = default_FS_h;
       current_conv.FS_w            = default_FS_w;
       current_conv.MAX_OG          = default_MAX_OG; //it must be choosed properly depending on output size and TCDM size
       
       current_conv.zero_padding    = default_zero_padding;
       current_conv.dil_h           = default_dil_h;
       current_conv.dil_w           = default_dil_w;
       current_conv.rectifier_activ = default_rectifier_activ;
       current_conv.pooling_hw      = default_pooling_hw;
     
       current_conv.qf              = default_QF;
       current_conv.precision8      = default_precision8;
       
       current_conv.w_ext = 0x80000000;
       current_conv.x_ext = 0x80000000;
       current_conv.y_ext = 0x80000000;    
         
     }
         
         
         /*parameters that depend on the others*/
         
         CONV_WIDTH = (current_conv.precision8) ? 8 : 16;
         
         PxW   = 16/CONV_WIDTH; //32
         BxP   = CONV_WIDTH/8;
         BxWei = 2;//CONV_WIDTH/8;
         
         WS_SIZE   = ((current_conv.FS_h*current_conv.FS_w)+1); //+ ((current_conv.FS_h*current_conv.FS_w)+1)%(64/CONV_WIDTH);
/*         if(WS_SIZE%4)*/
/*          WS_SIZE = WS_SIZE + (WS_SIZE%4);*/
          
         ws_size_B = WS_SIZE*(CONV_WIDTH/8);
         
         YS = (current_conv.MAX_OG + 1 ); // YS must be a multiple of YSLOTSxSUBPART
         if (YS%YSLOTSxSUBPART)
           YS = YS + (YSLOTSxSUBPART - YS%YSLOTSxSUBPART);
         
        OW= current_conv.IW-(current_conv.FS_w-1)*current_conv.dil_w*(1-current_conv.zero_padding)*(1-!(current_conv.IW>1));
        OH= current_conv.IH-(current_conv.FS_h-1)*current_conv.dil_h*(1-current_conv.zero_padding)*(1-!(current_conv.IH>1));
         
         int sub_part_n = YS/YSLOTSxSUBPART;
         
         BANK_SLOT_SIZE_Y = (BANK_SIZE*4/2)/sub_part_n;   // *4 dim in byte, /2 ping e pong, /sub_part_n suddivision di ping o pong in slot
         _dbgm_printf_("slotsize %d\n", BANK_SLOT_SIZE_Y);
         //BANK_SLOT_SIZE_Y must be rounded down to the nearest multiple of 4 bytes 
         if (BANK_SLOT_SIZE_Y % 16) // %8
           BANK_SLOT_SIZE_Y = BANK_SLOT_SIZE_Y - (BANK_SLOT_SIZE_Y % 16); // %8 
         _dbgm_printf_("slotsize %d\n", BANK_SLOT_SIZE_Y);
         
         SLOT_SIZE_X = BYTE_PER_BANK/2;
         int img_size_B_x = current_conv.IH*current_conv.IW*BxP;
         
         int img_size_B_y = OW * OH * BxP;
         
         TILEs = (int)(img_size_B_y/BANK_SLOT_SIZE_Y);      
         if (img_size_B_y%BANK_SLOT_SIZE_Y>0) TILEs++;
         
         //check tiles' size     for y slots     
         int tile_h= current_conv.IH/TILEs;
         int bottom_tile_h;
         do{                    
           bottom_tile_h = current_conv.IH - (current_conv.IH/TILEs)*(TILEs-1);                
           if (bottom_tile_h>tile_h)
             TILEs++;                                                                          
         }while (bottom_tile_h>tile_h);
         
         //check middle tiles
         int mid_tile_xh;
         
         do{                    
           mid_tile_xh=current_conv.IH/TILEs+current_conv.FS_h-1;
           if (mid_tile_xh*current_conv.IW*BxP > SLOT_SIZE_X)
             TILEs++;
         }while (mid_tile_xh*current_conv.IW*BxP > SLOT_SIZE_X);
         
/*         unsigned int feat_per_IG = (current_conv.FS==3) ? N_COL*3 : N_COL;*/
         
         unsigned int feat_per_IG;
         
         if(current_conv.IF<N_COL) 
          feat_per_IG = current_conv.IF;
         else
          feat_per_IG = N_COL;
         
         IG= (int)(current_conv.IF/feat_per_IG);
           
         if (current_conv.IF%feat_per_IG) IG++;
         
         OG= (int)(current_conv.OF/N_ROW); 
         if (current_conv.OF%N_ROW) OG++;
         
         
         SG= OG/current_conv.MAX_OG;
         if (OG%current_conv.MAX_OG!=0) SG++;
         
            
        /* if ((WS_SIZE*N_ROW*N_COL*current_conv.MAX_OG)/WEI_DMA_FREQ_RATIO>current_conv.IH/TILEs * current_conv.IW * feat_per_IG)
           current_conv.max_stores = (WS_SIZE*N_ROW*N_COL*current_conv.MAX_OG )/WEI_DMA_FREQ_RATIO / (OH/TILEs * OW * N_ROW); // WS_SIZE: 32 | 16: 4x4 
         else
           current_conv.max_stores = (current_conv.IH/TILEs * current_conv.IW * feat_per_IG)               / (OH/TILEs * OW * N_ROW);
         */

          current_conv.max_stores = (current_conv.MAX_OG) / IG; // <- in terms of OG
          if((current_conv.MAX_OG) % IG)
            current_conv.max_stores +=1;
     
          
         _dbgm_printf_("    IF: %d\n", current_conv.IF);
         _dbgm_printf_("    OF: %d\n", current_conv.OF);
         _dbgm_printf_("    IH: %d\n", current_conv.IH);
         _dbgm_printf_("    IW: %d\n", current_conv.IW);
         _dbgm_printf_("    FS_h: %d\n", current_conv.FS_h);
         _dbgm_printf_("    FS_w: %d\n", current_conv.FS_w);
         _dbgm_printf_("    dil_h: %d\n", current_conv.dil_h);
         _dbgm_printf_("    dil_w: %d\n", current_conv.dil_w);
         _dbgm_printf_("    OH: %d\n", OH);
         _dbgm_printf_("    OW: %d\n", OW);
         _dbgm_printf_("    IG: %d\n", IG);
         _dbgm_printf_("    OG: %d\n", OG);
         _dbgm_printf_("    SG: %d\n", SG); 
         _dbgm_printf_(" maxOG: %d\n", current_conv.MAX_OG); 
         _dbgm_printf_("    YS: %d\n", YS);
         _dbgm_printf_("    WS_SIZE: %d\n", WS_SIZE);
         _dbgm_printf_("    sub_part_n: %d\n", sub_part_n);
         _dbgm_printf_("    BANK_SLOT_SIZE_Y: %d\n", BANK_SLOT_SIZE_Y);
         
         _dbgm_printf_("tile_h: %d\n", tile_h);
         _dbgm_printf_(" TILEs: %d\n", TILEs);
         
         _dbgm_printf_("    img_size_B_x: %d\n",img_size_B_x);
         _dbgm_printf_("    img_size_B_y: %d\n",img_size_B_y);
             
         _dbgm_printf_(" max_stores: %d\n", current_conv.max_stores);
         _dbgm_printf_(" rectifier_activ: %d\n", current_conv.rectifier_activ);
         _dbgm_printf_(" zero_padding   : %d\n", current_conv.zero_padding);
         _dbgm_printf_(" pooling_hw     : %d\n", current_conv.pooling_hw);
         _dbgm_printf_(" feat_per_IG    : %d\n", feat_per_IG);
         _dbgm_printf_(" qf    : %d\n", current_conv.qf);
         
         _dbgm_printf_("\tweights_ext: 0x%08x\n", current_conv.w_ext);
         _dbgm_printf_("\tx_in_ext   : 0x%08x\n", current_conv.x_ext);
         _dbgm_printf_("\ty_out_ext  : 0x%08x\n", current_conv.y_ext);   

         /*
         
         if(pooling_hw==2){
            pooling_hw=1;
         }
         */     
         
         _dbg_flag_( 0x123); 
         create_pointers();               
         _dbg_flag_( 0x124); 

         if (current_conv.IH != 1 && current_conv.IH/TILEs< (current_conv.FS_h-1)*current_conv.dil_h + 1){
           printf ("ERROR! The tiling lead to a input size smaller than the filter size.\n");  
           printf ("\t Try reducing MAX_OG value. Current value: 0x%x\n", current_conv.MAX_OG);
           
           conv_tasks[job_id].run = 100;
           job_id = (job_id+1)%MAX_JOBS;
          // *((volatile unsigned int*)(CONV_SETUP_ADDR      )) = (unsigned int)(conv_tasks);
         //  *((volatile unsigned int*)(CONV_SETUP_ADDR + 4*1)) = job_id;
           return 1;
         }
         
          if (current_conv.MAX_OG*N_ROW*N_COL*WS_SIZE*2*2>WEI_MEM_SIZE_B){
           printf ("ERROR! The weights group size (%d B) execeded the available weights memory ( B).\n", current_conv.MAX_OG*N_ROW*N_COL*WS_SIZE*2*2, WEI_MEM_SIZE_B); 
           printf ("\t Try reducing MAX_OG value. Current value: 0x%x\n", current_conv.MAX_OG);
           
           conv_tasks[job_id].run = 101;
           job_id = (job_id+1)%MAX_JOBS;
          // *((volatile unsigned int*)(CONV_SETUP_ADDR      )) = (unsigned int)(conv_tasks);
         //  *((volatile unsigned int*)(CONV_SETUP_ADDR + 4*1)) = job_id;
           return 1;
         }


           _dbgm_printf_("Convolution started...\n");  
          

         stop_timer();    
   //printf("\n\nsetup:    %d\t  cycles\n\r", get_time());
                            
         hwce_offload_ext ( current_conv.IH, current_conv.IW, current_conv.FS_h, current_conv.FS_w, current_conv.dil_h, current_conv.dil_w );  
        


      
        _dbgm_printf_("End of layer.\n\n\n");   
        if (simulation) {
          _dbgm_printf_("!!! Running simulation !!! \n This configuration of the MW is not suitable for ARM triggered convolution.\n");
        }
         
          
       if (simulation) {
         break;
       }
       
       //conv_done_ddr();
       conv_tasks[job_id].run = 0;
   //    printf("%d\n", job_id);   
       job_id = (job_id+1)%MAX_JOBS;
       *((volatile unsigned int*)( CONV_SETUP_ADDR )) = (unsigned int)(conv_tasks);
       *((volatile unsigned int*)( JOB_ID_ADDR     )) = job_id;
       
     } //while(1)
   } //if get_core_id==0      
   //synch_barrier();
 eoc(0);

}




 /*
  
████████╗ ██████╗██████╗ ███╗   ███╗    ██████╗  ██████╗ ██╗███╗   ██╗████████╗███████╗██████╗ ███████╗
╚══██╔══╝██╔════╝██╔══██╗████╗ ████║    ██╔══██╗██╔═══██╗██║████╗  ██║╚══██╔══╝██╔════╝██╔══██╗██╔════╝
   ██║   ██║     ██║  ██║██╔████╔██║    ██████╔╝██║   ██║██║██╔██╗ ██║   ██║   █████╗  ██████╔╝███████╗
   ██║   ██║     ██║  ██║██║╚██╔╝██║    ██╔═══╝ ██║   ██║██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗╚════██║
   ██║   ╚██████╗██████╔╝██║ ╚═╝ ██║    ██║     ╚██████╔╝██║██║ ╚████║   ██║   ███████╗██║  ██║███████║
   ╚═╝    ╚═════╝╚═════╝ ╚═╝     ╚═╝    ╚═╝      ╚═════╝ ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚══════╝
  */
  
void create_pointers(){
  unsigned int i,j, k, pp;  
  /*                                                                                                     
  
  La memoria è divisa in due aree: una per le X e una per le Y. Entrambe le aree sono divise in due partizioni e le partizioni sono divise a loro volta in slot.
  Il numero di slot delle X è per ora costante (1 nella configurazione 5x5 e 3 nella configurazione 3x3), 
  quello delle Y varia a seconda dei parametri della rete (ad esempio dalla dimensione delle immagini in ingresso) ed è pari a MAXOG+1.

  Questo è importante: nelle due aree si switcha fra le due partizioni con regole diverse:
  Per l'area X si cambia partizione a ogni nuovo IG. Per l'area Y si cambia partizione per ogni nuovo SG.
  Quindi mentre nell'area Y si sta sulla partizione ping nell'area X si cambia varie volte fra ping e pong.

  Questo per dire che a ogni nuovo SG, nell'area Y, cambio partizione e ogni slot è vuoto per cui è indifferente a quale valore viene inizializzato il puntatore yseq.
  Quindi che parta da 0 (assegnandogli il valore 0 nel SG loop) o che parta dall'ultimo valore assunto nella partizione precedente il comportamento non cambia.
  
  
  */
  
  
   //####################################################################################
   //##################################  y_out pointers    ##############################
   //####################################################################################
   
   _dbgmwptr_printf_ ("\nCreated %d y slots of 0x%x * %d = 0x%x bytes each\n", YS*2, BANK_SLOT_SIZE_Y,N_ROW,BANK_SLOT_SIZE_Y*N_ROW);
   _dbgmwptr_printf_(".--------------------.--------------------.--------------------.--------------------.--------------------.\n");
   _dbgmwptr_printf_("|    banks C - F     |   banks 10 - 13    |   banks 14 - 17    |   banks 18 - 1B    |   banks 1C - 1F    |\n");
   _dbgmwptr_printf_("|--------------------+--------------------+--------------------+--------------------+--------------------|\n");
  
   unsigned int y_start_addr= SRAM_BASE_ADDRESS; //+ N_COL*3*BYTE_PER_BANK;       
   unsigned int sub_part_n;
   sub_part_n = YS/YSLOTSxSUBPART;
   
   
   for (pp=0; pp<2;pp++){
     for (i=0;i<sub_part_n;i++){ 
       for (j=0; j<YSLOTSxSUBPART; j++) { 
         int n_row_pw2;
         if (N_ROW>32)
           n_row_pw2 = 64;
         else if (N_ROW>16)
           n_row_pw2 = 32;
         else if (N_ROW>8)
           n_row_pw2 = 16;
         else if (N_ROW>4)
           n_row_pw2 = 8;
         else if (N_ROW>2)
           n_row_pw2 = 4;
         else if (N_ROW>1)
           n_row_pw2 = 2;
         else 
           n_row_pw2 = 1;
           
         y_addr      [pp*YS*2 + i*YSLOTSxSUBPART+j] = y_start_addr + j*N_ROW    *BYTE_PER_BANK + (pp*sub_part_n + i) * BANK_SLOT_SIZE_Y;
         y_addr_hwce [pp*YS*2 + i*YSLOTSxSUBPART+j] = y_start_addr + j*n_row_pw2*BYTE_PER_BANK + (pp*sub_part_n + i) * BANK_SLOT_SIZE_Y;
      
         _dbgmwptr_printf_("|%02d:    0x%08x   ", pp*YS + i*YSLOTSxSUBPART+j, y_addr[pp*YS*2 + i*YSLOTSxSUBPART+j]);
     
      }
       
      _dbgmwptr_printf_("|\n");
      if (i<sub_part_n-1)
        _dbgmwptr_printf_("|--------------------+--------------------+--------------------+--------------------+--------------------|\n");
      if (i==sub_part_n-1 && pp==0)
        _dbgmwptr_printf_("|====================+====================+====================+====================+====================|\n");
   
     }
   }
      
   _dbgmwptr_printf_("'--------------------'--------------------'--------------------'--------------------'--------------------'\n\n");
  
   //####################################################################################
   //###################################  y_in pointers    ##############################
   //####################################################################################
   
   /*Sfasamento di uno slot per gli indirizzi delle y per le due partizioni*/
   for (pp=0; pp<2;pp++){
     for (i=0;i<YS-1;i++){
       y_in_addr[pp*YS*2 + i] = y_addr[pp*YS*2 + i+1];
       y_in_addr_hwce[pp*YS*2 + i] = y_addr_hwce[pp*YS*2 + i+1];
     }
     y_in_addr[pp*YS*2 + YS-1] = y_addr[pp*YS*2 + 0];
     y_in_addr_hwce[pp*YS*2 + YS-1] = y_addr_hwce[pp*YS*2 + 0];
   }    
 
 
 
 
 
  /*The middleware needs 2*YS y tcdm pointers. This pointers are doubled in this way:
  
  MAXOG=4 -> YS=5
  
     0    1    2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18   19
   0100 0101 0102 0103 0104 0100 0101 0102 0103 0104 0010 0011 0012 0013 0014 0010 0011 0012 0013 0014
  |------------------- ping pointers ---------------|------------------- pong pointers ---------------|
  |------- original -------|--------- copy ---------|------- original -------|--------- copy ---------|
  
  They are doubled to emulate a circular array without acting on index.
  For example if you need 4 consecutive location starting from that at index 3 you can simply increase the index without taking care to go back to the location 0.
  This technic is used when programming a batch of OG.
  */ 
  
  
  // printf("y_in_addr  y_addr\n");
   for (pp=0; pp<2;pp++){
     for (i=0; i<YS;i++){ //FIXME
       y_addr    [pp*YS*2 + YS + i] = y_addr    [pp*YS*2 + i];       
       y_in_addr [pp*YS*2 + i+YS]   = y_in_addr [pp*YS*2 + i];
       
       y_addr_hwce    [pp*YS*2 + YS + i] = y_addr_hwce    [pp*YS*2 + i];       
       y_in_addr_hwce [pp*YS*2 + i+YS]   = y_in_addr_hwce [pp*YS*2 + i];
     }
   }
     
 
}


/******************************************************************************************************/
/*  ██████╗ ██████╗ ███╗   ██╗██╗   ██╗     ██████╗ ███████╗███████╗██╗      ██████╗  █████╗ ██████╗  */
/* ██╔════╝██╔═══██╗████╗  ██║██║   ██║    ██╔═══██╗██╔════╝██╔════╝██║     ██╔═══██╗██╔══██╗██╔══██╗ */
/* ██║     ██║   ██║██╔██╗ ██║██║   ██║    ██║   ██║█████╗  █████╗  ██║     ██║   ██║███████║██║  ██║ */
/* ██║     ██║   ██║██║╚██╗██║╚██╗ ██╔╝    ██║   ██║██╔══╝  ██╔══╝  ██║     ██║   ██║██╔══██║██║  ██║ */
/* ╚██████╗╚██████╔╝██║ ╚████║ ╚████╔╝     ╚██████╔╝██║     ██║     ███████╗╚██████╔╝██║  ██║██████╔╝ */
/*  ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝  ╚═══╝       ╚═════╝ ╚═╝     ╚═╝     ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝  */
/******************************************************************************************************/
void hwce_offload_ext ( int ih, int iw, int fw_h, int fw_w, int dil_h, int dil_w) {

     Store store_queue [2] [200];
      
      int n_store=0;
         
      volatile int offload_id, dma_id[3];
      unsigned int hwce_id = 0;
      unsigned int x_ptr_int;
      unsigned int w_ptr_int;
      
             
      unsigned int i,j, m, ig;
      unsigned int c=0;
      
      unsigned int t, sg, ss_mod2, ss_m1_mod2;
      unsigned int sg_mod2, sg_m1_mod2;
            
      int offload_id_tmp = -1;
        
          
      unsigned int y_seq=0;
      unsigned int x_seq=0;      
      
      unsigned int sum_over_constant;
      
      int queued_stores[2]={0,0};
      unsigned int r_ptr[2]={0,0};
      unsigned int w_ptr[2]={0,0};
      unsigned int tot_transf[2]={0,0};
    
    
      unsigned int ih_tile;
      unsigned int oh_tile;
       
      int if_stride;
      int of_stride;
       
      //int ig_stride;
      int og_stride; 
    
      reset_timer();
      start_timer();
      
      int oh, ow;
      int tr;
      
      unsigned int feat_per_IG;
      if(current_conv.IF<N_COL) 
        feat_per_IG = current_conv.IF;
      else
       feat_per_IG = N_COL;
          
      ow = (current_conv.zero_padding&0x1) ? iw: ( iw - (fw_w-1)*dil_w*(1-!(iw>1)));
      oh = (current_conv.zero_padding&0x1) ? ih: ( ih - (fw_w-1)*dil_h*(1-!(ih>1)));
     
      
       int out_row_made = 0;
       int in_row_made  = 0;
       
    //   int tile_height = ih/TILEs; //unused
       
       int o_tile_h;
       int oh_tot;
       
       if (current_conv.zero_padding&0x1){
         oh_tot = ih;
       }
       else {
         oh_tot = ( ih - (fw_h-1)*dil_h*(1-!(ih>1)));         
       }
       
       o_tile_h= oh_tot/TILEs;
       
       //printf("output tile h: %d\n", o_tile_h);
       
              
       int pool_d;
       switch(current_conv.pooling_hw&0x3){
        case 1: pool_d=2;
                break;
        case 3: pool_d=4;
                break;
        default: pool_d=1;
                 break;                 
        } 
       
       int odd_img=0;
        if(((ow/2)&0x1)==1 && (current_conv.pooling_hw&0x1)==1){ //pooling with odd images     TODO: pooligg must be adapted to 8bit precision     
          odd_img=1;                    
        } 
       of_stride       = ((ow/pool_d + odd_img)*BxP * oh/pool_d);
       og_stride       = of_stride * N_ROW;
       
       
       
       x_seq = 0;
       y_seq = 0;
        
      sg_mod2    =0;
      sg_m1_mod2 =1;
      

      _dbg_flag_( 0x49); 
      
       
      
       

      _dbg_flag_( 0x50); 
 



      _dbg_flag_( 0xc0); 
   
      dma_id[0]= mchan_alloc_mw_load(0);
      dma_id[2]= mchan_alloc_mw(0);
          

      _dbg_flag_( 0xc1); 
 
      dma_id[1]= mchan_alloc_mw(1);
          
      _dbg_flag_( 0xc2); 

       
       
      for (t=0;t<TILEs;t++){
      //############################# TILE LOOP #####################################
       /*
          _____ ___ _     _____   _                      
         |_   _|_ _| |   | ____| | |    ___   ___  _ __  
           | |  | || |   |  _|   | |   / _ \ / _ \| '_ \ 
           | |  | || |___| |___  | |__| (_) | (_) | |_) |
           |_| |___|_____|_____| |_____\___/ \___/| .__/ 
                                                  |_|    
      */
      
                 
        _dbgmw_printf_("\n# TILE loop %d of %d #\n", t+1, TILEs);

         _dbg_flag_( 0x321); 
    
        //############################# TILING #####################################
        Tile tile; 
        
    
        tile.iw = iw;
        tile.ow=  ow;
        
        
    
        if (TILEs==1) { //only one tile
          tile.nb_nt_zp=0b000 + (current_conv.zero_padding&0x1);
          
          tile.oh = o_tile_h;
          tile.ih = ih;
          
        }
        else if (t==0){ //top tile          
          tile.nb_nt_zp=0b100 + (current_conv.zero_padding&0x1);
          
          tile.oh = o_tile_h;
          tile.ih = (current_conv.zero_padding&0x1) ? o_tile_h + dil_h*(fw_h-1)/2 : o_tile_h + dil_h*(fw_h-1);
          
        
        }
        else if (t == TILEs-1){ //bottom tile
          o_tile_h = o_tile_h + (oh_tot - o_tile_h * TILEs);
        
          tile.nb_nt_zp=0b010 + (current_conv.zero_padding&0x1);
          
          tile.oh = o_tile_h;
          tile.ih = (current_conv.zero_padding&0x1) ? o_tile_h + dil_h*(fw_h-1)/2 : o_tile_h + dil_h*(fw_h-1);
                  
          
        
        }
        else{ //middle tiles
          tile.nb_nt_zp=0b110+ (current_conv.zero_padding&0x1);
          
          tile.oh = o_tile_h;
          tile.ih = o_tile_h + dil_h*(fw_h-1);
          
          
        }
       
     
         
        int iwidth_w= tile.iw/PxW; 
         //iwidth_w = iwidth_w >> 1; ///PxW;
        int owidth_w= tile.ow/PxW;
         //owidth_w = owidth_w >> 1; ///PxW;     
       
       
       tile.ibase_addr = current_conv.x_ext + in_row_made*tile.iw*BxP;//*4;
       in_row_made += tile.ih - ((fw_h-1) + (dil_h-1)*(1-!(ih>1))/2);                             //!!!!!!!!!!!!! DA VERIFICARE APPROFONDITAMENTE !!!!!!!!!!!!!!
       
       
       
       
       
       
       
       
       
      // printf ("  tile.oh: %d  out_row_made: %d \n", tile.oh, out_row_made);
       if_stride    =      iw*BxP *    ih   ; 
       
       //ig_stride    =      if_stride   * N_COL;  
       
       tile.isize_B = tile.iw*BxP * tile.ih; //* feat_per_IG; //N_COL;
       
      
              
            
        tile.osize_B    = ((tile.ow/pool_d + odd_img)*BxP * tile.oh/pool_d) * N_ROW;            
        tile.obase_addr = current_conv.y_ext + out_row_made*(tile.ow/pool_d + odd_img)*BxP;//*4;
        
       // printf ("  of_stride: %d \n", of_stride);
        
        out_row_made   += tile.oh/pool_d;
              
               
        _dbgmw_printf_ ("  ih_tile: %d -> oh_tile: %d \n", tile.ih, tile.oh);
        _dbgmw_printf_ ("  iw_tile: %d -> ow_tile: %d \n", tile.iw, tile.ow);
     
       
       
       
            _dbg_flag_( 0x322); 
        
        
        
        
        
        
        w_ptr_int = current_conv.w_ext;
        
      //  y_ptr_int_out = current_conv.y_ext;
         
      //    printf("1\n");
        for (sg=0; sg<SG; sg++){
          //############################# SUPER GROUP LOOP #####################################
             
          _dbgmw_printf_("\n    # SG loop %d of %d #\n", sg+1, SG);
     
          /****************************************************/
          /*    _____   _____     _                           */
          /*   / ____| / ____|   | |                          */
          /*  | (___  | |  __    | |      ___    ___   _ __   */
          /*   \___ \ | | |_ |   | |     / _ \  / _ \ | '_ \  */
          /*   ____) || |__| |   | |____| (_) || (_) || |_) | */
          /*  |_____/  \_____|   |______|\___/  \___/ | .__/  */
          /*                                          | |     */
          /*                                          |_|     */
          /****************************************************/ 
          
          int y_pp = sg_mod2*(YS*2); // it selects the ping or the pong partition for the y area
          
          
          unsigned int n_OG;
              
   
          if ((sg+1)*current_conv.MAX_OG>OG){
            n_OG = OG-sg*current_conv.MAX_OG;
          }
          else{
            n_OG = current_conv.MAX_OG;
          }    
            
                 
           
          int y_slot;  
          
          y_slot = IG-1;
          while (y_slot > YS)
            y_slot -= YS;
            
          //printf("\ny_slot: %d\n",y_slot);
            
          x_ptr_int = tile.ibase_addr;
          sum_over_constant = 1;
          for (ig=0;ig<IG;ig++){
          
              /**************************************************/
              /*  _____   _____     _                           */ 
              /* |_   _| / ____|   | |                          */ 
              /*   | |  | |  __    | |      ___    ___   _ __   */ 
              /*   | |  | | |_ |   | |     / _ \  / _ \ | '_ \  */ 
              /*  _| |_ | |__| |   | |____| (_) || (_) || |_) | */ 
              /* |_____| \_____|   |______|\___/  \___/ | .__/  */ 
              /*                                        | |     */ 
              /*                                        |_|     */   
              /**************************************************/  
                           
              _dbgmw_printf_("\n        # IG loop %d of %d #\n", ig+1, IG);
           
              
              
              y_seq= y_pp + y_slot;
              
              if (y_slot==0 )
                y_slot=YS-1;
              else
                y_slot--;
             
              
        
              _dbg_flag_( 0xb1); 

              
              
              
              // HWCE has a 2 slots queue: one processing and one waiting.
              // If the queue is full it means that both the y partition (ping and pong) are busy and the core must wait.              
        
               while((offload_id_tmp = hwce_acquire()) < 0) // BUSY WAIT
               ;
               offload_id = offload_id_tmp; 
                                  
               //printf("\noffload_id : %d\n",offload_id);
               
                
                
                
                
                /*
                   _                    _         
                  | |    ___   __ _  __| |  __  __
                  | |   / _ \ / _` |/ _` |  \ \/ /
                  | |__| (_) | (_| | (_| |   >  < 
                  |_____\___/ \__,_|\__,_|  /_/\_\
                                 
                */
                                           
              
                _dbgdma_printf_("\n            Lx(EXT->T) 0x%x byte.\n", tile.isize_B);
                
                 _dbg_flag_( 0x66);
               
                unsigned int num_burst;
                
                num_burst = 1; //(fw==3)? 3: 1;
#ifdef SINGLETRANSF_PROGR      
                for (i=0;i<num_burst;i++){

                  for (tr=0;tr<N_COL;tr++){  
                    mchan_lin_transfer  (0, tile.isize_B/N_COL, RX, INC, x_ptr_int, (unsigned int)(x_seq*(BYTE_PER_BANK/2) + (i*N_COL+tr)*BYTE_PER_BANK));
                    x_ptr_int += if_stride;
                    
                  }
                  
                }
#endif
#ifdef MULTITRANSF_PROGR
                mchan_lin_multi_transfer  (0, tile.isize_B/N_COL, RX, INC, x_ptr_int, (unsigned int)(x_seq*(BYTE_PER_BANK/2)), if_stride, num_burst*N_COL);
                    x_ptr_int += if_stride*N_COL*num_burst;                
#endif   

#ifdef MCHAN_2D
                mchan_twd_transfer        (0, tile.isize_B/*/N_COL*/, RX, x_ptr_int, (unsigned int)(x_seq*(BYTE_PER_BANK/2)), if_stride, BYTE_PER_BANK, num_burst*feat_per_IG/*N_COL*/,
                                                                                  0x00000000, 1, num_burst*feat_per_IG/*N_COL*/);
                    x_ptr_int += if_stride*N_COL*num_burst;
#endif            
               
                
                
              
                
                             
              /*              
                  _                    _             
                 | |    ___   __ _  __| |  __      __
                 | |   / _ \ / _` |/ _` |  \ \ /\ / /
                 | |__| (_) | (_| | (_| |   \ V  V / 
                 |_____\___/ \__,_|\__,_|    \_/\_/
              */
              
              
              

                _dbgdma_printf_("\n            W(EXT->T) 2*0x%x byte.\n", WS_SIZE*BxWei*n_OG*WL_PORTS);        
      
                _dbg_flag_( 0x65); 
#ifdef SINGLETRANSF_PROGR      
                               
                for (tr=0;tr<WL_PORTS;tr++){  // FIXME: the address of internal memory must be greater than 0x10000000
                  mchan_lin_transfer(1, WS_SIZE*BxWei*n_OG, RX, INC, w_ptr_int, 0x10000000 + WEI_MEM_BANK_SIZE_B*tr + x_seq*WEI_MEM_BANK_SIZE_B/2);
                  w_ptr_int += WS_SIZE*BxWei*n_OG;
                
                }
#endif 


#ifdef MULTITRANSF_PROGR 

                  mchan_lin_multi_transfer(1, WS_SIZE*BxWei*n_OG, RX, INC, w_ptr_int, 0x10000000 +  x_seq*WEI_MEM_BANK_SIZE_B/2, WS_SIZE*BxWei*n_OG, WL_PORTS);
                  w_ptr_int += WS_SIZE*BxWei*n_OG*WL_PORTS;               
                  
#endif


#ifdef MCHAN_2D 
                //printf("\n\t WS_SIZE : %d , BxWei: %d, n_OG:%d, WS_SIZE*BxWei*n_OG*4: %d, WL_PORTS/4 : %d \n",WS_SIZE,BxWei,n_OG,WS_SIZE*BxWei*n_OG*4,WL_PORTS/4);
                
                mchan_twd_transfer(1, WS_SIZE*BxWei*n_OG*4, RX, w_ptr_int,  0x10000000 + x_seq*WEI_MEM_BANK_SIZE_B/2, WS_SIZE*BxWei*n_OG*4, WEI_MEM_BANK_SIZE_B*4, (WL_PORTS/4),
                                    0x00000000, 1, (WL_PORTS/4));
                w_ptr_int += WS_SIZE*BxWei*n_OG*WL_PORTS;

#endif 

           
 
                    
                    
          //modelsim_wave_flag( 0x49);  
               
                      
              int    actv_on_last_IG = 0;
              int pool_hw_on_last_IG = 0;
              
              if (ig==IG-1) {//activation and pooling, if any, must be applied on the last IG only  
                   actv_on_last_IG = current_conv.rectifier_activ;  
                pool_hw_on_last_IG = current_conv.pooling_hw;
              }  
                                       
                    

                    _dbghwce_printf_("\n            ~~~ Conv tile:%d, sg:%d, ig:%d, n_OG:%d ~~~\n", t, sg, ig, n_OG);
                    _dbghwce_printf_("                  x_seq=%d, y_seq=%d, y_pp=%d, queued_stores: %d\n", x_seq, y_seq, y_pp, queued_stores[sg_mod2]);
                    _dbghwce_printf_("                  first of batch OG y: 0x%08x\n", y_addr    [y_pp]);
                    _dbghwce_printf_("                  ih=%d, iw=%d, fw_h=%d, fw_w=%d. sum_const=%d\n", tile.ih, tile.iw, fw_h, fw_w, sum_over_constant);
                    _dbghwce_printf_("                  tile.nb_nt_zp=%d, actv_on_last_IG=%d, pool_hw_on_last_IG=%d \n", tile.nb_nt_zp, actv_on_last_IG, pool_hw_on_last_IG);
                    _dbghwce_printf_("                  dil_h=%d, dil_w=%d\n", dil_h, dil_w);

                          
                    /************************************************************************/                     
                    /*  _    _ __          __ _____  ______              _                  */     
                    /* | |  | |\ \        / // ____||  ____|            | |                 */
                    /* | |__| | \ \  /\  / /| |     | |__     ___   ___ | |_  _   _  _ __   */
                    /* |  __  |  \ \/  \/ / | |     |  __|   / __| / _ \| __|| | | || '_ \  */
                    /* | |  | |   \  /\  /  | |____ | |____  \__ \|  __/| |_ | |_| || |_) | */
                    /* |_|  |_|    \/  \/    \_____||______| |___/ \___| \__| \__,_|| .__/  */
                    /*                                                              | |     */
                    /*                                                              |_|     */              
                    /************************************************************************/                      

                    _dbg_flag_( 0x70); 
                 
                    
                    hwce_setup (
                    //  (unsigned int) 0x800    * x_seq ,        //weights, from dedicated memory
                    //  (unsigned int) BYTE_PER_BANK/2   * x_seq ,   //x_addr    [x_seq],
                                     x_seq,
                                     y_in_addr_hwce [y_seq],  //yin
                                     y_addr_hwce    [y_seq],  //yout 
                                     y_addr_hwce    [y_pp],
                                     y_addr_hwce    [y_pp + YS-1],
                                     BANK_SLOT_SIZE_Y,
                                     n_OG,              // number of OG.                                      
                                     tile,
                                     ow,                // width_hwce, effective width processed in the specific offload
                                     fw_h,                // fw_eff
                                     fw_w,
                                     dil_h,
                                     dil_w,
                                     ws_size_B,
                                     current_conv.qf,   // qf
                                     current_conv.precision8,
                                     sum_over_constant, // sum_over_constant
                                    // tile.nb_nt_zp,     // zero padding
                                     actv_on_last_IG,   // rectifier_activation
                                     pool_hw_on_last_IG, // pooling   
                                     PxW,
                                     iwidth_w,
                                     owidth_w                           
                    );  
                    
                    
                              
                    while (hwce_status()){;}; 
                    
                    
                                         /*               
                    ____  _                 
                   / ___|| |_ ___  _ __ ___ 
                   \___ \| __/ _ \| '__/ _ \
                    ___) | || (_) | | |  __/
                   |____/ \__\___/|_|  \___|
                */
                
                if ((sg>0 || t>0)){
                    
                      //while (hwce_status()){;};
                      
                       _dbg_flag_( 0x64);
                      
                   i=0;
                   // before passing to a new SG all the previous OG must be stored so if HWCE is going to process the last ig of the SG it is necessary to program
                   // the transfers of all the remaining og.
                   
#ifdef SINGLETRANSF_PROGR                   
                   while (current_conv.max_stores && queued_stores[sg_m1_mod2]>0){   //TODO: i<max_store          */
                   //  printf("           %d     remaining queued_stores[%d]: %d\n", sg_mod2 ,sg_mod2, queued_stores[sg_mod2]-1);        

                   _dbgdma_printf_("\n            S(T->EXT) 0x%x byte\n", store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].size_B);
                   _dbgdma_printf_("                0x%x -> 0x%x\n",  store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].tcdm_ptr ,store_queue[sg_mod2][r_ptrsg_mod2]].ext_ptr );
                   _dbgdma_printf_("                remaining queued_stores[%d]: %d\n", sg_m1_mod2, queued_stores[sg_m1_mod2]-1);
                   
                     for (tr=0; tr<N_ROW; tr++){

                       mchan_lin_transfer(0, store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].size_B/N_ROW,
                                    TX, INC, store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].ext_ptr  + of_stride    * tr, 
                                             store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].tcdm_ptr + BYTE_PER_BANK * tr);
                       n_store++;

                    
                     }
                     
                     queued_stores[sg_m1_mod2]--; // decrement number of stores
                   
                 if (r_ptr[sg_m1_mod2]>=current_conv.MAX_OG-1) // update read pointer
                   r_ptr[sg_m1_mod2]=0;
                 else
                   r_ptr[sg_m1_mod2]++;
                 
                 i++;
                   }
                   
                 
#endif 


#ifdef MULTITRANSF_PROGR 
                  
                  while (current_conv.max_stores && queued_stores[sg_m1_mod2]>0){
                  
                    mchan_lin_multi_transfer(0, store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].size_B/N_ROW,
                                       TX, INC, store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].ext_ptr, 
                                                store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].tcdm_ptr, of_stride,
                                                store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].batch_size);
                 
                  //  printf("batch size: %d\n", store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].batch_size);               
                    n_store+=store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].batch_size;
                                             
                                             
                   queued_stores[sg_m1_mod2]--; // decrement number of stores
                     
                   if (r_ptr[sg_m1_mod2]>=current_conv.MAX_OG-1) // update read pointer
                     r_ptr[sg_m1_mod2]=0;
                   else
                     r_ptr[sg_m1_mod2]++;
                   
                   i++;          
                }
                
              
                                  
 #endif                  
                   
#ifdef MCHAN_2D 

                  if(queued_stores[sg_m1_mod2]>0){
                  
/*                  for(int qs=0; qs<queued_stores[sg_m1_mod2]; qs++){*/
/*                    tot_transf = tot_transf + store_queue[sg_m1_mod2][w_ptr[sg_m1_mod2]].batch_size;*/
/*                  }*/

                   mchan_twd_transfer_store(0, store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].size_B/N_ROW,
                                            TX, store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].ext_ptr, 
                                            store_queue[sg_m1_mod2][r_ptr[sg_m1_mod2]].tcdm_ptr, 
                                            of_stride, 
                                            BYTE_PER_BANK,
                                            tot_transf[sg_m1_mod2], //n_OG*N_ROW, //tot_transf /*current_conv.MAX_OG*N_ROW/
                                            BANK_SLOT_SIZE_Y,           
                                            queued_stores[sg_m1_mod2],  //num_batch_stores
                                            YSLOTSxSUBPART * N_ROW      //batch_size
                                            );
                                            
                    n_store+=current_conv.MAX_OG*N_ROW;
                    
                    
                    if (r_ptr[sg_m1_mod2]>=TILEs*SG*current_conv.MAX_OG)//current_conv.MAX_OG-1) // update read pointer
                       r_ptr[sg_m1_mod2]=0;
                    else
                       r_ptr[sg_m1_mod2] = r_ptr[sg_m1_mod2] + queued_stores[sg_m1_mod2];
                       
                       
                    queued_stores[sg_m1_mod2] = 0;
                    tot_transf[sg_m1_mod2] = 0;
                 } 
                 
#endif
                }
                           
              
                            
                                 
                              
                              
                    /*
                        _                        _        _                       
                       | |____      _____ ___   | |_ _ __(_) __ _  __ _  ___ _ __ 
                       | '_ \ \ /\ / / __/ _ \  | __| '__| |/ _` |/ _` |/ _ \ '__|
                       | | | \ V  V / (_|  __/  | |_| |  | | (_| | (_| |  __/ |   
                       |_| |_|\_/\_/ \___\___|   \__|_|  |_|\__, |\__, |\___|_|   
                                                            |___/ |___/                               
                    */         
                                         

                    _dbg_flag_( 0x71);        
                   
                    // The trigger can be sent only if the transfer of needed x and w is concluded
                    
                    mchan_barrier_mw_load(0, dma_id[0]);  // DMA BARRIER 
                    //mchan_barrier_mw(0, dma_id[2]);

                    _dbg_flag_( 0x72);        
                   
                    mchan_barrier_mw(1, dma_id[1]);  // DMA BARRIER 
                    

                    _dbg_flag_( 0x75); 
        
                    
                    hwce_trigger(); // HWCE TRIGGER 
                    
                    //while (hwce_status()){;}
                    
                    
 //  modelsim_wave_flag( 0x49);                 
                          
                    
                    /*              
                                _                                          _             
                            ___| |_ ___  _ __ ___    __ _ _   _  ___ _   _(_)_ __   __ _ 
                           / __| __/ _ \| '__/ _ \  / _` | | | |/ _ \ | | | | '_ \ / _` |
                           \__ \ || (_) | | |  __/ | (_| | |_| |  __/ |_| | | | | | (_| |
                           |___/\__\___/|_|  \___|  \__, |\__,_|\___|\__,_|_|_| |_|\__, |
                                                       |_|                         |___/                     
                    */
                      
                    if (ig==IG-1) { //add a store to queue only if the OG is complete

                      _dbg_flag_( 0x80); 
  

                      _dbgdma_printf_("            Queuing %d stores in queue #%d\n", n_OG, sg_mod2);                      
                      
                  
                      int store_batch = n_OG / YSLOTSxSUBPART;
                      if (n_OG > YSLOTSxSUBPART*store_batch)
                        store_batch++;
                        


                      for (i=0; i < store_batch; i++){
                        store_queue [sg_mod2][w_ptr[sg_mod2]].tcdm_ptr = y_addr[y_seq] + XMEM_SIZE;                                                
                        store_queue [sg_mod2][w_ptr[sg_mod2]].ext_ptr  = tile.obase_addr + (sg*current_conv.MAX_OG * og_stride) + (i * of_stride*N_ROW*YSLOTSxSUBPART);
                        store_queue [sg_mod2][w_ptr[sg_mod2]].size_B   = tile.osize_B;
                        int batch_size;
                        if (i == store_batch-1)
                          batch_size=(n_OG- i*YSLOTSxSUBPART)* N_ROW;
                        else
                          batch_size=YSLOTSxSUBPART * N_ROW;
                        
                        store_queue [sg_mod2][w_ptr[sg_mod2]].batch_size   = batch_size; 
                        
                        tot_transf[sg_mod2] = tot_transf[sg_mod2] + batch_size; //magari in futuro da inserire come campo di store_queue

                        _dbgdma_printf_("                0x%x -> 0x%x: 0x%x B, w_ptr[sg_mod2] = %d\n y_seq %d, y_addr[y_seq] 0x%x\n",  store_queue [sg_mod2][w_ptr[sg_mod2]].tcdm_ptr , 
                                                                          store_queue [sg_mod2][w_ptr[sg_mod2]].ext_ptr, 
                                                                          store_queue [sg_mod2][w_ptr[sg_mod2]].size_B,
                                                                          w_ptr[sg_mod2],
                                                                          y_seq,
                                                                          y_addr[y_seq]);
//printf("yseq: %d\n", y_seq);               
                        queued_stores[sg_mod2]++;
                        if (w_ptr[sg_mod2]>=TILEs*SG*current_conv.MAX_OG)//current_conv.MAX_OG-1)
                          w_ptr[sg_mod2]=0;
                        else
                          w_ptr[sg_mod2]++;
                          
                        y_seq+=YSLOTSxSUBPART;
                      }
                      
                      
                      _dbgdma_printf_("            queued_stores[%d]: %d\n",sg_mod2, queued_stores[sg_mod2]);

                    }
                                  
                                 
                x_seq ^= 1;  // first bit toggling. this expression requires less low-level instructions than this -> x_seq = (x_seq) ? 0: 1; 
                             // the "if method" requires 26 cycles, xor method requires 18 cycles.
                
                
                                   
                sum_over_constant = 0; // sum the bias only one time for each OG 
                
                
               // while (hwce_status()){;} // TODO: 
  //         ; // wait the end of the last convolution  
           } //loop IG 
           
           

            _dbg_flag_( 0x81); 
 
            //##################################### BARRIERA DMA #################################
            mchan_barrier_mw(0, dma_id[2]);
            _dbg_flag_( 0x811);
            //mchan_barrier_mw_load(0, dma_id[0]); // wait for the transfers of all the remaining og in the partition that is going to be used
            
            mchan_barrier_mw(1, dma_id[1]);
            //##################################### BARRIERA DMA #################################
          //  mchan_free_mw(0,dma_id[0]);
          //  mchan_free_mw(1,dma_id[1]);

            _dbg_flag_( 0x82); 
     
            sg_m1_mod2 = sg_mod2;        
            sg_mod2 ^= 1; // first bit toggling. Instead of %2 operation
                
          } //loop SG 
                         
        } //tile loop
        
        
        _dbg_flag_( 0x90); 
  
       //####################################################################
       //##################### HWCE BUSY WAITING ############################       
        while (hwce_status()){;}
       ; // wait the end of the last convolution       
       //####################################################################
            
                

        _dbgdma_printf_("\n# Last Stores #\n");
    //    _dbgdma_printf_("    queued_stores: %d\n", queued_stores);
    //    _dbgdma_printf_("    r_ptr: %d\n", r_ptr);
    //    _dbgdma_printf_("    w_ptr: %d\n", w_ptr);
 
       // dma_id[0]= mchan_alloc_mw(0);
       // dma_id[1]= mchan_alloc_mw(1);
        
        for (i=0;i<2;i++) { //     queued_stores are two counters, one for the ping partition and one for the pong 
          while (queued_stores[i]) {
             
             //############### STORE LAST Y

               _dbgdma_printf_("\nS(T->EXT) 0x%x byte\n", store_queue[i][r_ptr[i]].size_B);
              // _dbgdma_printf_("    0x%x -> 0x%x\n",  (int)y_store_fifo_tcdm[i][r_ptr[i]] ,   (int)y_store_fifo_ext[i][r_ptr[i]] );
               _dbgdma_printf_("    0x%x -> 0x%x\n",  store_queue[i][r_ptr[i]].tcdm_ptr ,   store_queue[i][r_ptr[i]].ext_ptr );
               _dbgdma_printf_("    remaining queued_stores[%d]: %d\n", i, queued_stores[i]-1);
               _dbgdma_printf_("    r_ptr[%d]: %d\n",i, r_ptr[i]);
 
                       
            //mchan_lin_transfer( 0, store_queue[i][r_ptr[i]].size_B, TX, INC, store_queue[i][r_ptr[i]].ext_ptr ,             store_queue[i][r_ptr[i]].tcdm_ptr);
           
#ifdef SINGLETRANSF_PROGR       


               for (tr=0;tr<N_ROW;tr++){ 
                 mchan_lin_transfer(0, store_queue[i][r_ptr[i]].size_B/N_ROW,
                              TX, INC, store_queue[i][r_ptr[i]].ext_ptr  + of_stride*tr, 
                                       store_queue[i][r_ptr[i]].tcdm_ptr + BYTE_PER_BANK*tr);
                 n_store++;
               }
               
               queued_stores[i]--; // decrement number of stores
                     
               if (r_ptr[i]>=TILEs*SG*current_conv.MAX_OG)//current_conv.MAX_OG-1) // update read pointer
                 r_ptr[i]=0;
               else
                 r_ptr[i]++;


#endif 


#ifdef MULTITRANSF_PROGR 


           mchan_lin_multi_transfer(0, store_queue[i][r_ptr[i]].size_B/N_ROW,
                              TX, INC, store_queue[i][r_ptr[i]].ext_ptr, 
                                       store_queue[i][r_ptr[i]].tcdm_ptr, of_stride, 
                                       store_queue[i][r_ptr[i]].batch_size);
                                               
          //printf("batch size: %d\n", store_queue[i][r_ptr[i]].batch_size);               
          n_store+=store_queue[i][r_ptr[i]].batch_size;
          
          queued_stores[i]--; // decrement number of stores
                             
         if (r_ptr[i]>=current_conv.MAX_OG-1) // update read pointer
           r_ptr[i]=0;
         else
           r_ptr[i]++;

#endif 
  
#ifdef MCHAN_2D 


         mchan_twd_transfer_store(0, store_queue[i][r_ptr[i]].size_B/N_ROW,
                                                  TX, store_queue[i][r_ptr[i]].ext_ptr, 
                                                  store_queue[i][r_ptr[i]].tcdm_ptr, 
                                                  of_stride, 
                                                  BYTE_PER_BANK,
                                                  tot_transf[i],
                                                  BANK_SLOT_SIZE_Y,
                                                  queued_stores[i],
                                                  YSLOTSxSUBPART * N_ROW
                                                  );
                                                  
                          n_store+=current_conv.MAX_OG*N_ROW;

             
                 
                 
                   if (r_ptr[i]>=current_conv.MAX_OG-1)
                     r_ptr[i]=0;
                   else
                     r_ptr[i] =  r_ptr[i] +  queued_stores[i]; 
                 
                   queued_stores[i] = 0;
                   tot_transf[i]=0;
  #endif                       
          }
       }

       _dbgdma_printf_("    queued_stores: %d + %d\n", queued_stores[0]*N_ROW,queued_stores[1]*N_ROW);
       _dbgdma_printf_("    n_stores: %d \n", n_store+ queued_stores[0]*N_ROW+queued_stores[1]*N_ROW);
      

       _dbg_flag_( 0xA1); 
    
        //##################################### BARRIERA DMA #################################
        mchan_barrier_mw(0, dma_id[2]); // attende che il traferimento sia completato
	_dbg_flag_( 0xA3);       
        mchan_barrier_mw(1, dma_id[1]);
        //##################################### BARRIERA DMA #################################
        
        mchan_free_mw(0,dma_id[0]);
        mchan_free_mw(0,dma_id[2]);
        mchan_free_mw(1,dma_id[1]);
 //  } //get_core_id() == 0
      
   stop_timer();    
  // printf("    %d\t cycles\n\r", get_time());  
 
         _dbg_flag_( 0xA2); 

   
}



/*

███████╗████████╗██╗   ██╗███████╗███████╗
██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝
███████╗   ██║   ██║   ██║█████╗  █████╗  
╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  
███████║   ██║   ╚██████╔╝██║     ██║     
╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝    

*/




void  
#ifdef INLINE_FUNCT
inline 
#endif
mw_ready(){  
  //printf("mw_ready!\n");
  *((volatile int *) MW_READY_ADDR)=MW_READY;
}

#ifdef SIM

inline void modelsim_wave_flag (int f){
  
  //  this function sends towards the stdout module a write.
   // You can use it to plot lightweight flags in modelsim waves to show at which time the execution reachs an instruction
  
  
  *(volatile int*) (0x1A111030) = f;
}

#else

inline void modelsim_wave_flag (int f){
  
  //  this function sends towards the stdout module a write.
  //  You can use it to plot lightweight flags in modelsim waves to show at which time the execution reachs an instruction
  
  
  *(volatile int*) (0x1C000000 + 0) = f;
}
#endif





/*
void  
#ifdef INLINE_FUNCT
inline 
#endif
 wait_for_offload(){
 
  // *((volatile int *) EOC_RETURN_ADDR)= MW_READY;
  
  while(*((volatile int *) OFFLOAD_READY)!=(int)0xABCDEF01) {}
  ;
  
  // *((volatile int *) EOC_RETURN_ADDR)= EOC_RETURN_RESET;
  *((volatile int *) OFFLOAD_READY)=0x0;  

}*/
/*
void  
#ifdef INLINE_FUNCT
inline 
#endif
 conv_done(){  
 // printf("convdone!\n");
  *((volatile int *) EOC_RETURN_ADDR)=CONV_DONE;
  while(*((volatile int *) OFFLOAD_READY)!=(int)0xC1A0) {}
  ;
  *((volatile int *) EOC_RETURN_ADDR)= EOC_RETURN_RESET;
}


*/


/*
void  
#ifdef INLINE_FUNCT
inline 
#endif
 wait_for_offload_ddr(){
   
  while(*((volatile int *) OFFLOAD_READY)!=(int)0xABCDEF01) {}
  ;
  
  *((volatile int *) OFFLOAD_READY)=0x0;  

}*/
/*
void  
#ifdef INLINE_FUNCT
inline 
#endif
 conv_done_ddr(){  
 // printf("convdone!\n");
  *((volatile int *) DDR_BASE_ADDR)=CONV_DONE;
}
*/
/*
void  
#ifdef INLINE_FUNCT
inline 
#endif
mw_ready_ddr(){  
  //printf("mw_ready!\n");
  *((volatile int *) DDR_BASE_ADDR)=MW_READY;
}

*/







/* High-level HAL */
/*
// waits on an offloaded job
static  
#ifdef INLINE_FUNCT
inline 
#endif
 void hwce_wait_on_job(unsigned int job_id) {
  int w;
  do {
    if (hwce_running_job()==0x00 && job_id==0xff)
      w=0;
    else if (hwce_running_job() > job_id)
      w=0;
    else
      w=1;
  } while (w==1);

  
  //int a;
  //while((a=hwce_running_job(hwce_id)) <= job_id) ;
   // printf ("a: %d\n",a);
}
*/
/*
// waits on an offloaded job
static  
#ifdef INLINE_FUNCT
inline 
#endif
 void hwce_wait_on_job_event(unsigned int job_id) {

  int coreID = get_core_id();
  
  set_evnt_mask_low( coreID, read_evnt_mask_low(coreID) | 1 << EVENT_HWCE );
  
  
   int w;
  do {
    if (hwce_running_job()==0x00 && job_id==0xff)
      w=0;
    else if (hwce_running_job() > job_id)
      w=0;
    else
      w=1;
    
    
    wait_event();
    clear_evnt_buff_low(1 << EVENT_HWCE);
    
  } while (w==1);
  
  

  while(hwce_running_job(hwce_id) <= job_id){
    wait_event();
    clear_evnt_buff_low(1 << EVENT_HWCE);
  }
}
    */

/*
void hwce_wait(int offload_id) {

  unsigned int hwce_id = 0;
#ifdef NO_HWCE_EVENTS
 // printf("hwce_wait_on_job\n");
  hwce_wait_on_job(offload_id);
#else
 // printf("hwce_wait_on_job_event\n");
  hwce_wait_on_job_event(offload_id);
#endif

} */

/*
void load_h_mw(short int * w_h, short int * x_h, unsigned int ih, unsigned int iw, unsigned int lite) {

_dbgm_printf_("Loading test features in l2 from header... \n");

  //####################################################################################
  //#############################  load weights           ##############################
  //####################################################################################
  
  unsigned int i;
  if (lite==0) {
    for (i=0; i<(unsigned int)(WS_SIZE*IG*N_ROW * N_COL * OG) ; i++){ // MOD 2
      current_conv.w_ext[i ] = w_h[i];
      //printf("0x%x\n",w_ext[i ]);
    }
    
    
    
    //####################################################################################
    //###############################  load x_in          ################################
    //####################################################################################
    
    for (i=0; i<ih*iw*IG*feat_per_IG ; i++)
      current_conv.x_ext[i ] = x_h[i];  
  }
  else {
    current_conv.w_ext = w_h;
    current_conv.x_ext = x_h; 
  }
  
#ifdef DEBUG_MAIN
   printf("Load l2 complete \n");
#endif
}

  _dbgm_printf_("Load l2 complete \n");

}
*/
/* #ifdef SIM

inline void modelsim_wave_flag (int f){
  
  //  this function sends towards the stdout module a write.
   // You can use it to plot lightweight flags in modelsim waves to show at which time the execution reachs an instruction
  
  
  *(volatile int*) (0x1A111030) = f;
}

#else

inline void modelsim_wave_flag (int f){
  
  //  this function sends towards the stdout module a write.
  //  You can use it to plot lightweight flags in modelsim waves to show at which time the execution reachs an instruction
  
  
  *(volatile int*) (0x80000080 + 0) = f;
}
#endif */




