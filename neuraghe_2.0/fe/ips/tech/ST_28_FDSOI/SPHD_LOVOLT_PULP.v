//  
//  
//  ------------------------------------------------------------
//    STMicroelectronics N.V. 2015
//   All rights reserved. Reproduction in whole or part is prohibited  without the written consent of the copyright holder.                                                                                                                                                                                                                                                                                                                           
//    STMicroelectronics RESERVES THE RIGHTS TO MAKE CHANGES WITHOUT  NOTICE AT ANY TIME.
//  STMicroelectronics MAKES NO WARRANTY,  EXPRESSED, IMPLIED OR STATUTORY, INCLUDING BUT NOT LIMITED TO ANY IMPLIED  WARRANTY OR MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE,  OR THAT THE USE WILL NOT INFRINGE ANY THIRD PARTY PATENT,  COPYRIGHT OR TRADEMARK.
//  STMicroelectronics SHALL NOT BE LIABLE  FOR ANY LOSS OR DAMAGE ARISING FROM THE USE OF ITS LIBRARIES OR  SOFTWARE.
//    STMicroelectronics
//   850, Rue Jean Monnet
//   BP 16 - 38921 Crolles Cedex - France
//   Central R&D / DAIS.
//                                                                                                                                                                                                                                                                                                                                                                             
//    
//  
//  ------------------------------------------------------------
//  
//  
//    User           : philippe flatresse      
//    Project        : PULP                    
//    Division       : Not known               
//    Creation date  : 19 May 2015             
//    Generator mode : MemConfMAT10/distributed
//    
//    WebGen configuration              : C28SOI_MEM_SRAM_SPHD_LOVOLT:800,5:MemConfMAT10/distributed:1.0-00
//  
//    HDL C28SOI_ST_SP Compiler version : 2.1a@20141219.0 at Dec-19-2014 (PTBL date)                        
//    
//  
//  For more information about the cuts or the generation environment, please
//  refer to files uk.env and ugnGuiSetupDB in directory DESIGN_DATA.
//   
//  
//  


        

/***************************************************************************************************************************************************
--  Description       :  Verilog Model 
--  ModelVersion      : 1.9
--  Date              : 24-Sept-2014
--  Changes Made by   : PS
*****************************************************************************************************************************************************/

/************************************** START OF HEADER *****************************************
   This Header Gives Information about the parameters & options present in the Model
   
   words = 2048
   bits  = 32
   mux   = 8 
   bank = 1
   bit_mask = yes
   Redundancy = no
   margin_control = yes
   ls_pin = yes
   hs_pin = yes
   Sleep = Yes
   eswitch = No
   power_supply = Default
   
   --------------------------------------------------------------------------------------------
     Signal Name             | Description       |             Port Mode        | Active When
                             |                   |          r    |  w   | rw    |
   --------------------------------------------------------------------------------------------

    A                           Address                     x      x      na       -
    ATP                         ATP pin                     x      x      na       high
    CK                          Clock	                    x      x      na       posedge
    CSN                         Chip Enable                 x      x      na       low
    D 	                        Data in                     na     x      na       -  
    
    HS                          High Speed Mode Enable      x      x      na       High
    IG                          Input Gate Enable           x      x      na       High     
    INITN                       Initialization Pin          x      x      na       Low
    
    LS                          Low Speed Mode Enable       x      x      na       High 
    
    M                           Mask in                     na     x      na       High  
    
    
    
    Q 	                        Data out	            x      na     na       -
    
    RM                           Read Margins                x      x      na       High 
    
    
    SCTRLI                      Scan Input (Control)
    SCTRLO                      Scan Output (Control)
    SDLI                        Scan Input (Data-Left)
    SDLO                        Scan Output (Data-Left)
    SDRI                        Scan Input (Data-Right)
    SDRO                        Scan Output (Data-Right)
    SE                          Scan Enable pin            -      -      -       High
    
    
    
    SMLI                        Scan Input (Mask-Left)        
    SMLO                        Scan Output (Mask-Left)
    SMRI                        Scan Input (Mask-Right)
    SMRO                        Scan Output (Mask-Right)  
    
    
    
    
     

    STDBY                       Stand-by mode enable        x      x      na       High  
    
    TA                          Bist Address
    TBIST                       Bist Enable Pin             x      x      na       High  
    
    TBYPASS                     Memory Bypass               na     na     na       High
    TCSN                        Bist Chip Select            x      x      na       Low
    TED                         Bist Even Data pin
    
    TEM                         Bist Even Mask pin
    TOD                         Bist Odd Data Pin
    
    TOM                         Bist Odd Mask Pin  
     
    TWEN                        Bist Write Enable           na     x      na       Low 
    WEN                         Write Enable                na     x      na       Low 
    
    WM                           Write Margins Code           x      x      na       - 

************************************** END OF HEADER ********************************************/




`celldefine

`ifdef ST_DELAY_SEQ
  `define st_delay_seq_taa `ST_DELAY_SEQ
`else
  `define st_delay_seq_taa 0.001
`endif

`ifdef ST_MEM_RETAIN_TIME
 `define st_delay_seq_th `ST_MEM_RETAIN_TIME
`else
 `define st_delay_seq_th 0.001
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_TIMESCALE
 `ST_TIMESCALE
`else
 `timescale 1ns/1ps
`endif

`ifdef ST_MSG_CONTROL_TIME
        `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
        `define st_msg_cntrl_time 0
`endif

`ifdef ST_MEM_BLOCK_CTRL_TIME
        `define st_mem_block_ctrl_time `ST_MEM_BLOCK_CTRL_TIME
`else
        `define st_mem_block_ctrl_time 0
`endif

`define mono_rail 2'b00
`define mo_ma_tied 2'b01
`define mo_mp_tied 2'b10
`define dual_rail 2'b11


`ifdef ST_MEM_PSWSMALLMA_SETTLING_TIME
  `define pswsmallma_settling_time `ST_MEM_PSWSMALLMA_SETTLING_TIME
`else  
  `define pswsmallma_settling_time 1000
`endif

`ifdef ST_MEM_PSWLARGEMA_SETTLING_TIME
  `define pswlargema_settling_time `ST_MEM_PSWLARGEMA_SETTLING_TIME
`else  
  `define pswlargema_settling_time 1000
`endif

`ifdef ST_MEM_PSWSMALLMP_SETTLING_TIME
  `define pswsmallmp_settling_time `ST_MEM_PSWSMALLMP_SETTLING_TIME
`else  
  `define pswsmallmp_settling_time 1000
`endif

`ifdef ST_MEM_PSWLARGEMP_SETTLING_TIME
  `define pswlargemp_settling_time `ST_MEM_PSWLARGEMP_SETTLING_TIME
`else  
  `define pswlargemp_settling_time 1000
`endif


/*------------------------------------------------------------------------------------------
            ST_SPHD_LOVOLT_2048x32m8_bTMl model for Verilog 
-------------------------------------------------------------------------------------------*/

module ST_SPHD_LOVOLT_2048x32m8_bTMl (A, ATP, CK, CSN, D , HS, IG, INITN , LS, M, Q, RM, SCTRLI,SCTRLO,SDLI,SDLO,SDRI,SDRO,SE, SMLI,SMLO,SMRI,SMRO,   STDBY ,TA,TBIST, TBYPASS ,TCSN,TED ,TEM  ,TOD  ,TOM , TWEN, WEN, WM);

    
    parameter
        `ifdef ST_MEM_CONFIGFAULT
                ConfigFault = 1,
        `else
                ConfigFault = 0,
        `endif
        
        `ifdef ST_NO_MSG_MODE  
                p_debug_level = 2'b00,
        `elsif ST_ALL_MSG_MODE  
                p_debug_level = 2'b11,
        `elsif ST_ERROR_ONLY_MODE 
                p_debug_level = 2'b01,
        `else 
                p_debug_level = 2'b10,
        `endif
        
        
        power_pins_config = `mono_rail,

        Fault_file_name = "ST_SPHD_LOVOLT_2048x32m8_bTMl_faults.txt",
        max_faults = 2048+2,
        MEM_INITIALIZE  = 1'b0,
        BinaryInit = 1'b0,
        InitFileName = "ST_SPHD_LOVOLT_2048x32m8_bTMl.cde",
        Debug_mode = "all_warning_mode",
        File_load_time=0,
        InstancePath = "ST_SPHD_LOVOLT_2048x32m8_bTMl",
        
        p_pswsmallma_settling_time = `pswsmallma_settling_time,
        p_pswlargema_settling_time = `pswlargema_settling_time,
        p_pswsmallmp_settling_time = `pswsmallmp_settling_time,
        p_pswlargemp_settling_time = `pswlargemp_settling_time,
        message_control_time = `st_msg_cntrl_time,
        mem_block_ctrl_time = `st_mem_block_ctrl_time;
        

    localparam
        words = 2048,
        bits = 32,
        Addr = 11,
        max_address_bits = 12,
        
        
        mask_bits = 32, 
        
        mux = 8,
        Logmux = 3,
        mux_bits=3,
        bank_bits=0,
        RedWords = mux * 2 * 1,
        Rows = words/mux,
        repair_address_width = 8,
        write_margin_size = 4, 
        read_margin_size = 4;

    localparam 
       scanlen_ctrl=17,
    
       scanlen_r= 16,
       scanlen_l= 16;

    localparam
        WordX = {bits{1'bx}},
        WordZ = {bits{1'bz}},
        AddrX = {Addr{1'bx}},
        Word0 = {bits{1'b0}},
        X = 1'bx;
    

//---------------  IN / OUT Declarations -----------

//--------------------------------------------------
//           Global Active (GAC) Pins 
//--------------------------------------------------
 
        input STDBY;
        input INITN;

//--------------------------------------------------
//              FUNCTIONAL Pins 
//--------------------------------------------------
	output [bits-1 : 0] Q;
        
        input CK;
        input CSN, IG, WEN;
        input [bits-1 : 0] D ;
	input [Addr-1 : 0] A;
        input [mask_bits-1:0] M;

//--------------------------------------------------
//                TEST Mode Pins 
//--------------------------------------------------
        input ATP;
    
    // Scan Flops related pins
        
        input SE;
        input SCTRLI,SDLI,SDRI ,SMLI,SMRI ;
        output SCTRLO, SDLO, SDRO , SMLO, SMRO;
        
    // Bypass pin
        input TBYPASS;
        
    // BIST Related Pins 
         input TBIST;
         input [Addr-1 :0 ] TA;
         input TCSN,TWEN,TED,TOD; 
         input TEM,TOM;
         

        

        

//----------------------------------------------------
//           Margin Control Related Pins
//----------------------------------------------------
        
        
        input [read_margin_size-1 : 0] RM;
        input [write_margin_size-1 : 0] WM;
        

//----------------------------------------------------
//             Speed Mode Related Pins
//----------------------------------------------------
        input LS;
        input HS;

//----------------------------------------------------
//              Eswitch Related Pins
//----------------------------------------------------
        
        

       
        
        
        reg gndm;
        
        
        
        reg vddm;
        
        
        
        
        

//----------------------------------------------------
//           Wire and Reg Declarations
//----------------------------------------------------
        
        wire WEN_bmux;
        wire CK_scff, CK_lock_up_latch;
        wire CK_rw;
        wire [Addr-1 : 0] A_bmux;
        wire [max_address_bits-1 : 0] A_scff_din; 

        wire [bits-1 : 0] M_bmux;
        wire [bits-1 : 0] M_scff_out;

        
        wire [bits-1 : 0] D_bmux;
        wire [bits-1 : 0] D_scff_out;

        wire [scanlen_ctrl-1 : 0] ctrl_scff_in;
        wire [scanlen_ctrl-1 : 0] ctrl_scff_out; 
        wire [bits-1 : 0] Q_int, Q_CORE; 
        
        wire SCTRLO_temp, SDLO_temp  ,SDRO_temp ,SMLO_temp  ,SMRO_temp;
        
        wire CK_buf;
        

        buf (CK_buf, CK); // while blocking the memory, CK_buf will be forced to 'x' 



        reg SLEEP_buf_r;
	reg STDBY_buf_r;
	reg INITN_buf_r;
	reg CSN_buf_r;
	reg IG_buf_r;
	reg WEN_buf_r;
        reg [bits-1 : 0] D_buf_r;
        reg [Addr-1 : 0] A_buf_r;
        reg [mask_bits-1 : 0] M_buf_r;
	reg ATP_buf_r;
	reg SE_buf_r;
	reg SCTRLI_buf_r;
	reg SDLI_buf_r;
	reg SDRI_buf_r;
	
        reg SMLI_buf_r;
	reg SMRI_buf_r;
	
        reg TBYPASS_buf_r;
        reg TBIST_buf_r;
        reg [Addr-1 : 0] TA_buf_r;
	reg TCSN_buf_r;
	reg TWEN_buf_r;
	reg TED_buf_r;
	reg TOD_buf_r;
	reg TEM_buf_r;
	reg TOM_buf_r;


        reg [read_margin_size-1 : 0] RM_buf_r;
        reg [write_margin_size-1 : 0] WM_buf_r;
        reg LS_buf_r;
        reg HS_buf_r;

  
        
        wire SLEEP_buf;
	wire STDBY_buf;
	wire INITN_buf;
	wire CSN_buf;
	wire IG_buf;
	wire WEN_buf;
        wire [bits-1 : 0] D_buf;
        wire [Addr-1 : 0] A_buf;
        wire [mask_bits-1 : 0] M_buf;
	wire ATP_buf;
	wire SE_buf;
	wire SCTRLI_buf;
	wire SDLI_buf;
	wire SDRI_buf;
	
        wire SMLI_buf;
	wire SMRI_buf;
	
        wire TBYPASS_buf;
        wire TBIST_buf;
        wire [Addr-1 : 0] TA_buf;
	wire TCSN_buf;
	wire TWEN_buf;
	wire TED_buf;
	wire TOD_buf;
	wire TEM_buf;
	wire TOM_buf;


        wire [read_margin_size-1 : 0] RM_buf;
        wire [write_margin_size-1 : 0] WM_buf;
        wire LS_buf;
        wire HS_buf;

  

        
        reg [bits-1 : 0] Q_final;
        reg r_supply_trigger;

//----------------------------------------------------
//              Input Non-Blocking Buffers Starts
//----------------------------------------------------

       
        assign SLEEP_buf = 1'b0;
        
        always @(STDBY or r_supply_trigger) begin
          STDBY_buf_r <= STDBY;
        end
        buf (STDBY_buf, STDBY_buf_r);
        
        always @(INITN or r_supply_trigger) begin
          INITN_buf_r <= INITN;
        end
        buf (INITN_buf, INITN_buf_r);
        
        always @(CSN or r_supply_trigger) begin
          CSN_buf_r <= CSN;
        end
        buf (CSN_buf, CSN_buf_r);
        
        always @(IG or r_supply_trigger) begin
          IG_buf_r <= IG;
        end
        buf (IG_buf, IG_buf_r);
        
        always @(WEN or r_supply_trigger) begin
          WEN_buf_r <= WEN;
        end
        buf (WEN_buf, WEN_buf_r);
        
        always @(D or r_supply_trigger) begin
          D_buf_r <= D;
        end
        buf buf_d [bits-1 : 0] (D_buf, D_buf_r);
        
        always @(A or r_supply_trigger) begin
          A_buf_r <= A;
        end
        buf buf_a [Addr-1 : 0] (A_buf, A_buf_r);
        
        always @(M or r_supply_trigger) begin
          M_buf_r <= M;
        end
        buf buf_m [mask_bits-1 : 0] (M_buf, M_buf_r);
        
        always @(ATP or r_supply_trigger) begin
          ATP_buf_r <= ATP;
        end
        buf (ATP_buf, ATP_buf_r);
        
        always @(SE or r_supply_trigger) begin
          SE_buf_r <= SE;
        end
        buf (SE_buf, SE_buf_r);
        
        always @(SCTRLI or r_supply_trigger) begin
          SCTRLI_buf_r <= SCTRLI;
        end
        buf (SCTRLI_buf, SCTRLI_buf_r);
        
        always @(SDLI or r_supply_trigger) begin
          SDLI_buf_r <= SDLI;
        end
        buf (SDLI_buf, SDLI_buf_r);
        
        always @(SDRI or r_supply_trigger) begin
          SDRI_buf_r <= SDRI;
        end
        buf (SDRI_buf, SDRI_buf_r);
        
        
        always @(SMLI or r_supply_trigger) begin
          SMLI_buf_r <= SMLI;
        end
        buf (SMLI_buf, SMLI_buf_r);
        
        always @(SMRI or r_supply_trigger) begin
          SMRI_buf_r <= SMRI;
        end
        buf (SMRI_buf, SMRI_buf_r);
        
        
        
        always @(TBYPASS or r_supply_trigger) begin
          TBYPASS_buf_r <= TBYPASS;
        end
        buf (TBYPASS_buf, TBYPASS_buf_r);
        
        always @(TBIST or r_supply_trigger) begin
          TBIST_buf_r <= TBIST;
        end
        buf (TBIST_buf, TBIST_buf_r);
        
        always @(TA or r_supply_trigger) begin
          TA_buf_r <= TA;
        end
        buf buf_ta [Addr-1 : 0] (TA_buf, TA_buf_r);
        
        always @(TCSN or r_supply_trigger) begin
          TCSN_buf_r <= TCSN;
        end
        buf (TCSN_buf, TCSN_buf_r);
        
        always @(TWEN or r_supply_trigger) begin
          TWEN_buf_r <= TWEN;
        end
        buf (TWEN_buf, TWEN_buf_r);
        
        always @(TED or r_supply_trigger) begin
          TED_buf_r <= TED;
        end
        buf (TED_buf, TED_buf_r);
        
        always @(TOD or r_supply_trigger) begin
          TOD_buf_r <= TOD;
        end
        buf (TOD_buf, TOD_buf_r);
        
        always @(TEM or r_supply_trigger) begin
          TEM_buf_r <= TEM;
        end
        buf (TEM_buf, TEM_buf_r);
        
        always @(TOM or r_supply_trigger) begin
          TOM_buf_r <= TOM;
        end
        buf (TOM_buf, TOM_buf_r);
        
        
        
        
        always @(RM or r_supply_trigger) begin
          RM_buf_r <= RM;
        end
        buf buf_rm [read_margin_size-1 : 0] (RM_buf, RM_buf_r);
        
        always @(WM or r_supply_trigger) begin
          WM_buf_r <= WM;
        end
        buf buf_wm [write_margin_size-1 : 0] (WM_buf, WM_buf_r);
        
        always @(LS or r_supply_trigger) begin
          LS_buf_r <= LS;
        end
        buf (LS_buf, LS_buf_r);
        
        always @(HS or r_supply_trigger) begin
          HS_buf_r <= HS;
        end
        buf (HS_buf, HS_buf_r);
        
        
//----------------------------------------------------
//              Input Non-Blocking Buffers Ends
//----------------------------------------------------


/*---------------------------------------------------------------------------
                     Functional Control Unit.
        1) BIST MUXes
        2) Clock generation : CK_scff, CK_rw, CK_lock_up_latch
        3) Output MUX
----------------------------------------------------------------------------*/

ST_SPHD_LOVOLT_2048x32m8_bTMl_INTERFACE IO (

// functional inputs
.A(A_buf),.D(D_buf),.M(M_buf),.CSN(CSN_buf),.WEN(WEN_buf),.CK(CK_buf),.SE(SE_buf),.TBYPASS(TBYPASS_buf),.IG(IG_buf),.SLEEP(SLEEP_buf),.ATP(ATP_buf),.STDBY(STDBY_buf),.INITN(INITN_buf),

// BIST inputs
.TBIST(TBIST_buf),.TCSN(TCSN_buf),.TA(TA_buf),.TED(TED_buf),.TOD(TOD_buf),.TEM(TEM_buf),.TOM(TOM_buf),.TWEN(TWEN_buf),



// bist mux outputs
.A_bmux(A_bmux),.D_bmux(D_bmux),.M_bmux(M_bmux),.WEN_bmux(WEN_bmux),.CSN_scff_din(CSN_scff_din),

// Test Enable signals for Scan flops
.shift_en_inst(shift_en_inst),

// Clocks for Scan flops and "mp" block
.CK_scff(CK_scff),.CK_lock_up_latch(CK_lock_up_latch),.CK_rw(CK_rw),

// Data and Control Scan flops outputs
.D_scff_out(D_scff_out),.BYP_ENint(ctrl_scff_out[16]),

// Q Output from rw and omux blocks
.Q_CORE(Q_CORE), .Q(Q_int), .MEM_EN_inst(MEM_EN_inst)

);

/*---------------------------------------------
        'D' input for Control Scan flops
----------------------------------------------*/

buf (A_scff_din[0], A_bmux[0]);
buf (A_scff_din[1], A_bmux[1]);
buf (A_scff_din[2], A_bmux[2]);
buf (A_scff_din[3], A_bmux[3]);
buf (A_scff_din[4], A_bmux[4]);
buf (A_scff_din[5], A_bmux[5]);
buf (A_scff_din[6], A_bmux[6]);
buf (A_scff_din[7], A_bmux[7]);
buf (A_scff_din[8], A_bmux[8]);
buf (A_scff_din[9], A_bmux[9]);
buf (A_scff_din[10], A_bmux[10]);

buf (A_scff_din[11],1'b0);

buf (WEN_scff_din, WEN_bmux);

/*------------------------------------     
        CONTROL SCAN CHAIN
------------------------------------*/



buf  (ctrl_scff_in[0], A_scff_din[11]);
buf  (ctrl_scff_in[1], A_scff_din[10]);
buf  (ctrl_scff_in[2], A_scff_din[9]);
buf  (ctrl_scff_in[3], A_scff_din[8]);
buf  (ctrl_scff_in[4], A_scff_din[7]);
buf  (ctrl_scff_in[5], A_scff_din[6]);
buf  (ctrl_scff_in[6], A_scff_din[5]);
buf  (ctrl_scff_in[7], A_scff_din[4]);
buf  (ctrl_scff_in[8], A_scff_din[3]);
buf  (ctrl_scff_in[9], A_scff_din[0]);
buf  (ctrl_scff_in[10], A_scff_din[1]);
buf  (ctrl_scff_in[11], 1'b0);
buf  (ctrl_scff_in[12], A_scff_din[2]);
buf  (ctrl_scff_in[13], 1'b0);
buf  (ctrl_scff_in[14], CSN_scff_din);
buf  (ctrl_scff_in[15], WEN_scff_din);
buf  (ctrl_scff_in[16], ctrl_scff_out[16]);

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_0  (.D(ctrl_scff_in[0]), .TI(SCTRLI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[0]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_1 (.D(ctrl_scff_in[1]), .TI(ctrl_scff_out[0]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[1]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_2 (.D(ctrl_scff_in[2]), .TI(ctrl_scff_out[1]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[2]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_3 (.D(ctrl_scff_in[3]), .TI(ctrl_scff_out[2]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[3]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_4 (.D(ctrl_scff_in[4]), .TI(ctrl_scff_out[3]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[4]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_5 (.D(ctrl_scff_in[5]), .TI(ctrl_scff_out[4]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[5]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_6 (.D(ctrl_scff_in[6]), .TI(ctrl_scff_out[5]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[6]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_7 (.D(ctrl_scff_in[7]), .TI(ctrl_scff_out[6]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[7]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_8 (.D(ctrl_scff_in[8]), .TI(ctrl_scff_out[7]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[8]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_9 (.D(ctrl_scff_in[9]), .TI(ctrl_scff_out[8]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[9]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_10 (.D(ctrl_scff_in[10]), .TI(ctrl_scff_out[9]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[10]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_11 (.D(ctrl_scff_in[11]), .TI(ctrl_scff_out[10]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[11]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_12 (.D(ctrl_scff_in[12]), .TI(ctrl_scff_out[11]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[12]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_13 (.D(ctrl_scff_in[13]), .TI(ctrl_scff_out[12]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[13]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_14 (.D(ctrl_scff_in[14]), .TI(ctrl_scff_out[13]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[14]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_15 (.D(ctrl_scff_in[15]), .TI(ctrl_scff_out[14]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[15]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_ctrl_16 (.D(ctrl_scff_in[16]), .TI(ctrl_scff_out[15]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[16]));

ST_SPHD_LOVOLT_2048x32m8_bTMl_lock_up_latch  latch_SCTRLO (.CK(!CK_lock_up_latch), .D(ctrl_scff_out[16]), .Q(SCTRLO_temp));


/*-----------------------------------
        LEFT DATA SCAN CHAIN
------------------------------------*/

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_0 (.D(D_bmux[15]), .TI(SDLI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[15])); 


 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_1 (.D(D_bmux[14]),  .TI(D_scff_out[15]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[14]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_2 (.D(D_bmux[13]),  .TI(D_scff_out[14]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[13]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_3 (.D(D_bmux[12]),  .TI(D_scff_out[13]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[12]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_4 (.D(D_bmux[11]),  .TI(D_scff_out[12]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[11]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_5 (.D(D_bmux[10]),  .TI(D_scff_out[11]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[10]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_6 (.D(D_bmux[9]),  .TI(D_scff_out[10]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[9]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_7 (.D(D_bmux[8]),  .TI(D_scff_out[9]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[8]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_8 (.D(D_bmux[7]),  .TI(D_scff_out[8]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[7]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_9 (.D(D_bmux[6]),  .TI(D_scff_out[7]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[6]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_10 (.D(D_bmux[5]),  .TI(D_scff_out[6]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[5]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_11 (.D(D_bmux[4]),  .TI(D_scff_out[5]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[4]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_12 (.D(D_bmux[3]),  .TI(D_scff_out[4]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[3]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_13 (.D(D_bmux[2]),  .TI(D_scff_out[3]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[2]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_14 (.D(D_bmux[1]),  .TI(D_scff_out[2]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[1]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_left_15 (.D(D_bmux[0]),  .TI(D_scff_out[1]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[0])); 

ST_SPHD_LOVOLT_2048x32m8_bTMl_lock_up_latch  latch_SDLO (.CK(!CK_lock_up_latch), .D(D_scff_out[0]), .Q(SDLO_temp)); 




/*-------------------------------------
        RIGHT DATA SCAN CHAIN
--------------------------------------*/

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_0 (.D(D_bmux[31]), .TI(SDRI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[31])); 

 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_1 (.D(D_bmux[30]),  .TI(D_scff_out[31]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[30]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_2 (.D(D_bmux[29]),  .TI(D_scff_out[30]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[29]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_3 (.D(D_bmux[28]),  .TI(D_scff_out[29]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[28]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_4 (.D(D_bmux[27]),  .TI(D_scff_out[28]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[27]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_5 (.D(D_bmux[26]),  .TI(D_scff_out[27]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[26]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_6 (.D(D_bmux[25]),  .TI(D_scff_out[26]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[25]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_7 (.D(D_bmux[24]),  .TI(D_scff_out[25]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[24]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_8 (.D(D_bmux[23]),  .TI(D_scff_out[24]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[23]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_9 (.D(D_bmux[22]),  .TI(D_scff_out[23]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[22]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_10 (.D(D_bmux[21]),  .TI(D_scff_out[22]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[21]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_11 (.D(D_bmux[20]),  .TI(D_scff_out[21]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[20]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_12 (.D(D_bmux[19]),  .TI(D_scff_out[20]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[19]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_13 (.D(D_bmux[18]),  .TI(D_scff_out[19]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[18]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_14 (.D(D_bmux[17]),  .TI(D_scff_out[18]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[17]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_data_right_15 (.D(D_bmux[16]),  .TI(D_scff_out[17]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[16])); 

ST_SPHD_LOVOLT_2048x32m8_bTMl_lock_up_latch  latch_SDRO (.CK(!CK_lock_up_latch), .D(D_scff_out[16]), .Q(SDRO_temp));










/*-----------------------------------
        LEFT MASK SCAN CHAIN
------------------------------------*/

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_0 (.D(M_bmux[15]), .TI(SMLI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[15])); 


 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_1 (.D(M_bmux[14]),  .TI(M_scff_out[15]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[14]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_2 (.D(M_bmux[13]),  .TI(M_scff_out[14]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[13]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_3 (.D(M_bmux[12]),  .TI(M_scff_out[13]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[12]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_4 (.D(M_bmux[11]),  .TI(M_scff_out[12]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[11]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_5 (.D(M_bmux[10]),  .TI(M_scff_out[11]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[10]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_6 (.D(M_bmux[9]),  .TI(M_scff_out[10]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[9]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_7 (.D(M_bmux[8]),  .TI(M_scff_out[9]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[8]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_8 (.D(M_bmux[7]),  .TI(M_scff_out[8]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[7]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_9 (.D(M_bmux[6]),  .TI(M_scff_out[7]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[6]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_10 (.D(M_bmux[5]),  .TI(M_scff_out[6]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[5]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_11 (.D(M_bmux[4]),  .TI(M_scff_out[5]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[4]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_12 (.D(M_bmux[3]),  .TI(M_scff_out[4]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[3]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_13 (.D(M_bmux[2]),  .TI(M_scff_out[3]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[2]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_14 (.D(M_bmux[1]),  .TI(M_scff_out[2]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[1]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_left_15 (.D(M_bmux[0]),  .TI(M_scff_out[1]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[0])); 

ST_SPHD_LOVOLT_2048x32m8_bTMl_lock_up_latch  latch_SMLO (.CK(!CK_lock_up_latch), .D(M_scff_out[0]), .Q(SMLO_temp)); 




/*-------------------------------------
        RIGHT MASK SCAN CHAIN
--------------------------------------*/

ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_0 (.D(M_bmux[31]), .TI(SMRI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[31])); 

 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_1 (.D(M_bmux[30]),  .TI(M_scff_out[31]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[30]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_2 (.D(M_bmux[29]),  .TI(M_scff_out[30]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[29]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_3 (.D(M_bmux[28]),  .TI(M_scff_out[29]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[28]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_4 (.D(M_bmux[27]),  .TI(M_scff_out[28]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[27]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_5 (.D(M_bmux[26]),  .TI(M_scff_out[27]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[26]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_6 (.D(M_bmux[25]),  .TI(M_scff_out[26]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[25]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_7 (.D(M_bmux[24]),  .TI(M_scff_out[25]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[24]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_8 (.D(M_bmux[23]),  .TI(M_scff_out[24]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[23]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_9 (.D(M_bmux[22]),  .TI(M_scff_out[23]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[22]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_10 (.D(M_bmux[21]),  .TI(M_scff_out[22]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[21]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_11 (.D(M_bmux[20]),  .TI(M_scff_out[21]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[20]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_12 (.D(M_bmux[19]),  .TI(M_scff_out[20]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[19]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_13 (.D(M_bmux[18]),  .TI(M_scff_out[19]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[18]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_14 (.D(M_bmux[17]),  .TI(M_scff_out[18]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[17]));
 ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF scff_mask_right_15 (.D(M_bmux[16]),  .TI(M_scff_out[17]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[16])); 

ST_SPHD_LOVOLT_2048x32m8_bTMl_lock_up_latch  latch_SMRO (.CK(!CK_lock_up_latch), .D(M_scff_out[16]), .Q(SMRO_temp));       










//-------------------------------------------------------------------------
//           Verilog Simulation Model Specifc functionality starts
//             -> Specify Block, Timing Wrapper
//             -> Power Pins functionality
//             -> Display Message Handling
//             -> Read/Write functionality with Redundancy
//             -> Fault File and Initialization file handling
//-------------------------------------------------------------------------

reg GAC_reg;        
 
reg initn_pulse_done=1;

reg SLEEP_reg, STDBY_reg, INITN_reg, ATP_reg, SE_reg, TBYPASS_reg, IG_reg, CSN_reg, DE_reg, WEN_reg, WEN_bmux_reg, MEMEN_reg, MEMEN_dft_prev, MEMEN_prev;

reg [bits-1 : 0] D_reg,D_bmux_reg;
reg [bits-1 : 0] M_bmux_reg;
reg [Addr-1 : 0] A_reg, A_bmux_reg;
reg lastCK, invalid_next_cycle_dft, invalid_next_cycle_func;
reg [8*44: 0] message_status;
reg [8*10: 0] operating_mode;
reg [1:0] debug_level;
wire DE_temp;
`ifdef ST_MEM_SLM
  integer slm_handle;
  initial begin
    $slm_RegisterMemory(slm_handle, words, bits);
  end
`else
  reg [bits-1 : 0] Mem [words-1 : 0];// RAM array
  reg [bits-1 : 0] RedMem [RedWords-1 : 0]; // Redundancy locations
`endif

reg [bits-1 : 0] Mem_prev;
reg [bits-1 : 0] Qtemp, tempReg;
reg ValidAddress, last_CK_rw;
reg file_loaded;
reg repair_access;


always @(CK) begin
  
  if (lastCK === 1'b0 && CK === 1'b1) begin
    
           GAC_reg = IO.GAC;
           MEMEN_dft_prev = IO.GAC & ATP_buf;
           MEMEN_prev = MEMEN_reg;
           MEMEN_reg = IO.MEM_EN_inst;
           SLEEP_reg = SLEEP_buf;
           STDBY_reg = STDBY_buf;
           INITN_reg = INITN_buf;
           ATP_reg = ATP_buf;
           SE_reg = SE_buf;
           TBYPASS_reg = TBYPASS_buf;
           IG_reg = IG_buf;
           CSN_reg = IO.CSN_bmux;
           WEN_reg = WEN_buf;
           WEN_bmux_reg = WEN_bmux;
           A_reg = A_buf;
           A_bmux_reg = A_bmux;
           D_reg = D_buf;
           D_bmux_reg = D_bmux;
           M_bmux_reg = M_bmux;
           DE_reg = DE_temp;
           
           
  end

  if (lastCK === 1'b0 && CK !== 1'b0) begin
           if (invalid_next_cycle_func === 1'b1) begin
             invalid_next_cycle_func = 1'b0;
             release IO.cgc_CK_rw.CK_gated;
           end     
           if (invalid_next_cycle_dft === 1'b1) begin
             invalid_next_cycle_dft = 1'b0;
             release IO.cgc_CK_lkp_latch.CK_gated;
             release IO.cgc_CK_scff.CK_gated;
           end     
  end
  
  lastCK = CK;
end

task Corrupt_Mem;
begin
        WriteMemX;
end
endtask

task Corrupt_Q;
begin
        IO.dff_mem_en.Q <= 1'bx;
end
endtask

task Corrupt_all_scan_flops_scan_outs;
begin
        Corrupt_ctrl_scan_flops_scan_outs;
        Corrupt_data_scan_flops_scan_outs;
        Corrupt_mask_scan_flops_scan_outs;
end
endtask

task Corrupt_ctrl_scan_flops;  
begin
        scff_ctrl_0.dff_in_scff.Q <= 1'bx;
scff_ctrl_1.dff_in_scff.Q <= 1'bx;
scff_ctrl_2.dff_in_scff.Q <= 1'bx;
scff_ctrl_3.dff_in_scff.Q <= 1'bx;
scff_ctrl_4.dff_in_scff.Q <= 1'bx;
scff_ctrl_5.dff_in_scff.Q <= 1'bx;
scff_ctrl_6.dff_in_scff.Q <= 1'bx;
scff_ctrl_7.dff_in_scff.Q <= 1'bx;
scff_ctrl_8.dff_in_scff.Q <= 1'bx;
scff_ctrl_9.dff_in_scff.Q <= 1'bx;
scff_ctrl_10.dff_in_scff.Q <= 1'bx;
scff_ctrl_11.dff_in_scff.Q <= 1'bx;
scff_ctrl_12.dff_in_scff.Q <= 1'bx;
scff_ctrl_13.dff_in_scff.Q <= 1'bx;
scff_ctrl_14.dff_in_scff.Q <= 1'bx;
scff_ctrl_15.dff_in_scff.Q <= 1'bx;
scff_ctrl_16.dff_in_scff.Q <= 1'bx;
end
endtask

task Corrupt_ctrl_scan_flops_scan_outs;
begin
        Corrupt_ctrl_scan_flops;
        latch_SCTRLO.dlat_lockup.Q <= 1'bx;
end
endtask

task Corrupt_data_scan_flops_scan_outs;
begin
        Corrupt_datal_scan_flops_scan_outs;
        Corrupt_datar_scan_flops_scan_outs;

end
endtask

task Corrupt_datal_scan_flops;
begin
        
       scff_data_left_0.dff_in_scff.Q <= 1'bx;
scff_data_left_1.dff_in_scff.Q <= 1'bx;
scff_data_left_2.dff_in_scff.Q <= 1'bx;
scff_data_left_3.dff_in_scff.Q <= 1'bx;
scff_data_left_4.dff_in_scff.Q <= 1'bx;
scff_data_left_5.dff_in_scff.Q <= 1'bx;
scff_data_left_6.dff_in_scff.Q <= 1'bx;
scff_data_left_7.dff_in_scff.Q <= 1'bx;
scff_data_left_8.dff_in_scff.Q <= 1'bx;
scff_data_left_9.dff_in_scff.Q <= 1'bx;
scff_data_left_10.dff_in_scff.Q <= 1'bx;
scff_data_left_11.dff_in_scff.Q <= 1'bx;
scff_data_left_12.dff_in_scff.Q <= 1'bx;
scff_data_left_13.dff_in_scff.Q <= 1'bx;
scff_data_left_14.dff_in_scff.Q <= 1'bx;
scff_data_left_15.dff_in_scff.Q <= 1'bx; 

end
endtask



task Corrupt_datal_scan_flops_scan_outs;
begin
        Corrupt_datal_scan_flops;
        latch_SDLO.dlat_lockup.Q <= 1'bx;
end
endtask



task Corrupt_datar_scan_flops;
begin
        
       scff_data_right_0.dff_in_scff.Q <= 1'bx;
scff_data_right_1.dff_in_scff.Q <= 1'bx;
scff_data_right_2.dff_in_scff.Q <= 1'bx;
scff_data_right_3.dff_in_scff.Q <= 1'bx;
scff_data_right_4.dff_in_scff.Q <= 1'bx;
scff_data_right_5.dff_in_scff.Q <= 1'bx;
scff_data_right_6.dff_in_scff.Q <= 1'bx;
scff_data_right_7.dff_in_scff.Q <= 1'bx;
scff_data_right_8.dff_in_scff.Q <= 1'bx;
scff_data_right_9.dff_in_scff.Q <= 1'bx;
scff_data_right_10.dff_in_scff.Q <= 1'bx;
scff_data_right_11.dff_in_scff.Q <= 1'bx;
scff_data_right_12.dff_in_scff.Q <= 1'bx;
scff_data_right_13.dff_in_scff.Q <= 1'bx;
scff_data_right_14.dff_in_scff.Q <= 1'bx;
scff_data_right_15.dff_in_scff.Q <= 1'bx;
       
end
endtask


  

task Corrupt_datar_scan_flops_scan_outs;
begin
        Corrupt_datar_scan_flops;
        latch_SDRO.dlat_lockup.Q <= 1'bx;
end
endtask





task Corrupt_mask_scan_flops_scan_outs;
begin
        Corrupt_maskl_scan_flops_scan_outs;
        Corrupt_maskr_scan_flops_scan_outs;

end
endtask

task Corrupt_maskl_scan_flops;
begin
        
       scff_mask_left_0.dff_in_scff.Q <= 1'bx;
scff_mask_left_1.dff_in_scff.Q <= 1'bx;
scff_mask_left_2.dff_in_scff.Q <= 1'bx;
scff_mask_left_3.dff_in_scff.Q <= 1'bx;
scff_mask_left_4.dff_in_scff.Q <= 1'bx;
scff_mask_left_5.dff_in_scff.Q <= 1'bx;
scff_mask_left_6.dff_in_scff.Q <= 1'bx;
scff_mask_left_7.dff_in_scff.Q <= 1'bx;
scff_mask_left_8.dff_in_scff.Q <= 1'bx;
scff_mask_left_9.dff_in_scff.Q <= 1'bx;
scff_mask_left_10.dff_in_scff.Q <= 1'bx;
scff_mask_left_11.dff_in_scff.Q <= 1'bx;
scff_mask_left_12.dff_in_scff.Q <= 1'bx;
scff_mask_left_13.dff_in_scff.Q <= 1'bx;
scff_mask_left_14.dff_in_scff.Q <= 1'bx;
scff_mask_left_15.dff_in_scff.Q <= 1'bx; 
end
endtask



task Corrupt_maskl_scan_flops_scan_outs;
begin
        Corrupt_maskl_scan_flops;
        latch_SMLO.dlat_lockup.Q <= 1'bx;
end
endtask



task Corrupt_maskr_scan_flops;
begin
     
       scff_mask_right_0.dff_in_scff.Q <= 1'bx;
scff_mask_right_1.dff_in_scff.Q <= 1'bx;
scff_mask_right_2.dff_in_scff.Q <= 1'bx;
scff_mask_right_3.dff_in_scff.Q <= 1'bx;
scff_mask_right_4.dff_in_scff.Q <= 1'bx;
scff_mask_right_5.dff_in_scff.Q <= 1'bx;
scff_mask_right_6.dff_in_scff.Q <= 1'bx;
scff_mask_right_7.dff_in_scff.Q <= 1'bx;
scff_mask_right_8.dff_in_scff.Q <= 1'bx;
scff_mask_right_9.dff_in_scff.Q <= 1'bx;
scff_mask_right_10.dff_in_scff.Q <= 1'bx;
scff_mask_right_11.dff_in_scff.Q <= 1'bx;
scff_mask_right_12.dff_in_scff.Q <= 1'bx;
scff_mask_right_13.dff_in_scff.Q <= 1'bx;
scff_mask_right_14.dff_in_scff.Q <= 1'bx;
scff_mask_right_15.dff_in_scff.Q <= 1'bx;
       
end
endtask


  

task Corrupt_maskr_scan_flops_scan_outs;
begin
        Corrupt_maskr_scan_flops;
        latch_SMRO.dlat_lockup.Q <= 1'bx;
end
endtask






`ifdef functional

/*------------------------------------------------------------
        Output Buffers for verilog functional model
-------------------------------------------------------------*/
    
    always @(Q_int) begin
      Q_final = Q_int;
    end  
    buf #(`st_delay_seq_taa) (Q[0], Q_final[0]);
buf #(`st_delay_seq_taa) (Q[1], Q_final[1]);
buf #(`st_delay_seq_taa) (Q[2], Q_final[2]);
buf #(`st_delay_seq_taa) (Q[3], Q_final[3]);
buf #(`st_delay_seq_taa) (Q[4], Q_final[4]);
buf #(`st_delay_seq_taa) (Q[5], Q_final[5]);
buf #(`st_delay_seq_taa) (Q[6], Q_final[6]);
buf #(`st_delay_seq_taa) (Q[7], Q_final[7]);
buf #(`st_delay_seq_taa) (Q[8], Q_final[8]);
buf #(`st_delay_seq_taa) (Q[9], Q_final[9]);
buf #(`st_delay_seq_taa) (Q[10], Q_final[10]);
buf #(`st_delay_seq_taa) (Q[11], Q_final[11]);
buf #(`st_delay_seq_taa) (Q[12], Q_final[12]);
buf #(`st_delay_seq_taa) (Q[13], Q_final[13]);
buf #(`st_delay_seq_taa) (Q[14], Q_final[14]);
buf #(`st_delay_seq_taa) (Q[15], Q_final[15]);
buf #(`st_delay_seq_taa) (Q[16], Q_final[16]);
buf #(`st_delay_seq_taa) (Q[17], Q_final[17]);
buf #(`st_delay_seq_taa) (Q[18], Q_final[18]);
buf #(`st_delay_seq_taa) (Q[19], Q_final[19]);
buf #(`st_delay_seq_taa) (Q[20], Q_final[20]);
buf #(`st_delay_seq_taa) (Q[21], Q_final[21]);
buf #(`st_delay_seq_taa) (Q[22], Q_final[22]);
buf #(`st_delay_seq_taa) (Q[23], Q_final[23]);
buf #(`st_delay_seq_taa) (Q[24], Q_final[24]);
buf #(`st_delay_seq_taa) (Q[25], Q_final[25]);
buf #(`st_delay_seq_taa) (Q[26], Q_final[26]);
buf #(`st_delay_seq_taa) (Q[27], Q_final[27]);
buf #(`st_delay_seq_taa) (Q[28], Q_final[28]);
buf #(`st_delay_seq_taa) (Q[29], Q_final[29]);
buf #(`st_delay_seq_taa) (Q[30], Q_final[30]);
buf #(`st_delay_seq_taa) (Q[31], Q_final[31]);
    
    buf #(`st_delay_seq_taa) (SCTRLO,SCTRLO_temp);
    buf #(`st_delay_seq_taa) (SDLO, SDLO_temp);
    buf #(`st_delay_seq_taa) (SDRO, SDRO_temp);
    
   
    buf #(`st_delay_seq_taa) (SMLO, SMLO_temp);
    buf #(`st_delay_seq_taa) (SMRO, SMRO_temp);
     
    

`else
    
/*--------------------------------------------------------------------
                     TIMING WRAPPER STARTS
---------------------------------------------------------------------*/
integer i;
wire dSLEEP;
wire [bits-1 : 0] dD ;
wire [Addr-1 : 0] dA;

wire [bits-1:0] dM;         
wire dCK,dCSN,dIG ,dSE,dSCTRLI,dSDLI,dSDRI  ,dSMLI,dSMRI   ,dTBYPASS, dWEN;


//Bist wires
wire [Addr-1 :0 ] dTA;
wire dTBIST,dTCSN,dTWEN,dTED,dTOD; 
wire dTEM,dTOM;

reg [bits-1 : 0] Q_int_prev;
reg SCTRLO_final, SCTRLO_prev;
reg SDLO_final, SDLO_prev;
reg SDRO_final, SDRO_prev;





reg SMLO_final, SMLO_prev;
reg SMRO_final, SMRO_prev;


reg [bits-1 : 0] TimingViol_data = 32'b0;
reg [bits-1 : 0] TimingViol_data_last;

reg  [bits-1 : 0] TimingViol_mask = 32'b0;
reg [bits-1 : 0] TimingViol_mask_last;

 reg TimingViol_mask_0;
 reg TimingViol_mask_1;
 reg TimingViol_mask_2;
 reg TimingViol_mask_3;
 reg TimingViol_mask_4;
 reg TimingViol_mask_5;
 reg TimingViol_mask_6;
 reg TimingViol_mask_7;
 reg TimingViol_mask_8;
 reg TimingViol_mask_9;
 reg TimingViol_mask_10;
 reg TimingViol_mask_11;
 reg TimingViol_mask_12;
 reg TimingViol_mask_13;
 reg TimingViol_mask_14;
 reg TimingViol_mask_15;
 reg TimingViol_mask_16;
 reg TimingViol_mask_17;
 reg TimingViol_mask_18;
 reg TimingViol_mask_19;
 reg TimingViol_mask_20;
 reg TimingViol_mask_21;
 reg TimingViol_mask_22;
 reg TimingViol_mask_23;
 reg TimingViol_mask_24;
 reg TimingViol_mask_25;
 reg TimingViol_mask_26;
 reg TimingViol_mask_27;
 reg TimingViol_mask_28;
 reg TimingViol_mask_29;
 reg TimingViol_mask_30;
 reg TimingViol_mask_31;


reg TimingViol_data_0;

reg TimingViol_data_1;

reg TimingViol_data_2;

reg TimingViol_data_3;

reg TimingViol_data_4;

reg TimingViol_data_5;

reg TimingViol_data_6;

reg TimingViol_data_7;

reg TimingViol_data_8;

reg TimingViol_data_9;

reg TimingViol_data_10;

reg TimingViol_data_11;

reg TimingViol_data_12;

reg TimingViol_data_13;

reg TimingViol_data_14;

reg TimingViol_data_15;

reg TimingViol_data_16;

reg TimingViol_data_17;

reg TimingViol_data_18;

reg TimingViol_data_19;

reg TimingViol_data_20;

reg TimingViol_data_21;

reg TimingViol_data_22;

reg TimingViol_data_23;

reg TimingViol_data_24;

reg TimingViol_data_25;

reg TimingViol_data_26;

reg TimingViol_data_27;

reg TimingViol_data_28;

reg TimingViol_data_29;

reg TimingViol_data_30;

reg TimingViol_data_31;

reg TimingViol_addr;
reg TimingViol_CSN, TimingViol_WEN, TimingViol_tbypass;
reg TimingViol_tckh, TimingViol_tckl, TimingViol_tcycle;
reg TimingViol_tckh_se, TimingViol_tckl_se, TimingViol_tcycle_se;
reg TimingViol_sctrli,TimingViol_sdli,TimingViol_sdri,TimingViol_se;



reg TimingViol_smli,TimingViol_smri;



reg TimingViol_initn;
reg TimingViol_ls;
reg TimingViol_hs;
reg TimingViol_sleep;
reg TimingViol_stdby;
reg TimingViol_rm;
reg TimingViol_wm;
reg TimingViol_tbist,TimingViol_ig,TimingViol_atp,TimingViol_TED,TimingViol_TOD,TimingViol_TEM,TimingViol_TOM;
reg TimingViolRRAE,TimingViolRRA;


wire CSTBYPASSN,cond_sdf_tas,cond_sdf_tds,cond_sdf_tms,cond_sdf_tws,cond_sdf_tbas,cond_sdf_tbps,cond_sdf_tbws,cond_sdf_tbdes,cond_sdf_tbdos,cond_sdf_tbmes,cond_sdf_tbmos;
wire SETB_EN,CSIG_EN,MEM_ACT,EN_ADM,CS_EN,CS_ADM,cond_sdf_tps,IG_EN,IG_ADM,cond_sdf_tigs,cond_sdf_taa,cond_sdf_taa_ls1,cond_sdf_taa_hs1,cond_tseq_tm;
wire cond_sdf_tcycle,cond_sdf_tcycle_ls1,cond_sdf_tcycle_hs1,cond_sdf_tcycle_se,cond_sdf_tckl_se,cond_sdf_tsctrlis,cond_sdf_tsdlis,cond_sdf_tsdris;



wire cond_sdf_tsmlis,cond_sdf_tsmris;
wire cond_sdf_taa_smlo_se,cond_sdf_taa_smro_se;
wire cond_sdf_taa_smlo,cond_sdf_taa_smro;


wire cond_sdf_tckh_se,cond_sdf_taa_sctrlo_se,cond_sdf_taa_sdlo_se,cond_sdf_taa_sdro_se;

wire cond_sdf_tckl,cond_sdf_tckh;
wire cond_sdf_ttms,cond_sdf_tbists,INITNandnotSLEEPandATPandnotSE,cond_sdf_taa_sctrlo,cond_sdf_taa_sdlo,cond_sdf_taa_sdro;




wire cond_sdf_taa_tm,cond_sdf_taa_tm_ls1, cond_sdf_taa_tm_hs1,cond_sdf_taa_tckq_tm,cond_sdf_taa_tseq_tm;
wire CSWETBYPASSN;
wire cond_sdf_tstdbys,cond_sdf_tsls,sleep_en,atp_csn_en;
wire cond_sdf_tlss,cond_sdf_thss,cond_sdf_trms,cond_sdf_twms; 
wire cond_sdf_tses,cond_sdf_tinitns;
wire tby_se_en;
wire rra_en;
wire tbist_atp_en;
wire rrae_en;
wire tbist_rrae_en;
wire cond_sdf_trraes;
wire cond_sdf_ttrraes;
wire cond_sdf_taa_trramatch;
wire cond_sdf_ttrraematch;
wire cond_sdf_tamatch;
wire cond_sdf_ttamatch;
wire cond_sdf_tatpmatch;
wire cond_sdf_ttbistmatch;
wire [bits-1 : 0] CSWEMTBYPASS;
 and (CSWEMTBYPASS[0], !M_bmux_reg[0], CSWETBYPASSN);
 and (CSWEMTBYPASS[1], !M_bmux_reg[1], CSWETBYPASSN);
 and (CSWEMTBYPASS[2], !M_bmux_reg[2], CSWETBYPASSN);
 and (CSWEMTBYPASS[3], !M_bmux_reg[3], CSWETBYPASSN);
 and (CSWEMTBYPASS[4], !M_bmux_reg[4], CSWETBYPASSN);
 and (CSWEMTBYPASS[5], !M_bmux_reg[5], CSWETBYPASSN);
 and (CSWEMTBYPASS[6], !M_bmux_reg[6], CSWETBYPASSN);
 and (CSWEMTBYPASS[7], !M_bmux_reg[7], CSWETBYPASSN);
 and (CSWEMTBYPASS[8], !M_bmux_reg[8], CSWETBYPASSN);
 and (CSWEMTBYPASS[9], !M_bmux_reg[9], CSWETBYPASSN);
 and (CSWEMTBYPASS[10], !M_bmux_reg[10], CSWETBYPASSN);
 and (CSWEMTBYPASS[11], !M_bmux_reg[11], CSWETBYPASSN);
 and (CSWEMTBYPASS[12], !M_bmux_reg[12], CSWETBYPASSN);
 and (CSWEMTBYPASS[13], !M_bmux_reg[13], CSWETBYPASSN);
 and (CSWEMTBYPASS[14], !M_bmux_reg[14], CSWETBYPASSN);
 and (CSWEMTBYPASS[15], !M_bmux_reg[15], CSWETBYPASSN);
 and (CSWEMTBYPASS[16], !M_bmux_reg[16], CSWETBYPASSN);
 and (CSWEMTBYPASS[17], !M_bmux_reg[17], CSWETBYPASSN);
 and (CSWEMTBYPASS[18], !M_bmux_reg[18], CSWETBYPASSN);
 and (CSWEMTBYPASS[19], !M_bmux_reg[19], CSWETBYPASSN);
 and (CSWEMTBYPASS[20], !M_bmux_reg[20], CSWETBYPASSN);
 and (CSWEMTBYPASS[21], !M_bmux_reg[21], CSWETBYPASSN);
 and (CSWEMTBYPASS[22], !M_bmux_reg[22], CSWETBYPASSN);
 and (CSWEMTBYPASS[23], !M_bmux_reg[23], CSWETBYPASSN);
 and (CSWEMTBYPASS[24], !M_bmux_reg[24], CSWETBYPASSN);
 and (CSWEMTBYPASS[25], !M_bmux_reg[25], CSWETBYPASSN);
 and (CSWEMTBYPASS[26], !M_bmux_reg[26], CSWETBYPASSN);
 and (CSWEMTBYPASS[27], !M_bmux_reg[27], CSWETBYPASSN);
 and (CSWEMTBYPASS[28], !M_bmux_reg[28], CSWETBYPASSN);
 and (CSWEMTBYPASS[29], !M_bmux_reg[29], CSWETBYPASSN);
 and (CSWEMTBYPASS[30], !M_bmux_reg[30], CSWETBYPASSN);
 and (CSWEMTBYPASS[31], !M_bmux_reg[31], CSWETBYPASSN);

buf (rta_en_cond, 1'b0);
buf (rta_en_cond_reg, 1'b0);


assign IGint = ((ATP_buf === 1'bx) || (ATP_buf===1'b1 && SE_buf === 1'bx)) ? 1'bx : IG_buf;
and (atp_csn_en,!ATP_buf,!IO.CSN_bmux,!IGint,!rta_en_cond);
or (sleep_en,atp_csn_en,ATP_buf);
or (SETB_EN,IO.SEint,TBIST_buf);
and (ATP_SETB_EN,ATP_buf,SETB_EN); 
or (CSIG_EN,IGint,IO.CSN_bmux,rta_en_cond);
and (MEM_ACT,!ATP_buf,CSIG_EN);
or (EN_ADM,MEM_ACT,ATP_SETB_EN);
or (ig_rta_en, IGint, rta_en_cond);
and (CS_EN,!ATP_buf,ig_rta_en);
or (CS_ADM,CS_EN,ATP_SETB_EN);
and (atp_ig_csn_en,!ATP_buf,!IO.CSN_bmux,!IGint,!rta_en_cond);
and (atp_se_en,!SE_buf,ATP_buf);
or (cycle_en,atp_ig_csn_en,atp_se_en);
and (atp_ig_csn_en_reg,!ATP_reg,!CSN_reg,!IG_reg,!rta_en_cond_reg);
and (atp_se_en_reg,!SE_reg,ATP_reg);
or (cycle_en_reg,atp_ig_csn_en,atp_se_en);
and (INITNandnotSLEEPandATPandnotSE,cond_gac,!SE_buf,ATP_buf);
and (csn_ig_en,!IGint,!IO.CSN_bmux);
and (atp_tby_ls_en,atp_se_en,cond_ls_tby_en);
and (IG_EN,!ATP_buf,!IO.CSN_bmux,!rta_en_cond);
or (IG_ADM,IG_EN,atp_se_en);
and (CSWETBYPASSN, !WEN_bmux_reg, 1'b1);



assign cond_sdf_tsls=((sleep_en && INITN_buf && !STDBY_buf) !==0) ? 1:0;
assign cond_sdf_tstdbys=((sleep_en && INITN_buf && !SLEEP_buf) !==0) ? 1:0;
assign cond_sdf_atps=((INITN_buf && !SLEEP_buf && !STDBY_buf) !==0) ? 1:0;
assign cond_gac=((INITN_buf && !SLEEP_buf && !STDBY_buf) !==0) ? 1:0;
assign cond_sdf_tas=((cond_gac && !EN_ADM) !==0) ? 1:0;
assign cond_sdf_tds=((cond_gac && !EN_ADM) !==0) ? 1:0;
assign cond_sdf_tms=((cond_gac && !EN_ADM) !==0) ? 1:0;
assign cond_sdf_tws=((cond_gac && !EN_ADM) !==0) ? 1:0;
assign cond_sdf_tps=((cond_gac && !CS_ADM) !==0) ? 1:0;
assign cond_sdf_tcycle=((cond_gac && cycle_en && !LS_buf && !HS_buf) !==0) ? 1:0;  
assign cond_sdf_tcycle_ls1=((cond_gac && cycle_en && LS_buf && !HS_buf) !==0) ? 1:0;
assign cond_sdf_tcycle_hs1=((cond_gac && cycle_en && !LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_tcycle_ls1_hs1=((cond_gac && cycle_en && LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_tckh=((cond_gac && cycle_en_reg) !==0) ? 1:0;
assign cond_sdf_tckl=((cond_gac && cycle_en) !==0) ? 1:0;
assign cond_sdf_tcycle_se=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tckl_se=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tsctrlis=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tsdlis=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tsdris=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;


assign cond_sdf_tsmlis=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tsmris=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;






assign cond_sdf_tckh_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sctrlo_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sdlo_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sdro_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;

assign cond_sdf_taa_smlo_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_smro_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;

assign cond_sdf_ttms=((cond_gac && !SE_buf && ATP_buf) !==0) ? 1:0;
assign cond_sdf_tbists=((cond_gac && !SE_buf && ATP_buf) !==0) ? 1:0;
assign cond_sdf_taa_sctrlo=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sdlo=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sdro=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_smlo=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_smro=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;



assign cond_sdf_taa_tckq_tm=((cond_gac && SE_reg && ATP_reg && TBYPASS_buf) !==0) ? 1:0;
assign cond_ls_en=((atp_ig_csn_en || atp_tby_ls_en) !==0) ? 1:0;
assign cond_sdf_tlss=((cond_ls_en && cond_gac) !==0) ? 1:0;
assign cond_sdf_thss=((cond_ls_en && cond_gac) !==0) ? 1:0;
assign cond_sdf_trms=((cond_gac && !IO.CSN_bmux && !IO.TBYPASSint && !IO.SEint && !IGint && !DE_temp && !rta_en_cond) !==0) ? 1:0; 
assign cond_sdf_twms=((cond_gac && !IO.CSN_bmux && !IO.TBYPASSint && !IO.SEint && !IGint && !DE_temp && !rta_en_cond) !==0) ? 1:0; 
assign cond_sdf_tses=((cond_gac && ATP_buf) !==0) ? 1:0;
assign cond_sdf_tbas=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbps=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbws=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbdes=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbdos=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbmes=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbmos=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tigs=((cond_gac && IG_ADM) !==0) ? 1:0;
assign cond_sdf_taa=((MEMEN_reg && WEN_bmux_reg && !LS_buf && !HS_buf && !rta_en_cond) !==0) ? 1:0; 
assign cond_sdf_taa_ls1=((MEMEN_reg && WEN_bmux_reg && LS_buf && !HS_buf) !==0) ? 1:0; 
assign cond_sdf_taa_hs1=((MEMEN_reg && WEN_bmux_reg && !LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_ls1_hs1=((MEMEN_reg && WEN_bmux_reg && LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tm=((INITNandnotSLEEPandATPandnotSE && TBYPASS_buf && !LS_buf && !HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tm_ls1=((INITNandnotSLEEPandATPandnotSE && TBYPASS_buf && LS_buf && !HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tm_hs1=((INITNandnotSLEEPandATPandnotSE && TBYPASS_buf && !LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tm_ls1_hs1=((INITNandnotSLEEPandATPandnotSE && TBYPASS_buf && LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tseq_tm=((cond_gac && ATP_buf && IO.TBYPASSint) !==0) ? 1:0;

assign cond_sdf_tinitns =(( sleep_en && !STDBY_buf && !SLEEP_buf) !==0) ? 1:0;
assign cond_ls_tby_en=((TBYPASS_buf || csn_ig_en) !==0) ? 1:0;



//specify block begins

specify
    specparam
    
         PATHPULSE$CK$Q = 0,
         PATHPULSE$CK$SCTRLO = 0,
         PATHPULSE$CK$SDLO = 0,
         PATHPULSE$CK$SDRO = 0,
    
        
         PATHPULSE$CK$SMLO = 0,
         PATHPULSE$CK$SMRO = 0,
     
         PATHPULSE$SE$Q = 0,
         

                 
         tlss = 0.0,
         tlsh = 0.0, 
        
         thss = 0.0,
         thsh = 0.0 , 
         tsls = 0.0,
         tslh = 0.0 ,
         tstdbys = 0.0,
         tstdbyh = 0.0 , 
         tcycle = 0.0,
	 
        
         tms = 0.0,
         tmh = 0.0 , 
         tsmlis = 0.0,
         tsmlih = 0.0 ,
         tsmris = 0.0,
         tsmrih = 0.0 ,
 


         
         tcycle_ls1 = 0.0,         
         
         tcycle_hs1 = 0.0,         
         
         tcycle_ls1_hs1 = 0.0,
         tckh = 0.0,
         tckl = 0.0,
         tcycle_se = 0.0,
         tckh_se = 0.0,
         tckl_se = 0.0,
         
         ttms = 0.0,
         ttmh = 0.0 ,
         tps = 0.0,
         tph = 0.0 ,
         tws = 0.0,
         twh = 0.0 ,
         tds = 0.0,
         tdh = 0.0, 
         tas = 0.0,
         tah = 0.0,
         
         tses = 0.0,
         tseh = 0.0 ,
         tsctrlis = 0.0,
         tsctrlih = 0.0,
         tsdlis = 0.0,
         tsdlih = 0.0 ,
         tsdris = 0.0,
         tsdrih = 0.0 , 

         tbists = 0.0,
         tbisth = 0.0 ,
         tbps = 0.0,
         tbph = 0.0 ,
         tbws = 0.0,
         tbwh = 0.0 ,
         tbdes = 0.0,
         tbdeh = 0.0 ,
         tbdos = 0.0,
         tbdoh = 0.0 ,
        
         tbmes = 0.0,
         tbmeh = 0.0 ,
         tbmos = 0.0,
         tbmoh = 0.0 ,  
         tbas = 0.0,
         tbah = 0.0 ,
         
         
         tinitns = 0.0,
         tinitnh = 0.0,
         tatps = 0.0,
         tatph = 0.0,
         tigs = 0.0,
         tigh = 0.0,
         
         
         trms = 0.0,
         trmh = 0.0 ,
         twms = 0.0,
         twmh = 0.0 ,


/*************************************************************************************************/
         taa =`st_delay_seq_taa,
         th = `st_delay_seq_th,


         taa_ls1 =`st_delay_seq_taa,
         th_ls1 = `st_delay_seq_th,

         taa_hs1 =`st_delay_seq_taa,
         th_hs1 = `st_delay_seq_th, 

         taa_ls1_hs1 =`st_delay_seq_taa,
         th_ls1_hs1 = `st_delay_seq_th, 


         taa_tm =`st_delay_seq_taa,
         th_tm = `st_delay_seq_th,

         taa_tm_ls1 =`st_delay_seq_taa,
         th_tm_ls1 = `st_delay_seq_th,

         taa_tm_hs1 =`st_delay_seq_taa,
         th_tm_hs1 = `st_delay_seq_th,         

         taa_tm_ls1_hs1 =`st_delay_seq_taa,
         th_tm_ls1_hs1 = `st_delay_seq_th,         
         taa_tseq_tm =`st_delay_seq_taa,
         th_tseq_tm = `st_delay_seq_th,
         taa_tckq_tm   = `st_delay_seq_taa,
         th_tckq_tm    = `st_delay_seq_th,
         taa_sctrlo =`st_delay_seq_taa,
         th_sctrlo = `st_delay_seq_th,
         taa_sdlo =`st_delay_seq_taa,
         th_sdlo = `st_delay_seq_th,
         taa_sdro =`st_delay_seq_taa,
         th_sdro = `st_delay_seq_th,
         


         taa_smlo =`st_delay_seq_taa,
         th_smlo = `st_delay_seq_th,
         taa_smro =`st_delay_seq_taa,
         th_smro = `st_delay_seq_th,
         taa_smlo_se =`st_delay_seq_taa,
         th_smlo_se = `st_delay_seq_th,
         taa_smro_se =`st_delay_seq_taa,
         th_smro_se = `st_delay_seq_th, 
 
       taa_sctrlo_se =`st_delay_seq_taa,
         th_sctrlo_se = `st_delay_seq_th,
         taa_sdlo_se =`st_delay_seq_taa,
         th_sdlo_se = `st_delay_seq_th,
         taa_sdro_se =`st_delay_seq_taa,
         th_sdro_se = `st_delay_seq_th;
     


/*---------------------- Timing Checks ---------------------*/

	$setup(posedge A[0], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[1], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[2], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[3], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[4], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[5], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[6], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[7], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[8], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[9], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[10], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[0], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[1], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[2], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[3], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[4], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[5], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[6], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[7], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[8], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[9], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[10], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[0], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[1], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[2], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[3], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[4], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[5], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[6], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[7], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[8], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[9], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[10], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[0], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[1], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[2], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[3], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[4], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[5], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[6], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[7], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[8], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[9], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[10], tah, TimingViol_addr);


	$setup(posedge D[0], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_0);
	$setup(posedge D[1], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_1);
	$setup(posedge D[2], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_2);
	$setup(posedge D[3], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_3);
	$setup(posedge D[4], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_4);
	$setup(posedge D[5], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_5);
	$setup(posedge D[6], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_6);
	$setup(posedge D[7], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_7);
	$setup(posedge D[8], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_8);
	$setup(posedge D[9], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_9);
	$setup(posedge D[10], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_10);
	$setup(posedge D[11], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_11);
	$setup(posedge D[12], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_12);
	$setup(posedge D[13], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_13);
	$setup(posedge D[14], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_14);
	$setup(posedge D[15], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_15);
	$setup(posedge D[16], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_16);
	$setup(posedge D[17], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_17);
	$setup(posedge D[18], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_18);
	$setup(posedge D[19], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_19);
	$setup(posedge D[20], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_20);
	$setup(posedge D[21], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_21);
	$setup(posedge D[22], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_22);
	$setup(posedge D[23], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_23);
	$setup(posedge D[24], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_24);
	$setup(posedge D[25], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_25);
	$setup(posedge D[26], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_26);
	$setup(posedge D[27], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_27);
	$setup(posedge D[28], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_28);
	$setup(posedge D[29], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_29);
	$setup(posedge D[30], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_30);
	$setup(posedge D[31], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_31);
	$setup(negedge D[0], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_0);
	$setup(negedge D[1], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_1);
	$setup(negedge D[2], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_2);
	$setup(negedge D[3], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_3);
	$setup(negedge D[4], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_4);
	$setup(negedge D[5], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_5);
	$setup(negedge D[6], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_6);
	$setup(negedge D[7], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_7);
	$setup(negedge D[8], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_8);
	$setup(negedge D[9], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_9);
	$setup(negedge D[10], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_10);
	$setup(negedge D[11], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_11);
	$setup(negedge D[12], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_12);
	$setup(negedge D[13], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_13);
	$setup(negedge D[14], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_14);
	$setup(negedge D[15], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_15);
	$setup(negedge D[16], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_16);
	$setup(negedge D[17], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_17);
	$setup(negedge D[18], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_18);
	$setup(negedge D[19], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_19);
	$setup(negedge D[20], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_20);
	$setup(negedge D[21], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_21);
	$setup(negedge D[22], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_22);
	$setup(negedge D[23], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_23);
	$setup(negedge D[24], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_24);
	$setup(negedge D[25], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_25);
	$setup(negedge D[26], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_26);
	$setup(negedge D[27], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_27);
	$setup(negedge D[28], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_28);
	$setup(negedge D[29], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_29);
	$setup(negedge D[30], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_30);
	$setup(negedge D[31], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_31);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[0], tdh, TimingViol_data_0);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[1], tdh, TimingViol_data_1);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[2], tdh, TimingViol_data_2);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[3], tdh, TimingViol_data_3);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[4], tdh, TimingViol_data_4);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[5], tdh, TimingViol_data_5);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[6], tdh, TimingViol_data_6);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[7], tdh, TimingViol_data_7);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[8], tdh, TimingViol_data_8);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[9], tdh, TimingViol_data_9);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[10], tdh, TimingViol_data_10);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[11], tdh, TimingViol_data_11);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[12], tdh, TimingViol_data_12);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[13], tdh, TimingViol_data_13);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[14], tdh, TimingViol_data_14);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[15], tdh, TimingViol_data_15);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[16], tdh, TimingViol_data_16);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[17], tdh, TimingViol_data_17);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[18], tdh, TimingViol_data_18);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[19], tdh, TimingViol_data_19);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[20], tdh, TimingViol_data_20);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[21], tdh, TimingViol_data_21);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[22], tdh, TimingViol_data_22);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[23], tdh, TimingViol_data_23);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[24], tdh, TimingViol_data_24);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[25], tdh, TimingViol_data_25);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[26], tdh, TimingViol_data_26);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[27], tdh, TimingViol_data_27);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[28], tdh, TimingViol_data_28);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[29], tdh, TimingViol_data_29);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[30], tdh, TimingViol_data_30);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[31], tdh, TimingViol_data_31);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[0], tdh, TimingViol_data_0);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[1], tdh, TimingViol_data_1);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[2], tdh, TimingViol_data_2);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[3], tdh, TimingViol_data_3);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[4], tdh, TimingViol_data_4);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[5], tdh, TimingViol_data_5);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[6], tdh, TimingViol_data_6);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[7], tdh, TimingViol_data_7);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[8], tdh, TimingViol_data_8);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[9], tdh, TimingViol_data_9);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[10], tdh, TimingViol_data_10);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[11], tdh, TimingViol_data_11);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[12], tdh, TimingViol_data_12);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[13], tdh, TimingViol_data_13);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[14], tdh, TimingViol_data_14);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[15], tdh, TimingViol_data_15);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[16], tdh, TimingViol_data_16);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[17], tdh, TimingViol_data_17);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[18], tdh, TimingViol_data_18);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[19], tdh, TimingViol_data_19);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[20], tdh, TimingViol_data_20);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[21], tdh, TimingViol_data_21);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[22], tdh, TimingViol_data_22);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[23], tdh, TimingViol_data_23);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[24], tdh, TimingViol_data_24);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[25], tdh, TimingViol_data_25);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[26], tdh, TimingViol_data_26);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[27], tdh, TimingViol_data_27);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[28], tdh, TimingViol_data_28);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[29], tdh, TimingViol_data_29);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[30], tdh, TimingViol_data_30);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[31], tdh, TimingViol_data_31);



        $setup(posedge M[0], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_0);
	$setup(negedge M[0], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_0);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[0], tmh, TimingViol_mask_0);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[0], tmh, TimingViol_mask_0);

        $setup(posedge M[1], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_1);
	$setup(negedge M[1], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_1);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[1], tmh, TimingViol_mask_1);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[1], tmh, TimingViol_mask_1);

        $setup(posedge M[2], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_2);
	$setup(negedge M[2], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_2);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[2], tmh, TimingViol_mask_2);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[2], tmh, TimingViol_mask_2);

        $setup(posedge M[3], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_3);
	$setup(negedge M[3], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_3);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[3], tmh, TimingViol_mask_3);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[3], tmh, TimingViol_mask_3);

        $setup(posedge M[4], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_4);
	$setup(negedge M[4], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_4);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[4], tmh, TimingViol_mask_4);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[4], tmh, TimingViol_mask_4);

        $setup(posedge M[5], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_5);
	$setup(negedge M[5], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_5);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[5], tmh, TimingViol_mask_5);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[5], tmh, TimingViol_mask_5);

        $setup(posedge M[6], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_6);
	$setup(negedge M[6], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_6);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[6], tmh, TimingViol_mask_6);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[6], tmh, TimingViol_mask_6);

        $setup(posedge M[7], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_7);
	$setup(negedge M[7], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_7);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[7], tmh, TimingViol_mask_7);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[7], tmh, TimingViol_mask_7);

        $setup(posedge M[8], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_8);
	$setup(negedge M[8], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_8);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[8], tmh, TimingViol_mask_8);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[8], tmh, TimingViol_mask_8);

        $setup(posedge M[9], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_9);
	$setup(negedge M[9], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_9);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[9], tmh, TimingViol_mask_9);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[9], tmh, TimingViol_mask_9);

        $setup(posedge M[10], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_10);
	$setup(negedge M[10], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_10);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[10], tmh, TimingViol_mask_10);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[10], tmh, TimingViol_mask_10);

        $setup(posedge M[11], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_11);
	$setup(negedge M[11], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_11);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[11], tmh, TimingViol_mask_11);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[11], tmh, TimingViol_mask_11);

        $setup(posedge M[12], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_12);
	$setup(negedge M[12], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_12);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[12], tmh, TimingViol_mask_12);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[12], tmh, TimingViol_mask_12);

        $setup(posedge M[13], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_13);
	$setup(negedge M[13], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_13);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[13], tmh, TimingViol_mask_13);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[13], tmh, TimingViol_mask_13);

        $setup(posedge M[14], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_14);
	$setup(negedge M[14], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_14);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[14], tmh, TimingViol_mask_14);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[14], tmh, TimingViol_mask_14);

        $setup(posedge M[15], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_15);
	$setup(negedge M[15], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_15);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[15], tmh, TimingViol_mask_15);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[15], tmh, TimingViol_mask_15);

        $setup(posedge M[16], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_16);
	$setup(negedge M[16], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_16);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[16], tmh, TimingViol_mask_16);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[16], tmh, TimingViol_mask_16);

        $setup(posedge M[17], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_17);
	$setup(negedge M[17], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_17);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[17], tmh, TimingViol_mask_17);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[17], tmh, TimingViol_mask_17);

        $setup(posedge M[18], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_18);
	$setup(negedge M[18], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_18);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[18], tmh, TimingViol_mask_18);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[18], tmh, TimingViol_mask_18);

        $setup(posedge M[19], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_19);
	$setup(negedge M[19], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_19);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[19], tmh, TimingViol_mask_19);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[19], tmh, TimingViol_mask_19);

        $setup(posedge M[20], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_20);
	$setup(negedge M[20], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_20);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[20], tmh, TimingViol_mask_20);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[20], tmh, TimingViol_mask_20);

        $setup(posedge M[21], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_21);
	$setup(negedge M[21], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_21);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[21], tmh, TimingViol_mask_21);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[21], tmh, TimingViol_mask_21);

        $setup(posedge M[22], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_22);
	$setup(negedge M[22], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_22);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[22], tmh, TimingViol_mask_22);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[22], tmh, TimingViol_mask_22);

        $setup(posedge M[23], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_23);
	$setup(negedge M[23], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_23);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[23], tmh, TimingViol_mask_23);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[23], tmh, TimingViol_mask_23);

        $setup(posedge M[24], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_24);
	$setup(negedge M[24], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_24);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[24], tmh, TimingViol_mask_24);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[24], tmh, TimingViol_mask_24);

        $setup(posedge M[25], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_25);
	$setup(negedge M[25], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_25);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[25], tmh, TimingViol_mask_25);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[25], tmh, TimingViol_mask_25);

        $setup(posedge M[26], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_26);
	$setup(negedge M[26], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_26);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[26], tmh, TimingViol_mask_26);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[26], tmh, TimingViol_mask_26);

        $setup(posedge M[27], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_27);
	$setup(negedge M[27], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_27);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[27], tmh, TimingViol_mask_27);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[27], tmh, TimingViol_mask_27);

        $setup(posedge M[28], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_28);
	$setup(negedge M[28], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_28);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[28], tmh, TimingViol_mask_28);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[28], tmh, TimingViol_mask_28);

        $setup(posedge M[29], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_29);
	$setup(negedge M[29], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_29);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[29], tmh, TimingViol_mask_29);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[29], tmh, TimingViol_mask_29);

        $setup(posedge M[30], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_30);
	$setup(negedge M[30], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_30);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[30], tmh, TimingViol_mask_30);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[30], tmh, TimingViol_mask_30);

        $setup(posedge M[31], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_31);
	$setup(negedge M[31], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_31);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[31], tmh, TimingViol_mask_31);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[31], tmh, TimingViol_mask_31);



        $setup(posedge WEN, posedge CK &&& cond_sdf_tws, tws, TimingViol_WEN);
        $setup(negedge WEN, posedge CK &&& cond_sdf_tws, tws, TimingViol_WEN);
        $hold(posedge CK &&& cond_sdf_tws, posedge WEN, twh, TimingViol_WEN);
        $hold(posedge CK &&& cond_sdf_tws, negedge WEN, twh, TimingViol_WEN);
        $setup(posedge CSN, posedge CK &&& cond_sdf_tps, tps, TimingViol_CSN);
	$setup(negedge CSN, posedge CK &&& cond_sdf_tps, tps, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tps, posedge CSN, tph, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tps, negedge CSN, tph, TimingViol_CSN);
        $period(posedge CK &&& cond_sdf_tcycle, tcycle, TimingViol_tcycle);  


        $period(posedge CK &&& cond_sdf_tcycle_ls1, tcycle_ls1, TimingViol_tcycle); 

        $period(posedge CK &&& cond_sdf_tcycle_hs1, tcycle_hs1, TimingViol_tcycle); 

        $period(posedge CK &&& cond_sdf_tcycle_ls1_hs1, tcycle_ls1_hs1, TimingViol_tcycle); 

        $width(posedge CK  &&& cond_sdf_tckh, tckh, 0, TimingViol_tckh);
        $width(negedge CK  &&& cond_sdf_tckl, tckl, 0, TimingViol_tckl);
        $period(posedge CK &&& cond_sdf_tcycle_se, tcycle_se, TimingViol_tcycle_se);
        $width(posedge CK  &&& cond_sdf_tckh_se, tckh_se, 0, TimingViol_tckh_se);
        $width(negedge CK  &&& cond_sdf_tckl_se, tckl_se, 0, TimingViol_tckl_se);

        $setup(posedge TBYPASS, posedge CK &&& cond_sdf_ttms,ttms, TimingViol_tbypass);
        $setup(negedge TBYPASS, posedge CK &&& cond_sdf_ttms,ttms, TimingViol_tbypass);
        $hold(posedge CK &&& cond_sdf_ttms, posedge TBYPASS, ttmh, TimingViol_tbypass); 
        $hold(posedge CK &&& cond_sdf_ttms, negedge TBYPASS, ttmh, TimingViol_tbypass); 
 


        $setup(posedge LS, posedge CK &&& cond_sdf_tlss,tlss, TimingViol_ls);
        $setup(negedge LS, posedge CK &&& cond_sdf_tlss,tlss, TimingViol_ls);
        $hold(posedge CK &&& cond_sdf_tlss, posedge LS, tlsh, TimingViol_ls); 
        $hold(posedge CK &&& cond_sdf_tlss, negedge LS, tlsh, TimingViol_ls); 


        $setup(posedge HS, posedge CK &&& cond_sdf_thss,thss, TimingViol_hs);
        $setup(negedge HS, posedge CK &&& cond_sdf_thss,thss, TimingViol_hs);
        $hold(posedge CK &&& cond_sdf_thss, posedge HS, thsh, TimingViol_hs); 
        $hold(posedge CK &&& cond_sdf_thss, negedge HS, thsh, TimingViol_hs); 


        $setup(posedge STDBY, posedge CK &&& cond_sdf_tstdbys, tstdbys, TimingViol_stdby);
        $setup(negedge STDBY, posedge CK &&& cond_sdf_tstdbys, tstdbys, TimingViol_stdby);
        $hold(posedge CK &&& cond_sdf_tstdbys, posedge STDBY, tstdbyh, TimingViol_stdby);        
        $hold(posedge CK &&& cond_sdf_tstdbys, negedge STDBY, tstdbyh, TimingViol_stdby); 
        
        
        $setup (posedge SE ,posedge CK &&& cond_sdf_tses,tses,TimingViol_se);
	$setup (negedge SE ,posedge CK &&& cond_sdf_tses,tses,TimingViol_se);
        
        $hold (posedge CK &&& cond_sdf_tses, posedge SE ,tseh,TimingViol_se);
	$hold (posedge CK &&& cond_sdf_tses, negedge SE ,tseh,TimingViol_se);
        
        $setup(posedge SCTRLI, posedge CK  &&& cond_sdf_tsctrlis , tsctrlis, TimingViol_sctrli);
        $setup(negedge SCTRLI, posedge CK  &&& cond_sdf_tsctrlis, tsctrlis, TimingViol_sctrli);
        $hold(posedge CK &&& cond_sdf_tsctrlis , posedge SCTRLI, tsctrlih, TimingViol_sctrli);        
        $hold(posedge CK &&& cond_sdf_tsctrlis , negedge SCTRLI, tsctrlih, TimingViol_sctrli);

        $setup(posedge SDLI, posedge CK &&& cond_sdf_tsdlis, tsdlis, TimingViol_sdli);
        $setup(negedge SDLI, posedge CK &&& cond_sdf_tsdlis, tsdlis, TimingViol_sdli);
        $hold(posedge CK &&& cond_sdf_tsdlis, posedge SDLI, tsdlih, TimingViol_sdli);        
        $hold(posedge CK &&& cond_sdf_tsdlis, negedge SDLI, tsdlih, TimingViol_sdli);

     

        $setup(posedge SDRI, posedge CK &&& cond_sdf_tsdris, tsdris, TimingViol_sdri);
        $setup(negedge SDRI, posedge CK &&& cond_sdf_tsdris, tsdris, TimingViol_sdri);
        $hold(posedge CK &&& cond_sdf_tsdris, posedge SDRI, tsdrih, TimingViol_sdri);        
        $hold(posedge CK &&& cond_sdf_tsdris, negedge SDRI, tsdrih, TimingViol_sdri);
        
 
        $setup(posedge SMLI, posedge CK &&& cond_sdf_tsmlis, tsmlis, TimingViol_smli);
        $setup(negedge SMLI, posedge CK &&& cond_sdf_tsmlis, tsmlis, TimingViol_smli);
        $hold(posedge CK &&& cond_sdf_tsmlis, posedge SMLI, tsmlih, TimingViol_smli);        
        $hold(posedge CK &&& cond_sdf_tsmlis, negedge SMLI, tsmlih, TimingViol_smli);

        $setup(posedge SMRI, posedge CK &&& cond_sdf_tsmris, tsmris, TimingViol_smri);
        $setup(negedge SMRI, posedge CK &&& cond_sdf_tsmris, tsmris, TimingViol_smri);
        $hold(posedge CK &&& cond_sdf_tsmris, posedge SMRI, tsmrih, TimingViol_smri);        
        $hold(posedge CK &&& cond_sdf_tsmris, negedge SMRI, tsmrih, TimingViol_smri);

      
        	
         
        
        $setup(posedge INITN, posedge CK &&& cond_sdf_tinitns, tinitns, TimingViol_initn);
        $setup(negedge INITN, posedge CK &&& cond_sdf_tinitns, tinitns, TimingViol_initn);
        
        $hold (posedge CK &&& cond_sdf_tinitns,posedge INITN, tinitnh, TimingViol_initn);
        $hold (posedge CK &&& cond_sdf_tinitns,negedge INITN, tinitnh, TimingViol_initn);

        $setup(posedge ATP, posedge CK &&& cond_sdf_atps , tatps, TimingViol_atp);
        $setup(negedge ATP, posedge CK &&& cond_sdf_atps , tatps, TimingViol_atp);
        $hold(posedge CK &&& cond_sdf_atps, posedge ATP, tatph, TimingViol_atp);        
        $hold(posedge CK &&& cond_sdf_atps, negedge ATP, tatph, TimingViol_atp);
        
        $setup(posedge IG, posedge CK &&& cond_sdf_tigs , tigs, TimingViol_ig);
        $setup(negedge IG, posedge CK &&& cond_sdf_tigs , tigs, TimingViol_ig);
        $hold(posedge CK &&& cond_sdf_tigs, posedge IG, tigh, TimingViol_ig);        
        $hold(posedge CK &&& cond_sdf_tigs, negedge IG, tigh, TimingViol_ig);



         
$setup(posedge RM[0], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[1], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[2], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[3], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[0], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[1], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[2], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[3], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[0], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[1], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[2], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[3], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[0], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[1], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[2], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[3], trmh, TimingViol_rm); 

        
$setup(posedge WM[0], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(posedge WM[1], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(posedge WM[2], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(posedge WM[3], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(negedge WM[0], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(negedge WM[1], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(negedge WM[2], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(negedge WM[3], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, posedge WM[0], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, posedge WM[1], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, posedge WM[2], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, posedge WM[3], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, negedge WM[0], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, negedge WM[1], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, negedge WM[2], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, negedge WM[3], twmh, TimingViol_wm);
 
        
        $setup(posedge TBIST, posedge CK &&& cond_sdf_tbists , tbists, TimingViol_tbist);
        $setup(negedge TBIST, posedge CK &&& cond_sdf_tbists , tbists, TimingViol_tbist);
        $hold(posedge CK &&& cond_sdf_tbists, posedge TBIST, tbisth, TimingViol_tbist);        
        $hold(posedge CK &&& cond_sdf_tbists, negedge TBIST, tbisth, TimingViol_tbist);


       	$setup(posedge TA[0], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[1], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[2], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[3], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[4], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[5], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[6], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[7], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[8], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[9], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[10], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
       	$setup(negedge TA[0], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[1], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[2], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[3], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[4], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[5], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[6], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[7], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[8], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[9], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[10], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
       	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[0], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[1], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[2], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[3], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[4], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[5], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[6], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[7], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[8], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[9], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[10], tbah, TimingViol_addr);
       	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[0], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[1], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[2], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[3], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[4], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[5], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[6], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[7], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[8], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[9], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[10], tbah, TimingViol_addr);


        $setup(posedge TCSN, posedge CK &&& cond_sdf_tbps, tbps, TimingViol_CSN);
	$setup(negedge TCSN, posedge CK &&& cond_sdf_tbps, tbps, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tbps, posedge TCSN, tbph, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tbps, negedge TCSN, tbph, TimingViol_CSN); 
       
        $setup(posedge TWEN, posedge CK &&& cond_sdf_tbws, tbws, TimingViol_WEN);
        $setup(negedge TWEN, posedge CK &&& cond_sdf_tbws, tbws, TimingViol_WEN);
        $hold(posedge CK &&& cond_sdf_tbws, posedge TWEN, tbwh, TimingViol_WEN);
        $hold(posedge CK &&& cond_sdf_tbws, negedge TWEN, tbwh, TimingViol_WEN);
       
       
        $setup(posedge TED, posedge CK &&& cond_sdf_tbdes, tbdes, TimingViol_TED);
        $setup(negedge TED, posedge CK &&& cond_sdf_tbdes, tbdes, TimingViol_TED);
        $hold(posedge CK &&& cond_sdf_tbdes, posedge TED, tbdeh, TimingViol_TED);
        $hold(posedge CK &&& cond_sdf_tbdes, negedge TED, tbdeh, TimingViol_TED);

        $setup(posedge TOD, posedge CK &&& cond_sdf_tbdos, tbdos, TimingViol_TOD);
        $setup(negedge TOD, posedge CK &&& cond_sdf_tbdos, tbdos, TimingViol_TOD);
        $hold(posedge CK &&& cond_sdf_tbdos, posedge TOD, tbdoh, TimingViol_TOD);
        $hold(posedge CK &&& cond_sdf_tbdos, negedge TOD, tbdoh, TimingViol_TOD);

        $setup(posedge TEM, posedge CK &&& cond_sdf_tbmes, tbmes, TimingViol_TEM);
        $setup(negedge TEM, posedge CK &&& cond_sdf_tbmes, tbmes, TimingViol_TEM);
        $hold(posedge CK &&& cond_sdf_tbmes, posedge TEM, tbmeh, TimingViol_TEM);
        $hold(posedge CK &&& cond_sdf_tbmes, negedge TEM, tbmeh, TimingViol_TEM);

        $setup(posedge TOM, posedge CK &&& cond_sdf_tbmos, tbmos, TimingViol_TOM);
        $setup(negedge TOM, posedge CK &&& cond_sdf_tbmos, tbmos, TimingViol_TOM);
        $hold(posedge CK &&& cond_sdf_tbmos, posedge TOM, tbmoh, TimingViol_TOM);
        $hold(posedge CK &&& cond_sdf_tbmos, negedge TOM, tbmoh, TimingViol_TOM);
       
          


          

          /*-------------------- Propagation Delays ------------------*/
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa, taa, th, taa, th, taa);
                 


/* // //	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[0] +: Q_final[0])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[1] +: Q_final[1])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[2] +: Q_final[2])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[3] +: Q_final[3])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[4] +: Q_final[4])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[5] +: Q_final[5])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[6] +: Q_final[6])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[7] +: Q_final[7])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[8] +: Q_final[8])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[9] +: Q_final[9])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[10] +: Q_final[10])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[11] +: Q_final[11])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[12] +: Q_final[12])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[13] +: Q_final[13])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[14] +: Q_final[14])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[15] +: Q_final[15])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[16] +: Q_final[16])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[17] +: Q_final[17])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[18] +: Q_final[18])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[19] +: Q_final[19])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[20] +: Q_final[20])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[21] +: Q_final[21])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[22] +: Q_final[22])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[23] +: Q_final[23])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[24] +: Q_final[24])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[25] +: Q_final[25])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[26] +: Q_final[26])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[27] +: Q_final[27])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[28] +: Q_final[28])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[29] +: Q_final[29])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[30] +: Q_final[30])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[31] +: Q_final[31])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q); */ 


	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                 




	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                



	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                




	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                




	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                




	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                




	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                



	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[0] +: Q_final[0])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[1] +: Q_final[1])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[2] +: Q_final[2])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[3] +: Q_final[3])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[4] +: Q_final[4])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[5] +: Q_final[5])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[6] +: Q_final[6])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[7] +: Q_final[7])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[8] +: Q_final[8])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[9] +: Q_final[9])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[10] +: Q_final[10])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[11] +: Q_final[11])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[12] +: Q_final[12])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[13] +: Q_final[13])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[14] +: Q_final[14])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[15] +: Q_final[15])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[16] +: Q_final[16])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[17] +: Q_final[17])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[18] +: Q_final[18])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[19] +: Q_final[19])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[20] +: Q_final[20])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[21] +: Q_final[21])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[22] +: Q_final[22])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[23] +: Q_final[23])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[24] +: Q_final[24])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[25] +: Q_final[25])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[26] +: Q_final[26])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[27] +: Q_final[27])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[28] +: Q_final[28])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[29] +: Q_final[29])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[30] +: Q_final[30])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[31] +: Q_final[31])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                 

	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[0] +: Q_final[0])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[1] +: Q_final[1])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[2] +: Q_final[2])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[3] +: Q_final[3])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[4] +: Q_final[4])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[5] +: Q_final[5])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[6] +: Q_final[6])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[7] +: Q_final[7])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[8] +: Q_final[8])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[9] +: Q_final[9])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[10] +: Q_final[10])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[11] +: Q_final[11])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[12] +: Q_final[12])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[13] +: Q_final[13])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[14] +: Q_final[14])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[15] +: Q_final[15])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[16] +: Q_final[16])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[17] +: Q_final[17])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[18] +: Q_final[18])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[19] +: Q_final[19])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[20] +: Q_final[20])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[21] +: Q_final[21])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[22] +: Q_final[22])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[23] +: Q_final[23])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[24] +: Q_final[24])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[25] +: Q_final[25])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[26] +: Q_final[26])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[27] +: Q_final[27])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[28] +: Q_final[28])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[29] +: Q_final[29])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[30] +: Q_final[30])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[31] +: Q_final[31])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                



if (cond_sdf_taa_sctrlo) 
        (posedge CK *> (SCTRLO :  SCTRLO_final)) = (taa_sctrlo,taa_sctrlo,th_sctrlo,taa_sctrlo,th_sctrlo,taa_sctrlo); 

if (cond_sdf_taa_sctrlo_se) 
        (negedge CK *> (SCTRLO : SCTRLO_final)) = (taa_sctrlo_se,taa_sctrlo_se,th_sctrlo_se,taa_sctrlo_se,th_sctrlo_se,taa_sctrlo_se); 
 
if (cond_sdf_taa_sdlo) 
        (posedge CK *> (SDLO :  SDLO_final)) = (taa_sdlo,taa_sdlo,th_sdlo,taa_sdlo,th_sdlo,taa_sdlo); 
if (cond_sdf_taa_sdlo_se) 
        (negedge CK *> (SDLO : SDLO_final)) = (taa_sdlo_se,taa_sdlo_se,th_sdlo_se,taa_sdlo_se,th_sdlo_se,taa_sdlo_se);


if (cond_sdf_taa_sdro) 
        (posedge CK *> (SDRO :  SDRO_final)) = (taa_sdro,taa_sdro,th_sdro,taa_sdro,th_sdro,taa_sdro); 
if (cond_sdf_taa_sdro_se) 
        (negedge CK *> (SDRO : SDRO_final)) = (taa_sdro_se,taa_sdro_se,th_sdro_se,taa_sdro_se,th_sdro_se,taa_sdro_se); 





if (cond_sdf_taa_smlo) 
        (posedge CK *> (SMLO :  SMLO_final)) = (taa_smlo,taa_smlo,th_smlo,taa_smlo,th_smlo,taa_smlo); 
if (cond_sdf_taa_smlo_se) 
        (negedge CK *> (SMLO : SMLO_final)) = (taa_smlo_se,taa_smlo_se,th_smlo_se,taa_smlo_se,th_smlo_se,taa_smlo_se);
if (cond_sdf_taa_smro) 
        (posedge CK *> (SMRO :  SMRO_final)) = (taa_smro,taa_smro,th_smro,taa_smro,th_smro,taa_smro);
if (cond_sdf_taa_smro_se) 
        (negedge CK *> (SMRO : SMRO_final)) = (taa_smro_se,taa_smro_se,th_smro_se,taa_smro_se,th_smro_se,taa_smro_se);


 
     


endspecify //specify block ends

always @(SE_buf)
begin
 if ($realtime > 0) begin
   if (INITN_buf === 1'b1 && SLEEP_buf === 1'b0 && ATP_buf === 1'b1 && STDBY_buf === 0) begin
// reset the next cycle corruption flag // modification done to test the proposal of resetting next cycle corruption flag on toggling of SE. This is because setup/hold of SE is large enough to ensure recovery from MemFSM corruption. 
        invalid_next_cycle_func = 1'b0;
        invalid_next_cycle_dft = 1'b0;
        release IO.cgc_CK_rw.CK_gated;
        release IO.cgc_CK_bypass.CK_gated;
        release IO.cgc_CK_lkp_latch.CK_gated;
        release IO.cgc_CK_scff.CK_gated;
        if (CK === 1'b0) begin
                IO.cgc_CK_rw.CK_gated = 1'b0;
                IO.cgc_CK_bypass.CK_gated = 1'b0;
                IO.cgc_CK_lkp_latch.CK_gated = 1'b0;
                IO.cgc_CK_scff.CK_gated = 1'b0;
        end        
   end 
 end  
end

task Invalid_next_cycle_func_tim;
begin
        
   Corrupt_Mem;
   Corrupt_Q;
   if (INITN !== 1'b0) begin     
        invalid_next_cycle_func <= 1'b1;
        force IO.cgc_CK_rw.CK_gated = 1'bx;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Memory and Output Q are Corrupted. Next Cycle is not functional", $realtime);
   end     
end
endtask

task Invalid_next_cycle_dft_tim;
begin

   Corrupt_all_scan_flops_scan_outs;
   if (INITN !== 1'b0) begin     
        invalid_next_cycle_dft <= 1'b1;
        force IO.cgc_CK_lkp_latch.CK_gated = 1'bx;
        force IO.cgc_CK_scff.CK_gated = 1'bx;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted. Next Cycle is not functional", $realtime);
   end
end
endtask

task WriteLocMskX_bwise;
input [Addr-1 : 0] Address;
input [bits-1 : 0] Mask;
reg [bits-1 : 0] Mask_inv;

reg [bits-1:0] tempReg1;
begin
   tempReg1 = WordX;
   Mask_inv = ~Mask;
   if (^Address !== X )
   begin
      `ifdef ST_MEM_SLM
        $slm_ReadMemory(slm_handle, Address, tempReg1);
      `else
        tempReg1 = Mem[Address];
      `endif
             
      for (i = 0; i < bits; i=i+1) begin
        if (Mask[i] === 1'bx)
            tempReg1[i] = 1'bx;
      end
      `ifdef ST_MEM_SLM
         $slm_WriteMemory(slm_handle, Address, tempReg1, Mask_inv);
      `else
        Mem[Address] = tempReg1;
      `endif
   end//if (^Address !== X
   else begin
      WriteMemX;
   end   
   task_insert_faults_in_memory;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Memory bit location Corrupted", $realtime);
end
endtask


// conversion from registers to array elements for mask setup violation notifiers 

   
always @(TimingViol_mask_0   or TimingViol_TEM   )
begin
          TimingViol_mask[0]=~TimingViol_mask[0]; 
end

   
always @(TimingViol_mask_1   or TimingViol_TOM   )
begin
          TimingViol_mask[1]=~TimingViol_mask[1]; 
end

   
always @(TimingViol_mask_2   or TimingViol_TEM   )
begin
          TimingViol_mask[2]=~TimingViol_mask[2]; 
end

   
always @(TimingViol_mask_3   or TimingViol_TOM   )
begin
          TimingViol_mask[3]=~TimingViol_mask[3]; 
end

   
always @(TimingViol_mask_4   or TimingViol_TEM   )
begin
          TimingViol_mask[4]=~TimingViol_mask[4]; 
end

   
always @(TimingViol_mask_5   or TimingViol_TOM   )
begin
          TimingViol_mask[5]=~TimingViol_mask[5]; 
end

   
always @(TimingViol_mask_6   or TimingViol_TEM   )
begin
          TimingViol_mask[6]=~TimingViol_mask[6]; 
end

   
always @(TimingViol_mask_7   or TimingViol_TOM   )
begin
          TimingViol_mask[7]=~TimingViol_mask[7]; 
end

   
always @(TimingViol_mask_8   or TimingViol_TEM   )
begin
          TimingViol_mask[8]=~TimingViol_mask[8]; 
end

   
always @(TimingViol_mask_9   or TimingViol_TOM   )
begin
          TimingViol_mask[9]=~TimingViol_mask[9]; 
end

   
always @(TimingViol_mask_10   or TimingViol_TEM   )
begin
          TimingViol_mask[10]=~TimingViol_mask[10]; 
end

   
always @(TimingViol_mask_11   or TimingViol_TOM   )
begin
          TimingViol_mask[11]=~TimingViol_mask[11]; 
end

   
always @(TimingViol_mask_12   or TimingViol_TEM   )
begin
          TimingViol_mask[12]=~TimingViol_mask[12]; 
end

   
always @(TimingViol_mask_13   or TimingViol_TOM   )
begin
          TimingViol_mask[13]=~TimingViol_mask[13]; 
end

   
always @(TimingViol_mask_14   or TimingViol_TEM   )
begin
          TimingViol_mask[14]=~TimingViol_mask[14]; 
end

   
always @(TimingViol_mask_15   or TimingViol_TOM   )
begin
          TimingViol_mask[15]=~TimingViol_mask[15]; 
end

   
always @(TimingViol_mask_16   or TimingViol_TEM   )
begin
          TimingViol_mask[16]=~TimingViol_mask[16]; 
end

   
always @(TimingViol_mask_17   or TimingViol_TOM   )
begin
          TimingViol_mask[17]=~TimingViol_mask[17]; 
end

   
always @(TimingViol_mask_18   or TimingViol_TEM   )
begin
          TimingViol_mask[18]=~TimingViol_mask[18]; 
end

   
always @(TimingViol_mask_19   or TimingViol_TOM   )
begin
          TimingViol_mask[19]=~TimingViol_mask[19]; 
end

   
always @(TimingViol_mask_20   or TimingViol_TEM   )
begin
          TimingViol_mask[20]=~TimingViol_mask[20]; 
end

   
always @(TimingViol_mask_21   or TimingViol_TOM   )
begin
          TimingViol_mask[21]=~TimingViol_mask[21]; 
end

   
always @(TimingViol_mask_22   or TimingViol_TEM   )
begin
          TimingViol_mask[22]=~TimingViol_mask[22]; 
end

   
always @(TimingViol_mask_23   or TimingViol_TOM   )
begin
          TimingViol_mask[23]=~TimingViol_mask[23]; 
end

   
always @(TimingViol_mask_24   or TimingViol_TEM   )
begin
          TimingViol_mask[24]=~TimingViol_mask[24]; 
end

   
always @(TimingViol_mask_25   or TimingViol_TOM   )
begin
          TimingViol_mask[25]=~TimingViol_mask[25]; 
end

   
always @(TimingViol_mask_26   or TimingViol_TEM   )
begin
          TimingViol_mask[26]=~TimingViol_mask[26]; 
end

   
always @(TimingViol_mask_27   or TimingViol_TOM   )
begin
          TimingViol_mask[27]=~TimingViol_mask[27]; 
end

   
always @(TimingViol_mask_28   or TimingViol_TEM   )
begin
          TimingViol_mask[28]=~TimingViol_mask[28]; 
end

   
always @(TimingViol_mask_29   or TimingViol_TOM   )
begin
          TimingViol_mask[29]=~TimingViol_mask[29]; 
end

   
always @(TimingViol_mask_30   or TimingViol_TEM   )
begin
          TimingViol_mask[30]=~TimingViol_mask[30]; 
end

   
always @(TimingViol_mask_31   or TimingViol_TOM   )
begin
          TimingViol_mask[31]=~TimingViol_mask[31]; 
end







// conversion from registers to array elements for data setup violation notifiers

always @(TimingViol_data_0   or TimingViol_TED  )
begin
        TimingViol_data[0]=~TimingViol_data[0];   
end


always @(TimingViol_data_1   or TimingViol_TOD  )
begin
        TimingViol_data[1]=~TimingViol_data[1];   
end


always @(TimingViol_data_2   or TimingViol_TED  )
begin
        TimingViol_data[2]=~TimingViol_data[2];   
end


always @(TimingViol_data_3   or TimingViol_TOD  )
begin
        TimingViol_data[3]=~TimingViol_data[3];   
end


always @(TimingViol_data_4   or TimingViol_TED  )
begin
        TimingViol_data[4]=~TimingViol_data[4];   
end


always @(TimingViol_data_5   or TimingViol_TOD  )
begin
        TimingViol_data[5]=~TimingViol_data[5];   
end


always @(TimingViol_data_6   or TimingViol_TED  )
begin
        TimingViol_data[6]=~TimingViol_data[6];   
end


always @(TimingViol_data_7   or TimingViol_TOD  )
begin
        TimingViol_data[7]=~TimingViol_data[7];   
end


always @(TimingViol_data_8   or TimingViol_TED  )
begin
        TimingViol_data[8]=~TimingViol_data[8];   
end


always @(TimingViol_data_9   or TimingViol_TOD  )
begin
        TimingViol_data[9]=~TimingViol_data[9];   
end


always @(TimingViol_data_10   or TimingViol_TED  )
begin
        TimingViol_data[10]=~TimingViol_data[10];   
end


always @(TimingViol_data_11   or TimingViol_TOD  )
begin
        TimingViol_data[11]=~TimingViol_data[11];   
end


always @(TimingViol_data_12   or TimingViol_TED  )
begin
        TimingViol_data[12]=~TimingViol_data[12];   
end


always @(TimingViol_data_13   or TimingViol_TOD  )
begin
        TimingViol_data[13]=~TimingViol_data[13];   
end


always @(TimingViol_data_14   or TimingViol_TED  )
begin
        TimingViol_data[14]=~TimingViol_data[14];   
end


always @(TimingViol_data_15   or TimingViol_TOD  )
begin
        TimingViol_data[15]=~TimingViol_data[15];   
end


always @(TimingViol_data_16   or TimingViol_TED  )
begin
        TimingViol_data[16]=~TimingViol_data[16];   
end


always @(TimingViol_data_17   or TimingViol_TOD  )
begin
        TimingViol_data[17]=~TimingViol_data[17];   
end


always @(TimingViol_data_18   or TimingViol_TED  )
begin
        TimingViol_data[18]=~TimingViol_data[18];   
end


always @(TimingViol_data_19   or TimingViol_TOD  )
begin
        TimingViol_data[19]=~TimingViol_data[19];   
end


always @(TimingViol_data_20   or TimingViol_TED  )
begin
        TimingViol_data[20]=~TimingViol_data[20];   
end


always @(TimingViol_data_21   or TimingViol_TOD  )
begin
        TimingViol_data[21]=~TimingViol_data[21];   
end


always @(TimingViol_data_22   or TimingViol_TED  )
begin
        TimingViol_data[22]=~TimingViol_data[22];   
end


always @(TimingViol_data_23   or TimingViol_TOD  )
begin
        TimingViol_data[23]=~TimingViol_data[23];   
end


always @(TimingViol_data_24   or TimingViol_TED  )
begin
        TimingViol_data[24]=~TimingViol_data[24];   
end


always @(TimingViol_data_25   or TimingViol_TOD  )
begin
        TimingViol_data[25]=~TimingViol_data[25];   
end


always @(TimingViol_data_26   or TimingViol_TED  )
begin
        TimingViol_data[26]=~TimingViol_data[26];   
end


always @(TimingViol_data_27   or TimingViol_TOD  )
begin
        TimingViol_data[27]=~TimingViol_data[27];   
end


always @(TimingViol_data_28   or TimingViol_TED  )
begin
        TimingViol_data[28]=~TimingViol_data[28];   
end


always @(TimingViol_data_29   or TimingViol_TOD  )
begin
        TimingViol_data[29]=~TimingViol_data[29];   
end


always @(TimingViol_data_30   or TimingViol_TED  )
begin
        TimingViol_data[30]=~TimingViol_data[30];   
end


always @(TimingViol_data_31   or TimingViol_TOD  )
begin
        TimingViol_data[31]=~TimingViol_data[31];   
end


//------------------------------------------------------------------------
//           Actions taken on timing violations starts 
//------------------------------------------------------------------------

 always @(TimingViol_data)
// tds or tdh violation
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
  for (i = 0; i < bits; i = i + 1) begin   
    if (CSWEMTBYPASS[i] !== 0) begin
     if((TimingViol_data[i] !== TimingViol_data_last[i])) begin
         M_bmux_reg[i] = 1'bx;
     end    
    end   
   end 
   if (CSWEMTBYPASS !== 0) WriteLocMskX_bwise(A_bmux_reg,M_bmux_reg);
  end
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin
   Corrupt_data_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Data Scan Flops and Scan Outs are Corrupted", $realtime);
  end
  TimingViol_data_last = TimingViol_data; 
end


always @(TimingViol_mask)
// tms or tmh violation
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
     if(CSWETBYPASSN !== 0) begin
          for (i = 0; i < bits; i = i+1) begin   
             if ( (TimingViol_mask_last[i] !== TimingViol_mask[i])) begin
                `ifdef ST_MEM_SLM
                        M_bmux_reg[i] = 1'bx;
                `else
                        if (D_bmux[i] !== Mem_prev[i]) begin
                         M_bmux_reg[i] = 1'bx;
                        end
                `endif
             end   
          end      
          WriteLocMskX_bwise(A_bmux_reg, M_bmux_reg);
     end      
  end
  
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
        Corrupt_mask_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Mask Scan Flops and Scan Outs are Corrupted", $realtime);
  end

  TimingViol_mask_last = TimingViol_mask; 
 end 

always @(TimingViol_addr)
// tas or tah
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Invalid_next_cycle_func_tim;
  end
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
      Corrupt_ctrl_scan_flops_scan_outs;
      if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Control Scan Flops and Scan Outs are Corrupted", $realtime);
  end
end

always @(TimingViol_WEN)
//tws or twh
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Qtemp = WordX;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Output Q Corrupted", $realtime);
   
   if (ValidAddress === 1'b1) begin
           Corrupt_Current_Location;
           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Current Address Location Corrupted", $realtime);
   end
   else if (ValidAddress === 1'bx) begin
           WriteMemX;
           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Entire Memory Array Corrupted", $realtime);
   end        
  end
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
   Corrupt_ctrl_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Control Scan Flops and Scan Outs are Corrupted", $realtime);
  end
end 

always @(TimingViol_CSN )
// tps or tph 
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Invalid_next_cycle_func_tim;
  end
  if (INITN_buf !== 0 && STDBY_buf !== 1 && SLEEP_buf !== 1 && ATP_buf !== 0 ) begin      
   Corrupt_ctrl_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Control Scan Flops and Scan Outs are Corrupted", $realtime);
  end
end

always @(TimingViol_tcycle )
//tcycle
begin
#0
   if ((IO.GAC && ATP_buf) !== 0 && MEMEN_dft_prev !== 0) begin
    Invalid_next_cycle_dft_tim;
   end
   if (IO.MEM_EN_inst !== 0 && MEMEN_prev !== 0) begin
    Invalid_next_cycle_func_tim;
   end
end

always @(TimingViol_tckl )
// tckl 
begin
#0
   if (INITN_buf !== 0 && STDBY_buf !== 1 && SLEEP_buf !== 1 && ATP_buf !== 0 ) begin      
    Invalid_next_cycle_dft_tim;
   end
   if (INITN_buf !== 0 && STDBY_buf !== 1 && SLEEP_buf !== 1 && IO.CSN_bmux !== 1 && IGint !== 1 && DE_temp !== 1 && (ATP_buf !== 1 ||(ATP_buf === 1 && SE_buf !== 1 && TBYPASS_buf !== 1))) begin
    Invalid_next_cycle_func_tim;
   end
end

always @(TimingViol_tckh) begin
#0
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
    Invalid_next_cycle_dft_tim;
   end
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
    Invalid_next_cycle_func_tim;
   end
end


always @(TimingViol_tcycle_se )
//tcycle_se
begin
#0
   if ((IO.GAC && ATP_buf) !== 0 && MEMEN_dft_prev !== 0) begin
         Invalid_next_cycle_dft_tim;
   end
end

always @(TimingViol_tckl_se  )
begin
#0
   if (INITN_buf !== 0 && STDBY_buf !== 1 && SLEEP_buf !== 1 && ATP_buf !== 0 ) begin      
         Invalid_next_cycle_dft_tim;
   end
end

always @(TimingViol_tckh_se) begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
         Invalid_next_cycle_dft_tim;
   end
end

always @(TimingViol_tbist) begin
#0
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
    Corrupt_all_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted", $realtime);
   end
   if (IO.TBYPASSint !== 1'b0) begin 
    Corrupt_Q;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Output Q Corrupted", $realtime);
   end 
   if (INITN_reg !==0 && STDBY_reg !== 1 && TBYPASS_reg !== 1 && SLEEP_reg !== 1 && SE_reg !== 1 && IG_reg !== 1 && DE_reg !== 1) begin
    Invalid_next_cycle_func_tim;
   end
end


always @(TimingViol_ls) begin
 #0 
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && (RM_buf === 0) && (WM_buf === 0)) begin
    Invalid_next_cycle_func_tim;
   end
end



always @(TimingViol_hs) begin
 #0 
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && (RM_buf === 0) && (WM_buf === 0)) begin   
    Invalid_next_cycle_func_tim;
   end
end 


always @(TimingViol_tbypass)
//ttmck
begin
#0  
  Corrupt_Q;
  if (INITN_reg !== 0 && SLEEP_reg !== 1 && SE_reg !== 1 && STDBY_reg !== 1 &&  DE_reg !== 1) begin
   Invalid_next_cycle_dft_tim;
  end
  if (CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && SLEEP_reg !== 1 && STDBY_reg !== 1 && INITN_reg !== 0) begin 
    Invalid_next_cycle_func_tim;
  end
end


always @(TimingViol_sleep)
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && DE_reg !== 1) begin
   Invalid_next_cycle_func_tim;
  end  
  if (INITN_reg !== 0 && STDBY_reg !== 1 && ATP_reg !== 0) begin
     if (SE_reg !== 1'b1) begin
        Invalid_next_cycle_dft_tim;
     end
     else begin
        Corrupt_all_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted", $realtime);
     end        
  end
end

always @(TimingViol_stdby)
begin
#0
  if (CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && DE_reg !== 1) begin 
   Invalid_next_cycle_func_tim;
  end  
  if (ATP_reg !== 0) begin 
     if (SE_reg !== 1'b1) begin
        Invalid_next_cycle_dft_tim;
     end
     else begin
        Corrupt_all_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted", $realtime);
     end        
  end
end






always @(TimingViol_se) begin
#0
  if (TBYPASS_reg === 1'b1) begin 
     Corrupt_Q;
     if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Output Q Corrupted", $realtime);
  end 
  else begin 
        Invalid_next_cycle_func_tim;
  end 
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
    Corrupt_all_scan_flops_scan_outs;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted", $realtime);
    if (TBYPASS_reg === 1'bx && SE_buf !== 1'b1) begin
        Invalid_next_cycle_dft_tim;
    end
  end
end

always @(TimingViol_sctrli) begin
    Corrupt_ctrl_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Control Scan Flops Corrupted", $realtime);
end

always @(TimingViol_sdli) begin
    Corrupt_datal_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Data Left Scan Flops Corrupted", $realtime);
end

always @(TimingViol_sdri) begin
    Corrupt_datar_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Data Right Scan Flops Corrupted", $realtime);
end




always @(TimingViol_smli) begin
    Corrupt_maskl_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Mask Left Scan Flops Corrupted", $realtime);
end

always @(TimingViol_smri) begin
    Corrupt_maskr_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Mask Right Scan Flops Corrupted", $realtime);
end




        

always @(TimingViol_initn) begin
#0
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && DE_reg !== 1) begin
   Corrupt_Mem;
   Corrupt_Q;
   invalid_next_cycle_func <= 1'b1;
   force IO.cgc_CK_rw.CK_gated = 1'bx;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Memory and Output Q are Corrupted. Next Cycle is not functional", $realtime);
  end  
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && ATP_reg !== 0) begin
     if (SE_reg !== 1'b1) begin
        Corrupt_all_scan_flops_scan_outs;
        invalid_next_cycle_dft <= 1'b1;
        force IO.cgc_CK_lkp_latch.CK_gated = 1'bx;
        force IO.cgc_CK_scff.CK_gated = 1'bx;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted. Next Cycle is not functional", $realtime);
     end
     else begin
        Corrupt_all_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops are Corrupted", $realtime);
     end        
  end
end

always @(TimingViol_ig) begin
#0
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && INITN_reg !== 0 && DE_reg !== 1) begin
   Invalid_next_cycle_func_tim;
  end  
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
   Corrupt_all_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops are Corrupted", $realtime);
  end
end

always @(TimingViol_atp) begin
#0
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && INITN_reg !== 0) begin  
   Invalid_next_cycle_func_tim;
  end  
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && INITN_reg !== 0) begin
   Invalid_next_cycle_dft_tim;
  end
end


always @(TimingViol_rm) begin
#0
   if (INITN_reg !== 0 && SLEEP_reg !== 1 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && (LS_buf !== X) && (HS_buf !== X) && (WM_buf === 0)) begin 
    Invalid_next_cycle_func_tim;
   end
end
always @(TimingViol_wm) begin
#0
   if (INITN_reg !== 0 && SLEEP_reg !== 1 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && (LS_buf !== X) && (HS_buf !== X) && (RM_buf === 0)) begin 
    Invalid_next_cycle_func_tim;
   end
end 



//------------------------------------------------------------------------
//           Actions taken on timing violations ends 
//------------------------------------------------------------------------

//------------------------------------------------------------
//    Glitch generation on Output(s) in Timing Mode Starts
//------------------------------------------------------------

always @(Q_int)
begin
        for (i=0; i <= bits-1; i=i+1)
        begin
          if (Q_int_prev[i] !== Q_int[i])
          begin
            if (Q_int[i] !== 1'bx) Q_final[i] = 1'bx;
            Q_final[i] <= Q_int[i];
          end
          else 
          begin
            Q_final[i] <= Q_int[i];
          end            
          Q_int_prev[i] = Q_int[i];
        end

end

always @(SCTRLO_temp)
begin
        if (SCTRLO_prev !== SCTRLO_temp)
        begin
          if (SCTRLO_temp !== 1'bx) SCTRLO_final = 1'bx;
          SCTRLO_final <= SCTRLO_temp;
        end
        else 
        begin
          SCTRLO_final <= SCTRLO_temp;
        end
        SCTRLO_prev = SCTRLO_temp;
end

always @(SDLO_temp)
begin
        if (SDLO_prev !== SDLO_temp)
        begin
          if (SDLO_temp !== 1'bx) SDLO_final = 1'bx;
          SDLO_final <= SDLO_temp;
        end
        else 
        begin
          SDLO_final <= SDLO_temp;
        end
        SDLO_prev = SDLO_temp;
end



always @(SDRO_temp)
begin
        if (SDRO_prev !== SDRO_temp)
        begin
          if (SDRO_temp !== 1'bx) SDRO_final = 1'bx;
          SDRO_final <= SDRO_temp;
        end
        else 
        begin
          SDRO_final <= SDRO_temp;
        end
        SDRO_prev = SDRO_temp;
end

    



always @(SMLO_temp)
begin
        if (SMLO_prev !== SMLO_temp)
        begin
          if (SMLO_temp !== 1'bx) SMLO_final = 1'bx;
          SMLO_final <= SMLO_temp;
        end
        else 
        begin
          SMLO_final <= SMLO_temp;
        end
        SMLO_prev = SMLO_temp;
end
    
always @(SMRO_temp)
begin
        if (SMRO_prev !== SMRO_temp)
        begin
          if (SMRO_temp !== 1'bx) SMRO_final = 1'bx;
          SMRO_final <= SMRO_temp;
        end
        else 
        begin
          SMRO_final <= SMRO_temp;
        end
        SMRO_prev = SMRO_temp;
end
    






//------------------------------------------------------------
//    Glitch generation on Output(s) in Timing Mode Ends
//------------------------------------------------------------

//------------------------------------------------------------
//        Output Buffers for verilog timing model
//------------------------------------------------------------


buf (Q[0],Q_final[0]);

buf (Q[1],Q_final[1]);

buf (Q[2],Q_final[2]);

buf (Q[3],Q_final[3]);

buf (Q[4],Q_final[4]);

buf (Q[5],Q_final[5]);

buf (Q[6],Q_final[6]);

buf (Q[7],Q_final[7]);

buf (Q[8],Q_final[8]);

buf (Q[9],Q_final[9]);

buf (Q[10],Q_final[10]);

buf (Q[11],Q_final[11]);

buf (Q[12],Q_final[12]);

buf (Q[13],Q_final[13]);

buf (Q[14],Q_final[14]);

buf (Q[15],Q_final[15]);

buf (Q[16],Q_final[16]);

buf (Q[17],Q_final[17]);

buf (Q[18],Q_final[18]);

buf (Q[19],Q_final[19]);

buf (Q[20],Q_final[20]);

buf (Q[21],Q_final[21]);

buf (Q[22],Q_final[22]);

buf (Q[23],Q_final[23]);

buf (Q[24],Q_final[24]);

buf (Q[25],Q_final[25]);

buf (Q[26],Q_final[26]);

buf (Q[27],Q_final[27]);

buf (Q[28],Q_final[28]);

buf (Q[29],Q_final[29]);

buf (Q[30],Q_final[30]);

buf (Q[31],Q_final[31]);

buf (SCTRLO,SCTRLO_final);
buf (SDLO, SDLO_final);
buf (SDRO, SDRO_final);


buf (SMLO, SMLO_final);
buf (SMRO, SMRO_final);





`endif // ifdef functional

//--------------------------------------------------------------------
//                     TIMING WRAPPER ENDS
//--------------------------------------------------------------------

wire supply_ok;

`ifdef ST_MEM_POWER_SEQUENCING_OFF
  
  assign supply_ok = 1'b1;

`else
//--------------------------------------------------------------------
//                 POWER PINS FUNCTIONALITY STARTS
//--------------------------------------------------------------------
reg mem_blocked = 1'b0;
reg Proper_shutdown;

wire vddmp_int, vddsmp_int, vddma_int, vddmo_int, gndm_int, gndsm_int;
reg [63 : 0]  sleep_toggle_time, vddmp_toggle_time, vddsmp_toggle_time, vddma_toggle_time, vddmo_toggle_time; 
reg [63 : 0] t_ma_mo=0, t_mp_mo=0, t_mo_ma=0, t_mo_smp=0, t_mo_mp=0, t_sl_ma=0, t_sl_mp=0, t_smp_mp=0, t_mp_smp=0, t_sl_mo=0;
wire PSWSMALLMA_int,PSWSMALLMP_int,PSWLARGEMA_int,PSWLARGEMP_int;
wire vddmpi_int, vddmai_int;



//-----------------------------------------------------------------
//   Calculating the valid states for all power supplies starts
//   Example : 
//        -> For flip-well vddsm valid range is -1 to 0
//        -> For noflip-well vddsm valid range is 0 to 1
//-----------------------------------------------------------------

localparam
        p_ok = 1'b1,
        p_not_ok = 1'b0,
        unknown = 1'bx;

assign vddmp_int = vddm;
assign vddma_int = vddm;
assign vddmo_int = vddm; 
assign gndm_int  = (gndm == 1'b0) ? p_ok : p_not_ok;




assign PSWSMALLMA_int = 1'b0;
assign PSWSMALLMP_int = 1'b0; 
assign PSWLARGEMA_int = 1'b0;
assign PSWLARGEMP_int = 1'b0;

ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim SLEEP_MUX (vddmo_int,1'b0,SLEEP_buf,SLEEP_gated);

and (pswsmallma_int,SLEEP_gated,PSWSMALLMA_int);
and (pswlargema_int,SLEEP_gated,PSWLARGEMA_int);
not (pswsmallma_close, pswsmallma_int);
not (pswlargema_close, pswlargema_int);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim switch_pswsmallma (pswsmallma_close,vddma_int,vddmai_small);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim switch_pswlargema (pswlargema_close,vddma_int,vddmai_large);
ST_SPHD_LOVOLT_2048x32m8_bTMl_WANDprim wand_vddmai (vddmai_int,vddmai_small,vddmai_large);

and (pswsmallmp_int,SLEEP_gated,PSWSMALLMP_int);
and (pswlargemp_int,SLEEP_gated,PSWLARGEMP_int);
not (pswsmallmp_close, pswsmallmp_int);
not (pswlargemp_close, pswlargemp_int);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim switch_pswsmallmp (pswsmallmp_close,vddmp_int,vddmpi_small);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim switch_pswlargemp (pswlargemp_close,vddmp_int,vddmpi_large);
ST_SPHD_LOVOLT_2048x32m8_bTMl_WANDprim wand_vddmpi (vddmpi_int,vddmpi_small,vddmpi_large);


//-----------------------------------------------------------------
//   Calculating the valid states for all power supplies ends
//-----------------------------------------------------------------
reg pswsmallmp_stable=1'b1,pswlargema_stable=1'b1,pswlargemp_stable=1'b1,pswsmallma_stable=1'b1;
reg pswsmallmp_toggle=1'b0,pswlargema_toggle=1'b0,pswlargemp_toggle=1'b0,pswsmallma_toggle=1'b0;

assign supply_ok = (vddmo_int === p_ok && vddmpi_int === p_ok && vddmai_int === p_ok && gndm_int === p_ok)? 1'b1 : 1'b0;

//-----------------------------------------------------------------
//        Actions taken on Power supplies toggling starts
//-----------------------------------------------------------------

always @(SLEEP_gated or r_supply_trigger) begin
   if ($realtime > 0) begin	
	sleep_toggle_time = $realtobits($realtime);
	if (SLEEP_gated !== 1'b1 && vddmo_int === 1'b1)begin	
          if (pswsmallma_stable !== 1'b1 || pswsmallmp_stable !== 1'b1 || pswlargema_stable !== 1'b1 || pswlargemp_stable !== 1'b1 || PSWLARGEMA_int !== 1'b0 || PSWSMALLMA_int !== 1'b0 || PSWLARGEMP_int !== 1'b0 || PSWSMALLMP_int !== 1'b0)begin
            Block_Memory("SLEEP");
          end    
          if (power_pins_config !== `mono_rail)begin
            #`st_delay_seq_taa;  
            Proper_Shutdown_Checker;
              if (Proper_shutdown !== 1'b1 && supply_ok === 1'b0)Block_Memory("SLEEP");
          end
        end  
   end
end    

always @(vddmpi_int or r_supply_trigger) begin
   if ($realtime > 0) begin	
	vddmp_toggle_time = $realtobits($realtime);
        #`st_delay_seq_taa;
        Proper_Shutdown_Checker;
        if (Proper_shutdown !== 1'b1)begin
          if (power_pins_config === `dual_rail || power_pins_config === `mo_ma_tied)begin
            if (SLEEP_gated === 1'b1) begin
		if (vddmpi_int !== 1'b1) begin
		Corrupt_Periphery("vddm");
		Supply_timings_checker ("vddm",vddmpi_int, vddmp_toggle_time, sleep_toggle_time, vddmo_toggle_time, t_sl_mp, t_mo_mp);
                end
	    end
            else Block_Memory("vddm");
          end
          else if (power_pins_config === `mo_mp_tied)begin
	    if (SLEEP_gated === 1'b1 || (vddmo_int === 1'bx && (vddmai_int === 1'b0 || vddmai_int === 1'bz))) begin
		if (vddmpi_int !== 1'b1) begin
		Corrupt_Periphery("vddm");
		Supply_timings_checker ("vddm",vddmpi_int, vddmp_toggle_time, sleep_toggle_time, vddmo_toggle_time, t_sl_mp, t_mo_mp);
                end
	    end
            else Block_Memory("vddm");
          end 
          else begin    //monorail
            if (supply_ok !== 1'b1)begin
              Corrupt_Periphery("vddm");
            end
          end
        end  
   end 
end




always @(vddmai_int or r_supply_trigger) begin
   if ($realtime > 0) begin	
	vddma_toggle_time = $realtobits($realtime);
        #`st_delay_seq_taa;
        Proper_Shutdown_Checker;
	if (Proper_shutdown !== 1'b1)begin
          if (power_pins_config === `dual_rail || power_pins_config === `mo_mp_tied)begin
            if (SLEEP_gated === 1'b1) begin
		if (vddmai_int !== 1'b1) begin
                Corrupt_Array("vddm");
		Supply_timings_checker ("vddm",vddmai_int, vddma_toggle_time, sleep_toggle_time, vddmo_toggle_time, t_sl_ma, t_mo_ma);
                end
            end      
            else Block_Memory("vddm");
          end
          else if (power_pins_config === `mo_ma_tied)begin
	    if (SLEEP_gated === 1'b1 || (vddmo_int === 1'bx && (vddmpi_int === 1'b0 || vddmpi_int === 1'bz))) begin
		if (vddmai_int !== 1'b1) begin
		Corrupt_Array("vddm");
		Supply_timings_checker ("vddm",vddmai_int, vddma_toggle_time, sleep_toggle_time, vddmo_toggle_time, t_sl_ma, t_mo_ma);
                end
	    end
            else Block_Memory("vddm");
          end 
          else begin
            if (supply_ok !== 1'b1)begin
              Corrupt_Array("vddm");
            end
          end  
	end
   end
end




always @(gndm_int or r_supply_trigger) begin
   if ($realtime > 0) begin
        if (gndm_int !== p_ok) Block_Memory("gndm");	
   end     
end



always @ (Proper_shutdown)begin
  if (Proper_shutdown !== 1'b0)begin
    Corrupt_all("vddm");
    
  end   
end  

//------------- eswitch functionality starts ------------------//

always @(PSWSMALLMA_int or PSWLARGEMA_int or PSWSMALLMP_int or PSWLARGEMP_int)begin
  if ($realtime > 0) begin
    if (SLEEP_gated === 1'bx && vddmo_int !== 1'bx)begin
      Block_Memory("SLEEP");
    end
  end
end  

always @(pswsmallma_int)begin
  pswsmallma_toggle = 1'b1;
  pswsmallma_toggle <= 1'b0;
end  

always @(pswsmallma_toggle)begin
  if ($realtime > 0)begin
      if(pswsmallma_int !== 1'b0)pswsmallma_stable = 1'b0;
      if (pswsmallma_int !== 1'b1)fork: block_pswsmallma
        begin
          #(p_pswsmallma_settling_time);
          pswsmallma_stable = 1'b1;
          disable block_pswsmallma;
        end  
        @(pswsmallma_int)begin
          pswsmallma_stable = 1'b0;
          disable block_pswsmallma;
        end
      join
  end
end  

always @(pswlargema_int)begin
  pswlargema_toggle = 1'b1;
  pswlargema_toggle <= 1'b0;
end  

always @ (pswlargema_toggle)begin
  if ($realtime > 0)begin
      if(pswlargema_int !== 1'b0)pswlargema_stable = 1'b0;
      if (pswlargema_int !== 1'b1)begin
        if (pswsmallma_int !== 1'b1 && pswsmallma_stable === 1'b1)fork: block_pswlargema
        begin
          #(p_pswlargema_settling_time);
          pswlargema_stable = 1'b1;
          disable block_pswlargema;
        end  
        @(pswsmallma_int or pswlargema_int or pswsmallma_stable)begin
          pswlargema_stable = 1'b0;
          disable block_pswlargema;
        end  
        join
        else begin
            Block_Memory("PSWLARGEM");
        end      
      end  
  end
end  

always @(pswsmallmp_int)begin
  pswsmallmp_toggle = 1'b1;
  pswsmallmp_toggle <= 1'b0;
end  

always @(pswsmallmp_toggle)begin
  if ($realtime > 0)begin
      if(pswsmallmp_int !== 1'b0)pswsmallmp_stable = 1'b0;
      if (pswsmallmp_int !== 1'b1)fork: block_pswsmallmp
        begin
          #(p_pswsmallmp_settling_time);
          pswsmallmp_stable = 1'b1;
          disable block_pswsmallmp;
        end  
        @(pswsmallmp_int)begin
          pswsmallmp_stable = 1'b0;
          disable block_pswsmallmp;
        end
      join
  end
end  

always @(pswlargemp_int)begin
  pswlargemp_toggle = 1'b1;
  pswlargemp_toggle <= 1'b0;
end  

always @ (pswlargemp_toggle)begin
  if ($realtime > 0)begin
      if(pswlargemp_int !== 1'b0)pswlargemp_stable = 1'b0;
      if (pswlargemp_int !== 1'b1)begin
        if (pswsmallmp_int !== 1'b1 && pswsmallmp_stable === 1'b1)fork: block_pswlargemp
        begin
          #(p_pswlargemp_settling_time);
          pswlargemp_stable = 1'b1;
          disable block_pswlargemp;
        end  
        @(pswsmallmp_int or pswlargemp_int or pswsmallmp_stable)begin
          pswlargemp_stable = 1'b0;
          disable block_pswlargemp;
        end  
        join
        else begin
            Block_Memory("PSWLARGEM");
        end      
      end  
  end
end  

//---------------------- eswitch functionality ends -----------------------//


//-----------------------------------------------------------------
//          Actions taken on Power supplies toggling ends
//-----------------------------------------------------------------

task Proper_Shutdown_Checker;
begin
  if (vddmo_int === 1'b0 && (vddmai_int === 1'b0 || vddmai_int === 1'bz) && (vddmpi_int === 1'b0 || vddmpi_int === 1'bz))begin
    Proper_shutdown = 1'b1;
  end
  else if (vddmo_int === 1'bx && vddma_int === 1'bx && vddmp_int === 1'bx) begin
    Proper_shutdown = 1'bx;
  end
  else begin
    Proper_shutdown = 1'b0;
  end
end
endtask

task Supply_timings_checker;
input [1023 : 0] input_string;
input input1;
input [63 : 0] real_time;
input [63 : 0] shut_time, rampup_time;
input [63 : 0] t_off, t_on;
begin
        if (input1 === 1'b0) begin
		if ((real_time - $bitstoreal(shut_time)) <= $bitstoreal(t_off)) Block_Memory(input_string);
	end
	else if (input1 === 1'b1) begin
		if ((real_time - $bitstoreal(rampup_time)) <= $bitstoreal(t_on)) Block_Memory(input_string);
	end
end
endtask

task Corrupt_Periphery;
input [1023:0] input_string;
begin
        Corrupt_Q;
        Corrupt_all_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid Value/Sequence on %0s. Output Q and Scan flops corrupted", $realtime, input_string);
end
endtask

task Corrupt_Array;
input [1023:0] input_string;
begin
        Corrupt_Mem;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid Value/Sequence on %0s. Memory corrupted", $realtime, input_string);
end
endtask

task Corrupt_all;
input [1023:0] input_string;
begin
        Corrupt_Periphery(input_string);
        Corrupt_Array(input_string);
end
endtask

task Block_Memory;
input [1023:0] input_string;
begin
  `ifdef ST_MEM_NO_BLOCK_MEM
        Corrupt_Q;
        Corrupt_all_scan_flops_scan_outs;
        Corrupt_Mem;
        if ( (debug_level > 0) && ($realtime > message_control_time) ) $display ("%m - %t ST_ERROR : Invalid Value/Sequence on %0s. Memory Contents, Output Q and Scan flops corrupted", $realtime, input_string);
  `else 
      if ($realtime > mem_block_ctrl_time) begin
          force CK_buf = 1'bx;
          force IO.CK_rw = 1'bx;
          force IO.CK_bypass = 1'bx;
          force IO.CK_scff = 1'bx;
          force IO.CK_lock_up_latch = 1'bx;
          mem_blocked = 1'b1;
          if ( (debug_level > 0) && ($realtime > message_control_time) ) $display ("%m - %t ST_ERROR : Invalid Value/Sequence on %0s. Memory Contents, Output Q and Scan flops corrupted. All further operations on the Memory are Blocked", $realtime, input_string);
      end
      else begin
        Corrupt_Q;
        Corrupt_all_scan_flops_scan_outs;
        Corrupt_Mem;
        if ( (debug_level > 0) && ($realtime > message_control_time) ) $display ("%m - %t ST_ERROR : Invalid Value/Sequence on %0s. Memory Contents, Output Q and Scan flops corrupted", $realtime, input_string);
      end
  `endif
end
endtask

task UnBlock_Memory;
begin
  release CK_buf;
  release IO.CK_rw;
  release IO.CK_bypass;
  release IO.CK_scff;
  release IO.CK_lock_up_latch;
  mem_blocked = 1'b0;
  pswsmallma_stable = 1'b1;       
  pswlargema_stable = 1'b1;
  pswsmallmp_stable = 1'b1;
  pswlargemp_stable = 1'b1;

end
endtask

//--------------------------------------------------------------------
//                 POWER PINS FUNCTIONALITY ENDS
//--------------------------------------------------------------------
`endif

assign IO.supply_ok = supply_ok;

//--------------------------------------------------------------------
//              FAULT FILE HANDLING FUNCTIONALITY STARTS 
//--------------------------------------------------------------------
 
integer file_ptr, ret_val;
integer fault_word;
integer fault_bit;
integer fcnt, Fault_in_memory,faultnum,stop_loop,count;
integer t;  
integer FailureLocn [max_faults -1 :0];
integer Failurebit [max_faults -1 :0];
reg [100 : 0] stuck_at;
reg [100 : 0] fault_array;
reg [200 : 0] tempStr;
reg [7:0] fault_char;
reg [7:0] fault_char1; // 8 Bit File Pointer
reg [Addr -1 : 0] std_fault_word;
reg [Addr -1 : mux_bits] fault_row_add [max_faults -1 :0];
reg [max_faults -1 :0] fault_repair_flag;
reg [max_faults -1 :0] dont_insert_fault;
reg [max_faults -1 :0] repair_flag;
reg [100 : 0] array_stuck_at[max_faults -1 : 0] ;
reg [100 : 0] mem_red_array_stuck_at[max_faults -1 : 0] ; 
reg msgcnt;

reg [bits - 1: 0] stuck_at_0fault [max_faults -1 : 0];
reg [bits - 1: 0] stuck_at_1fault [max_faults -1 : 0];
reg [bits -1 : 0] stuck0;
reg [bits -1 : 0] stuck1;
reg [2047:0] reg_Fault_file_name;
reg reg_ConfigFault;
reg reg_MEM_INITIALIZE;
reg reg_BinaryInit;
reg [2047:0] reg_InitFileName;
time reg_File_load_time;

integer flag_error;





task task_insert_faults_in_memory;
reg [bits -1 : 0] slm_temp_data;
integer i;
begin
   if (reg_ConfigFault)
   begin   
     for(i = 0;i< fcnt;i = i+ 1) begin
        if(mem_red_array_stuck_at[i] === "mem_array") begin
          if (array_stuck_at[i] === "sa0") begin
           `ifdef ST_MEM_SLM
            //Read first
            $slm_ReadMemory(slm_handle, FailureLocn[i], slm_temp_data);
            //operation
            slm_temp_data = slm_temp_data & stuck_at_0fault[i];
            //write back
            $slm_WriteMemory(slm_handle, FailureLocn[i], slm_temp_data);
          `else
            Mem[FailureLocn[i]] = Mem[FailureLocn[i]] & stuck_at_0fault[i];
          `endif
         end //if(array_stuck_at)
                                        
         if(array_stuck_at[i] === "sa1") begin
         `ifdef ST_MEM_SLM
            //Read first
            $slm_ReadMemory(slm_handle, FailureLocn[i], slm_temp_data);
            //operation
            slm_temp_data = slm_temp_data | stuck_at_1fault[i];
            //write back
            $slm_WriteMemory(slm_handle, FailureLocn[i], slm_temp_data);
         `else
            Mem[FailureLocn[i]] = Mem[FailureLocn[i]] | stuck_at_1fault[i]; 
         `endif
         end //if(array_stuck_at)
       end //if mem_red_array_stuck_at
    
    
     end    // end of for
   end  
end
endtask



task task_read_fault_file;
integer i;
begin

/*  -----------Implemetation for config fault starts------*/
   msgcnt = X;
   t = 0;
   fault_repair_flag = {max_faults{1'b1}};
   repair_flag = {max_faults{1'b1}};
   if(reg_ConfigFault) 
   begin
      file_ptr = $fopen(reg_Fault_file_name , "r");
      if(file_ptr == 0)
      begin     
          if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Fault File cannot be opened ",$realtime);
      end        
      else                
      begin : read_fault_file
        t = 0;
        for (i = 0; i< max_faults; i= i + 1)
        begin
         
           stuck0 = {bits{1'b1}};
           stuck1 = {bits{1'b0}};
           fault_char1 = $fgetc (file_ptr);
           if (fault_char1 == 8'b11111111)
              disable read_fault_file;
           ret_val = $ungetc (fault_char1, file_ptr);
           ret_val = $fgets(tempStr, file_ptr);
           ret_val = $sscanf(tempStr, "%s %d %d %s",fault_array,fault_word, fault_bit, stuck_at) ;
           flag_error = 0; 
           if(ret_val !== 0)
           begin         
              if(ret_val == 3 || ret_val == 4)
              begin
                if(ret_val == 3)
                   stuck_at = "sa0";

                if(stuck_at !== "sa0" && stuck_at !== "sa1" && stuck_at !== "none")
                begin
                   if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Wrong value for stuck at in fault file ",$realtime);
                   flag_error = 1;
                end    
                      
                if(fault_word >= words)
                begin
                   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Address out of range in fault file ",$realtime);
                   flag_error = 1;
                end    

                if(fault_bit >= bits)
                begin  
                  if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Faulty bit out of range in fault file ",$realtime);
                  flag_error = 1;
                end    

                
                        
                if(fault_array !== "mem_array")
                begin
                  if( (debug_level > 1) && ($realtime > message_control_time)) $display("%m - %t ST_WARNING: Fault array is not mem_array ",$realtime);
                  flag_error = 1;
                end

                if(fault_array === "red_array")
                begin
                  if( (debug_level > 1) && ($realtime > message_control_time)) $display("%m - %t ST_WARNING: Fault array can't be on redundancy array in non redundancy cut.",$realtime);
                  flag_error = 1;
                end

                
                

                if(flag_error == 0)
                //Correct Inputs
                begin
                   if(stuck_at === "none")
                   begin
                       if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: No fault injected, empty fault file ",$realtime);
                   end
                   else
                   //Adding the faults
                   begin
                      FailureLocn[t] = fault_word;
                      Failurebit[t]  = fault_bit ;
                      std_fault_word = fault_word;
                      fault_row_add[t] = std_fault_word[Addr-1:mux_bits];
                      mem_red_array_stuck_at[t] = fault_array;
                      fault_repair_flag[t] = 1'b0;
                      if (stuck_at === "sa0" )
                      begin
                         stuck0[fault_bit] = 1'b0;         
                         stuck_at_0fault[t] = stuck0;
                      end     
                      if (stuck_at === "sa1" )
                      begin
                         stuck1[fault_bit] = 1'b1;
                         stuck_at_1fault[t] = stuck1; 
                      end

                      array_stuck_at[t] = stuck_at;
                      t = t + 1;
                   end //if(stuck_at === "none")  
                end //if(flag_error == 0)
              end //if(ret_val == 2 || ret_val == 3 
              else
              //wrong number of arguments
              begin
                if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: WRONG VALUES ENTERED FOR FAULTY WORD OR FAULTY BIT OR STUCK_AT IN Fault_file_name ",$realtime);
                flag_error = 1;
              end
           end //if(ret_val !== 0)
           else
           begin 
               if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: No fault injected, empty fault file ",$realtime);
           end    
        end //for (i = 0; i< m
      end //begin: read_fault_file  
      $fclose (file_ptr);

      fcnt = t;
      
      //fault injection at time 0.
      task_insert_faults_in_memory;
  end // config_fault 
end
endtask

//--------------------------------------------------------------------
//             FAULT FILE HANDLING FUNCTIONALITY ENDS
//--------------------------------------------------------------------

//--------------------------------------------------------------------
//                     DISPLAY MESSAGES STARTS
//--------------------------------------------------------------------

wire BYP_EN_scff_din;
reg lastCK_rw;
reg MEM_EN_reg, bypass_en_reg;
reg delay;

initial
begin
   
  `ifdef ST_MEM_SLM
     `ifdef functional 
          operating_mode = "SLM + FUNCTIONAL";
     `else 
          operating_mode = "SLM + TIMING";
     `endif     
  `elsif functional
     operating_mode = "FUNCTIONAL";
  `else
     operating_mode = "TIMING";
  `endif

   debug_level= p_debug_level;
  
  if (debug_level === 2'b00) begin
          message_status = "All Info/Warning/Error Messages are Switched OFF";
  end        
  else if (debug_level === 2'b11) begin
          message_status = "All Info/Warning/Error Messages are Switched ON";
  end        
  else if (debug_level === 2'b01) begin
          message_status = "Error messages are switched ON. Warning/Info Messages are Switched OFF";
  end        
  else begin
          message_status = "Error/Warning messages are switched ON. Info Messages are Switched OFF";
  end        
  
  $timeformat (-9, 6, " ns --", 10);  
  reg_Fault_file_name = Fault_file_name; 
  reg_MEM_INITIALIZE  = MEM_INITIALIZE;
  reg_ConfigFault     = ConfigFault;
  reg_BinaryInit      = BinaryInit;
  reg_InitFileName    = InitFileName;
  reg_File_load_time  = File_load_time;
  
  file_loaded = 1'b0;
  if (reg_MEM_INITIALIZE === 1'b1) begin
          file_loaded = 1'b1;
  end
  delay = 1'b0;
  `ifndef ST_MEM_POWER_SEQUENCING_OFF
    Proper_shutdown = 1'b0;
  `endif  
  
  gndm = 1'b0;
  
  
  
  vddm = 1'b1;
  
  
  
  r_supply_trigger <= 1'b1;
  
  initn_pulse_done = 1; 
  
  if (INITN_buf === 1'b0 && supply_ok === 1) begin 
        initn_pulse_done = 1;  
  end
  task_read_fault_file;
  
  // IMP : Please Dont add any other statements beyond this in initial block
  #0; // This #0 is important to avoid race at start of simulation
  lastCK = CK;
  last_CK_rw = CK_rw;
  lastCK_rw = CK_rw;
  
  #(message_control_time + `st_delay_seq_taa)
  if (debug_level > 2) begin
    $display ("%m - %t ST_INFO : ***************************************", $realtime);
    $display ("%m - %t ST_INFO : The Model is Operating in %s MODE", $realtime, operating_mode);
    if (operating_mode == "TIMING") $display ("%m - %t ST_INFO : Please ensure SDF is properly annotated otherwise dummy values will be used", $realtime);
    $display ("%m - %t ST_INFO : %s", $realtime, message_status);
    
    if(ConfigFault) $display ("%m - %t ST_INFO : Configurable Fault Functionality is ON", $realtime);   
    else  $display ("%m - %t ST_INFO : Configurable Fault Functionality is OFF", $realtime);   
    
    $display ("%m - %t ST_INFO : Fault File used by the model Fault_File_Name=%s", $realtime, Fault_file_name);
    $display ("%m - %t ST_INFO : Values of Config_fault used in model=%d", $realtime, ConfigFault);
    $display ("%m - %t ST_INFO : Values of Mem_INITALIZE used in model=%d", $realtime, MEM_INITIALIZE);
    $display ("%m - %t ST_INFO : Values of BinaryInit used in model=%d", $realtime, BinaryInit);
    $display ("%m - %t ST_INFO : Values of InitFileName used in model=%s", $realtime, InitFileName);
    $display ("%m - %t ST_INFO : Values of File_load_time used in model=%t", $realtime, File_load_time);  
    
    $display ("%m - %t ST_INFO : ***************************************", $realtime);
  end
  // BEWARE : There is a seq delay. DO NOT add any statements after this.
end


always @(IO.bypass_en) 
begin
   if (IO.bypass_en === 1'bx) begin
           if (SLEEP_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SLEEP pin. Output Q corrupted", $realtime);
           end
           if (STDBY_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on STDBY pin. Output Q corrupted", $realtime);
           end   
           if (INITN_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on INITN pin. Output Q corrupted", $realtime);
           end   
           if (ATP_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on ATP pin. Output Q corrupted", $realtime);
           end   
           if (TBYPASS_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TBYPASS pin. Output Q corrupted", $realtime);
           end   

   end               
end


always @(CK_rw) 
begin

   if (lastCK_rw === 1'b0 && CK_rw === 1'b1) begin
 
           if (WEN_bmux === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on WEN/TWEN pin. Memory and Output Q corrupted", $realtime);
           end  
           
           #0; // This is to ensure ValidAddress calculation in "rw" block
           if (ValidAddress === 1'bx) begin 
                   if (WEN_bmux === 1'b0) begin
                           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on A/TA pin. Memory corrupted", $realtime);
                   end
                   else begin
                           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on A/TA pin. Memory and Output Q corrupted", $realtime);
                   end
           end
           else if (ValidAddress === 1'b0) begin
                   if (WEN_bmux !== 1'b1) begin
                           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Address Out of Range. No Memory Operation", $realtime);
                   end
                   else begin
                           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Address Out of Range. Output Q corrupted", $realtime);
                   end
           end        
   end
   
   else if (CK_rw === 1'bx) begin
         
           if (SLEEP_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SLEEP pin. Memory and Output Q corrupted", $realtime);
           end
           if (STDBY_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on STDBY pin. Memory and Output Q corrupted", $realtime);
           end
           if (INITN_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on INITN pin. Memory and Output Q corrupted", $realtime);
           end  
           if (ATP_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on ATP pin. Memory and Output Q corrupted", $realtime);
           end  
           if (SE_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SE pin. Memory and Output Q corrupted", $realtime);
           end  
           if (TBYPASS_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TBYPASS pin. Memory and Output Q corrupted", $realtime);
           end
           if (IG_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on IG pin. Memory and Output Q corrupted", $realtime);
           end  
           if (CSN_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on CSN pin. Memory and Output Q corrupted", $realtime);
           end
           if (TBIST_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TBIST pin. Memory and Output Q corrupted", $realtime);
           end  
           if (TBIST_buf === 1'b1 && TCSN_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TCSN pin. Memory and Output Q corrupted", $realtime);
           end  
           if (LS_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on LS pin. Memory and Output Q corrupted", $realtime);
           end
           if (HS_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on HS pin. Memory and Output Q corrupted", $realtime);
           end
   
   end

   lastCK_rw = CK_rw;

end

always @(CK_scff) begin
   if (CK_scff === 1'bx) begin
       if (CK === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on CK pin. All Scan Flops are corrupted", $realtime);
       end         
       if (SLEEP_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SLEEP pin. All Scan Flops are corrupted", $realtime);
       end         
       if (STDBY_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on STDBY pin. All Scan Flops are corrupted", $realtime);
       end         
       if (INITN_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on INITN pin. All Scan Flops are corrupted", $realtime);
       end         
       if (ATP_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on ATP pin. All Scan Flops are corrupted", $realtime);
       end         
       if (SE_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SE pin. All Scan Flops are corrupted", $realtime);
       end         
       if (TBYPASS_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TBYPASS pin. All Scan Flops are corrupted", $realtime);
       end
       else if (IO.shift_en_inst === 1'b0 && TBYPASS_buf === 1'b1 && BYP_EN_scff_din === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on LP-FLOP pin. All Scan Flops are corrupted", $realtime);
       end         
   end
end

always @(CK_lock_up_latch) begin
   if (CK_lock_up_latch === 1'bx) begin
       if (CK === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on CK pin. All Scan Outs are corrupted", $realtime);
       end         
       if (SLEEP_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SLEEP pin. All Scan Outs are corrupted", $realtime);
       end         
       if (STDBY_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on STDBY pin. All Scan Outs are corrupted", $realtime);
       end         
       if (INITN_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on INITN pin. All Scan Outs are corrupted", $realtime);
       end         
       if (SE_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SE pin. All Scan Outs are corrupted", $realtime);
       end         
   end
end

//----------------------------------------------------------------------
//                        DISPLAY MESSAGES ENDS
//----------------------------------------------------------------------

//--------------------------------------------------------------------------------
//               Features not supported in TMAX model - starts
//         
//         1) INITN pulse checking
//         2) GAC toggling during clock high period in scan shift mode
//         3) LS, HS functionality
//         4) RM, WM functionality
//         5) RTA, RTAE, RTABANK functionality
//         
//--------------------------------------------------------------------------------

assign LSint = LS_buf;
assign HSint = HS_buf;

assign DE_temp = (LSint === 1'bx || (HSint === 1'bx) || RM_buf !== 0 || WM_buf !== 0) ? 1'bx : 1'b0;
assign IO.DE_temp = DE_temp;

always @(INITN_buf)
begin
   if (INITN_buf === 1'b0 && supply_ok === 1'b1) begin
       `ifdef ST_MEM_INITN_OUTPUT_RESET
          Q_final <= 32'b0;
       `endif   
       initn_pulse_done = 1'b1;
       invalid_next_cycle_dft = 1'b0;
       invalid_next_cycle_func = 1'b0;
       release IO.cgc_CK_rw.CK_gated;
       release IO.cgc_CK_lkp_latch.CK_gated;
       release IO.cgc_CK_scff.CK_gated;
   end        
end

always @(supply_ok)
begin
 if (INITN_buf === 1'b0 && supply_ok === 1'b1) begin
     initn_pulse_done = 1'b1;
     invalid_next_cycle_dft = 1'b0;
     invalid_next_cycle_func = 1'b0;
     release IO.cgc_CK_rw.CK_gated;
     release IO.cgc_CK_lkp_latch.CK_gated;
     release IO.cgc_CK_scff.CK_gated;
 end   
end

assign IO.initn_pulse_done = initn_pulse_done;

always @(IO.GAC) begin
  
  if (IO.CK_lock_up_latch === 1'b1 && GAC_reg === 1'b1 && IO.GAC !== 1'b1) begin
	IO.cgc_CK_scff.CK_gated <= 1'bx;
	IO.cgc_CK_lkp_latch.CK_gated <= 1'bx;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : SLEEP / STDBY / INITN pin toggled during clock high time in scan shift mode. All Scan flops and Scan Outs Corrupted", $realtime);

  end

end



//--------------------------------------------------------------------------------
//               Features not supported in TMAX model - ends
//--------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------
//        Verilog Simulation Model : "rw" read/write functionality block starts 
//-----------------------------------------------------------------------------------

wire [bits-1 : 0] M_inv;
assign M_inv = ~M_bmux;

wire red_en = 0;
wire [repair_address_width-1 : 0] repair_add = 8'b0;
wire [repair_address_width-1 : 0] next_repair_add = 8'b0;
reg [mux_bits-1:0]Col_Add;
integer Col_Add_integer,Bank_sel_integer,RedMem_address;

always @(CK_rw)
begin
  if (last_CK_rw===1'b0 && CK_rw===1'b1) begin
     
    task_initialize_memory;
     
    if (^A_bmux === 1'bx) ValidAddress = 1'bx;
    else if (A_bmux < words) ValidAddress = 1'b1;
    else ValidAddress = 1'b0;

    repair_access = 0;
    
      
    if (ValidAddress === 1'bx) begin // Address 'X'
    	 WriteMemX;
       if (WEN_bmux !== 1'b0) Qtemp = WordX;
    end
    else begin // Address is valid	
            // Read Operation...
            if (WEN_bmux===1'b1)
            begin
              ReadCycle;
            end
            
            // Write Operation...
            else if (WEN_bmux===1'b0)
            begin
              `ifndef ST_MEM_SLM
                       Mem_prev = Mem[A_bmux];
              `endif
              WriteCycle;
            end

            else begin // WEN_bmux === 1'bx
              Qtemp = WordX;
              if (ValidAddress === 1'b1) begin
                Corrupt_Current_Location;
              end
            end
    end	 
  end // if (last_CK_rw===1'b0 && CK_rw=1'b1
  else if (CK_rw===1'bx) begin
    WriteMemX;
    Qtemp = WordX;
  end
  last_CK_rw = CK_rw;
  Qtemp <= WordZ;
end

task task_initialize_memory;
begin
     if (reg_MEM_INITIALIZE === 1'b1 && $realtime >= reg_File_load_time && file_loaded ) begin   
        `ifdef ST_MEM_SLM
          if (reg_BinaryInit)
             $slm_LoadMemory(slm_handle, reg_InitFileName, "VERILOG_BIN");
          else
             $slm_LoadMemory(slm_handle, reg_InitFileName, "VERILOG_HEX");
        `else
          if (reg_BinaryInit)
             $readmemb(reg_InitFileName, Mem, 0, words-1);
          else
             $readmemh(reg_InitFileName, Mem, 0, words-1);
        `endif
         file_loaded = 1'b0;
     end
end
endtask

task WriteCycle;                  
reg [bits-1:0] Mem_temp;
integer i;
begin
     `ifdef ST_MEM_SLM
          if (repair_access === 0) $slm_WriteMemory(slm_handle, A_bmux, D_bmux, M_inv);
     `else
          
          Mem_temp = {bits{1'bx}};
   
          // Reading the previous contents of memory
           
          if(repair_access === 0) Mem_temp = Mem[A_bmux];
          else if(repair_access === 1) Mem_temp = RedMem[RedMem_address];
          
          // Masking functionality
          for (i=0; i < bits; i=i+1) begin
            if (M_bmux[i] === 1'b0) Mem_temp[i]=D_bmux[i];
            else if (M_bmux[i] === 1'bx) begin
              if (Mem_temp[i] !== D_bmux[i]) Mem_temp[i]=1'bx;
              else Mem_temp[i] = D_bmux[i];
            end
          end // for (...
          
          //Finally writing into the memory address
          if(repair_access === 0 ) begin
             if (ValidAddress === 1'b1) begin
                Mem[A_bmux] = Mem_temp;
             end
          end        
          else if (repair_access === 1 )  RedMem[RedMem_address] = Mem_temp;
     `endif
     task_insert_faults_in_memory;     
end
endtask

task ReadCycle;
begin
     `ifdef ST_MEM_SLM
          if (repair_access === 0)  $slm_ReadMemory(slm_handle, A_bmux, Qtemp);
     `else
          if (repair_access === 0) begin
              if (ValidAddress === 1'b1) begin
                Qtemp = Mem[A_bmux];
              end
              else Qtemp = WordX;
          end    
          else if (repair_access === 1)  Qtemp = RedMem[RedMem_address];
     `endif
   
end
endtask

task WriteMemX;
integer i;
begin

`ifdef ST_MEM_SLM
  $slm_ResetMemory(slm_handle, WordX);
`else
  for (i = 0; i < words; i = i + 1) begin
     Mem[i] = WordX;
  end
  
  for (i = 0; i < RedWords; i = i + 1) begin
     RedMem[i] = WordX;
  end   

`endif
task_insert_faults_in_memory;     
end
endtask

task Corrupt_Current_Location;
begin
  `ifdef ST_MEM_SLM
     if (repair_access === 1'b0) $slm_WriteMemory(slm_handle, A_bmux, WordX);
  `else 
     if (repair_access === 1'b0) begin
       Mem[A_bmux] = WordX;
     end  
     else if (repair_access === 1'b1) begin
       RedMem[RedMem_address] = WordX;
     end    
  `endif
  task_insert_faults_in_memory;     
end
endtask

assign Q_CORE = Qtemp;

//-----------------------------------------------------------------------------------
//        Verilog Simulation Model : "rw" read/write functionality block ends 
//-----------------------------------------------------------------------------------


endmodule

`undef st_delay_seq_taa
`undef st_delay_seq_th
`undef st_msg_cntrl_time
`undef mono_rail
`undef mo_ma_tied
`undef mo_mp_tied
`undef dual_rail
`undef pswsmallma_settling_time
`undef pswlargema_settling_time
`undef pswsmallmp_settling_time
`undef pswlargemp_settling_time




//-------------------------------------------------------
//       module definition for INTERFACE
//-------------------------------------------------------


module ST_SPHD_LOVOLT_2048x32m8_bTMl_INTERFACE (
// functional inputs
A,D,M,CSN,WEN,CK,SE,TBYPASS,IG,SLEEP,ATP,STDBY,INITN,

// BIST inputs
TBIST,TCSN,TA,TED,TOD,TEM,TOM,TWEN,



// bist mux outputs
A_bmux,D_bmux,M_bmux,WEN_bmux,CSN_scff_din,

// Test Enable signals for Scan flops
shift_en_inst,

// Clocks for Scan flops and "rw" block
CK_scff, CK_lock_up_latch, CK_rw,

// Data and Control Scan flops outputs
D_scff_out,BYP_ENint,

// Q Output from rw and omux blocks
Q_CORE, Q, MEM_EN_inst

);

    localparam max_address_bits = 12;
    localparam Addr = 11;
    localparam bits =32;
    localparam words = 2048;
    localparam repair_address_width = 8;
    
    
    localparam mask_bits = 32; 
    

    output [bits-1 : 0] D_bmux;
    output [bits-1 : 0] Q;
    output [bits-1 : 0] M_bmux;
    output [Addr-1 : 0] A_bmux;
    output WEN_bmux, CSN_scff_din;
// CK_scff is the clock for Scan flops and "mp" block
    output CK_scff, CK_lock_up_latch;
// CK_rw is the clock for Read/Write (rw) block    
    output CK_rw, MEM_EN_inst; 

// Scan enable signal for the scan chain ----
    output shift_en_inst;



// --- functional inputs ----
    input SLEEP,ATP,STDBY,INITN;
    input IG,CK,SE;
    input TBYPASS;
    input [bits-1 : 0] D;
    
    input [mask_bits-1 :0] M; 
    
    input [Addr-1 : 0] A;
    
    input [Addr-1 : 0] TA;
    input TBIST,TWEN,TCSN,TED,TOD,TEM,TOM;
    input WEN,CSN;
//---- Output Q of the "mp" block -----
    input [bits-1 : 0] Q_CORE;

//---- 'Q' output of the scan flops -----
    

        input [bits-1 : 0] D_scff_out;
        input BYP_ENint;
    
    
    wire bypass_en_temp, SE_lat;
    reg pos_TBY=0;
    reg neg_SE_tby_high = 0;

    
    wire initn_pulse_done, DE_temp, supply_ok;
    




//Bist Mux Implementation

and (ATP_TBIST, ATP, TBIST);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim CSN_bistmux (ATP_TBIST, CSN, TCSN, CSN_bmux_temp);
buf (CSN_scff_din, CSN_bmux_temp);

ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim WEN_bistmux (ATP_TBIST, WEN, TWEN, WEN_bmux_temp);


assign CSN_bmux = ((ATP === 1'bx) || (ATP===1'b1 && SE === 1'bx)) ? 1'bx : CSN_bmux_temp;
assign WEN_bmux = ((ATP === 1'bx) || (ATP===1'b1 && SE === 1'bx)) ? 1'bx : WEN_bmux_temp;
assign TBYPASSint = (ATP === 1'bx && TBYPASS !== 1'b0) ? 1'bx : TBYPASS;
assign SEint = (ATP === 1'bx) ? 1'bx : SE;


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim addr_bistmux_0 (ATP_TBIST, A[0], TA[0], A_bmux[0]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim addr_bistmux_1 (ATP_TBIST, A[1], TA[1], A_bmux[1]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim addr_bistmux_2 (ATP_TBIST, A[2], TA[2], A_bmux[2]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim addr_bistmux_3 (ATP_TBIST, A[3], TA[3], A_bmux[3]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim addr_bistmux_4 (ATP_TBIST, A[4], TA[4], A_bmux[4]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim addr_bistmux_5 (ATP_TBIST, A[5], TA[5], A_bmux[5]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim addr_bistmux_6 (ATP_TBIST, A[6], TA[6], A_bmux[6]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim addr_bistmux_7 (ATP_TBIST, A[7], TA[7], A_bmux[7]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim addr_bistmux_8 (ATP_TBIST, A[8], TA[8], A_bmux[8]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim addr_bistmux_9 (ATP_TBIST, A[9], TA[9], A_bmux[9]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim addr_bistmux_10 (ATP_TBIST, A[10], TA[10], A_bmux[10]);

ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_0 (ATP_TBIST,D[0], TED, D_bmux[0]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_1 (ATP_TBIST,D[1], TOD, D_bmux[1]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_2 (ATP_TBIST,D[2], TED, D_bmux[2]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_3 (ATP_TBIST,D[3], TOD, D_bmux[3]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_4 (ATP_TBIST,D[4], TED, D_bmux[4]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_5 (ATP_TBIST,D[5], TOD, D_bmux[5]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_6 (ATP_TBIST,D[6], TED, D_bmux[6]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_7 (ATP_TBIST,D[7], TOD, D_bmux[7]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_8 (ATP_TBIST,D[8], TED, D_bmux[8]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_9 (ATP_TBIST,D[9], TOD, D_bmux[9]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_10 (ATP_TBIST,D[10], TED, D_bmux[10]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_11 (ATP_TBIST,D[11], TOD, D_bmux[11]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_12 (ATP_TBIST,D[12], TED, D_bmux[12]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_13 (ATP_TBIST,D[13], TOD, D_bmux[13]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_14 (ATP_TBIST,D[14], TED, D_bmux[14]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_15 (ATP_TBIST,D[15], TOD, D_bmux[15]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_16 (ATP_TBIST,D[16], TED, D_bmux[16]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_17 (ATP_TBIST,D[17], TOD, D_bmux[17]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_18 (ATP_TBIST,D[18], TED, D_bmux[18]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_19 (ATP_TBIST,D[19], TOD, D_bmux[19]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_20 (ATP_TBIST,D[20], TED, D_bmux[20]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_21 (ATP_TBIST,D[21], TOD, D_bmux[21]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_22 (ATP_TBIST,D[22], TED, D_bmux[22]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_23 (ATP_TBIST,D[23], TOD, D_bmux[23]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_24 (ATP_TBIST,D[24], TED, D_bmux[24]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_25 (ATP_TBIST,D[25], TOD, D_bmux[25]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_26 (ATP_TBIST,D[26], TED, D_bmux[26]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_27 (ATP_TBIST,D[27], TOD, D_bmux[27]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_28 (ATP_TBIST,D[28], TED, D_bmux[28]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_29 (ATP_TBIST,D[29], TOD, D_bmux[29]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_30 (ATP_TBIST,D[30], TED, D_bmux[30]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim data_bistmux_31 (ATP_TBIST,D[31], TOD, D_bmux[31]);


  //Mask Bist Mux




ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_0 (ATP_TBIST , M[0], TEM, M_bmux[0]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_1 (ATP_TBIST , M[1], TOM, M_bmux[1]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_2 (ATP_TBIST , M[2], TEM, M_bmux[2]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_3 (ATP_TBIST , M[3], TOM, M_bmux[3]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_4 (ATP_TBIST , M[4], TEM, M_bmux[4]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_5 (ATP_TBIST , M[5], TOM, M_bmux[5]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_6 (ATP_TBIST , M[6], TEM, M_bmux[6]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_7 (ATP_TBIST , M[7], TOM, M_bmux[7]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_8 (ATP_TBIST , M[8], TEM, M_bmux[8]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_9 (ATP_TBIST , M[9], TOM, M_bmux[9]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_10 (ATP_TBIST , M[10], TEM, M_bmux[10]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_11 (ATP_TBIST , M[11], TOM, M_bmux[11]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_12 (ATP_TBIST , M[12], TEM, M_bmux[12]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_13 (ATP_TBIST , M[13], TOM, M_bmux[13]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_14 (ATP_TBIST , M[14], TEM, M_bmux[14]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_15 (ATP_TBIST , M[15], TOM, M_bmux[15]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_16 (ATP_TBIST , M[16], TEM, M_bmux[16]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_17 (ATP_TBIST , M[17], TOM, M_bmux[17]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_18 (ATP_TBIST , M[18], TEM, M_bmux[18]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_19 (ATP_TBIST , M[19], TOM, M_bmux[19]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_20 (ATP_TBIST , M[20], TEM, M_bmux[20]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_21 (ATP_TBIST , M[21], TOM, M_bmux[21]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_22 (ATP_TBIST , M[22], TEM, M_bmux[22]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_23 (ATP_TBIST , M[23], TOM, M_bmux[23]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_24 (ATP_TBIST , M[24], TEM, M_bmux[24]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_25 (ATP_TBIST , M[25], TOM, M_bmux[25]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_26 (ATP_TBIST , M[26], TEM, M_bmux[26]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_27 (ATP_TBIST , M[27], TOM, M_bmux[27]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_28 (ATP_TBIST , M[28], TEM, M_bmux[28]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_29 (ATP_TBIST , M[29], TOM, M_bmux[29]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_30 (ATP_TBIST , M[30], TEM, M_bmux[30]);
 


ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim M_after_bmux_31 (ATP_TBIST , M[31], TOM, M_bmux[31]);
  


// ----------------------------------------
// ------- Clock generation start ---------
// ----------------------------------------

and (GAC, INITN, initn_pulse_done, !STDBY, !SLEEP, supply_ok);

// Shift Enable calculation
and (shift_en_inst,SEint, ATP, GAC);

// Capture Enable calculation
and (capt_byp_en_inst, TBYPASSint, !BYP_ENint, !SEint, ATP, GAC);
and (capt_func_en_inst, !TBYPASSint, !SEint, ATP, GAC);

or (shift_or_capt_inst, shift_en_inst, capt_func_en_inst, capt_byp_en_inst);

// Clock Gating Logic
ST_SPHD_LOVOLT_2048x32m8_bTMl_CGCprim cgc_CK_scff (.EN(shift_or_capt_inst), .CK(CK), .CK_gated(CK_scff));

// Clock for lock-up-latch at the end of scan chains... (scan shift mode)
ST_SPHD_LOVOLT_2048x32m8_bTMl_CGCprim cgc_CK_lkp_latch (.EN(shift_en_inst), .CK(CK), .CK_gated(CK_lock_up_latch));

// ----- Memory enable signal

and (MEM_EN_inst_atp1, GAC, ATP, !SEint, !TBYPASSint, !IG, !CSN_bmux, !DE_temp);
and (MEM_EN_inst_atp0, GAC, !ATP, !IG, !CSN, !DE_temp);
or (MEM_EN_inst, MEM_EN_inst_atp1, MEM_EN_inst_atp0);

// ----- Clock generation for "rw" block
ST_SPHD_LOVOLT_2048x32m8_bTMl_CGCprim cgc_CK_rw (.EN(MEM_EN_inst), .CK(CK), .CK_gated(CK_rw));



// -----------------------------------
// ----- Clock generation ends -------
// -----------------------------------

// Inputs to OMUX : Output Q Enable Signal Calculations

// ----- Mem Enable signal -----
ST_SPHD_LOVOLT_2048x32m8_bTMl_DFFprim_blocking dff_mem_en (1'b0, bypass_en, CK_rw, MEM_EN_inst, MEMEN_reg_temp);
and (MEMEN_reg, MEMEN_reg_temp, !bypass_en); // To Avoid 'Z' violations


// ---- bypass enable signal -----
ST_SPHD_LOVOLT_2048x32m8_bTMl_DLATprim dlat_se (1'b0, 1'b0, !CK, SEint, SE_lat);


and (capt_byp_en_inst, GAC, ATP, !SEint, TBYPASSint, !BYP_ENint);
ST_SPHD_LOVOLT_2048x32m8_bTMl_CGCprim cgc_CK_bypass (.EN(capt_byp_en_inst), .CK(CK), .CK_gated(CK_bypass));

and (TBYP_rise, TBYPASSint, ATP, GAC);

always @(CK_bypass) begin
  if (CK_bypass === 1'b1) begin
    pos_TBY = 1'b0;
    neg_SE_tby_high = 1'b0;
  end
end

always @(TBYP_rise) begin
    if (TBYP_rise !== 1'b0 && (SEint !== 1'b1 || SE_lat === 1'bx)) begin
          pos_TBY = 1'bx;
    end
    else begin
          pos_TBY = 1'b0;
    end
    neg_SE_tby_high = 1'b0;
end

reg last_SElat;
initial begin
    // This #0 is important to avoid race at start of simulation
   #0 last_SElat = SE_lat;
end

always @(SE_lat) begin
  if (last_SElat === 1'b1 && SE_lat === 1'b0 && TBYP_rise === 1'b1) neg_SE_tby_high = 1'b1;
  else if (last_SElat === 1'b1 && SE_lat === 1'b0 && TBYP_rise === 1'bx) neg_SE_tby_high = 1'bx;
  else if (SE_lat === 1'bx && TBYP_rise !== 1'b0) neg_SE_tby_high = 1'bx;
  else begin
	neg_SE_tby_high = 1'b0;
	pos_TBY = 1'b0;
  end
  last_SElat = SE_lat;
end
or (bypass_en_temp, neg_SE_tby_high, pos_TBY);
or (bypass_en, CK_bypass, bypass_en_temp);



/*-------------------------------------------------------------------
        Output MUX : Paths on Output 'Q'
           1) Memory Read path : From "rw" block - Q_CORE
           2) BYPASS path      : From data scff  - D_scff_out
--------------------------------------------------------------------*/
ST_SPHD_LOVOLT_2048x32m8_bTMl_outputmux omux (.Q(Q), .D_scff_out(D_scff_out), .bypass_en(bypass_en), .Q_CORE(Q_CORE), .MEMEN_reg(MEMEN_reg));



endmodule

/*-------------------------------------------------------
        module definition for Output MUX block
--------------------------------------------------------*/

module ST_SPHD_LOVOLT_2048x32m8_bTMl_outputmux ( Q, D_scff_out, bypass_en, Q_CORE, MEMEN_reg);

localparam bits = 32;

input   MEMEN_reg;
input [bits-1:0] Q_CORE;

        input bypass_en;
        input [bits-1 : 0] D_scff_out;


output [bits-1:0] Q;
trireg (medium) [bits-1:0] Q;

ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_0 (MEMEN_reg, Q_CORE[0], Q[0]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_1 (MEMEN_reg, Q_CORE[1], Q[1]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_2 (MEMEN_reg, Q_CORE[2], Q[2]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_3 (MEMEN_reg, Q_CORE[3], Q[3]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_4 (MEMEN_reg, Q_CORE[4], Q[4]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_5 (MEMEN_reg, Q_CORE[5], Q[5]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_6 (MEMEN_reg, Q_CORE[6], Q[6]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_7 (MEMEN_reg, Q_CORE[7], Q[7]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_8 (MEMEN_reg, Q_CORE[8], Q[8]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_9 (MEMEN_reg, Q_CORE[9], Q[9]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_10 (MEMEN_reg, Q_CORE[10], Q[10]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_11 (MEMEN_reg, Q_CORE[11], Q[11]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_12 (MEMEN_reg, Q_CORE[12], Q[12]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_13 (MEMEN_reg, Q_CORE[13], Q[13]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_14 (MEMEN_reg, Q_CORE[14], Q[14]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_15 (MEMEN_reg, Q_CORE[15], Q[15]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_16 (MEMEN_reg, Q_CORE[16], Q[16]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_17 (MEMEN_reg, Q_CORE[17], Q[17]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_18 (MEMEN_reg, Q_CORE[18], Q[18]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_19 (MEMEN_reg, Q_CORE[19], Q[19]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_20 (MEMEN_reg, Q_CORE[20], Q[20]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_21 (MEMEN_reg, Q_CORE[21], Q[21]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_22 (MEMEN_reg, Q_CORE[22], Q[22]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_23 (MEMEN_reg, Q_CORE[23], Q[23]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_24 (MEMEN_reg, Q_CORE[24], Q[24]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_25 (MEMEN_reg, Q_CORE[25], Q[25]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_26 (MEMEN_reg, Q_CORE[26], Q[26]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_27 (MEMEN_reg, Q_CORE[27], Q[27]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_28 (MEMEN_reg, Q_CORE[28], Q[28]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_29 (MEMEN_reg, Q_CORE[29], Q[29]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_30 (MEMEN_reg, Q_CORE[30], Q[30]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim memory_path_31 (MEMEN_reg, Q_CORE[31], Q[31]);

ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_0 (bypass_en, D_scff_out[0], Q[0]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_1 (bypass_en, D_scff_out[1], Q[1]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_2 (bypass_en, D_scff_out[2], Q[2]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_3 (bypass_en, D_scff_out[3], Q[3]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_4 (bypass_en, D_scff_out[4], Q[4]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_5 (bypass_en, D_scff_out[5], Q[5]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_6 (bypass_en, D_scff_out[6], Q[6]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_7 (bypass_en, D_scff_out[7], Q[7]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_8 (bypass_en, D_scff_out[8], Q[8]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_9 (bypass_en, D_scff_out[9], Q[9]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_10 (bypass_en, D_scff_out[10], Q[10]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_11 (bypass_en, D_scff_out[11], Q[11]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_12 (bypass_en, D_scff_out[12], Q[12]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_13 (bypass_en, D_scff_out[13], Q[13]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_14 (bypass_en, D_scff_out[14], Q[14]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_15 (bypass_en, D_scff_out[15], Q[15]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_16 (bypass_en, D_scff_out[16], Q[16]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_17 (bypass_en, D_scff_out[17], Q[17]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_18 (bypass_en, D_scff_out[18], Q[18]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_19 (bypass_en, D_scff_out[19], Q[19]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_20 (bypass_en, D_scff_out[20], Q[20]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_21 (bypass_en, D_scff_out[21], Q[21]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_22 (bypass_en, D_scff_out[22], Q[22]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_23 (bypass_en, D_scff_out[23], Q[23]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_24 (bypass_en, D_scff_out[24], Q[24]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_25 (bypass_en, D_scff_out[25], Q[25]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_26 (bypass_en, D_scff_out[26], Q[26]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_27 (bypass_en, D_scff_out[27], Q[27]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_28 (bypass_en, D_scff_out[28], Q[28]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_29 (bypass_en, D_scff_out[29], Q[29]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_30 (bypass_en, D_scff_out[30], Q[30]);
ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim bypass_path_31 (bypass_en, D_scff_out[31], Q[31]);

endmodule











module ST_SPHD_LOVOLT_2048x32m8_bTMl_WANDprim (out,in1,in2);
input in1,in2;
output out;

assign out = (in1 === 1'b0 || in2 === 1'b0) ? 1'b0 : (in1 === 1'b1 && in2 === 1'b1) ? 1'b1 : (in1 === 1'bz && in2 === 1'bz) ? 1'b0 : 1'bx;
endmodule


module ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim (SEL, A, B, Z);
input SEL, A, B;
output Z;

assign Z = (SEL === 1'b0) ? A : (SEL === 1'b1) ? B : 1'bx;

endmodule



module ST_SPHD_LOVOLT_2048x32m8_bTMl_CGCprim (EN, CK, CK_gated);
input EN, CK;
output reg CK_gated;
reg last_CK;

initial begin
  // This #0 is important to avoid race at start of simulation
  #0 last_CK = CK;
end        

  always @(CK or EN) begin

     if (CK === 1'b0) begin
       CK_gated = CK;
     end
     else if (last_CK === 1'b0 && CK === 1'b1) begin
       CK_gated = EN;
     end
     else if (CK === 1'bx) begin
       if (EN !== 1'b0) CK_gated = 1'bx;
       else CK_gated = 1'b0;
     end  
     last_CK = CK;
  end

endmodule

module ST_SPHD_LOVOLT_2048x32m8_bTMl_lock_up_latch (CK, D, Q);
input CK,D;
output Q;

ST_SPHD_LOVOLT_2048x32m8_bTMl_DLATprim dlat_lockup (1'b0, 1'b0, CK, D, Q);

endmodule

module ST_SPHD_LOVOLT_2048x32m8_bTMl_SCFF (D,TI,TE,CP,Q);
input D,TI,TE,CP;
output Q;

ST_SPHD_LOVOLT_2048x32m8_bTMl_MUXprim mux_in_scff (TE, D, TI, temp);
ST_SPHD_LOVOLT_2048x32m8_bTMl_DFFprim dff_in_scff (1'b0, 1'b0, CP, temp, Q);

endmodule

module ST_SPHD_LOVOLT_2048x32m8_bTMl_DFFprim (SET,CLR,CK,D,Q);
output reg Q;
input D,SET,CLR,CK;
reg Qtemp, last_CK;

        initial begin
         // This #0 is important to avoid race at start of simulation
        #0 last_CK = CK;
        end

        always @ (SET or CLR or CK) begin
          
          if (SET === 1'b1 && CLR === 1'b0) Q = 1'b1;  // Output is SET
          else if (SET === 1'b1 && CLR !== 1'b0) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (SET === 1'b0 && CLR === 1'b1) Q = 1'b0; // Output is RESET
          else if (SET !== 1'b0 && CLR === 1'b1) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (last_CK === 1'b0 && CK === 1'b1) Q <= D;  
          else if (CK === 1'bx) Q <= 1'bx;
          
          last_CK = CK;
        end   

endmodule

module ST_SPHD_LOVOLT_2048x32m8_bTMl_DFFprim_blocking (SET,CLR,CK,D,Q);
output reg Q;
input D,SET,CLR,CK;
reg last_CK;

        initial begin
         // This #0 is important to avoid race at start of simulation
        #0 last_CK = CK;
        end

        always @ (SET or CLR or CK) begin
          
          if (SET === 1'b1 && CLR === 1'b0) Q = 1'b1;  // Output is SET
          else if (SET === 1'b1 && CLR !== 1'b0) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (SET === 1'b0 && CLR === 1'b1) Q = 1'b0; // Output is RESET
          else if (SET !== 1'b0 && CLR === 1'b1) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (last_CK === 1'b0 && CK === 1'b1) Q = D;  
          else if (CK === 1'bx) Q = 1'bx;
          
          last_CK = CK;
        end  

endmodule

module ST_SPHD_LOVOLT_2048x32m8_bTMl_DLATprim (SET,CLR,CK,D,Q);
output reg Q;
input D,SET,CLR,CK;
reg Qprev;

        always @ (SET or CLR or CK or D) begin
          
          if (SET === 1'b1 && CLR === 1'b0) Q = 1'b1;  // Output is SET
          else if (SET === 1'b1 && CLR !== 1'b0) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (SET === 1'b0 && CLR === 1'b1) Q = 1'b0; // Output is RESET
          else if (SET !== 1'b0 && CLR === 1'b1) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (CK === 1'b1) Q = D;  // Latch Transparant
          else if (CK === 1'bx) Q = 1'bx;
        
          Qprev = Q; // Storing the previous value of Q
        
        end

endmodule

module ST_SPHD_LOVOLT_2048x32m8_bTMl_SWprim (control,in,out);
output out;
input control,in;

assign out = (control === 1'b1) ? in : 
             (control === 1'b0) ? 1'bz :
             1'bx;
endmodule


`endcelldefine





        

/***************************************************************************************************************************************************
--  Description       :  Verilog Model 
--  ModelVersion      : 1.9
--  Date              : 24-Sept-2014
--  Changes Made by   : PS
*****************************************************************************************************************************************************/

/************************************** START OF HEADER *****************************************
   This Header Gives Information about the parameters & options present in the Model
   
   words = 1024
   bits  = 32
   mux   = 4 
   bank = 1
   bit_mask = yes
   Redundancy = no
   margin_control = yes
   ls_pin = yes
   hs_pin = yes
   Sleep = Yes
   eswitch = No
   power_supply = Default
   
   --------------------------------------------------------------------------------------------
     Signal Name             | Description       |             Port Mode        | Active When
                             |                   |          r    |  w   | rw    |
   --------------------------------------------------------------------------------------------

    A                           Address                     x      x      na       -
    ATP                         ATP pin                     x      x      na       high
    CK                          Clock	                    x      x      na       posedge
    CSN                         Chip Enable                 x      x      na       low
    D 	                        Data in                     na     x      na       -  
    
    HS                          High Speed Mode Enable      x      x      na       High
    IG                          Input Gate Enable           x      x      na       High     
    INITN                       Initialization Pin          x      x      na       Low
    
    LS                          Low Speed Mode Enable       x      x      na       High 
    
    M                           Mask in                     na     x      na       High  
    
    
    
    Q 	                        Data out	            x      na     na       -
    
    RM                           Read Margins                x      x      na       High 
    
    
    SCTRLI                      Scan Input (Control)
    SCTRLO                      Scan Output (Control)
    SDLI                        Scan Input (Data-Left)
    SDLO                        Scan Output (Data-Left)
    SDRI                        Scan Input (Data-Right)
    SDRO                        Scan Output (Data-Right)
    SE                          Scan Enable pin            -      -      -       High
    
    
    
    SMLI                        Scan Input (Mask-Left)        
    SMLO                        Scan Output (Mask-Left)
    SMRI                        Scan Input (Mask-Right)
    SMRO                        Scan Output (Mask-Right)  
    
    
    
    
     

    STDBY                       Stand-by mode enable        x      x      na       High  
    
    TA                          Bist Address
    TBIST                       Bist Enable Pin             x      x      na       High  
    
    TBYPASS                     Memory Bypass               na     na     na       High
    TCSN                        Bist Chip Select            x      x      na       Low
    TED                         Bist Even Data pin
    
    TEM                         Bist Even Mask pin
    TOD                         Bist Odd Data Pin
    
    TOM                         Bist Odd Mask Pin  
     
    TWEN                        Bist Write Enable           na     x      na       Low 
    WEN                         Write Enable                na     x      na       Low 
    
    WM                           Write Margins Code           x      x      na       - 

************************************** END OF HEADER ********************************************/




`celldefine

`ifdef ST_DELAY_SEQ
  `define st_delay_seq_taa `ST_DELAY_SEQ
`else
  `define st_delay_seq_taa 0.001
`endif

`ifdef ST_MEM_RETAIN_TIME
 `define st_delay_seq_th `ST_MEM_RETAIN_TIME
`else
 `define st_delay_seq_th 0.001
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_TIMESCALE
 `ST_TIMESCALE
`else
 `timescale 1ns/1ps
`endif

`ifdef ST_MSG_CONTROL_TIME
        `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
        `define st_msg_cntrl_time 0
`endif

`ifdef ST_MEM_BLOCK_CTRL_TIME
        `define st_mem_block_ctrl_time `ST_MEM_BLOCK_CTRL_TIME
`else
        `define st_mem_block_ctrl_time 0
`endif

`define mono_rail 2'b00
`define mo_ma_tied 2'b01
`define mo_mp_tied 2'b10
`define dual_rail 2'b11


`ifdef ST_MEM_PSWSMALLMA_SETTLING_TIME
  `define pswsmallma_settling_time `ST_MEM_PSWSMALLMA_SETTLING_TIME
`else  
  `define pswsmallma_settling_time 1000
`endif

`ifdef ST_MEM_PSWLARGEMA_SETTLING_TIME
  `define pswlargema_settling_time `ST_MEM_PSWLARGEMA_SETTLING_TIME
`else  
  `define pswlargema_settling_time 1000
`endif

`ifdef ST_MEM_PSWSMALLMP_SETTLING_TIME
  `define pswsmallmp_settling_time `ST_MEM_PSWSMALLMP_SETTLING_TIME
`else  
  `define pswsmallmp_settling_time 1000
`endif

`ifdef ST_MEM_PSWLARGEMP_SETTLING_TIME
  `define pswlargemp_settling_time `ST_MEM_PSWLARGEMP_SETTLING_TIME
`else  
  `define pswlargemp_settling_time 1000
`endif


/*------------------------------------------------------------------------------------------
            ST_SPHD_LOVOLT_1024x32m4_bTMl model for Verilog 
-------------------------------------------------------------------------------------------*/

module ST_SPHD_LOVOLT_1024x32m4_bTMl (A, ATP, CK, CSN, D , HS, IG, INITN , LS, M, Q, RM, SCTRLI,SCTRLO,SDLI,SDLO,SDRI,SDRO,SE, SMLI,SMLO,SMRI,SMRO,   STDBY ,TA,TBIST, TBYPASS ,TCSN,TED ,TEM  ,TOD  ,TOM , TWEN, WEN, WM);

    
    parameter
        `ifdef ST_MEM_CONFIGFAULT
                ConfigFault = 1,
        `else
                ConfigFault = 0,
        `endif
        
        `ifdef ST_NO_MSG_MODE  
                p_debug_level = 2'b00,
        `elsif ST_ALL_MSG_MODE  
                p_debug_level = 2'b11,
        `elsif ST_ERROR_ONLY_MODE 
                p_debug_level = 2'b01,
        `else 
                p_debug_level = 2'b10,
        `endif
        
        
        power_pins_config = `mono_rail,

        Fault_file_name = "ST_SPHD_LOVOLT_1024x32m4_bTMl_faults.txt",
        max_faults = 1024+2,
        MEM_INITIALIZE  = 1'b0,
        BinaryInit = 1'b0,
        InitFileName = "ST_SPHD_LOVOLT_1024x32m4_bTMl.cde",
        Debug_mode = "all_warning_mode",
        File_load_time=0,
        InstancePath = "ST_SPHD_LOVOLT_1024x32m4_bTMl",
        
        p_pswsmallma_settling_time = `pswsmallma_settling_time,
        p_pswlargema_settling_time = `pswlargema_settling_time,
        p_pswsmallmp_settling_time = `pswsmallmp_settling_time,
        p_pswlargemp_settling_time = `pswlargemp_settling_time,
        message_control_time = `st_msg_cntrl_time,
        mem_block_ctrl_time = `st_mem_block_ctrl_time;
        

    localparam
        words = 1024,
        bits = 32,
        Addr = 10,
        max_address_bits = 11,
        
        
        mask_bits = 32, 
        
        mux = 4,
        Logmux = 2,
        mux_bits=2,
        bank_bits=0,
        RedWords = mux * 2 * 1,
        Rows = words/mux,
        repair_address_width = 8,
        write_margin_size = 4, 
        read_margin_size = 4;

    localparam 
       scanlen_ctrl=17,
    
       scanlen_r= 16,
       scanlen_l= 16;

    localparam
        WordX = {bits{1'bx}},
        WordZ = {bits{1'bz}},
        AddrX = {Addr{1'bx}},
        Word0 = {bits{1'b0}},
        X = 1'bx;
    

//---------------  IN / OUT Declarations -----------

//--------------------------------------------------
//           Global Active (GAC) Pins 
//--------------------------------------------------
 
        input STDBY;
        input INITN;

//--------------------------------------------------
//              FUNCTIONAL Pins 
//--------------------------------------------------
	output [bits-1 : 0] Q;
        
        input CK;
        input CSN, IG, WEN;
        input [bits-1 : 0] D ;
	input [Addr-1 : 0] A;
        input [mask_bits-1:0] M;

//--------------------------------------------------
//                TEST Mode Pins 
//--------------------------------------------------
        input ATP;
    
    // Scan Flops related pins
        
        input SE;
        input SCTRLI,SDLI,SDRI ,SMLI,SMRI ;
        output SCTRLO, SDLO, SDRO , SMLO, SMRO;
        
    // Bypass pin
        input TBYPASS;
        
    // BIST Related Pins 
         input TBIST;
         input [Addr-1 :0 ] TA;
         input TCSN,TWEN,TED,TOD; 
         input TEM,TOM;
         

        

        

//----------------------------------------------------
//           Margin Control Related Pins
//----------------------------------------------------
        
        
        input [read_margin_size-1 : 0] RM;
        input [write_margin_size-1 : 0] WM;
        

//----------------------------------------------------
//             Speed Mode Related Pins
//----------------------------------------------------
        input LS;
        input HS;

//----------------------------------------------------
//              Eswitch Related Pins
//----------------------------------------------------
        
        

       
        
        
        reg gndm;
        
        
        
        reg vddm;
        
        
        
        
        

//----------------------------------------------------
//           Wire and Reg Declarations
//----------------------------------------------------
        
        wire WEN_bmux;
        wire CK_scff, CK_lock_up_latch;
        wire CK_rw;
        wire [Addr-1 : 0] A_bmux;
        wire [max_address_bits-1 : 0] A_scff_din; 

        wire [bits-1 : 0] M_bmux;
        wire [bits-1 : 0] M_scff_out;

        
        wire [bits-1 : 0] D_bmux;
        wire [bits-1 : 0] D_scff_out;

        wire [scanlen_ctrl-1 : 0] ctrl_scff_in;
        wire [scanlen_ctrl-1 : 0] ctrl_scff_out; 
        wire [bits-1 : 0] Q_int, Q_CORE; 
        
        wire SCTRLO_temp, SDLO_temp  ,SDRO_temp ,SMLO_temp  ,SMRO_temp;
        
        wire CK_buf;
        

        buf (CK_buf, CK); // while blocking the memory, CK_buf will be forced to 'x' 



        reg SLEEP_buf_r;
	reg STDBY_buf_r;
	reg INITN_buf_r;
	reg CSN_buf_r;
	reg IG_buf_r;
	reg WEN_buf_r;
        reg [bits-1 : 0] D_buf_r;
        reg [Addr-1 : 0] A_buf_r;
        reg [mask_bits-1 : 0] M_buf_r;
	reg ATP_buf_r;
	reg SE_buf_r;
	reg SCTRLI_buf_r;
	reg SDLI_buf_r;
	reg SDRI_buf_r;
	
        reg SMLI_buf_r;
	reg SMRI_buf_r;
	
        reg TBYPASS_buf_r;
        reg TBIST_buf_r;
        reg [Addr-1 : 0] TA_buf_r;
	reg TCSN_buf_r;
	reg TWEN_buf_r;
	reg TED_buf_r;
	reg TOD_buf_r;
	reg TEM_buf_r;
	reg TOM_buf_r;


        reg [read_margin_size-1 : 0] RM_buf_r;
        reg [write_margin_size-1 : 0] WM_buf_r;
        reg LS_buf_r;
        reg HS_buf_r;

  
        
        wire SLEEP_buf;
	wire STDBY_buf;
	wire INITN_buf;
	wire CSN_buf;
	wire IG_buf;
	wire WEN_buf;
        wire [bits-1 : 0] D_buf;
        wire [Addr-1 : 0] A_buf;
        wire [mask_bits-1 : 0] M_buf;
	wire ATP_buf;
	wire SE_buf;
	wire SCTRLI_buf;
	wire SDLI_buf;
	wire SDRI_buf;
	
        wire SMLI_buf;
	wire SMRI_buf;
	
        wire TBYPASS_buf;
        wire TBIST_buf;
        wire [Addr-1 : 0] TA_buf;
	wire TCSN_buf;
	wire TWEN_buf;
	wire TED_buf;
	wire TOD_buf;
	wire TEM_buf;
	wire TOM_buf;


        wire [read_margin_size-1 : 0] RM_buf;
        wire [write_margin_size-1 : 0] WM_buf;
        wire LS_buf;
        wire HS_buf;

  

        
        reg [bits-1 : 0] Q_final;
        reg r_supply_trigger;

//----------------------------------------------------
//              Input Non-Blocking Buffers Starts
//----------------------------------------------------

       
        assign SLEEP_buf = 1'b0;
        
        always @(STDBY or r_supply_trigger) begin
          STDBY_buf_r <= STDBY;
        end
        buf (STDBY_buf, STDBY_buf_r);
        
        always @(INITN or r_supply_trigger) begin
          INITN_buf_r <= INITN;
        end
        buf (INITN_buf, INITN_buf_r);
        
        always @(CSN or r_supply_trigger) begin
          CSN_buf_r <= CSN;
        end
        buf (CSN_buf, CSN_buf_r);
        
        always @(IG or r_supply_trigger) begin
          IG_buf_r <= IG;
        end
        buf (IG_buf, IG_buf_r);
        
        always @(WEN or r_supply_trigger) begin
          WEN_buf_r <= WEN;
        end
        buf (WEN_buf, WEN_buf_r);
        
        always @(D or r_supply_trigger) begin
          D_buf_r <= D;
        end
        buf buf_d [bits-1 : 0] (D_buf, D_buf_r);
        
        always @(A or r_supply_trigger) begin
          A_buf_r <= A;
        end
        buf buf_a [Addr-1 : 0] (A_buf, A_buf_r);
        
        always @(M or r_supply_trigger) begin
          M_buf_r <= M;
        end
        buf buf_m [mask_bits-1 : 0] (M_buf, M_buf_r);
        
        always @(ATP or r_supply_trigger) begin
          ATP_buf_r <= ATP;
        end
        buf (ATP_buf, ATP_buf_r);
        
        always @(SE or r_supply_trigger) begin
          SE_buf_r <= SE;
        end
        buf (SE_buf, SE_buf_r);
        
        always @(SCTRLI or r_supply_trigger) begin
          SCTRLI_buf_r <= SCTRLI;
        end
        buf (SCTRLI_buf, SCTRLI_buf_r);
        
        always @(SDLI or r_supply_trigger) begin
          SDLI_buf_r <= SDLI;
        end
        buf (SDLI_buf, SDLI_buf_r);
        
        always @(SDRI or r_supply_trigger) begin
          SDRI_buf_r <= SDRI;
        end
        buf (SDRI_buf, SDRI_buf_r);
        
        
        always @(SMLI or r_supply_trigger) begin
          SMLI_buf_r <= SMLI;
        end
        buf (SMLI_buf, SMLI_buf_r);
        
        always @(SMRI or r_supply_trigger) begin
          SMRI_buf_r <= SMRI;
        end
        buf (SMRI_buf, SMRI_buf_r);
        
        
        
        always @(TBYPASS or r_supply_trigger) begin
          TBYPASS_buf_r <= TBYPASS;
        end
        buf (TBYPASS_buf, TBYPASS_buf_r);
        
        always @(TBIST or r_supply_trigger) begin
          TBIST_buf_r <= TBIST;
        end
        buf (TBIST_buf, TBIST_buf_r);
        
        always @(TA or r_supply_trigger) begin
          TA_buf_r <= TA;
        end
        buf buf_ta [Addr-1 : 0] (TA_buf, TA_buf_r);
        
        always @(TCSN or r_supply_trigger) begin
          TCSN_buf_r <= TCSN;
        end
        buf (TCSN_buf, TCSN_buf_r);
        
        always @(TWEN or r_supply_trigger) begin
          TWEN_buf_r <= TWEN;
        end
        buf (TWEN_buf, TWEN_buf_r);
        
        always @(TED or r_supply_trigger) begin
          TED_buf_r <= TED;
        end
        buf (TED_buf, TED_buf_r);
        
        always @(TOD or r_supply_trigger) begin
          TOD_buf_r <= TOD;
        end
        buf (TOD_buf, TOD_buf_r);
        
        always @(TEM or r_supply_trigger) begin
          TEM_buf_r <= TEM;
        end
        buf (TEM_buf, TEM_buf_r);
        
        always @(TOM or r_supply_trigger) begin
          TOM_buf_r <= TOM;
        end
        buf (TOM_buf, TOM_buf_r);
        
        
        
        
        always @(RM or r_supply_trigger) begin
          RM_buf_r <= RM;
        end
        buf buf_rm [read_margin_size-1 : 0] (RM_buf, RM_buf_r);
        
        always @(WM or r_supply_trigger) begin
          WM_buf_r <= WM;
        end
        buf buf_wm [write_margin_size-1 : 0] (WM_buf, WM_buf_r);
        
        always @(LS or r_supply_trigger) begin
          LS_buf_r <= LS;
        end
        buf (LS_buf, LS_buf_r);
        
        always @(HS or r_supply_trigger) begin
          HS_buf_r <= HS;
        end
        buf (HS_buf, HS_buf_r);
        
        
//----------------------------------------------------
//              Input Non-Blocking Buffers Ends
//----------------------------------------------------


/*---------------------------------------------------------------------------
                     Functional Control Unit.
        1) BIST MUXes
        2) Clock generation : CK_scff, CK_rw, CK_lock_up_latch
        3) Output MUX
----------------------------------------------------------------------------*/

ST_SPHD_LOVOLT_1024x32m4_bTMl_INTERFACE IO (

// functional inputs
.A(A_buf),.D(D_buf),.M(M_buf),.CSN(CSN_buf),.WEN(WEN_buf),.CK(CK_buf),.SE(SE_buf),.TBYPASS(TBYPASS_buf),.IG(IG_buf),.SLEEP(SLEEP_buf),.ATP(ATP_buf),.STDBY(STDBY_buf),.INITN(INITN_buf),

// BIST inputs
.TBIST(TBIST_buf),.TCSN(TCSN_buf),.TA(TA_buf),.TED(TED_buf),.TOD(TOD_buf),.TEM(TEM_buf),.TOM(TOM_buf),.TWEN(TWEN_buf),



// bist mux outputs
.A_bmux(A_bmux),.D_bmux(D_bmux),.M_bmux(M_bmux),.WEN_bmux(WEN_bmux),.CSN_scff_din(CSN_scff_din),

// Test Enable signals for Scan flops
.shift_en_inst(shift_en_inst),

// Clocks for Scan flops and "mp" block
.CK_scff(CK_scff),.CK_lock_up_latch(CK_lock_up_latch),.CK_rw(CK_rw),

// Data and Control Scan flops outputs
.D_scff_out(D_scff_out),.BYP_ENint(ctrl_scff_out[16]),

// Q Output from rw and omux blocks
.Q_CORE(Q_CORE), .Q(Q_int), .MEM_EN_inst(MEM_EN_inst)

);

/*---------------------------------------------
        'D' input for Control Scan flops
----------------------------------------------*/

buf (A_scff_din[0], A_bmux[0]);
buf (A_scff_din[1], A_bmux[1]);
buf (A_scff_din[2], A_bmux[2]);
buf (A_scff_din[3], A_bmux[3]);
buf (A_scff_din[4], A_bmux[4]);
buf (A_scff_din[5], A_bmux[5]);
buf (A_scff_din[6], A_bmux[6]);
buf (A_scff_din[7], A_bmux[7]);
buf (A_scff_din[8], A_bmux[8]);
buf (A_scff_din[9], A_bmux[9]);

buf (A_scff_din[10],1'b0);

buf (WEN_scff_din, WEN_bmux);

/*------------------------------------     
        CONTROL SCAN CHAIN
------------------------------------*/



buf  (ctrl_scff_in[0], A_scff_din[10]);
buf  (ctrl_scff_in[1], A_scff_din[9]);
buf  (ctrl_scff_in[2], A_scff_din[8]);
buf  (ctrl_scff_in[3], A_scff_din[7]);
buf  (ctrl_scff_in[4], A_scff_din[6]);
buf  (ctrl_scff_in[5], A_scff_din[5]);
buf  (ctrl_scff_in[6], A_scff_din[4]);
buf  (ctrl_scff_in[7], A_scff_din[3]);
buf  (ctrl_scff_in[8], A_scff_din[2]);
buf  (ctrl_scff_in[9], A_scff_din[0]);
buf  (ctrl_scff_in[10], A_scff_din[1]);
buf  (ctrl_scff_in[11], 1'b0);
buf  (ctrl_scff_in[12], 1'b0);
buf  (ctrl_scff_in[13], 1'b0);
buf  (ctrl_scff_in[14], CSN_scff_din);
buf  (ctrl_scff_in[15], WEN_scff_din);
buf  (ctrl_scff_in[16], ctrl_scff_out[16]);

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_0  (.D(ctrl_scff_in[0]), .TI(SCTRLI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[0]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_1 (.D(ctrl_scff_in[1]), .TI(ctrl_scff_out[0]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[1]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_2 (.D(ctrl_scff_in[2]), .TI(ctrl_scff_out[1]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[2]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_3 (.D(ctrl_scff_in[3]), .TI(ctrl_scff_out[2]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[3]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_4 (.D(ctrl_scff_in[4]), .TI(ctrl_scff_out[3]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[4]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_5 (.D(ctrl_scff_in[5]), .TI(ctrl_scff_out[4]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[5]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_6 (.D(ctrl_scff_in[6]), .TI(ctrl_scff_out[5]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[6]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_7 (.D(ctrl_scff_in[7]), .TI(ctrl_scff_out[6]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[7]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_8 (.D(ctrl_scff_in[8]), .TI(ctrl_scff_out[7]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[8]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_9 (.D(ctrl_scff_in[9]), .TI(ctrl_scff_out[8]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[9]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_10 (.D(ctrl_scff_in[10]), .TI(ctrl_scff_out[9]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[10]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_11 (.D(ctrl_scff_in[11]), .TI(ctrl_scff_out[10]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[11]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_12 (.D(ctrl_scff_in[12]), .TI(ctrl_scff_out[11]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[12]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_13 (.D(ctrl_scff_in[13]), .TI(ctrl_scff_out[12]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[13]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_14 (.D(ctrl_scff_in[14]), .TI(ctrl_scff_out[13]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[14]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_15 (.D(ctrl_scff_in[15]), .TI(ctrl_scff_out[14]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[15]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_ctrl_16 (.D(ctrl_scff_in[16]), .TI(ctrl_scff_out[15]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[16]));

ST_SPHD_LOVOLT_1024x32m4_bTMl_lock_up_latch  latch_SCTRLO (.CK(!CK_lock_up_latch), .D(ctrl_scff_out[16]), .Q(SCTRLO_temp));


/*-----------------------------------
        LEFT DATA SCAN CHAIN
------------------------------------*/

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_0 (.D(D_bmux[15]), .TI(SDLI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[15])); 


 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_1 (.D(D_bmux[14]),  .TI(D_scff_out[15]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[14]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_2 (.D(D_bmux[13]),  .TI(D_scff_out[14]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[13]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_3 (.D(D_bmux[12]),  .TI(D_scff_out[13]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[12]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_4 (.D(D_bmux[11]),  .TI(D_scff_out[12]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[11]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_5 (.D(D_bmux[10]),  .TI(D_scff_out[11]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[10]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_6 (.D(D_bmux[9]),  .TI(D_scff_out[10]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[9]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_7 (.D(D_bmux[8]),  .TI(D_scff_out[9]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[8]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_8 (.D(D_bmux[7]),  .TI(D_scff_out[8]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[7]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_9 (.D(D_bmux[6]),  .TI(D_scff_out[7]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[6]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_10 (.D(D_bmux[5]),  .TI(D_scff_out[6]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[5]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_11 (.D(D_bmux[4]),  .TI(D_scff_out[5]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[4]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_12 (.D(D_bmux[3]),  .TI(D_scff_out[4]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[3]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_13 (.D(D_bmux[2]),  .TI(D_scff_out[3]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[2]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_14 (.D(D_bmux[1]),  .TI(D_scff_out[2]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[1]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_left_15 (.D(D_bmux[0]),  .TI(D_scff_out[1]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[0])); 

ST_SPHD_LOVOLT_1024x32m4_bTMl_lock_up_latch  latch_SDLO (.CK(!CK_lock_up_latch), .D(D_scff_out[0]), .Q(SDLO_temp)); 




/*-------------------------------------
        RIGHT DATA SCAN CHAIN
--------------------------------------*/

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_0 (.D(D_bmux[31]), .TI(SDRI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[31])); 

 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_1 (.D(D_bmux[30]),  .TI(D_scff_out[31]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[30]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_2 (.D(D_bmux[29]),  .TI(D_scff_out[30]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[29]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_3 (.D(D_bmux[28]),  .TI(D_scff_out[29]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[28]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_4 (.D(D_bmux[27]),  .TI(D_scff_out[28]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[27]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_5 (.D(D_bmux[26]),  .TI(D_scff_out[27]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[26]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_6 (.D(D_bmux[25]),  .TI(D_scff_out[26]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[25]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_7 (.D(D_bmux[24]),  .TI(D_scff_out[25]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[24]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_8 (.D(D_bmux[23]),  .TI(D_scff_out[24]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[23]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_9 (.D(D_bmux[22]),  .TI(D_scff_out[23]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[22]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_10 (.D(D_bmux[21]),  .TI(D_scff_out[22]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[21]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_11 (.D(D_bmux[20]),  .TI(D_scff_out[21]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[20]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_12 (.D(D_bmux[19]),  .TI(D_scff_out[20]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[19]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_13 (.D(D_bmux[18]),  .TI(D_scff_out[19]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[18]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_14 (.D(D_bmux[17]),  .TI(D_scff_out[18]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[17]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_data_right_15 (.D(D_bmux[16]),  .TI(D_scff_out[17]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[16])); 

ST_SPHD_LOVOLT_1024x32m4_bTMl_lock_up_latch  latch_SDRO (.CK(!CK_lock_up_latch), .D(D_scff_out[16]), .Q(SDRO_temp));










/*-----------------------------------
        LEFT MASK SCAN CHAIN
------------------------------------*/

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_0 (.D(M_bmux[15]), .TI(SMLI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[15])); 


 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_1 (.D(M_bmux[14]),  .TI(M_scff_out[15]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[14]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_2 (.D(M_bmux[13]),  .TI(M_scff_out[14]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[13]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_3 (.D(M_bmux[12]),  .TI(M_scff_out[13]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[12]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_4 (.D(M_bmux[11]),  .TI(M_scff_out[12]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[11]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_5 (.D(M_bmux[10]),  .TI(M_scff_out[11]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[10]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_6 (.D(M_bmux[9]),  .TI(M_scff_out[10]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[9]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_7 (.D(M_bmux[8]),  .TI(M_scff_out[9]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[8]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_8 (.D(M_bmux[7]),  .TI(M_scff_out[8]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[7]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_9 (.D(M_bmux[6]),  .TI(M_scff_out[7]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[6]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_10 (.D(M_bmux[5]),  .TI(M_scff_out[6]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[5]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_11 (.D(M_bmux[4]),  .TI(M_scff_out[5]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[4]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_12 (.D(M_bmux[3]),  .TI(M_scff_out[4]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[3]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_13 (.D(M_bmux[2]),  .TI(M_scff_out[3]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[2]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_14 (.D(M_bmux[1]),  .TI(M_scff_out[2]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[1]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_left_15 (.D(M_bmux[0]),  .TI(M_scff_out[1]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[0])); 

ST_SPHD_LOVOLT_1024x32m4_bTMl_lock_up_latch  latch_SMLO (.CK(!CK_lock_up_latch), .D(M_scff_out[0]), .Q(SMLO_temp)); 




/*-------------------------------------
        RIGHT MASK SCAN CHAIN
--------------------------------------*/

ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_0 (.D(M_bmux[31]), .TI(SMRI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[31])); 

 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_1 (.D(M_bmux[30]),  .TI(M_scff_out[31]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[30]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_2 (.D(M_bmux[29]),  .TI(M_scff_out[30]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[29]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_3 (.D(M_bmux[28]),  .TI(M_scff_out[29]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[28]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_4 (.D(M_bmux[27]),  .TI(M_scff_out[28]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[27]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_5 (.D(M_bmux[26]),  .TI(M_scff_out[27]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[26]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_6 (.D(M_bmux[25]),  .TI(M_scff_out[26]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[25]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_7 (.D(M_bmux[24]),  .TI(M_scff_out[25]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[24]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_8 (.D(M_bmux[23]),  .TI(M_scff_out[24]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[23]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_9 (.D(M_bmux[22]),  .TI(M_scff_out[23]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[22]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_10 (.D(M_bmux[21]),  .TI(M_scff_out[22]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[21]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_11 (.D(M_bmux[20]),  .TI(M_scff_out[21]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[20]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_12 (.D(M_bmux[19]),  .TI(M_scff_out[20]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[19]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_13 (.D(M_bmux[18]),  .TI(M_scff_out[19]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[18]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_14 (.D(M_bmux[17]),  .TI(M_scff_out[18]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[17]));
 ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF scff_mask_right_15 (.D(M_bmux[16]),  .TI(M_scff_out[17]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[16])); 

ST_SPHD_LOVOLT_1024x32m4_bTMl_lock_up_latch  latch_SMRO (.CK(!CK_lock_up_latch), .D(M_scff_out[16]), .Q(SMRO_temp));       










//-------------------------------------------------------------------------
//           Verilog Simulation Model Specifc functionality starts
//             -> Specify Block, Timing Wrapper
//             -> Power Pins functionality
//             -> Display Message Handling
//             -> Read/Write functionality with Redundancy
//             -> Fault File and Initialization file handling
//-------------------------------------------------------------------------

reg GAC_reg;        
 
reg initn_pulse_done=1;

reg SLEEP_reg, STDBY_reg, INITN_reg, ATP_reg, SE_reg, TBYPASS_reg, IG_reg, CSN_reg, DE_reg, WEN_reg, WEN_bmux_reg, MEMEN_reg, MEMEN_dft_prev, MEMEN_prev;

reg [bits-1 : 0] D_reg,D_bmux_reg;
reg [bits-1 : 0] M_bmux_reg;
reg [Addr-1 : 0] A_reg, A_bmux_reg;
reg lastCK, invalid_next_cycle_dft, invalid_next_cycle_func;
reg [8*44: 0] message_status;
reg [8*10: 0] operating_mode;
reg [1:0] debug_level;
wire DE_temp;
`ifdef ST_MEM_SLM
  integer slm_handle;
  initial begin
    $slm_RegisterMemory(slm_handle, words, bits);
  end
`else
  reg [bits-1 : 0] Mem [words-1 : 0];// RAM array
  reg [bits-1 : 0] RedMem [RedWords-1 : 0]; // Redundancy locations
`endif

reg [bits-1 : 0] Mem_prev;
reg [bits-1 : 0] Qtemp, tempReg;
reg ValidAddress, last_CK_rw;
reg file_loaded;
reg repair_access;


always @(CK) begin
  
  if (lastCK === 1'b0 && CK === 1'b1) begin
    
           GAC_reg = IO.GAC;
           MEMEN_dft_prev = IO.GAC & ATP_buf;
           MEMEN_prev = MEMEN_reg;
           MEMEN_reg = IO.MEM_EN_inst;
           SLEEP_reg = SLEEP_buf;
           STDBY_reg = STDBY_buf;
           INITN_reg = INITN_buf;
           ATP_reg = ATP_buf;
           SE_reg = SE_buf;
           TBYPASS_reg = TBYPASS_buf;
           IG_reg = IG_buf;
           CSN_reg = IO.CSN_bmux;
           WEN_reg = WEN_buf;
           WEN_bmux_reg = WEN_bmux;
           A_reg = A_buf;
           A_bmux_reg = A_bmux;
           D_reg = D_buf;
           D_bmux_reg = D_bmux;
           M_bmux_reg = M_bmux;
           DE_reg = DE_temp;
           
           
  end

  if (lastCK === 1'b0 && CK !== 1'b0) begin
           if (invalid_next_cycle_func === 1'b1) begin
             invalid_next_cycle_func = 1'b0;
             release IO.cgc_CK_rw.CK_gated;
           end     
           if (invalid_next_cycle_dft === 1'b1) begin
             invalid_next_cycle_dft = 1'b0;
             release IO.cgc_CK_lkp_latch.CK_gated;
             release IO.cgc_CK_scff.CK_gated;
           end     
  end
  
  lastCK = CK;
end

task Corrupt_Mem;
begin
        WriteMemX;
end
endtask

task Corrupt_Q;
begin
        IO.dff_mem_en.Q <= 1'bx;
end
endtask

task Corrupt_all_scan_flops_scan_outs;
begin
        Corrupt_ctrl_scan_flops_scan_outs;
        Corrupt_data_scan_flops_scan_outs;
        Corrupt_mask_scan_flops_scan_outs;
end
endtask

task Corrupt_ctrl_scan_flops;  
begin
        scff_ctrl_0.dff_in_scff.Q <= 1'bx;
scff_ctrl_1.dff_in_scff.Q <= 1'bx;
scff_ctrl_2.dff_in_scff.Q <= 1'bx;
scff_ctrl_3.dff_in_scff.Q <= 1'bx;
scff_ctrl_4.dff_in_scff.Q <= 1'bx;
scff_ctrl_5.dff_in_scff.Q <= 1'bx;
scff_ctrl_6.dff_in_scff.Q <= 1'bx;
scff_ctrl_7.dff_in_scff.Q <= 1'bx;
scff_ctrl_8.dff_in_scff.Q <= 1'bx;
scff_ctrl_9.dff_in_scff.Q <= 1'bx;
scff_ctrl_10.dff_in_scff.Q <= 1'bx;
scff_ctrl_11.dff_in_scff.Q <= 1'bx;
scff_ctrl_12.dff_in_scff.Q <= 1'bx;
scff_ctrl_13.dff_in_scff.Q <= 1'bx;
scff_ctrl_14.dff_in_scff.Q <= 1'bx;
scff_ctrl_15.dff_in_scff.Q <= 1'bx;
scff_ctrl_16.dff_in_scff.Q <= 1'bx;
end
endtask

task Corrupt_ctrl_scan_flops_scan_outs;
begin
        Corrupt_ctrl_scan_flops;
        latch_SCTRLO.dlat_lockup.Q <= 1'bx;
end
endtask

task Corrupt_data_scan_flops_scan_outs;
begin
        Corrupt_datal_scan_flops_scan_outs;
        Corrupt_datar_scan_flops_scan_outs;

end
endtask

task Corrupt_datal_scan_flops;
begin
        
       scff_data_left_0.dff_in_scff.Q <= 1'bx;
scff_data_left_1.dff_in_scff.Q <= 1'bx;
scff_data_left_2.dff_in_scff.Q <= 1'bx;
scff_data_left_3.dff_in_scff.Q <= 1'bx;
scff_data_left_4.dff_in_scff.Q <= 1'bx;
scff_data_left_5.dff_in_scff.Q <= 1'bx;
scff_data_left_6.dff_in_scff.Q <= 1'bx;
scff_data_left_7.dff_in_scff.Q <= 1'bx;
scff_data_left_8.dff_in_scff.Q <= 1'bx;
scff_data_left_9.dff_in_scff.Q <= 1'bx;
scff_data_left_10.dff_in_scff.Q <= 1'bx;
scff_data_left_11.dff_in_scff.Q <= 1'bx;
scff_data_left_12.dff_in_scff.Q <= 1'bx;
scff_data_left_13.dff_in_scff.Q <= 1'bx;
scff_data_left_14.dff_in_scff.Q <= 1'bx;
scff_data_left_15.dff_in_scff.Q <= 1'bx; 

end
endtask



task Corrupt_datal_scan_flops_scan_outs;
begin
        Corrupt_datal_scan_flops;
        latch_SDLO.dlat_lockup.Q <= 1'bx;
end
endtask



task Corrupt_datar_scan_flops;
begin
        
       scff_data_right_0.dff_in_scff.Q <= 1'bx;
scff_data_right_1.dff_in_scff.Q <= 1'bx;
scff_data_right_2.dff_in_scff.Q <= 1'bx;
scff_data_right_3.dff_in_scff.Q <= 1'bx;
scff_data_right_4.dff_in_scff.Q <= 1'bx;
scff_data_right_5.dff_in_scff.Q <= 1'bx;
scff_data_right_6.dff_in_scff.Q <= 1'bx;
scff_data_right_7.dff_in_scff.Q <= 1'bx;
scff_data_right_8.dff_in_scff.Q <= 1'bx;
scff_data_right_9.dff_in_scff.Q <= 1'bx;
scff_data_right_10.dff_in_scff.Q <= 1'bx;
scff_data_right_11.dff_in_scff.Q <= 1'bx;
scff_data_right_12.dff_in_scff.Q <= 1'bx;
scff_data_right_13.dff_in_scff.Q <= 1'bx;
scff_data_right_14.dff_in_scff.Q <= 1'bx;
scff_data_right_15.dff_in_scff.Q <= 1'bx;
       
end
endtask


  

task Corrupt_datar_scan_flops_scan_outs;
begin
        Corrupt_datar_scan_flops;
        latch_SDRO.dlat_lockup.Q <= 1'bx;
end
endtask





task Corrupt_mask_scan_flops_scan_outs;
begin
        Corrupt_maskl_scan_flops_scan_outs;
        Corrupt_maskr_scan_flops_scan_outs;

end
endtask

task Corrupt_maskl_scan_flops;
begin
        
       scff_mask_left_0.dff_in_scff.Q <= 1'bx;
scff_mask_left_1.dff_in_scff.Q <= 1'bx;
scff_mask_left_2.dff_in_scff.Q <= 1'bx;
scff_mask_left_3.dff_in_scff.Q <= 1'bx;
scff_mask_left_4.dff_in_scff.Q <= 1'bx;
scff_mask_left_5.dff_in_scff.Q <= 1'bx;
scff_mask_left_6.dff_in_scff.Q <= 1'bx;
scff_mask_left_7.dff_in_scff.Q <= 1'bx;
scff_mask_left_8.dff_in_scff.Q <= 1'bx;
scff_mask_left_9.dff_in_scff.Q <= 1'bx;
scff_mask_left_10.dff_in_scff.Q <= 1'bx;
scff_mask_left_11.dff_in_scff.Q <= 1'bx;
scff_mask_left_12.dff_in_scff.Q <= 1'bx;
scff_mask_left_13.dff_in_scff.Q <= 1'bx;
scff_mask_left_14.dff_in_scff.Q <= 1'bx;
scff_mask_left_15.dff_in_scff.Q <= 1'bx; 
end
endtask



task Corrupt_maskl_scan_flops_scan_outs;
begin
        Corrupt_maskl_scan_flops;
        latch_SMLO.dlat_lockup.Q <= 1'bx;
end
endtask



task Corrupt_maskr_scan_flops;
begin
     
       scff_mask_right_0.dff_in_scff.Q <= 1'bx;
scff_mask_right_1.dff_in_scff.Q <= 1'bx;
scff_mask_right_2.dff_in_scff.Q <= 1'bx;
scff_mask_right_3.dff_in_scff.Q <= 1'bx;
scff_mask_right_4.dff_in_scff.Q <= 1'bx;
scff_mask_right_5.dff_in_scff.Q <= 1'bx;
scff_mask_right_6.dff_in_scff.Q <= 1'bx;
scff_mask_right_7.dff_in_scff.Q <= 1'bx;
scff_mask_right_8.dff_in_scff.Q <= 1'bx;
scff_mask_right_9.dff_in_scff.Q <= 1'bx;
scff_mask_right_10.dff_in_scff.Q <= 1'bx;
scff_mask_right_11.dff_in_scff.Q <= 1'bx;
scff_mask_right_12.dff_in_scff.Q <= 1'bx;
scff_mask_right_13.dff_in_scff.Q <= 1'bx;
scff_mask_right_14.dff_in_scff.Q <= 1'bx;
scff_mask_right_15.dff_in_scff.Q <= 1'bx;
       
end
endtask


  

task Corrupt_maskr_scan_flops_scan_outs;
begin
        Corrupt_maskr_scan_flops;
        latch_SMRO.dlat_lockup.Q <= 1'bx;
end
endtask






`ifdef functional

/*------------------------------------------------------------
        Output Buffers for verilog functional model
-------------------------------------------------------------*/
    
    always @(Q_int) begin
      Q_final = Q_int;
    end  
    buf #(`st_delay_seq_taa) (Q[0], Q_final[0]);
buf #(`st_delay_seq_taa) (Q[1], Q_final[1]);
buf #(`st_delay_seq_taa) (Q[2], Q_final[2]);
buf #(`st_delay_seq_taa) (Q[3], Q_final[3]);
buf #(`st_delay_seq_taa) (Q[4], Q_final[4]);
buf #(`st_delay_seq_taa) (Q[5], Q_final[5]);
buf #(`st_delay_seq_taa) (Q[6], Q_final[6]);
buf #(`st_delay_seq_taa) (Q[7], Q_final[7]);
buf #(`st_delay_seq_taa) (Q[8], Q_final[8]);
buf #(`st_delay_seq_taa) (Q[9], Q_final[9]);
buf #(`st_delay_seq_taa) (Q[10], Q_final[10]);
buf #(`st_delay_seq_taa) (Q[11], Q_final[11]);
buf #(`st_delay_seq_taa) (Q[12], Q_final[12]);
buf #(`st_delay_seq_taa) (Q[13], Q_final[13]);
buf #(`st_delay_seq_taa) (Q[14], Q_final[14]);
buf #(`st_delay_seq_taa) (Q[15], Q_final[15]);
buf #(`st_delay_seq_taa) (Q[16], Q_final[16]);
buf #(`st_delay_seq_taa) (Q[17], Q_final[17]);
buf #(`st_delay_seq_taa) (Q[18], Q_final[18]);
buf #(`st_delay_seq_taa) (Q[19], Q_final[19]);
buf #(`st_delay_seq_taa) (Q[20], Q_final[20]);
buf #(`st_delay_seq_taa) (Q[21], Q_final[21]);
buf #(`st_delay_seq_taa) (Q[22], Q_final[22]);
buf #(`st_delay_seq_taa) (Q[23], Q_final[23]);
buf #(`st_delay_seq_taa) (Q[24], Q_final[24]);
buf #(`st_delay_seq_taa) (Q[25], Q_final[25]);
buf #(`st_delay_seq_taa) (Q[26], Q_final[26]);
buf #(`st_delay_seq_taa) (Q[27], Q_final[27]);
buf #(`st_delay_seq_taa) (Q[28], Q_final[28]);
buf #(`st_delay_seq_taa) (Q[29], Q_final[29]);
buf #(`st_delay_seq_taa) (Q[30], Q_final[30]);
buf #(`st_delay_seq_taa) (Q[31], Q_final[31]);
    
    buf #(`st_delay_seq_taa) (SCTRLO,SCTRLO_temp);
    buf #(`st_delay_seq_taa) (SDLO, SDLO_temp);
    buf #(`st_delay_seq_taa) (SDRO, SDRO_temp);
    
   
    buf #(`st_delay_seq_taa) (SMLO, SMLO_temp);
    buf #(`st_delay_seq_taa) (SMRO, SMRO_temp);
     
    

`else
    
/*--------------------------------------------------------------------
                     TIMING WRAPPER STARTS
---------------------------------------------------------------------*/
integer i;
wire dSLEEP;
wire [bits-1 : 0] dD ;
wire [Addr-1 : 0] dA;

wire [bits-1:0] dM;         
wire dCK,dCSN,dIG ,dSE,dSCTRLI,dSDLI,dSDRI  ,dSMLI,dSMRI   ,dTBYPASS, dWEN;


//Bist wires
wire [Addr-1 :0 ] dTA;
wire dTBIST,dTCSN,dTWEN,dTED,dTOD; 
wire dTEM,dTOM;

reg [bits-1 : 0] Q_int_prev;
reg SCTRLO_final, SCTRLO_prev;
reg SDLO_final, SDLO_prev;
reg SDRO_final, SDRO_prev;





reg SMLO_final, SMLO_prev;
reg SMRO_final, SMRO_prev;


reg [bits-1 : 0] TimingViol_data = 32'b0;
reg [bits-1 : 0] TimingViol_data_last;

reg  [bits-1 : 0] TimingViol_mask = 32'b0;
reg [bits-1 : 0] TimingViol_mask_last;

 reg TimingViol_mask_0;
 reg TimingViol_mask_1;
 reg TimingViol_mask_2;
 reg TimingViol_mask_3;
 reg TimingViol_mask_4;
 reg TimingViol_mask_5;
 reg TimingViol_mask_6;
 reg TimingViol_mask_7;
 reg TimingViol_mask_8;
 reg TimingViol_mask_9;
 reg TimingViol_mask_10;
 reg TimingViol_mask_11;
 reg TimingViol_mask_12;
 reg TimingViol_mask_13;
 reg TimingViol_mask_14;
 reg TimingViol_mask_15;
 reg TimingViol_mask_16;
 reg TimingViol_mask_17;
 reg TimingViol_mask_18;
 reg TimingViol_mask_19;
 reg TimingViol_mask_20;
 reg TimingViol_mask_21;
 reg TimingViol_mask_22;
 reg TimingViol_mask_23;
 reg TimingViol_mask_24;
 reg TimingViol_mask_25;
 reg TimingViol_mask_26;
 reg TimingViol_mask_27;
 reg TimingViol_mask_28;
 reg TimingViol_mask_29;
 reg TimingViol_mask_30;
 reg TimingViol_mask_31;


reg TimingViol_data_0;

reg TimingViol_data_1;

reg TimingViol_data_2;

reg TimingViol_data_3;

reg TimingViol_data_4;

reg TimingViol_data_5;

reg TimingViol_data_6;

reg TimingViol_data_7;

reg TimingViol_data_8;

reg TimingViol_data_9;

reg TimingViol_data_10;

reg TimingViol_data_11;

reg TimingViol_data_12;

reg TimingViol_data_13;

reg TimingViol_data_14;

reg TimingViol_data_15;

reg TimingViol_data_16;

reg TimingViol_data_17;

reg TimingViol_data_18;

reg TimingViol_data_19;

reg TimingViol_data_20;

reg TimingViol_data_21;

reg TimingViol_data_22;

reg TimingViol_data_23;

reg TimingViol_data_24;

reg TimingViol_data_25;

reg TimingViol_data_26;

reg TimingViol_data_27;

reg TimingViol_data_28;

reg TimingViol_data_29;

reg TimingViol_data_30;

reg TimingViol_data_31;

reg TimingViol_addr;
reg TimingViol_CSN, TimingViol_WEN, TimingViol_tbypass;
reg TimingViol_tckh, TimingViol_tckl, TimingViol_tcycle;
reg TimingViol_tckh_se, TimingViol_tckl_se, TimingViol_tcycle_se;
reg TimingViol_sctrli,TimingViol_sdli,TimingViol_sdri,TimingViol_se;



reg TimingViol_smli,TimingViol_smri;



reg TimingViol_initn;
reg TimingViol_ls;
reg TimingViol_hs;
reg TimingViol_sleep;
reg TimingViol_stdby;
reg TimingViol_rm;
reg TimingViol_wm;
reg TimingViol_tbist,TimingViol_ig,TimingViol_atp,TimingViol_TED,TimingViol_TOD,TimingViol_TEM,TimingViol_TOM;
reg TimingViolRRAE,TimingViolRRA;


wire CSTBYPASSN,cond_sdf_tas,cond_sdf_tds,cond_sdf_tms,cond_sdf_tws,cond_sdf_tbas,cond_sdf_tbps,cond_sdf_tbws,cond_sdf_tbdes,cond_sdf_tbdos,cond_sdf_tbmes,cond_sdf_tbmos;
wire SETB_EN,CSIG_EN,MEM_ACT,EN_ADM,CS_EN,CS_ADM,cond_sdf_tps,IG_EN,IG_ADM,cond_sdf_tigs,cond_sdf_taa,cond_sdf_taa_ls1,cond_sdf_taa_hs1,cond_tseq_tm;
wire cond_sdf_tcycle,cond_sdf_tcycle_ls1,cond_sdf_tcycle_hs1,cond_sdf_tcycle_se,cond_sdf_tckl_se,cond_sdf_tsctrlis,cond_sdf_tsdlis,cond_sdf_tsdris;



wire cond_sdf_tsmlis,cond_sdf_tsmris;
wire cond_sdf_taa_smlo_se,cond_sdf_taa_smro_se;
wire cond_sdf_taa_smlo,cond_sdf_taa_smro;


wire cond_sdf_tckh_se,cond_sdf_taa_sctrlo_se,cond_sdf_taa_sdlo_se,cond_sdf_taa_sdro_se;

wire cond_sdf_tckl,cond_sdf_tckh;
wire cond_sdf_ttms,cond_sdf_tbists,INITNandnotSLEEPandATPandnotSE,cond_sdf_taa_sctrlo,cond_sdf_taa_sdlo,cond_sdf_taa_sdro;




wire cond_sdf_taa_tm,cond_sdf_taa_tm_ls1, cond_sdf_taa_tm_hs1,cond_sdf_taa_tckq_tm,cond_sdf_taa_tseq_tm;
wire CSWETBYPASSN;
wire cond_sdf_tstdbys,cond_sdf_tsls,sleep_en,atp_csn_en;
wire cond_sdf_tlss,cond_sdf_thss,cond_sdf_trms,cond_sdf_twms; 
wire cond_sdf_tses,cond_sdf_tinitns;
wire tby_se_en;
wire rra_en;
wire tbist_atp_en;
wire rrae_en;
wire tbist_rrae_en;
wire cond_sdf_trraes;
wire cond_sdf_ttrraes;
wire cond_sdf_taa_trramatch;
wire cond_sdf_ttrraematch;
wire cond_sdf_tamatch;
wire cond_sdf_ttamatch;
wire cond_sdf_tatpmatch;
wire cond_sdf_ttbistmatch;
wire [bits-1 : 0] CSWEMTBYPASS;
 and (CSWEMTBYPASS[0], !M_bmux_reg[0], CSWETBYPASSN);
 and (CSWEMTBYPASS[1], !M_bmux_reg[1], CSWETBYPASSN);
 and (CSWEMTBYPASS[2], !M_bmux_reg[2], CSWETBYPASSN);
 and (CSWEMTBYPASS[3], !M_bmux_reg[3], CSWETBYPASSN);
 and (CSWEMTBYPASS[4], !M_bmux_reg[4], CSWETBYPASSN);
 and (CSWEMTBYPASS[5], !M_bmux_reg[5], CSWETBYPASSN);
 and (CSWEMTBYPASS[6], !M_bmux_reg[6], CSWETBYPASSN);
 and (CSWEMTBYPASS[7], !M_bmux_reg[7], CSWETBYPASSN);
 and (CSWEMTBYPASS[8], !M_bmux_reg[8], CSWETBYPASSN);
 and (CSWEMTBYPASS[9], !M_bmux_reg[9], CSWETBYPASSN);
 and (CSWEMTBYPASS[10], !M_bmux_reg[10], CSWETBYPASSN);
 and (CSWEMTBYPASS[11], !M_bmux_reg[11], CSWETBYPASSN);
 and (CSWEMTBYPASS[12], !M_bmux_reg[12], CSWETBYPASSN);
 and (CSWEMTBYPASS[13], !M_bmux_reg[13], CSWETBYPASSN);
 and (CSWEMTBYPASS[14], !M_bmux_reg[14], CSWETBYPASSN);
 and (CSWEMTBYPASS[15], !M_bmux_reg[15], CSWETBYPASSN);
 and (CSWEMTBYPASS[16], !M_bmux_reg[16], CSWETBYPASSN);
 and (CSWEMTBYPASS[17], !M_bmux_reg[17], CSWETBYPASSN);
 and (CSWEMTBYPASS[18], !M_bmux_reg[18], CSWETBYPASSN);
 and (CSWEMTBYPASS[19], !M_bmux_reg[19], CSWETBYPASSN);
 and (CSWEMTBYPASS[20], !M_bmux_reg[20], CSWETBYPASSN);
 and (CSWEMTBYPASS[21], !M_bmux_reg[21], CSWETBYPASSN);
 and (CSWEMTBYPASS[22], !M_bmux_reg[22], CSWETBYPASSN);
 and (CSWEMTBYPASS[23], !M_bmux_reg[23], CSWETBYPASSN);
 and (CSWEMTBYPASS[24], !M_bmux_reg[24], CSWETBYPASSN);
 and (CSWEMTBYPASS[25], !M_bmux_reg[25], CSWETBYPASSN);
 and (CSWEMTBYPASS[26], !M_bmux_reg[26], CSWETBYPASSN);
 and (CSWEMTBYPASS[27], !M_bmux_reg[27], CSWETBYPASSN);
 and (CSWEMTBYPASS[28], !M_bmux_reg[28], CSWETBYPASSN);
 and (CSWEMTBYPASS[29], !M_bmux_reg[29], CSWETBYPASSN);
 and (CSWEMTBYPASS[30], !M_bmux_reg[30], CSWETBYPASSN);
 and (CSWEMTBYPASS[31], !M_bmux_reg[31], CSWETBYPASSN);

buf (rta_en_cond, 1'b0);
buf (rta_en_cond_reg, 1'b0);


assign IGint = ((ATP_buf === 1'bx) || (ATP_buf===1'b1 && SE_buf === 1'bx)) ? 1'bx : IG_buf;
and (atp_csn_en,!ATP_buf,!IO.CSN_bmux,!IGint,!rta_en_cond);
or (sleep_en,atp_csn_en,ATP_buf);
or (SETB_EN,IO.SEint,TBIST_buf);
and (ATP_SETB_EN,ATP_buf,SETB_EN); 
or (CSIG_EN,IGint,IO.CSN_bmux,rta_en_cond);
and (MEM_ACT,!ATP_buf,CSIG_EN);
or (EN_ADM,MEM_ACT,ATP_SETB_EN);
or (ig_rta_en, IGint, rta_en_cond);
and (CS_EN,!ATP_buf,ig_rta_en);
or (CS_ADM,CS_EN,ATP_SETB_EN);
and (atp_ig_csn_en,!ATP_buf,!IO.CSN_bmux,!IGint,!rta_en_cond);
and (atp_se_en,!SE_buf,ATP_buf);
or (cycle_en,atp_ig_csn_en,atp_se_en);
and (atp_ig_csn_en_reg,!ATP_reg,!CSN_reg,!IG_reg,!rta_en_cond_reg);
and (atp_se_en_reg,!SE_reg,ATP_reg);
or (cycle_en_reg,atp_ig_csn_en,atp_se_en);
and (INITNandnotSLEEPandATPandnotSE,cond_gac,!SE_buf,ATP_buf);
and (csn_ig_en,!IGint,!IO.CSN_bmux);
and (atp_tby_ls_en,atp_se_en,cond_ls_tby_en);
and (IG_EN,!ATP_buf,!IO.CSN_bmux,!rta_en_cond);
or (IG_ADM,IG_EN,atp_se_en);
and (CSWETBYPASSN, !WEN_bmux_reg, 1'b1);



assign cond_sdf_tsls=((sleep_en && INITN_buf && !STDBY_buf) !==0) ? 1:0;
assign cond_sdf_tstdbys=((sleep_en && INITN_buf && !SLEEP_buf) !==0) ? 1:0;
assign cond_sdf_atps=((INITN_buf && !SLEEP_buf && !STDBY_buf) !==0) ? 1:0;
assign cond_gac=((INITN_buf && !SLEEP_buf && !STDBY_buf) !==0) ? 1:0;
assign cond_sdf_tas=((cond_gac && !EN_ADM) !==0) ? 1:0;
assign cond_sdf_tds=((cond_gac && !EN_ADM) !==0) ? 1:0;
assign cond_sdf_tms=((cond_gac && !EN_ADM) !==0) ? 1:0;
assign cond_sdf_tws=((cond_gac && !EN_ADM) !==0) ? 1:0;
assign cond_sdf_tps=((cond_gac && !CS_ADM) !==0) ? 1:0;
assign cond_sdf_tcycle=((cond_gac && cycle_en && !LS_buf && !HS_buf) !==0) ? 1:0;  
assign cond_sdf_tcycle_ls1=((cond_gac && cycle_en && LS_buf && !HS_buf) !==0) ? 1:0;
assign cond_sdf_tcycle_hs1=((cond_gac && cycle_en && !LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_tcycle_ls1_hs1=((cond_gac && cycle_en && LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_tckh=((cond_gac && cycle_en_reg) !==0) ? 1:0;
assign cond_sdf_tckl=((cond_gac && cycle_en) !==0) ? 1:0;
assign cond_sdf_tcycle_se=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tckl_se=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tsctrlis=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tsdlis=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tsdris=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;


assign cond_sdf_tsmlis=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tsmris=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;






assign cond_sdf_tckh_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sctrlo_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sdlo_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sdro_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;

assign cond_sdf_taa_smlo_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_smro_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;

assign cond_sdf_ttms=((cond_gac && !SE_buf && ATP_buf) !==0) ? 1:0;
assign cond_sdf_tbists=((cond_gac && !SE_buf && ATP_buf) !==0) ? 1:0;
assign cond_sdf_taa_sctrlo=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sdlo=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sdro=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_smlo=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_smro=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;



assign cond_sdf_taa_tckq_tm=((cond_gac && SE_reg && ATP_reg && TBYPASS_buf) !==0) ? 1:0;
assign cond_ls_en=((atp_ig_csn_en || atp_tby_ls_en) !==0) ? 1:0;
assign cond_sdf_tlss=((cond_ls_en && cond_gac) !==0) ? 1:0;
assign cond_sdf_thss=((cond_ls_en && cond_gac) !==0) ? 1:0;
assign cond_sdf_trms=((cond_gac && !IO.CSN_bmux && !IO.TBYPASSint && !IO.SEint && !IGint && !DE_temp && !rta_en_cond) !==0) ? 1:0; 
assign cond_sdf_twms=((cond_gac && !IO.CSN_bmux && !IO.TBYPASSint && !IO.SEint && !IGint && !DE_temp && !rta_en_cond) !==0) ? 1:0; 
assign cond_sdf_tses=((cond_gac && ATP_buf) !==0) ? 1:0;
assign cond_sdf_tbas=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbps=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbws=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbdes=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbdos=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbmes=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbmos=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tigs=((cond_gac && IG_ADM) !==0) ? 1:0;
assign cond_sdf_taa=((MEMEN_reg && WEN_bmux_reg && !LS_buf && !HS_buf && !rta_en_cond) !==0) ? 1:0; 
assign cond_sdf_taa_ls1=((MEMEN_reg && WEN_bmux_reg && LS_buf && !HS_buf) !==0) ? 1:0; 
assign cond_sdf_taa_hs1=((MEMEN_reg && WEN_bmux_reg && !LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_ls1_hs1=((MEMEN_reg && WEN_bmux_reg && LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tm=((INITNandnotSLEEPandATPandnotSE && TBYPASS_buf && !LS_buf && !HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tm_ls1=((INITNandnotSLEEPandATPandnotSE && TBYPASS_buf && LS_buf && !HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tm_hs1=((INITNandnotSLEEPandATPandnotSE && TBYPASS_buf && !LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tm_ls1_hs1=((INITNandnotSLEEPandATPandnotSE && TBYPASS_buf && LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tseq_tm=((cond_gac && ATP_buf && IO.TBYPASSint) !==0) ? 1:0;

assign cond_sdf_tinitns =(( sleep_en && !STDBY_buf && !SLEEP_buf) !==0) ? 1:0;
assign cond_ls_tby_en=((TBYPASS_buf || csn_ig_en) !==0) ? 1:0;



//specify block begins

specify
    specparam
    
         PATHPULSE$CK$Q = 0,
         PATHPULSE$CK$SCTRLO = 0,
         PATHPULSE$CK$SDLO = 0,
         PATHPULSE$CK$SDRO = 0,
    
        
         PATHPULSE$CK$SMLO = 0,
         PATHPULSE$CK$SMRO = 0,
     
         PATHPULSE$SE$Q = 0,
         

                 
         tlss = 0.0,
         tlsh = 0.0, 
        
         thss = 0.0,
         thsh = 0.0 , 
         tsls = 0.0,
         tslh = 0.0 ,
         tstdbys = 0.0,
         tstdbyh = 0.0 , 
         tcycle = 0.0,
	 
        
         tms = 0.0,
         tmh = 0.0 , 
         tsmlis = 0.0,
         tsmlih = 0.0 ,
         tsmris = 0.0,
         tsmrih = 0.0 ,
 


         
         tcycle_ls1 = 0.0,         
         
         tcycle_hs1 = 0.0,         
         
         tcycle_ls1_hs1 = 0.0,
         tckh = 0.0,
         tckl = 0.0,
         tcycle_se = 0.0,
         tckh_se = 0.0,
         tckl_se = 0.0,
         
         ttms = 0.0,
         ttmh = 0.0 ,
         tps = 0.0,
         tph = 0.0 ,
         tws = 0.0,
         twh = 0.0 ,
         tds = 0.0,
         tdh = 0.0, 
         tas = 0.0,
         tah = 0.0,
         
         tses = 0.0,
         tseh = 0.0 ,
         tsctrlis = 0.0,
         tsctrlih = 0.0,
         tsdlis = 0.0,
         tsdlih = 0.0 ,
         tsdris = 0.0,
         tsdrih = 0.0 , 

         tbists = 0.0,
         tbisth = 0.0 ,
         tbps = 0.0,
         tbph = 0.0 ,
         tbws = 0.0,
         tbwh = 0.0 ,
         tbdes = 0.0,
         tbdeh = 0.0 ,
         tbdos = 0.0,
         tbdoh = 0.0 ,
        
         tbmes = 0.0,
         tbmeh = 0.0 ,
         tbmos = 0.0,
         tbmoh = 0.0 ,  
         tbas = 0.0,
         tbah = 0.0 ,
         
         
         tinitns = 0.0,
         tinitnh = 0.0,
         tatps = 0.0,
         tatph = 0.0,
         tigs = 0.0,
         tigh = 0.0,
         
         
         trms = 0.0,
         trmh = 0.0 ,
         twms = 0.0,
         twmh = 0.0 ,


/*************************************************************************************************/
         taa =`st_delay_seq_taa,
         th = `st_delay_seq_th,


         taa_ls1 =`st_delay_seq_taa,
         th_ls1 = `st_delay_seq_th,

         taa_hs1 =`st_delay_seq_taa,
         th_hs1 = `st_delay_seq_th, 

         taa_ls1_hs1 =`st_delay_seq_taa,
         th_ls1_hs1 = `st_delay_seq_th, 


         taa_tm =`st_delay_seq_taa,
         th_tm = `st_delay_seq_th,

         taa_tm_ls1 =`st_delay_seq_taa,
         th_tm_ls1 = `st_delay_seq_th,

         taa_tm_hs1 =`st_delay_seq_taa,
         th_tm_hs1 = `st_delay_seq_th,         

         taa_tm_ls1_hs1 =`st_delay_seq_taa,
         th_tm_ls1_hs1 = `st_delay_seq_th,         
         taa_tseq_tm =`st_delay_seq_taa,
         th_tseq_tm = `st_delay_seq_th,
         taa_tckq_tm   = `st_delay_seq_taa,
         th_tckq_tm    = `st_delay_seq_th,
         taa_sctrlo =`st_delay_seq_taa,
         th_sctrlo = `st_delay_seq_th,
         taa_sdlo =`st_delay_seq_taa,
         th_sdlo = `st_delay_seq_th,
         taa_sdro =`st_delay_seq_taa,
         th_sdro = `st_delay_seq_th,
         


         taa_smlo =`st_delay_seq_taa,
         th_smlo = `st_delay_seq_th,
         taa_smro =`st_delay_seq_taa,
         th_smro = `st_delay_seq_th,
         taa_smlo_se =`st_delay_seq_taa,
         th_smlo_se = `st_delay_seq_th,
         taa_smro_se =`st_delay_seq_taa,
         th_smro_se = `st_delay_seq_th, 
 
       taa_sctrlo_se =`st_delay_seq_taa,
         th_sctrlo_se = `st_delay_seq_th,
         taa_sdlo_se =`st_delay_seq_taa,
         th_sdlo_se = `st_delay_seq_th,
         taa_sdro_se =`st_delay_seq_taa,
         th_sdro_se = `st_delay_seq_th;
     


/*---------------------- Timing Checks ---------------------*/

	$setup(posedge A[0], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[1], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[2], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[3], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[4], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[5], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[6], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[7], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[8], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[9], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[0], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[1], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[2], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[3], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[4], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[5], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[6], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[7], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[8], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[9], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[0], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[1], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[2], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[3], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[4], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[5], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[6], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[7], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[8], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[9], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[0], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[1], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[2], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[3], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[4], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[5], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[6], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[7], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[8], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[9], tah, TimingViol_addr);


	$setup(posedge D[0], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_0);
	$setup(posedge D[1], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_1);
	$setup(posedge D[2], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_2);
	$setup(posedge D[3], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_3);
	$setup(posedge D[4], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_4);
	$setup(posedge D[5], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_5);
	$setup(posedge D[6], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_6);
	$setup(posedge D[7], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_7);
	$setup(posedge D[8], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_8);
	$setup(posedge D[9], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_9);
	$setup(posedge D[10], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_10);
	$setup(posedge D[11], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_11);
	$setup(posedge D[12], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_12);
	$setup(posedge D[13], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_13);
	$setup(posedge D[14], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_14);
	$setup(posedge D[15], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_15);
	$setup(posedge D[16], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_16);
	$setup(posedge D[17], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_17);
	$setup(posedge D[18], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_18);
	$setup(posedge D[19], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_19);
	$setup(posedge D[20], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_20);
	$setup(posedge D[21], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_21);
	$setup(posedge D[22], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_22);
	$setup(posedge D[23], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_23);
	$setup(posedge D[24], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_24);
	$setup(posedge D[25], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_25);
	$setup(posedge D[26], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_26);
	$setup(posedge D[27], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_27);
	$setup(posedge D[28], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_28);
	$setup(posedge D[29], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_29);
	$setup(posedge D[30], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_30);
	$setup(posedge D[31], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_31);
	$setup(negedge D[0], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_0);
	$setup(negedge D[1], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_1);
	$setup(negedge D[2], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_2);
	$setup(negedge D[3], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_3);
	$setup(negedge D[4], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_4);
	$setup(negedge D[5], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_5);
	$setup(negedge D[6], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_6);
	$setup(negedge D[7], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_7);
	$setup(negedge D[8], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_8);
	$setup(negedge D[9], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_9);
	$setup(negedge D[10], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_10);
	$setup(negedge D[11], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_11);
	$setup(negedge D[12], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_12);
	$setup(negedge D[13], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_13);
	$setup(negedge D[14], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_14);
	$setup(negedge D[15], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_15);
	$setup(negedge D[16], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_16);
	$setup(negedge D[17], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_17);
	$setup(negedge D[18], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_18);
	$setup(negedge D[19], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_19);
	$setup(negedge D[20], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_20);
	$setup(negedge D[21], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_21);
	$setup(negedge D[22], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_22);
	$setup(negedge D[23], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_23);
	$setup(negedge D[24], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_24);
	$setup(negedge D[25], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_25);
	$setup(negedge D[26], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_26);
	$setup(negedge D[27], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_27);
	$setup(negedge D[28], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_28);
	$setup(negedge D[29], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_29);
	$setup(negedge D[30], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_30);
	$setup(negedge D[31], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_31);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[0], tdh, TimingViol_data_0);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[1], tdh, TimingViol_data_1);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[2], tdh, TimingViol_data_2);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[3], tdh, TimingViol_data_3);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[4], tdh, TimingViol_data_4);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[5], tdh, TimingViol_data_5);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[6], tdh, TimingViol_data_6);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[7], tdh, TimingViol_data_7);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[8], tdh, TimingViol_data_8);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[9], tdh, TimingViol_data_9);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[10], tdh, TimingViol_data_10);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[11], tdh, TimingViol_data_11);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[12], tdh, TimingViol_data_12);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[13], tdh, TimingViol_data_13);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[14], tdh, TimingViol_data_14);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[15], tdh, TimingViol_data_15);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[16], tdh, TimingViol_data_16);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[17], tdh, TimingViol_data_17);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[18], tdh, TimingViol_data_18);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[19], tdh, TimingViol_data_19);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[20], tdh, TimingViol_data_20);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[21], tdh, TimingViol_data_21);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[22], tdh, TimingViol_data_22);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[23], tdh, TimingViol_data_23);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[24], tdh, TimingViol_data_24);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[25], tdh, TimingViol_data_25);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[26], tdh, TimingViol_data_26);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[27], tdh, TimingViol_data_27);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[28], tdh, TimingViol_data_28);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[29], tdh, TimingViol_data_29);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[30], tdh, TimingViol_data_30);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[31], tdh, TimingViol_data_31);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[0], tdh, TimingViol_data_0);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[1], tdh, TimingViol_data_1);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[2], tdh, TimingViol_data_2);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[3], tdh, TimingViol_data_3);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[4], tdh, TimingViol_data_4);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[5], tdh, TimingViol_data_5);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[6], tdh, TimingViol_data_6);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[7], tdh, TimingViol_data_7);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[8], tdh, TimingViol_data_8);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[9], tdh, TimingViol_data_9);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[10], tdh, TimingViol_data_10);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[11], tdh, TimingViol_data_11);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[12], tdh, TimingViol_data_12);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[13], tdh, TimingViol_data_13);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[14], tdh, TimingViol_data_14);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[15], tdh, TimingViol_data_15);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[16], tdh, TimingViol_data_16);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[17], tdh, TimingViol_data_17);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[18], tdh, TimingViol_data_18);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[19], tdh, TimingViol_data_19);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[20], tdh, TimingViol_data_20);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[21], tdh, TimingViol_data_21);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[22], tdh, TimingViol_data_22);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[23], tdh, TimingViol_data_23);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[24], tdh, TimingViol_data_24);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[25], tdh, TimingViol_data_25);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[26], tdh, TimingViol_data_26);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[27], tdh, TimingViol_data_27);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[28], tdh, TimingViol_data_28);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[29], tdh, TimingViol_data_29);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[30], tdh, TimingViol_data_30);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[31], tdh, TimingViol_data_31);



        $setup(posedge M[0], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_0);
	$setup(negedge M[0], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_0);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[0], tmh, TimingViol_mask_0);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[0], tmh, TimingViol_mask_0);

        $setup(posedge M[1], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_1);
	$setup(negedge M[1], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_1);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[1], tmh, TimingViol_mask_1);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[1], tmh, TimingViol_mask_1);

        $setup(posedge M[2], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_2);
	$setup(negedge M[2], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_2);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[2], tmh, TimingViol_mask_2);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[2], tmh, TimingViol_mask_2);

        $setup(posedge M[3], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_3);
	$setup(negedge M[3], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_3);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[3], tmh, TimingViol_mask_3);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[3], tmh, TimingViol_mask_3);

        $setup(posedge M[4], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_4);
	$setup(negedge M[4], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_4);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[4], tmh, TimingViol_mask_4);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[4], tmh, TimingViol_mask_4);

        $setup(posedge M[5], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_5);
	$setup(negedge M[5], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_5);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[5], tmh, TimingViol_mask_5);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[5], tmh, TimingViol_mask_5);

        $setup(posedge M[6], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_6);
	$setup(negedge M[6], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_6);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[6], tmh, TimingViol_mask_6);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[6], tmh, TimingViol_mask_6);

        $setup(posedge M[7], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_7);
	$setup(negedge M[7], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_7);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[7], tmh, TimingViol_mask_7);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[7], tmh, TimingViol_mask_7);

        $setup(posedge M[8], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_8);
	$setup(negedge M[8], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_8);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[8], tmh, TimingViol_mask_8);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[8], tmh, TimingViol_mask_8);

        $setup(posedge M[9], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_9);
	$setup(negedge M[9], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_9);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[9], tmh, TimingViol_mask_9);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[9], tmh, TimingViol_mask_9);

        $setup(posedge M[10], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_10);
	$setup(negedge M[10], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_10);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[10], tmh, TimingViol_mask_10);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[10], tmh, TimingViol_mask_10);

        $setup(posedge M[11], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_11);
	$setup(negedge M[11], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_11);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[11], tmh, TimingViol_mask_11);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[11], tmh, TimingViol_mask_11);

        $setup(posedge M[12], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_12);
	$setup(negedge M[12], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_12);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[12], tmh, TimingViol_mask_12);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[12], tmh, TimingViol_mask_12);

        $setup(posedge M[13], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_13);
	$setup(negedge M[13], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_13);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[13], tmh, TimingViol_mask_13);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[13], tmh, TimingViol_mask_13);

        $setup(posedge M[14], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_14);
	$setup(negedge M[14], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_14);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[14], tmh, TimingViol_mask_14);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[14], tmh, TimingViol_mask_14);

        $setup(posedge M[15], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_15);
	$setup(negedge M[15], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_15);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[15], tmh, TimingViol_mask_15);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[15], tmh, TimingViol_mask_15);

        $setup(posedge M[16], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_16);
	$setup(negedge M[16], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_16);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[16], tmh, TimingViol_mask_16);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[16], tmh, TimingViol_mask_16);

        $setup(posedge M[17], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_17);
	$setup(negedge M[17], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_17);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[17], tmh, TimingViol_mask_17);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[17], tmh, TimingViol_mask_17);

        $setup(posedge M[18], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_18);
	$setup(negedge M[18], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_18);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[18], tmh, TimingViol_mask_18);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[18], tmh, TimingViol_mask_18);

        $setup(posedge M[19], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_19);
	$setup(negedge M[19], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_19);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[19], tmh, TimingViol_mask_19);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[19], tmh, TimingViol_mask_19);

        $setup(posedge M[20], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_20);
	$setup(negedge M[20], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_20);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[20], tmh, TimingViol_mask_20);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[20], tmh, TimingViol_mask_20);

        $setup(posedge M[21], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_21);
	$setup(negedge M[21], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_21);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[21], tmh, TimingViol_mask_21);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[21], tmh, TimingViol_mask_21);

        $setup(posedge M[22], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_22);
	$setup(negedge M[22], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_22);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[22], tmh, TimingViol_mask_22);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[22], tmh, TimingViol_mask_22);

        $setup(posedge M[23], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_23);
	$setup(negedge M[23], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_23);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[23], tmh, TimingViol_mask_23);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[23], tmh, TimingViol_mask_23);

        $setup(posedge M[24], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_24);
	$setup(negedge M[24], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_24);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[24], tmh, TimingViol_mask_24);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[24], tmh, TimingViol_mask_24);

        $setup(posedge M[25], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_25);
	$setup(negedge M[25], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_25);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[25], tmh, TimingViol_mask_25);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[25], tmh, TimingViol_mask_25);

        $setup(posedge M[26], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_26);
	$setup(negedge M[26], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_26);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[26], tmh, TimingViol_mask_26);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[26], tmh, TimingViol_mask_26);

        $setup(posedge M[27], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_27);
	$setup(negedge M[27], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_27);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[27], tmh, TimingViol_mask_27);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[27], tmh, TimingViol_mask_27);

        $setup(posedge M[28], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_28);
	$setup(negedge M[28], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_28);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[28], tmh, TimingViol_mask_28);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[28], tmh, TimingViol_mask_28);

        $setup(posedge M[29], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_29);
	$setup(negedge M[29], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_29);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[29], tmh, TimingViol_mask_29);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[29], tmh, TimingViol_mask_29);

        $setup(posedge M[30], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_30);
	$setup(negedge M[30], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_30);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[30], tmh, TimingViol_mask_30);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[30], tmh, TimingViol_mask_30);

        $setup(posedge M[31], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_31);
	$setup(negedge M[31], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_31);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[31], tmh, TimingViol_mask_31);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[31], tmh, TimingViol_mask_31);



        $setup(posedge WEN, posedge CK &&& cond_sdf_tws, tws, TimingViol_WEN);
        $setup(negedge WEN, posedge CK &&& cond_sdf_tws, tws, TimingViol_WEN);
        $hold(posedge CK &&& cond_sdf_tws, posedge WEN, twh, TimingViol_WEN);
        $hold(posedge CK &&& cond_sdf_tws, negedge WEN, twh, TimingViol_WEN);
        $setup(posedge CSN, posedge CK &&& cond_sdf_tps, tps, TimingViol_CSN);
	$setup(negedge CSN, posedge CK &&& cond_sdf_tps, tps, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tps, posedge CSN, tph, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tps, negedge CSN, tph, TimingViol_CSN);
        $period(posedge CK &&& cond_sdf_tcycle, tcycle, TimingViol_tcycle);  


        $period(posedge CK &&& cond_sdf_tcycle_ls1, tcycle_ls1, TimingViol_tcycle); 

        $period(posedge CK &&& cond_sdf_tcycle_hs1, tcycle_hs1, TimingViol_tcycle); 

        $period(posedge CK &&& cond_sdf_tcycle_ls1_hs1, tcycle_ls1_hs1, TimingViol_tcycle); 

        $width(posedge CK  &&& cond_sdf_tckh, tckh, 0, TimingViol_tckh);
        $width(negedge CK  &&& cond_sdf_tckl, tckl, 0, TimingViol_tckl);
        $period(posedge CK &&& cond_sdf_tcycle_se, tcycle_se, TimingViol_tcycle_se);
        $width(posedge CK  &&& cond_sdf_tckh_se, tckh_se, 0, TimingViol_tckh_se);
        $width(negedge CK  &&& cond_sdf_tckl_se, tckl_se, 0, TimingViol_tckl_se);

        $setup(posedge TBYPASS, posedge CK &&& cond_sdf_ttms,ttms, TimingViol_tbypass);
        $setup(negedge TBYPASS, posedge CK &&& cond_sdf_ttms,ttms, TimingViol_tbypass);
        $hold(posedge CK &&& cond_sdf_ttms, posedge TBYPASS, ttmh, TimingViol_tbypass); 
        $hold(posedge CK &&& cond_sdf_ttms, negedge TBYPASS, ttmh, TimingViol_tbypass); 
 


        $setup(posedge LS, posedge CK &&& cond_sdf_tlss,tlss, TimingViol_ls);
        $setup(negedge LS, posedge CK &&& cond_sdf_tlss,tlss, TimingViol_ls);
        $hold(posedge CK &&& cond_sdf_tlss, posedge LS, tlsh, TimingViol_ls); 
        $hold(posedge CK &&& cond_sdf_tlss, negedge LS, tlsh, TimingViol_ls); 


        $setup(posedge HS, posedge CK &&& cond_sdf_thss,thss, TimingViol_hs);
        $setup(negedge HS, posedge CK &&& cond_sdf_thss,thss, TimingViol_hs);
        $hold(posedge CK &&& cond_sdf_thss, posedge HS, thsh, TimingViol_hs); 
        $hold(posedge CK &&& cond_sdf_thss, negedge HS, thsh, TimingViol_hs); 


        $setup(posedge STDBY, posedge CK &&& cond_sdf_tstdbys, tstdbys, TimingViol_stdby);
        $setup(negedge STDBY, posedge CK &&& cond_sdf_tstdbys, tstdbys, TimingViol_stdby);
        $hold(posedge CK &&& cond_sdf_tstdbys, posedge STDBY, tstdbyh, TimingViol_stdby);        
        $hold(posedge CK &&& cond_sdf_tstdbys, negedge STDBY, tstdbyh, TimingViol_stdby); 
        
        
        $setup (posedge SE ,posedge CK &&& cond_sdf_tses,tses,TimingViol_se);
	$setup (negedge SE ,posedge CK &&& cond_sdf_tses,tses,TimingViol_se);
        
        $hold (posedge CK &&& cond_sdf_tses, posedge SE ,tseh,TimingViol_se);
	$hold (posedge CK &&& cond_sdf_tses, negedge SE ,tseh,TimingViol_se);
        
        $setup(posedge SCTRLI, posedge CK  &&& cond_sdf_tsctrlis , tsctrlis, TimingViol_sctrli);
        $setup(negedge SCTRLI, posedge CK  &&& cond_sdf_tsctrlis, tsctrlis, TimingViol_sctrli);
        $hold(posedge CK &&& cond_sdf_tsctrlis , posedge SCTRLI, tsctrlih, TimingViol_sctrli);        
        $hold(posedge CK &&& cond_sdf_tsctrlis , negedge SCTRLI, tsctrlih, TimingViol_sctrli);

        $setup(posedge SDLI, posedge CK &&& cond_sdf_tsdlis, tsdlis, TimingViol_sdli);
        $setup(negedge SDLI, posedge CK &&& cond_sdf_tsdlis, tsdlis, TimingViol_sdli);
        $hold(posedge CK &&& cond_sdf_tsdlis, posedge SDLI, tsdlih, TimingViol_sdli);        
        $hold(posedge CK &&& cond_sdf_tsdlis, negedge SDLI, tsdlih, TimingViol_sdli);

     

        $setup(posedge SDRI, posedge CK &&& cond_sdf_tsdris, tsdris, TimingViol_sdri);
        $setup(negedge SDRI, posedge CK &&& cond_sdf_tsdris, tsdris, TimingViol_sdri);
        $hold(posedge CK &&& cond_sdf_tsdris, posedge SDRI, tsdrih, TimingViol_sdri);        
        $hold(posedge CK &&& cond_sdf_tsdris, negedge SDRI, tsdrih, TimingViol_sdri);
        
 
        $setup(posedge SMLI, posedge CK &&& cond_sdf_tsmlis, tsmlis, TimingViol_smli);
        $setup(negedge SMLI, posedge CK &&& cond_sdf_tsmlis, tsmlis, TimingViol_smli);
        $hold(posedge CK &&& cond_sdf_tsmlis, posedge SMLI, tsmlih, TimingViol_smli);        
        $hold(posedge CK &&& cond_sdf_tsmlis, negedge SMLI, tsmlih, TimingViol_smli);

        $setup(posedge SMRI, posedge CK &&& cond_sdf_tsmris, tsmris, TimingViol_smri);
        $setup(negedge SMRI, posedge CK &&& cond_sdf_tsmris, tsmris, TimingViol_smri);
        $hold(posedge CK &&& cond_sdf_tsmris, posedge SMRI, tsmrih, TimingViol_smri);        
        $hold(posedge CK &&& cond_sdf_tsmris, negedge SMRI, tsmrih, TimingViol_smri);

      
        	
         
        
        $setup(posedge INITN, posedge CK &&& cond_sdf_tinitns, tinitns, TimingViol_initn);
        $setup(negedge INITN, posedge CK &&& cond_sdf_tinitns, tinitns, TimingViol_initn);
        
        $hold (posedge CK &&& cond_sdf_tinitns,posedge INITN, tinitnh, TimingViol_initn);
        $hold (posedge CK &&& cond_sdf_tinitns,negedge INITN, tinitnh, TimingViol_initn);

        $setup(posedge ATP, posedge CK &&& cond_sdf_atps , tatps, TimingViol_atp);
        $setup(negedge ATP, posedge CK &&& cond_sdf_atps , tatps, TimingViol_atp);
        $hold(posedge CK &&& cond_sdf_atps, posedge ATP, tatph, TimingViol_atp);        
        $hold(posedge CK &&& cond_sdf_atps, negedge ATP, tatph, TimingViol_atp);
        
        $setup(posedge IG, posedge CK &&& cond_sdf_tigs , tigs, TimingViol_ig);
        $setup(negedge IG, posedge CK &&& cond_sdf_tigs , tigs, TimingViol_ig);
        $hold(posedge CK &&& cond_sdf_tigs, posedge IG, tigh, TimingViol_ig);        
        $hold(posedge CK &&& cond_sdf_tigs, negedge IG, tigh, TimingViol_ig);



         
$setup(posedge RM[0], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[1], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[2], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[3], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[0], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[1], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[2], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[3], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[0], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[1], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[2], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[3], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[0], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[1], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[2], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[3], trmh, TimingViol_rm); 

        
$setup(posedge WM[0], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(posedge WM[1], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(posedge WM[2], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(posedge WM[3], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(negedge WM[0], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(negedge WM[1], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(negedge WM[2], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(negedge WM[3], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, posedge WM[0], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, posedge WM[1], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, posedge WM[2], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, posedge WM[3], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, negedge WM[0], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, negedge WM[1], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, negedge WM[2], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, negedge WM[3], twmh, TimingViol_wm);
 
        
        $setup(posedge TBIST, posedge CK &&& cond_sdf_tbists , tbists, TimingViol_tbist);
        $setup(negedge TBIST, posedge CK &&& cond_sdf_tbists , tbists, TimingViol_tbist);
        $hold(posedge CK &&& cond_sdf_tbists, posedge TBIST, tbisth, TimingViol_tbist);        
        $hold(posedge CK &&& cond_sdf_tbists, negedge TBIST, tbisth, TimingViol_tbist);


       	$setup(posedge TA[0], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[1], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[2], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[3], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[4], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[5], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[6], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[7], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[8], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[9], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
       	$setup(negedge TA[0], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[1], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[2], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[3], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[4], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[5], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[6], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[7], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[8], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[9], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
       	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[0], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[1], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[2], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[3], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[4], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[5], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[6], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[7], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[8], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[9], tbah, TimingViol_addr);
       	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[0], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[1], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[2], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[3], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[4], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[5], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[6], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[7], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[8], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[9], tbah, TimingViol_addr);


        $setup(posedge TCSN, posedge CK &&& cond_sdf_tbps, tbps, TimingViol_CSN);
	$setup(negedge TCSN, posedge CK &&& cond_sdf_tbps, tbps, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tbps, posedge TCSN, tbph, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tbps, negedge TCSN, tbph, TimingViol_CSN); 
       
        $setup(posedge TWEN, posedge CK &&& cond_sdf_tbws, tbws, TimingViol_WEN);
        $setup(negedge TWEN, posedge CK &&& cond_sdf_tbws, tbws, TimingViol_WEN);
        $hold(posedge CK &&& cond_sdf_tbws, posedge TWEN, tbwh, TimingViol_WEN);
        $hold(posedge CK &&& cond_sdf_tbws, negedge TWEN, tbwh, TimingViol_WEN);
       
       
        $setup(posedge TED, posedge CK &&& cond_sdf_tbdes, tbdes, TimingViol_TED);
        $setup(negedge TED, posedge CK &&& cond_sdf_tbdes, tbdes, TimingViol_TED);
        $hold(posedge CK &&& cond_sdf_tbdes, posedge TED, tbdeh, TimingViol_TED);
        $hold(posedge CK &&& cond_sdf_tbdes, negedge TED, tbdeh, TimingViol_TED);

        $setup(posedge TOD, posedge CK &&& cond_sdf_tbdos, tbdos, TimingViol_TOD);
        $setup(negedge TOD, posedge CK &&& cond_sdf_tbdos, tbdos, TimingViol_TOD);
        $hold(posedge CK &&& cond_sdf_tbdos, posedge TOD, tbdoh, TimingViol_TOD);
        $hold(posedge CK &&& cond_sdf_tbdos, negedge TOD, tbdoh, TimingViol_TOD);

        $setup(posedge TEM, posedge CK &&& cond_sdf_tbmes, tbmes, TimingViol_TEM);
        $setup(negedge TEM, posedge CK &&& cond_sdf_tbmes, tbmes, TimingViol_TEM);
        $hold(posedge CK &&& cond_sdf_tbmes, posedge TEM, tbmeh, TimingViol_TEM);
        $hold(posedge CK &&& cond_sdf_tbmes, negedge TEM, tbmeh, TimingViol_TEM);

        $setup(posedge TOM, posedge CK &&& cond_sdf_tbmos, tbmos, TimingViol_TOM);
        $setup(negedge TOM, posedge CK &&& cond_sdf_tbmos, tbmos, TimingViol_TOM);
        $hold(posedge CK &&& cond_sdf_tbmos, posedge TOM, tbmoh, TimingViol_TOM);
        $hold(posedge CK &&& cond_sdf_tbmos, negedge TOM, tbmoh, TimingViol_TOM);
       
          


          

          /*-------------------- Propagation Delays ------------------*/
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa, taa, th, taa, th, taa);
                 


/* // //	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[0] +: Q_final[0])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[1] +: Q_final[1])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[2] +: Q_final[2])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[3] +: Q_final[3])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[4] +: Q_final[4])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[5] +: Q_final[5])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[6] +: Q_final[6])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[7] +: Q_final[7])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[8] +: Q_final[8])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[9] +: Q_final[9])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[10] +: Q_final[10])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[11] +: Q_final[11])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[12] +: Q_final[12])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[13] +: Q_final[13])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[14] +: Q_final[14])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[15] +: Q_final[15])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[16] +: Q_final[16])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[17] +: Q_final[17])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[18] +: Q_final[18])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[19] +: Q_final[19])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[20] +: Q_final[20])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[21] +: Q_final[21])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[22] +: Q_final[22])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[23] +: Q_final[23])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[24] +: Q_final[24])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[25] +: Q_final[25])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[26] +: Q_final[26])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[27] +: Q_final[27])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[28] +: Q_final[28])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[29] +: Q_final[29])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[30] +: Q_final[30])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[31] +: Q_final[31])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q); */ 


	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                 




	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                



	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                




	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                




	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                




	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                




	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                



	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[0] +: Q_final[0])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[1] +: Q_final[1])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[2] +: Q_final[2])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[3] +: Q_final[3])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[4] +: Q_final[4])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[5] +: Q_final[5])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[6] +: Q_final[6])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[7] +: Q_final[7])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[8] +: Q_final[8])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[9] +: Q_final[9])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[10] +: Q_final[10])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[11] +: Q_final[11])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[12] +: Q_final[12])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[13] +: Q_final[13])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[14] +: Q_final[14])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[15] +: Q_final[15])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[16] +: Q_final[16])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[17] +: Q_final[17])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[18] +: Q_final[18])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[19] +: Q_final[19])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[20] +: Q_final[20])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[21] +: Q_final[21])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[22] +: Q_final[22])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[23] +: Q_final[23])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[24] +: Q_final[24])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[25] +: Q_final[25])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[26] +: Q_final[26])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[27] +: Q_final[27])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[28] +: Q_final[28])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[29] +: Q_final[29])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[30] +: Q_final[30])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[31] +: Q_final[31])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                 

	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[0] +: Q_final[0])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[1] +: Q_final[1])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[2] +: Q_final[2])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[3] +: Q_final[3])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[4] +: Q_final[4])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[5] +: Q_final[5])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[6] +: Q_final[6])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[7] +: Q_final[7])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[8] +: Q_final[8])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[9] +: Q_final[9])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[10] +: Q_final[10])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[11] +: Q_final[11])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[12] +: Q_final[12])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[13] +: Q_final[13])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[14] +: Q_final[14])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[15] +: Q_final[15])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[16] +: Q_final[16])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[17] +: Q_final[17])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[18] +: Q_final[18])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[19] +: Q_final[19])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[20] +: Q_final[20])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[21] +: Q_final[21])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[22] +: Q_final[22])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[23] +: Q_final[23])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[24] +: Q_final[24])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[25] +: Q_final[25])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[26] +: Q_final[26])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[27] +: Q_final[27])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[28] +: Q_final[28])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[29] +: Q_final[29])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[30] +: Q_final[30])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[31] +: Q_final[31])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                



if (cond_sdf_taa_sctrlo) 
        (posedge CK *> (SCTRLO :  SCTRLO_final)) = (taa_sctrlo,taa_sctrlo,th_sctrlo,taa_sctrlo,th_sctrlo,taa_sctrlo); 

if (cond_sdf_taa_sctrlo_se) 
        (negedge CK *> (SCTRLO : SCTRLO_final)) = (taa_sctrlo_se,taa_sctrlo_se,th_sctrlo_se,taa_sctrlo_se,th_sctrlo_se,taa_sctrlo_se); 
 
if (cond_sdf_taa_sdlo) 
        (posedge CK *> (SDLO :  SDLO_final)) = (taa_sdlo,taa_sdlo,th_sdlo,taa_sdlo,th_sdlo,taa_sdlo); 
if (cond_sdf_taa_sdlo_se) 
        (negedge CK *> (SDLO : SDLO_final)) = (taa_sdlo_se,taa_sdlo_se,th_sdlo_se,taa_sdlo_se,th_sdlo_se,taa_sdlo_se);


if (cond_sdf_taa_sdro) 
        (posedge CK *> (SDRO :  SDRO_final)) = (taa_sdro,taa_sdro,th_sdro,taa_sdro,th_sdro,taa_sdro); 
if (cond_sdf_taa_sdro_se) 
        (negedge CK *> (SDRO : SDRO_final)) = (taa_sdro_se,taa_sdro_se,th_sdro_se,taa_sdro_se,th_sdro_se,taa_sdro_se); 





if (cond_sdf_taa_smlo) 
        (posedge CK *> (SMLO :  SMLO_final)) = (taa_smlo,taa_smlo,th_smlo,taa_smlo,th_smlo,taa_smlo); 
if (cond_sdf_taa_smlo_se) 
        (negedge CK *> (SMLO : SMLO_final)) = (taa_smlo_se,taa_smlo_se,th_smlo_se,taa_smlo_se,th_smlo_se,taa_smlo_se);
if (cond_sdf_taa_smro) 
        (posedge CK *> (SMRO :  SMRO_final)) = (taa_smro,taa_smro,th_smro,taa_smro,th_smro,taa_smro);
if (cond_sdf_taa_smro_se) 
        (negedge CK *> (SMRO : SMRO_final)) = (taa_smro_se,taa_smro_se,th_smro_se,taa_smro_se,th_smro_se,taa_smro_se);


 
     


endspecify //specify block ends

always @(SE_buf)
begin
 if ($realtime > 0) begin
   if (INITN_buf === 1'b1 && SLEEP_buf === 1'b0 && ATP_buf === 1'b1 && STDBY_buf === 0) begin
// reset the next cycle corruption flag // modification done to test the proposal of resetting next cycle corruption flag on toggling of SE. This is because setup/hold of SE is large enough to ensure recovery from MemFSM corruption. 
        invalid_next_cycle_func = 1'b0;
        invalid_next_cycle_dft = 1'b0;
        release IO.cgc_CK_rw.CK_gated;
        release IO.cgc_CK_bypass.CK_gated;
        release IO.cgc_CK_lkp_latch.CK_gated;
        release IO.cgc_CK_scff.CK_gated;
        if (CK === 1'b0) begin
                IO.cgc_CK_rw.CK_gated = 1'b0;
                IO.cgc_CK_bypass.CK_gated = 1'b0;
                IO.cgc_CK_lkp_latch.CK_gated = 1'b0;
                IO.cgc_CK_scff.CK_gated = 1'b0;
        end        
   end 
 end  
end

task Invalid_next_cycle_func_tim;
begin
        
   Corrupt_Mem;
   Corrupt_Q;
   if (INITN !== 1'b0) begin     
        invalid_next_cycle_func <= 1'b1;
        force IO.cgc_CK_rw.CK_gated = 1'bx;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Memory and Output Q are Corrupted. Next Cycle is not functional", $realtime);
   end     
end
endtask

task Invalid_next_cycle_dft_tim;
begin

   Corrupt_all_scan_flops_scan_outs;
   if (INITN !== 1'b0) begin     
        invalid_next_cycle_dft <= 1'b1;
        force IO.cgc_CK_lkp_latch.CK_gated = 1'bx;
        force IO.cgc_CK_scff.CK_gated = 1'bx;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted. Next Cycle is not functional", $realtime);
   end
end
endtask

task WriteLocMskX_bwise;
input [Addr-1 : 0] Address;
input [bits-1 : 0] Mask;
reg [bits-1 : 0] Mask_inv;

reg [bits-1:0] tempReg1;
begin
   tempReg1 = WordX;
   Mask_inv = ~Mask;
   if (^Address !== X )
   begin
      `ifdef ST_MEM_SLM
        $slm_ReadMemory(slm_handle, Address, tempReg1);
      `else
        tempReg1 = Mem[Address];
      `endif
             
      for (i = 0; i < bits; i=i+1) begin
        if (Mask[i] === 1'bx)
            tempReg1[i] = 1'bx;
      end
      `ifdef ST_MEM_SLM
         $slm_WriteMemory(slm_handle, Address, tempReg1, Mask_inv);
      `else
        Mem[Address] = tempReg1;
      `endif
   end//if (^Address !== X
   else begin
      WriteMemX;
   end   
   task_insert_faults_in_memory;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Memory bit location Corrupted", $realtime);
end
endtask


// conversion from registers to array elements for mask setup violation notifiers 

   
always @(TimingViol_mask_0   or TimingViol_TEM   )
begin
          TimingViol_mask[0]=~TimingViol_mask[0]; 
end

   
always @(TimingViol_mask_1   or TimingViol_TOM   )
begin
          TimingViol_mask[1]=~TimingViol_mask[1]; 
end

   
always @(TimingViol_mask_2   or TimingViol_TEM   )
begin
          TimingViol_mask[2]=~TimingViol_mask[2]; 
end

   
always @(TimingViol_mask_3   or TimingViol_TOM   )
begin
          TimingViol_mask[3]=~TimingViol_mask[3]; 
end

   
always @(TimingViol_mask_4   or TimingViol_TEM   )
begin
          TimingViol_mask[4]=~TimingViol_mask[4]; 
end

   
always @(TimingViol_mask_5   or TimingViol_TOM   )
begin
          TimingViol_mask[5]=~TimingViol_mask[5]; 
end

   
always @(TimingViol_mask_6   or TimingViol_TEM   )
begin
          TimingViol_mask[6]=~TimingViol_mask[6]; 
end

   
always @(TimingViol_mask_7   or TimingViol_TOM   )
begin
          TimingViol_mask[7]=~TimingViol_mask[7]; 
end

   
always @(TimingViol_mask_8   or TimingViol_TEM   )
begin
          TimingViol_mask[8]=~TimingViol_mask[8]; 
end

   
always @(TimingViol_mask_9   or TimingViol_TOM   )
begin
          TimingViol_mask[9]=~TimingViol_mask[9]; 
end

   
always @(TimingViol_mask_10   or TimingViol_TEM   )
begin
          TimingViol_mask[10]=~TimingViol_mask[10]; 
end

   
always @(TimingViol_mask_11   or TimingViol_TOM   )
begin
          TimingViol_mask[11]=~TimingViol_mask[11]; 
end

   
always @(TimingViol_mask_12   or TimingViol_TEM   )
begin
          TimingViol_mask[12]=~TimingViol_mask[12]; 
end

   
always @(TimingViol_mask_13   or TimingViol_TOM   )
begin
          TimingViol_mask[13]=~TimingViol_mask[13]; 
end

   
always @(TimingViol_mask_14   or TimingViol_TEM   )
begin
          TimingViol_mask[14]=~TimingViol_mask[14]; 
end

   
always @(TimingViol_mask_15   or TimingViol_TOM   )
begin
          TimingViol_mask[15]=~TimingViol_mask[15]; 
end

   
always @(TimingViol_mask_16   or TimingViol_TEM   )
begin
          TimingViol_mask[16]=~TimingViol_mask[16]; 
end

   
always @(TimingViol_mask_17   or TimingViol_TOM   )
begin
          TimingViol_mask[17]=~TimingViol_mask[17]; 
end

   
always @(TimingViol_mask_18   or TimingViol_TEM   )
begin
          TimingViol_mask[18]=~TimingViol_mask[18]; 
end

   
always @(TimingViol_mask_19   or TimingViol_TOM   )
begin
          TimingViol_mask[19]=~TimingViol_mask[19]; 
end

   
always @(TimingViol_mask_20   or TimingViol_TEM   )
begin
          TimingViol_mask[20]=~TimingViol_mask[20]; 
end

   
always @(TimingViol_mask_21   or TimingViol_TOM   )
begin
          TimingViol_mask[21]=~TimingViol_mask[21]; 
end

   
always @(TimingViol_mask_22   or TimingViol_TEM   )
begin
          TimingViol_mask[22]=~TimingViol_mask[22]; 
end

   
always @(TimingViol_mask_23   or TimingViol_TOM   )
begin
          TimingViol_mask[23]=~TimingViol_mask[23]; 
end

   
always @(TimingViol_mask_24   or TimingViol_TEM   )
begin
          TimingViol_mask[24]=~TimingViol_mask[24]; 
end

   
always @(TimingViol_mask_25   or TimingViol_TOM   )
begin
          TimingViol_mask[25]=~TimingViol_mask[25]; 
end

   
always @(TimingViol_mask_26   or TimingViol_TEM   )
begin
          TimingViol_mask[26]=~TimingViol_mask[26]; 
end

   
always @(TimingViol_mask_27   or TimingViol_TOM   )
begin
          TimingViol_mask[27]=~TimingViol_mask[27]; 
end

   
always @(TimingViol_mask_28   or TimingViol_TEM   )
begin
          TimingViol_mask[28]=~TimingViol_mask[28]; 
end

   
always @(TimingViol_mask_29   or TimingViol_TOM   )
begin
          TimingViol_mask[29]=~TimingViol_mask[29]; 
end

   
always @(TimingViol_mask_30   or TimingViol_TEM   )
begin
          TimingViol_mask[30]=~TimingViol_mask[30]; 
end

   
always @(TimingViol_mask_31   or TimingViol_TOM   )
begin
          TimingViol_mask[31]=~TimingViol_mask[31]; 
end







// conversion from registers to array elements for data setup violation notifiers

always @(TimingViol_data_0   or TimingViol_TED  )
begin
        TimingViol_data[0]=~TimingViol_data[0];   
end


always @(TimingViol_data_1   or TimingViol_TOD  )
begin
        TimingViol_data[1]=~TimingViol_data[1];   
end


always @(TimingViol_data_2   or TimingViol_TED  )
begin
        TimingViol_data[2]=~TimingViol_data[2];   
end


always @(TimingViol_data_3   or TimingViol_TOD  )
begin
        TimingViol_data[3]=~TimingViol_data[3];   
end


always @(TimingViol_data_4   or TimingViol_TED  )
begin
        TimingViol_data[4]=~TimingViol_data[4];   
end


always @(TimingViol_data_5   or TimingViol_TOD  )
begin
        TimingViol_data[5]=~TimingViol_data[5];   
end


always @(TimingViol_data_6   or TimingViol_TED  )
begin
        TimingViol_data[6]=~TimingViol_data[6];   
end


always @(TimingViol_data_7   or TimingViol_TOD  )
begin
        TimingViol_data[7]=~TimingViol_data[7];   
end


always @(TimingViol_data_8   or TimingViol_TED  )
begin
        TimingViol_data[8]=~TimingViol_data[8];   
end


always @(TimingViol_data_9   or TimingViol_TOD  )
begin
        TimingViol_data[9]=~TimingViol_data[9];   
end


always @(TimingViol_data_10   or TimingViol_TED  )
begin
        TimingViol_data[10]=~TimingViol_data[10];   
end


always @(TimingViol_data_11   or TimingViol_TOD  )
begin
        TimingViol_data[11]=~TimingViol_data[11];   
end


always @(TimingViol_data_12   or TimingViol_TED  )
begin
        TimingViol_data[12]=~TimingViol_data[12];   
end


always @(TimingViol_data_13   or TimingViol_TOD  )
begin
        TimingViol_data[13]=~TimingViol_data[13];   
end


always @(TimingViol_data_14   or TimingViol_TED  )
begin
        TimingViol_data[14]=~TimingViol_data[14];   
end


always @(TimingViol_data_15   or TimingViol_TOD  )
begin
        TimingViol_data[15]=~TimingViol_data[15];   
end


always @(TimingViol_data_16   or TimingViol_TED  )
begin
        TimingViol_data[16]=~TimingViol_data[16];   
end


always @(TimingViol_data_17   or TimingViol_TOD  )
begin
        TimingViol_data[17]=~TimingViol_data[17];   
end


always @(TimingViol_data_18   or TimingViol_TED  )
begin
        TimingViol_data[18]=~TimingViol_data[18];   
end


always @(TimingViol_data_19   or TimingViol_TOD  )
begin
        TimingViol_data[19]=~TimingViol_data[19];   
end


always @(TimingViol_data_20   or TimingViol_TED  )
begin
        TimingViol_data[20]=~TimingViol_data[20];   
end


always @(TimingViol_data_21   or TimingViol_TOD  )
begin
        TimingViol_data[21]=~TimingViol_data[21];   
end


always @(TimingViol_data_22   or TimingViol_TED  )
begin
        TimingViol_data[22]=~TimingViol_data[22];   
end


always @(TimingViol_data_23   or TimingViol_TOD  )
begin
        TimingViol_data[23]=~TimingViol_data[23];   
end


always @(TimingViol_data_24   or TimingViol_TED  )
begin
        TimingViol_data[24]=~TimingViol_data[24];   
end


always @(TimingViol_data_25   or TimingViol_TOD  )
begin
        TimingViol_data[25]=~TimingViol_data[25];   
end


always @(TimingViol_data_26   or TimingViol_TED  )
begin
        TimingViol_data[26]=~TimingViol_data[26];   
end


always @(TimingViol_data_27   or TimingViol_TOD  )
begin
        TimingViol_data[27]=~TimingViol_data[27];   
end


always @(TimingViol_data_28   or TimingViol_TED  )
begin
        TimingViol_data[28]=~TimingViol_data[28];   
end


always @(TimingViol_data_29   or TimingViol_TOD  )
begin
        TimingViol_data[29]=~TimingViol_data[29];   
end


always @(TimingViol_data_30   or TimingViol_TED  )
begin
        TimingViol_data[30]=~TimingViol_data[30];   
end


always @(TimingViol_data_31   or TimingViol_TOD  )
begin
        TimingViol_data[31]=~TimingViol_data[31];   
end


//------------------------------------------------------------------------
//           Actions taken on timing violations starts 
//------------------------------------------------------------------------

 always @(TimingViol_data)
// tds or tdh violation
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
  for (i = 0; i < bits; i = i + 1) begin   
    if (CSWEMTBYPASS[i] !== 0) begin
     if((TimingViol_data[i] !== TimingViol_data_last[i])) begin
         M_bmux_reg[i] = 1'bx;
     end    
    end   
   end 
   if (CSWEMTBYPASS !== 0) WriteLocMskX_bwise(A_bmux_reg,M_bmux_reg);
  end
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin
   Corrupt_data_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Data Scan Flops and Scan Outs are Corrupted", $realtime);
  end
  TimingViol_data_last = TimingViol_data; 
end


always @(TimingViol_mask)
// tms or tmh violation
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
     if(CSWETBYPASSN !== 0) begin
          for (i = 0; i < bits; i = i+1) begin   
             if ( (TimingViol_mask_last[i] !== TimingViol_mask[i])) begin
                `ifdef ST_MEM_SLM
                        M_bmux_reg[i] = 1'bx;
                `else
                        if (D_bmux[i] !== Mem_prev[i]) begin
                         M_bmux_reg[i] = 1'bx;
                        end
                `endif
             end   
          end      
          WriteLocMskX_bwise(A_bmux_reg, M_bmux_reg);
     end      
  end
  
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
        Corrupt_mask_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Mask Scan Flops and Scan Outs are Corrupted", $realtime);
  end

  TimingViol_mask_last = TimingViol_mask; 
 end 

always @(TimingViol_addr)
// tas or tah
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Invalid_next_cycle_func_tim;
  end
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
      Corrupt_ctrl_scan_flops_scan_outs;
      if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Control Scan Flops and Scan Outs are Corrupted", $realtime);
  end
end

always @(TimingViol_WEN)
//tws or twh
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Qtemp = WordX;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Output Q Corrupted", $realtime);
   
   if (ValidAddress === 1'b1) begin
           Corrupt_Current_Location;
           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Current Address Location Corrupted", $realtime);
   end
   else if (ValidAddress === 1'bx) begin
           WriteMemX;
           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Entire Memory Array Corrupted", $realtime);
   end        
  end
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
   Corrupt_ctrl_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Control Scan Flops and Scan Outs are Corrupted", $realtime);
  end
end 

always @(TimingViol_CSN )
// tps or tph 
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Invalid_next_cycle_func_tim;
  end
  if (INITN_buf !== 0 && STDBY_buf !== 1 && SLEEP_buf !== 1 && ATP_buf !== 0 ) begin      
   Corrupt_ctrl_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Control Scan Flops and Scan Outs are Corrupted", $realtime);
  end
end

always @(TimingViol_tcycle )
//tcycle
begin
#0
   if ((IO.GAC && ATP_buf) !== 0 && MEMEN_dft_prev !== 0) begin
    Invalid_next_cycle_dft_tim;
   end
   if (IO.MEM_EN_inst !== 0 && MEMEN_prev !== 0) begin
    Invalid_next_cycle_func_tim;
   end
end

always @(TimingViol_tckl )
// tckl 
begin
#0
   if (INITN_buf !== 0 && STDBY_buf !== 1 && SLEEP_buf !== 1 && ATP_buf !== 0 ) begin      
    Invalid_next_cycle_dft_tim;
   end
   if (INITN_buf !== 0 && STDBY_buf !== 1 && SLEEP_buf !== 1 && IO.CSN_bmux !== 1 && IGint !== 1 && DE_temp !== 1 && (ATP_buf !== 1 ||(ATP_buf === 1 && SE_buf !== 1 && TBYPASS_buf !== 1))) begin
    Invalid_next_cycle_func_tim;
   end
end

always @(TimingViol_tckh) begin
#0
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
    Invalid_next_cycle_dft_tim;
   end
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
    Invalid_next_cycle_func_tim;
   end
end


always @(TimingViol_tcycle_se )
//tcycle_se
begin
#0
   if ((IO.GAC && ATP_buf) !== 0 && MEMEN_dft_prev !== 0) begin
         Invalid_next_cycle_dft_tim;
   end
end

always @(TimingViol_tckl_se  )
begin
#0
   if (INITN_buf !== 0 && STDBY_buf !== 1 && SLEEP_buf !== 1 && ATP_buf !== 0 ) begin      
         Invalid_next_cycle_dft_tim;
   end
end

always @(TimingViol_tckh_se) begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
         Invalid_next_cycle_dft_tim;
   end
end

always @(TimingViol_tbist) begin
#0
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
    Corrupt_all_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted", $realtime);
   end
   if (IO.TBYPASSint !== 1'b0) begin 
    Corrupt_Q;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Output Q Corrupted", $realtime);
   end 
   if (INITN_reg !==0 && STDBY_reg !== 1 && TBYPASS_reg !== 1 && SLEEP_reg !== 1 && SE_reg !== 1 && IG_reg !== 1 && DE_reg !== 1) begin
    Invalid_next_cycle_func_tim;
   end
end


always @(TimingViol_ls) begin
 #0 
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && (RM_buf === 0) && (WM_buf === 0)) begin
    Invalid_next_cycle_func_tim;
   end
end



always @(TimingViol_hs) begin
 #0 
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && (RM_buf === 0) && (WM_buf === 0)) begin   
    Invalid_next_cycle_func_tim;
   end
end 


always @(TimingViol_tbypass)
//ttmck
begin
#0  
  Corrupt_Q;
  if (INITN_reg !== 0 && SLEEP_reg !== 1 && SE_reg !== 1 && STDBY_reg !== 1 &&  DE_reg !== 1) begin
   Invalid_next_cycle_dft_tim;
  end
  if (CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && SLEEP_reg !== 1 && STDBY_reg !== 1 && INITN_reg !== 0) begin 
    Invalid_next_cycle_func_tim;
  end
end


always @(TimingViol_sleep)
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && DE_reg !== 1) begin
   Invalid_next_cycle_func_tim;
  end  
  if (INITN_reg !== 0 && STDBY_reg !== 1 && ATP_reg !== 0) begin
     if (SE_reg !== 1'b1) begin
        Invalid_next_cycle_dft_tim;
     end
     else begin
        Corrupt_all_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted", $realtime);
     end        
  end
end

always @(TimingViol_stdby)
begin
#0
  if (CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && DE_reg !== 1) begin 
   Invalid_next_cycle_func_tim;
  end  
  if (ATP_reg !== 0) begin 
     if (SE_reg !== 1'b1) begin
        Invalid_next_cycle_dft_tim;
     end
     else begin
        Corrupt_all_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted", $realtime);
     end        
  end
end






always @(TimingViol_se) begin
#0
  if (TBYPASS_reg === 1'b1) begin 
     Corrupt_Q;
     if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Output Q Corrupted", $realtime);
  end 
  else begin 
        Invalid_next_cycle_func_tim;
  end 
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
    Corrupt_all_scan_flops_scan_outs;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted", $realtime);
    if (TBYPASS_reg === 1'bx && SE_buf !== 1'b1) begin
        Invalid_next_cycle_dft_tim;
    end
  end
end

always @(TimingViol_sctrli) begin
    Corrupt_ctrl_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Control Scan Flops Corrupted", $realtime);
end

always @(TimingViol_sdli) begin
    Corrupt_datal_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Data Left Scan Flops Corrupted", $realtime);
end

always @(TimingViol_sdri) begin
    Corrupt_datar_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Data Right Scan Flops Corrupted", $realtime);
end




always @(TimingViol_smli) begin
    Corrupt_maskl_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Mask Left Scan Flops Corrupted", $realtime);
end

always @(TimingViol_smri) begin
    Corrupt_maskr_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Mask Right Scan Flops Corrupted", $realtime);
end




        

always @(TimingViol_initn) begin
#0
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && DE_reg !== 1) begin
   Corrupt_Mem;
   Corrupt_Q;
   invalid_next_cycle_func <= 1'b1;
   force IO.cgc_CK_rw.CK_gated = 1'bx;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Memory and Output Q are Corrupted. Next Cycle is not functional", $realtime);
  end  
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && ATP_reg !== 0) begin
     if (SE_reg !== 1'b1) begin
        Corrupt_all_scan_flops_scan_outs;
        invalid_next_cycle_dft <= 1'b1;
        force IO.cgc_CK_lkp_latch.CK_gated = 1'bx;
        force IO.cgc_CK_scff.CK_gated = 1'bx;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted. Next Cycle is not functional", $realtime);
     end
     else begin
        Corrupt_all_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops are Corrupted", $realtime);
     end        
  end
end

always @(TimingViol_ig) begin
#0
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && INITN_reg !== 0 && DE_reg !== 1) begin
   Invalid_next_cycle_func_tim;
  end  
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
   Corrupt_all_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops are Corrupted", $realtime);
  end
end

always @(TimingViol_atp) begin
#0
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && INITN_reg !== 0) begin  
   Invalid_next_cycle_func_tim;
  end  
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && INITN_reg !== 0) begin
   Invalid_next_cycle_dft_tim;
  end
end


always @(TimingViol_rm) begin
#0
   if (INITN_reg !== 0 && SLEEP_reg !== 1 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && (LS_buf !== X) && (HS_buf !== X) && (WM_buf === 0)) begin 
    Invalid_next_cycle_func_tim;
   end
end
always @(TimingViol_wm) begin
#0
   if (INITN_reg !== 0 && SLEEP_reg !== 1 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && (LS_buf !== X) && (HS_buf !== X) && (RM_buf === 0)) begin 
    Invalid_next_cycle_func_tim;
   end
end 



//------------------------------------------------------------------------
//           Actions taken on timing violations ends 
//------------------------------------------------------------------------

//------------------------------------------------------------
//    Glitch generation on Output(s) in Timing Mode Starts
//------------------------------------------------------------

always @(Q_int)
begin
        for (i=0; i <= bits-1; i=i+1)
        begin
          if (Q_int_prev[i] !== Q_int[i])
          begin
            if (Q_int[i] !== 1'bx) Q_final[i] = 1'bx;
            Q_final[i] <= Q_int[i];
          end
          else 
          begin
            Q_final[i] <= Q_int[i];
          end            
          Q_int_prev[i] = Q_int[i];
        end

end

always @(SCTRLO_temp)
begin
        if (SCTRLO_prev !== SCTRLO_temp)
        begin
          if (SCTRLO_temp !== 1'bx) SCTRLO_final = 1'bx;
          SCTRLO_final <= SCTRLO_temp;
        end
        else 
        begin
          SCTRLO_final <= SCTRLO_temp;
        end
        SCTRLO_prev = SCTRLO_temp;
end

always @(SDLO_temp)
begin
        if (SDLO_prev !== SDLO_temp)
        begin
          if (SDLO_temp !== 1'bx) SDLO_final = 1'bx;
          SDLO_final <= SDLO_temp;
        end
        else 
        begin
          SDLO_final <= SDLO_temp;
        end
        SDLO_prev = SDLO_temp;
end



always @(SDRO_temp)
begin
        if (SDRO_prev !== SDRO_temp)
        begin
          if (SDRO_temp !== 1'bx) SDRO_final = 1'bx;
          SDRO_final <= SDRO_temp;
        end
        else 
        begin
          SDRO_final <= SDRO_temp;
        end
        SDRO_prev = SDRO_temp;
end

    



always @(SMLO_temp)
begin
        if (SMLO_prev !== SMLO_temp)
        begin
          if (SMLO_temp !== 1'bx) SMLO_final = 1'bx;
          SMLO_final <= SMLO_temp;
        end
        else 
        begin
          SMLO_final <= SMLO_temp;
        end
        SMLO_prev = SMLO_temp;
end
    
always @(SMRO_temp)
begin
        if (SMRO_prev !== SMRO_temp)
        begin
          if (SMRO_temp !== 1'bx) SMRO_final = 1'bx;
          SMRO_final <= SMRO_temp;
        end
        else 
        begin
          SMRO_final <= SMRO_temp;
        end
        SMRO_prev = SMRO_temp;
end
    






//------------------------------------------------------------
//    Glitch generation on Output(s) in Timing Mode Ends
//------------------------------------------------------------

//------------------------------------------------------------
//        Output Buffers for verilog timing model
//------------------------------------------------------------


buf (Q[0],Q_final[0]);

buf (Q[1],Q_final[1]);

buf (Q[2],Q_final[2]);

buf (Q[3],Q_final[3]);

buf (Q[4],Q_final[4]);

buf (Q[5],Q_final[5]);

buf (Q[6],Q_final[6]);

buf (Q[7],Q_final[7]);

buf (Q[8],Q_final[8]);

buf (Q[9],Q_final[9]);

buf (Q[10],Q_final[10]);

buf (Q[11],Q_final[11]);

buf (Q[12],Q_final[12]);

buf (Q[13],Q_final[13]);

buf (Q[14],Q_final[14]);

buf (Q[15],Q_final[15]);

buf (Q[16],Q_final[16]);

buf (Q[17],Q_final[17]);

buf (Q[18],Q_final[18]);

buf (Q[19],Q_final[19]);

buf (Q[20],Q_final[20]);

buf (Q[21],Q_final[21]);

buf (Q[22],Q_final[22]);

buf (Q[23],Q_final[23]);

buf (Q[24],Q_final[24]);

buf (Q[25],Q_final[25]);

buf (Q[26],Q_final[26]);

buf (Q[27],Q_final[27]);

buf (Q[28],Q_final[28]);

buf (Q[29],Q_final[29]);

buf (Q[30],Q_final[30]);

buf (Q[31],Q_final[31]);

buf (SCTRLO,SCTRLO_final);
buf (SDLO, SDLO_final);
buf (SDRO, SDRO_final);


buf (SMLO, SMLO_final);
buf (SMRO, SMRO_final);





`endif // ifdef functional

//--------------------------------------------------------------------
//                     TIMING WRAPPER ENDS
//--------------------------------------------------------------------

wire supply_ok;

`ifdef ST_MEM_POWER_SEQUENCING_OFF
  
  assign supply_ok = 1'b1;

`else
//--------------------------------------------------------------------
//                 POWER PINS FUNCTIONALITY STARTS
//--------------------------------------------------------------------
reg mem_blocked = 1'b0;
reg Proper_shutdown;

wire vddmp_int, vddsmp_int, vddma_int, vddmo_int, gndm_int, gndsm_int;
reg [63 : 0]  sleep_toggle_time, vddmp_toggle_time, vddsmp_toggle_time, vddma_toggle_time, vddmo_toggle_time; 
reg [63 : 0] t_ma_mo=0, t_mp_mo=0, t_mo_ma=0, t_mo_smp=0, t_mo_mp=0, t_sl_ma=0, t_sl_mp=0, t_smp_mp=0, t_mp_smp=0, t_sl_mo=0;
wire PSWSMALLMA_int,PSWSMALLMP_int,PSWLARGEMA_int,PSWLARGEMP_int;
wire vddmpi_int, vddmai_int;



//-----------------------------------------------------------------
//   Calculating the valid states for all power supplies starts
//   Example : 
//        -> For flip-well vddsm valid range is -1 to 0
//        -> For noflip-well vddsm valid range is 0 to 1
//-----------------------------------------------------------------

localparam
        p_ok = 1'b1,
        p_not_ok = 1'b0,
        unknown = 1'bx;

assign vddmp_int = vddm;
assign vddma_int = vddm;
assign vddmo_int = vddm; 
assign gndm_int  = (gndm == 1'b0) ? p_ok : p_not_ok;




assign PSWSMALLMA_int = 1'b0;
assign PSWSMALLMP_int = 1'b0; 
assign PSWLARGEMA_int = 1'b0;
assign PSWLARGEMP_int = 1'b0;

ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim SLEEP_MUX (vddmo_int,1'b0,SLEEP_buf,SLEEP_gated);

and (pswsmallma_int,SLEEP_gated,PSWSMALLMA_int);
and (pswlargema_int,SLEEP_gated,PSWLARGEMA_int);
not (pswsmallma_close, pswsmallma_int);
not (pswlargema_close, pswlargema_int);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim switch_pswsmallma (pswsmallma_close,vddma_int,vddmai_small);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim switch_pswlargema (pswlargema_close,vddma_int,vddmai_large);
ST_SPHD_LOVOLT_1024x32m4_bTMl_WANDprim wand_vddmai (vddmai_int,vddmai_small,vddmai_large);

and (pswsmallmp_int,SLEEP_gated,PSWSMALLMP_int);
and (pswlargemp_int,SLEEP_gated,PSWLARGEMP_int);
not (pswsmallmp_close, pswsmallmp_int);
not (pswlargemp_close, pswlargemp_int);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim switch_pswsmallmp (pswsmallmp_close,vddmp_int,vddmpi_small);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim switch_pswlargemp (pswlargemp_close,vddmp_int,vddmpi_large);
ST_SPHD_LOVOLT_1024x32m4_bTMl_WANDprim wand_vddmpi (vddmpi_int,vddmpi_small,vddmpi_large);


//-----------------------------------------------------------------
//   Calculating the valid states for all power supplies ends
//-----------------------------------------------------------------
reg pswsmallmp_stable=1'b1,pswlargema_stable=1'b1,pswlargemp_stable=1'b1,pswsmallma_stable=1'b1;
reg pswsmallmp_toggle=1'b0,pswlargema_toggle=1'b0,pswlargemp_toggle=1'b0,pswsmallma_toggle=1'b0;

assign supply_ok = (vddmo_int === p_ok && vddmpi_int === p_ok && vddmai_int === p_ok && gndm_int === p_ok)? 1'b1 : 1'b0;

//-----------------------------------------------------------------
//        Actions taken on Power supplies toggling starts
//-----------------------------------------------------------------

always @(SLEEP_gated or r_supply_trigger) begin
   if ($realtime > 0) begin	
	sleep_toggle_time = $realtobits($realtime);
	if (SLEEP_gated !== 1'b1 && vddmo_int === 1'b1)begin	
          if (pswsmallma_stable !== 1'b1 || pswsmallmp_stable !== 1'b1 || pswlargema_stable !== 1'b1 || pswlargemp_stable !== 1'b1 || PSWLARGEMA_int !== 1'b0 || PSWSMALLMA_int !== 1'b0 || PSWLARGEMP_int !== 1'b0 || PSWSMALLMP_int !== 1'b0)begin
            Block_Memory("SLEEP");
          end    
          if (power_pins_config !== `mono_rail)begin
            #`st_delay_seq_taa;  
            Proper_Shutdown_Checker;
              if (Proper_shutdown !== 1'b1 && supply_ok === 1'b0)Block_Memory("SLEEP");
          end
        end  
   end
end    

always @(vddmpi_int or r_supply_trigger) begin
   if ($realtime > 0) begin	
	vddmp_toggle_time = $realtobits($realtime);
        #`st_delay_seq_taa;
        Proper_Shutdown_Checker;
        if (Proper_shutdown !== 1'b1)begin
          if (power_pins_config === `dual_rail || power_pins_config === `mo_ma_tied)begin
            if (SLEEP_gated === 1'b1) begin
		if (vddmpi_int !== 1'b1) begin
		Corrupt_Periphery("vddm");
		Supply_timings_checker ("vddm",vddmpi_int, vddmp_toggle_time, sleep_toggle_time, vddmo_toggle_time, t_sl_mp, t_mo_mp);
                end
	    end
            else Block_Memory("vddm");
          end
          else if (power_pins_config === `mo_mp_tied)begin
	    if (SLEEP_gated === 1'b1 || (vddmo_int === 1'bx && (vddmai_int === 1'b0 || vddmai_int === 1'bz))) begin
		if (vddmpi_int !== 1'b1) begin
		Corrupt_Periphery("vddm");
		Supply_timings_checker ("vddm",vddmpi_int, vddmp_toggle_time, sleep_toggle_time, vddmo_toggle_time, t_sl_mp, t_mo_mp);
                end
	    end
            else Block_Memory("vddm");
          end 
          else begin    //monorail
            if (supply_ok !== 1'b1)begin
              Corrupt_Periphery("vddm");
            end
          end
        end  
   end 
end




always @(vddmai_int or r_supply_trigger) begin
   if ($realtime > 0) begin	
	vddma_toggle_time = $realtobits($realtime);
        #`st_delay_seq_taa;
        Proper_Shutdown_Checker;
	if (Proper_shutdown !== 1'b1)begin
          if (power_pins_config === `dual_rail || power_pins_config === `mo_mp_tied)begin
            if (SLEEP_gated === 1'b1) begin
		if (vddmai_int !== 1'b1) begin
                Corrupt_Array("vddm");
		Supply_timings_checker ("vddm",vddmai_int, vddma_toggle_time, sleep_toggle_time, vddmo_toggle_time, t_sl_ma, t_mo_ma);
                end
            end      
            else Block_Memory("vddm");
          end
          else if (power_pins_config === `mo_ma_tied)begin
	    if (SLEEP_gated === 1'b1 || (vddmo_int === 1'bx && (vddmpi_int === 1'b0 || vddmpi_int === 1'bz))) begin
		if (vddmai_int !== 1'b1) begin
		Corrupt_Array("vddm");
		Supply_timings_checker ("vddm",vddmai_int, vddma_toggle_time, sleep_toggle_time, vddmo_toggle_time, t_sl_ma, t_mo_ma);
                end
	    end
            else Block_Memory("vddm");
          end 
          else begin
            if (supply_ok !== 1'b1)begin
              Corrupt_Array("vddm");
            end
          end  
	end
   end
end




always @(gndm_int or r_supply_trigger) begin
   if ($realtime > 0) begin
        if (gndm_int !== p_ok) Block_Memory("gndm");	
   end     
end



always @ (Proper_shutdown)begin
  if (Proper_shutdown !== 1'b0)begin
    Corrupt_all("vddm");
    
  end   
end  

//------------- eswitch functionality starts ------------------//

always @(PSWSMALLMA_int or PSWLARGEMA_int or PSWSMALLMP_int or PSWLARGEMP_int)begin
  if ($realtime > 0) begin
    if (SLEEP_gated === 1'bx && vddmo_int !== 1'bx)begin
      Block_Memory("SLEEP");
    end
  end
end  

always @(pswsmallma_int)begin
  pswsmallma_toggle = 1'b1;
  pswsmallma_toggle <= 1'b0;
end  

always @(pswsmallma_toggle)begin
  if ($realtime > 0)begin
      if(pswsmallma_int !== 1'b0)pswsmallma_stable = 1'b0;
      if (pswsmallma_int !== 1'b1)fork: block_pswsmallma
        begin
          #(p_pswsmallma_settling_time);
          pswsmallma_stable = 1'b1;
          disable block_pswsmallma;
        end  
        @(pswsmallma_int)begin
          pswsmallma_stable = 1'b0;
          disable block_pswsmallma;
        end
      join
  end
end  

always @(pswlargema_int)begin
  pswlargema_toggle = 1'b1;
  pswlargema_toggle <= 1'b0;
end  

always @ (pswlargema_toggle)begin
  if ($realtime > 0)begin
      if(pswlargema_int !== 1'b0)pswlargema_stable = 1'b0;
      if (pswlargema_int !== 1'b1)begin
        if (pswsmallma_int !== 1'b1 && pswsmallma_stable === 1'b1)fork: block_pswlargema
        begin
          #(p_pswlargema_settling_time);
          pswlargema_stable = 1'b1;
          disable block_pswlargema;
        end  
        @(pswsmallma_int or pswlargema_int or pswsmallma_stable)begin
          pswlargema_stable = 1'b0;
          disable block_pswlargema;
        end  
        join
        else begin
            Block_Memory("PSWLARGEM");
        end      
      end  
  end
end  

always @(pswsmallmp_int)begin
  pswsmallmp_toggle = 1'b1;
  pswsmallmp_toggle <= 1'b0;
end  

always @(pswsmallmp_toggle)begin
  if ($realtime > 0)begin
      if(pswsmallmp_int !== 1'b0)pswsmallmp_stable = 1'b0;
      if (pswsmallmp_int !== 1'b1)fork: block_pswsmallmp
        begin
          #(p_pswsmallmp_settling_time);
          pswsmallmp_stable = 1'b1;
          disable block_pswsmallmp;
        end  
        @(pswsmallmp_int)begin
          pswsmallmp_stable = 1'b0;
          disable block_pswsmallmp;
        end
      join
  end
end  

always @(pswlargemp_int)begin
  pswlargemp_toggle = 1'b1;
  pswlargemp_toggle <= 1'b0;
end  

always @ (pswlargemp_toggle)begin
  if ($realtime > 0)begin
      if(pswlargemp_int !== 1'b0)pswlargemp_stable = 1'b0;
      if (pswlargemp_int !== 1'b1)begin
        if (pswsmallmp_int !== 1'b1 && pswsmallmp_stable === 1'b1)fork: block_pswlargemp
        begin
          #(p_pswlargemp_settling_time);
          pswlargemp_stable = 1'b1;
          disable block_pswlargemp;
        end  
        @(pswsmallmp_int or pswlargemp_int or pswsmallmp_stable)begin
          pswlargemp_stable = 1'b0;
          disable block_pswlargemp;
        end  
        join
        else begin
            Block_Memory("PSWLARGEM");
        end      
      end  
  end
end  

//---------------------- eswitch functionality ends -----------------------//


//-----------------------------------------------------------------
//          Actions taken on Power supplies toggling ends
//-----------------------------------------------------------------

task Proper_Shutdown_Checker;
begin
  if (vddmo_int === 1'b0 && (vddmai_int === 1'b0 || vddmai_int === 1'bz) && (vddmpi_int === 1'b0 || vddmpi_int === 1'bz))begin
    Proper_shutdown = 1'b1;
  end
  else if (vddmo_int === 1'bx && vddma_int === 1'bx && vddmp_int === 1'bx) begin
    Proper_shutdown = 1'bx;
  end
  else begin
    Proper_shutdown = 1'b0;
  end
end
endtask

task Supply_timings_checker;
input [1023 : 0] input_string;
input input1;
input [63 : 0] real_time;
input [63 : 0] shut_time, rampup_time;
input [63 : 0] t_off, t_on;
begin
        if (input1 === 1'b0) begin
		if ((real_time - $bitstoreal(shut_time)) <= $bitstoreal(t_off)) Block_Memory(input_string);
	end
	else if (input1 === 1'b1) begin
		if ((real_time - $bitstoreal(rampup_time)) <= $bitstoreal(t_on)) Block_Memory(input_string);
	end
end
endtask

task Corrupt_Periphery;
input [1023:0] input_string;
begin
        Corrupt_Q;
        Corrupt_all_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid Value/Sequence on %0s. Output Q and Scan flops corrupted", $realtime, input_string);
end
endtask

task Corrupt_Array;
input [1023:0] input_string;
begin
        Corrupt_Mem;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid Value/Sequence on %0s. Memory corrupted", $realtime, input_string);
end
endtask

task Corrupt_all;
input [1023:0] input_string;
begin
        Corrupt_Periphery(input_string);
        Corrupt_Array(input_string);
end
endtask

task Block_Memory;
input [1023:0] input_string;
begin
  `ifdef ST_MEM_NO_BLOCK_MEM
        Corrupt_Q;
        Corrupt_all_scan_flops_scan_outs;
        Corrupt_Mem;
        if ( (debug_level > 0) && ($realtime > message_control_time) ) $display ("%m - %t ST_ERROR : Invalid Value/Sequence on %0s. Memory Contents, Output Q and Scan flops corrupted", $realtime, input_string);
  `else 
      if ($realtime > mem_block_ctrl_time) begin
          force CK_buf = 1'bx;
          force IO.CK_rw = 1'bx;
          force IO.CK_bypass = 1'bx;
          force IO.CK_scff = 1'bx;
          force IO.CK_lock_up_latch = 1'bx;
          mem_blocked = 1'b1;
          if ( (debug_level > 0) && ($realtime > message_control_time) ) $display ("%m - %t ST_ERROR : Invalid Value/Sequence on %0s. Memory Contents, Output Q and Scan flops corrupted. All further operations on the Memory are Blocked", $realtime, input_string);
      end
      else begin
        Corrupt_Q;
        Corrupt_all_scan_flops_scan_outs;
        Corrupt_Mem;
        if ( (debug_level > 0) && ($realtime > message_control_time) ) $display ("%m - %t ST_ERROR : Invalid Value/Sequence on %0s. Memory Contents, Output Q and Scan flops corrupted", $realtime, input_string);
      end
  `endif
end
endtask

task UnBlock_Memory;
begin
  release CK_buf;
  release IO.CK_rw;
  release IO.CK_bypass;
  release IO.CK_scff;
  release IO.CK_lock_up_latch;
  mem_blocked = 1'b0;
  pswsmallma_stable = 1'b1;       
  pswlargema_stable = 1'b1;
  pswsmallmp_stable = 1'b1;
  pswlargemp_stable = 1'b1;

end
endtask

//--------------------------------------------------------------------
//                 POWER PINS FUNCTIONALITY ENDS
//--------------------------------------------------------------------
`endif

assign IO.supply_ok = supply_ok;

//--------------------------------------------------------------------
//              FAULT FILE HANDLING FUNCTIONALITY STARTS 
//--------------------------------------------------------------------
 
integer file_ptr, ret_val;
integer fault_word;
integer fault_bit;
integer fcnt, Fault_in_memory,faultnum,stop_loop,count;
integer t;  
integer FailureLocn [max_faults -1 :0];
integer Failurebit [max_faults -1 :0];
reg [100 : 0] stuck_at;
reg [100 : 0] fault_array;
reg [200 : 0] tempStr;
reg [7:0] fault_char;
reg [7:0] fault_char1; // 8 Bit File Pointer
reg [Addr -1 : 0] std_fault_word;
reg [Addr -1 : mux_bits] fault_row_add [max_faults -1 :0];
reg [max_faults -1 :0] fault_repair_flag;
reg [max_faults -1 :0] dont_insert_fault;
reg [max_faults -1 :0] repair_flag;
reg [100 : 0] array_stuck_at[max_faults -1 : 0] ;
reg [100 : 0] mem_red_array_stuck_at[max_faults -1 : 0] ; 
reg msgcnt;

reg [bits - 1: 0] stuck_at_0fault [max_faults -1 : 0];
reg [bits - 1: 0] stuck_at_1fault [max_faults -1 : 0];
reg [bits -1 : 0] stuck0;
reg [bits -1 : 0] stuck1;
reg [2047:0] reg_Fault_file_name;
reg reg_ConfigFault;
reg reg_MEM_INITIALIZE;
reg reg_BinaryInit;
reg [2047:0] reg_InitFileName;
time reg_File_load_time;

integer flag_error;





task task_insert_faults_in_memory;
reg [bits -1 : 0] slm_temp_data;
integer i;
begin
   if (reg_ConfigFault)
   begin   
     for(i = 0;i< fcnt;i = i+ 1) begin
        if(mem_red_array_stuck_at[i] === "mem_array") begin
          if (array_stuck_at[i] === "sa0") begin
           `ifdef ST_MEM_SLM
            //Read first
            $slm_ReadMemory(slm_handle, FailureLocn[i], slm_temp_data);
            //operation
            slm_temp_data = slm_temp_data & stuck_at_0fault[i];
            //write back
            $slm_WriteMemory(slm_handle, FailureLocn[i], slm_temp_data);
          `else
            Mem[FailureLocn[i]] = Mem[FailureLocn[i]] & stuck_at_0fault[i];
          `endif
         end //if(array_stuck_at)
                                        
         if(array_stuck_at[i] === "sa1") begin
         `ifdef ST_MEM_SLM
            //Read first
            $slm_ReadMemory(slm_handle, FailureLocn[i], slm_temp_data);
            //operation
            slm_temp_data = slm_temp_data | stuck_at_1fault[i];
            //write back
            $slm_WriteMemory(slm_handle, FailureLocn[i], slm_temp_data);
         `else
            Mem[FailureLocn[i]] = Mem[FailureLocn[i]] | stuck_at_1fault[i]; 
         `endif
         end //if(array_stuck_at)
       end //if mem_red_array_stuck_at
    
    
     end    // end of for
   end  
end
endtask



task task_read_fault_file;
integer i;
begin

/*  -----------Implemetation for config fault starts------*/
   msgcnt = X;
   t = 0;
   fault_repair_flag = {max_faults{1'b1}};
   repair_flag = {max_faults{1'b1}};
   if(reg_ConfigFault) 
   begin
      file_ptr = $fopen(reg_Fault_file_name , "r");
      if(file_ptr == 0)
      begin     
          if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Fault File cannot be opened ",$realtime);
      end        
      else                
      begin : read_fault_file
        t = 0;
        for (i = 0; i< max_faults; i= i + 1)
        begin
         
           stuck0 = {bits{1'b1}};
           stuck1 = {bits{1'b0}};
           fault_char1 = $fgetc (file_ptr);
           if (fault_char1 == 8'b11111111)
              disable read_fault_file;
           ret_val = $ungetc (fault_char1, file_ptr);
           ret_val = $fgets(tempStr, file_ptr);
           ret_val = $sscanf(tempStr, "%s %d %d %s",fault_array,fault_word, fault_bit, stuck_at) ;
           flag_error = 0; 
           if(ret_val !== 0)
           begin         
              if(ret_val == 3 || ret_val == 4)
              begin
                if(ret_val == 3)
                   stuck_at = "sa0";

                if(stuck_at !== "sa0" && stuck_at !== "sa1" && stuck_at !== "none")
                begin
                   if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Wrong value for stuck at in fault file ",$realtime);
                   flag_error = 1;
                end    
                      
                if(fault_word >= words)
                begin
                   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Address out of range in fault file ",$realtime);
                   flag_error = 1;
                end    

                if(fault_bit >= bits)
                begin  
                  if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Faulty bit out of range in fault file ",$realtime);
                  flag_error = 1;
                end    

                
                        
                if(fault_array !== "mem_array")
                begin
                  if( (debug_level > 1) && ($realtime > message_control_time)) $display("%m - %t ST_WARNING: Fault array is not mem_array ",$realtime);
                  flag_error = 1;
                end

                if(fault_array === "red_array")
                begin
                  if( (debug_level > 1) && ($realtime > message_control_time)) $display("%m - %t ST_WARNING: Fault array can't be on redundancy array in non redundancy cut.",$realtime);
                  flag_error = 1;
                end

                
                

                if(flag_error == 0)
                //Correct Inputs
                begin
                   if(stuck_at === "none")
                   begin
                       if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: No fault injected, empty fault file ",$realtime);
                   end
                   else
                   //Adding the faults
                   begin
                      FailureLocn[t] = fault_word;
                      Failurebit[t]  = fault_bit ;
                      std_fault_word = fault_word;
                      fault_row_add[t] = std_fault_word[Addr-1:mux_bits];
                      mem_red_array_stuck_at[t] = fault_array;
                      fault_repair_flag[t] = 1'b0;
                      if (stuck_at === "sa0" )
                      begin
                         stuck0[fault_bit] = 1'b0;         
                         stuck_at_0fault[t] = stuck0;
                      end     
                      if (stuck_at === "sa1" )
                      begin
                         stuck1[fault_bit] = 1'b1;
                         stuck_at_1fault[t] = stuck1; 
                      end

                      array_stuck_at[t] = stuck_at;
                      t = t + 1;
                   end //if(stuck_at === "none")  
                end //if(flag_error == 0)
              end //if(ret_val == 2 || ret_val == 3 
              else
              //wrong number of arguments
              begin
                if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: WRONG VALUES ENTERED FOR FAULTY WORD OR FAULTY BIT OR STUCK_AT IN Fault_file_name ",$realtime);
                flag_error = 1;
              end
           end //if(ret_val !== 0)
           else
           begin 
               if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: No fault injected, empty fault file ",$realtime);
           end    
        end //for (i = 0; i< m
      end //begin: read_fault_file  
      $fclose (file_ptr);

      fcnt = t;
      
      //fault injection at time 0.
      task_insert_faults_in_memory;
  end // config_fault 
end
endtask

//--------------------------------------------------------------------
//             FAULT FILE HANDLING FUNCTIONALITY ENDS
//--------------------------------------------------------------------

//--------------------------------------------------------------------
//                     DISPLAY MESSAGES STARTS
//--------------------------------------------------------------------

wire BYP_EN_scff_din;
reg lastCK_rw;
reg MEM_EN_reg, bypass_en_reg;
reg delay;

initial
begin
   
  `ifdef ST_MEM_SLM
     `ifdef functional 
          operating_mode = "SLM + FUNCTIONAL";
     `else 
          operating_mode = "SLM + TIMING";
     `endif     
  `elsif functional
     operating_mode = "FUNCTIONAL";
  `else
     operating_mode = "TIMING";
  `endif

   debug_level= p_debug_level;
  
  if (debug_level === 2'b00) begin
          message_status = "All Info/Warning/Error Messages are Switched OFF";
  end        
  else if (debug_level === 2'b11) begin
          message_status = "All Info/Warning/Error Messages are Switched ON";
  end        
  else if (debug_level === 2'b01) begin
          message_status = "Error messages are switched ON. Warning/Info Messages are Switched OFF";
  end        
  else begin
          message_status = "Error/Warning messages are switched ON. Info Messages are Switched OFF";
  end        
  
  $timeformat (-9, 6, " ns --", 10);  
  reg_Fault_file_name = Fault_file_name; 
  reg_MEM_INITIALIZE  = MEM_INITIALIZE;
  reg_ConfigFault     = ConfigFault;
  reg_BinaryInit      = BinaryInit;
  reg_InitFileName    = InitFileName;
  reg_File_load_time  = File_load_time;
  
  file_loaded = 1'b0;
  if (reg_MEM_INITIALIZE === 1'b1) begin
          file_loaded = 1'b1;
  end
  delay = 1'b0;
  `ifndef ST_MEM_POWER_SEQUENCING_OFF
    Proper_shutdown = 1'b0;
  `endif  
  
  gndm = 1'b0;
  
  
  
  vddm = 1'b1;
  
  
  
  r_supply_trigger <= 1'b1;
  
  initn_pulse_done = 1; 
  
  if (INITN_buf === 1'b0 && supply_ok === 1) begin 
        initn_pulse_done = 1;  
  end
  task_read_fault_file;
  
  // IMP : Please Dont add any other statements beyond this in initial block
  #0; // This #0 is important to avoid race at start of simulation
  lastCK = CK;
  last_CK_rw = CK_rw;
  lastCK_rw = CK_rw;
  
  #(message_control_time + `st_delay_seq_taa)
  if (debug_level > 2) begin
    $display ("%m - %t ST_INFO : ***************************************", $realtime);
    $display ("%m - %t ST_INFO : The Model is Operating in %s MODE", $realtime, operating_mode);
    if (operating_mode == "TIMING") $display ("%m - %t ST_INFO : Please ensure SDF is properly annotated otherwise dummy values will be used", $realtime);
    $display ("%m - %t ST_INFO : %s", $realtime, message_status);
    
    if(ConfigFault) $display ("%m - %t ST_INFO : Configurable Fault Functionality is ON", $realtime);   
    else  $display ("%m - %t ST_INFO : Configurable Fault Functionality is OFF", $realtime);   
    
    $display ("%m - %t ST_INFO : Fault File used by the model Fault_File_Name=%s", $realtime, Fault_file_name);
    $display ("%m - %t ST_INFO : Values of Config_fault used in model=%d", $realtime, ConfigFault);
    $display ("%m - %t ST_INFO : Values of Mem_INITALIZE used in model=%d", $realtime, MEM_INITIALIZE);
    $display ("%m - %t ST_INFO : Values of BinaryInit used in model=%d", $realtime, BinaryInit);
    $display ("%m - %t ST_INFO : Values of InitFileName used in model=%s", $realtime, InitFileName);
    $display ("%m - %t ST_INFO : Values of File_load_time used in model=%t", $realtime, File_load_time);  
    
    $display ("%m - %t ST_INFO : ***************************************", $realtime);
  end
  // BEWARE : There is a seq delay. DO NOT add any statements after this.
end


always @(IO.bypass_en) 
begin
   if (IO.bypass_en === 1'bx) begin
           if (SLEEP_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SLEEP pin. Output Q corrupted", $realtime);
           end
           if (STDBY_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on STDBY pin. Output Q corrupted", $realtime);
           end   
           if (INITN_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on INITN pin. Output Q corrupted", $realtime);
           end   
           if (ATP_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on ATP pin. Output Q corrupted", $realtime);
           end   
           if (TBYPASS_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TBYPASS pin. Output Q corrupted", $realtime);
           end   

   end               
end


always @(CK_rw) 
begin

   if (lastCK_rw === 1'b0 && CK_rw === 1'b1) begin
 
           if (WEN_bmux === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on WEN/TWEN pin. Memory and Output Q corrupted", $realtime);
           end  
           
           #0; // This is to ensure ValidAddress calculation in "rw" block
           if (ValidAddress === 1'bx) begin 
                   if (WEN_bmux === 1'b0) begin
                           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on A/TA pin. Memory corrupted", $realtime);
                   end
                   else begin
                           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on A/TA pin. Memory and Output Q corrupted", $realtime);
                   end
           end
           else if (ValidAddress === 1'b0) begin
                   if (WEN_bmux !== 1'b1) begin
                           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Address Out of Range. No Memory Operation", $realtime);
                   end
                   else begin
                           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Address Out of Range. Output Q corrupted", $realtime);
                   end
           end        
   end
   
   else if (CK_rw === 1'bx) begin
         
           if (SLEEP_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SLEEP pin. Memory and Output Q corrupted", $realtime);
           end
           if (STDBY_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on STDBY pin. Memory and Output Q corrupted", $realtime);
           end
           if (INITN_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on INITN pin. Memory and Output Q corrupted", $realtime);
           end  
           if (ATP_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on ATP pin. Memory and Output Q corrupted", $realtime);
           end  
           if (SE_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SE pin. Memory and Output Q corrupted", $realtime);
           end  
           if (TBYPASS_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TBYPASS pin. Memory and Output Q corrupted", $realtime);
           end
           if (IG_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on IG pin. Memory and Output Q corrupted", $realtime);
           end  
           if (CSN_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on CSN pin. Memory and Output Q corrupted", $realtime);
           end
           if (TBIST_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TBIST pin. Memory and Output Q corrupted", $realtime);
           end  
           if (TBIST_buf === 1'b1 && TCSN_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TCSN pin. Memory and Output Q corrupted", $realtime);
           end  
           if (LS_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on LS pin. Memory and Output Q corrupted", $realtime);
           end
           if (HS_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on HS pin. Memory and Output Q corrupted", $realtime);
           end
   
   end

   lastCK_rw = CK_rw;

end

always @(CK_scff) begin
   if (CK_scff === 1'bx) begin
       if (CK === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on CK pin. All Scan Flops are corrupted", $realtime);
       end         
       if (SLEEP_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SLEEP pin. All Scan Flops are corrupted", $realtime);
       end         
       if (STDBY_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on STDBY pin. All Scan Flops are corrupted", $realtime);
       end         
       if (INITN_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on INITN pin. All Scan Flops are corrupted", $realtime);
       end         
       if (ATP_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on ATP pin. All Scan Flops are corrupted", $realtime);
       end         
       if (SE_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SE pin. All Scan Flops are corrupted", $realtime);
       end         
       if (TBYPASS_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TBYPASS pin. All Scan Flops are corrupted", $realtime);
       end
       else if (IO.shift_en_inst === 1'b0 && TBYPASS_buf === 1'b1 && BYP_EN_scff_din === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on LP-FLOP pin. All Scan Flops are corrupted", $realtime);
       end         
   end
end

always @(CK_lock_up_latch) begin
   if (CK_lock_up_latch === 1'bx) begin
       if (CK === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on CK pin. All Scan Outs are corrupted", $realtime);
       end         
       if (SLEEP_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SLEEP pin. All Scan Outs are corrupted", $realtime);
       end         
       if (STDBY_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on STDBY pin. All Scan Outs are corrupted", $realtime);
       end         
       if (INITN_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on INITN pin. All Scan Outs are corrupted", $realtime);
       end         
       if (SE_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SE pin. All Scan Outs are corrupted", $realtime);
       end         
   end
end

//----------------------------------------------------------------------
//                        DISPLAY MESSAGES ENDS
//----------------------------------------------------------------------

//--------------------------------------------------------------------------------
//               Features not supported in TMAX model - starts
//         
//         1) INITN pulse checking
//         2) GAC toggling during clock high period in scan shift mode
//         3) LS, HS functionality
//         4) RM, WM functionality
//         5) RTA, RTAE, RTABANK functionality
//         
//--------------------------------------------------------------------------------

assign LSint = LS_buf;
assign HSint = HS_buf;

assign DE_temp = (LSint === 1'bx || (HSint === 1'bx) || RM_buf !== 0 || WM_buf !== 0) ? 1'bx : 1'b0;
assign IO.DE_temp = DE_temp;

always @(INITN_buf)
begin
   if (INITN_buf === 1'b0 && supply_ok === 1'b1) begin
       `ifdef ST_MEM_INITN_OUTPUT_RESET
          Q_final <= 32'b0;
       `endif   
       initn_pulse_done = 1'b1;
       invalid_next_cycle_dft = 1'b0;
       invalid_next_cycle_func = 1'b0;
       release IO.cgc_CK_rw.CK_gated;
       release IO.cgc_CK_lkp_latch.CK_gated;
       release IO.cgc_CK_scff.CK_gated;
   end        
end

always @(supply_ok)
begin
 if (INITN_buf === 1'b0 && supply_ok === 1'b1) begin
     initn_pulse_done = 1'b1;
     invalid_next_cycle_dft = 1'b0;
     invalid_next_cycle_func = 1'b0;
     release IO.cgc_CK_rw.CK_gated;
     release IO.cgc_CK_lkp_latch.CK_gated;
     release IO.cgc_CK_scff.CK_gated;
 end   
end

assign IO.initn_pulse_done = initn_pulse_done;

always @(IO.GAC) begin
  
  if (IO.CK_lock_up_latch === 1'b1 && GAC_reg === 1'b1 && IO.GAC !== 1'b1) begin
	IO.cgc_CK_scff.CK_gated <= 1'bx;
	IO.cgc_CK_lkp_latch.CK_gated <= 1'bx;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : SLEEP / STDBY / INITN pin toggled during clock high time in scan shift mode. All Scan flops and Scan Outs Corrupted", $realtime);

  end

end



//--------------------------------------------------------------------------------
//               Features not supported in TMAX model - ends
//--------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------
//        Verilog Simulation Model : "rw" read/write functionality block starts 
//-----------------------------------------------------------------------------------

wire [bits-1 : 0] M_inv;
assign M_inv = ~M_bmux;

wire red_en = 0;
wire [repair_address_width-1 : 0] repair_add = 8'b0;
wire [repair_address_width-1 : 0] next_repair_add = 8'b0;
reg [mux_bits-1:0]Col_Add;
integer Col_Add_integer,Bank_sel_integer,RedMem_address;

always @(CK_rw)
begin
  if (last_CK_rw===1'b0 && CK_rw===1'b1) begin
     
    task_initialize_memory;
     
    if (^A_bmux === 1'bx) ValidAddress = 1'bx;
    else if (A_bmux < words) ValidAddress = 1'b1;
    else ValidAddress = 1'b0;

    repair_access = 0;
    
      
    if (ValidAddress === 1'bx) begin // Address 'X'
    	 WriteMemX;
       if (WEN_bmux !== 1'b0) Qtemp = WordX;
    end
    else begin // Address is valid	
            // Read Operation...
            if (WEN_bmux===1'b1)
            begin
              ReadCycle;
            end
            
            // Write Operation...
            else if (WEN_bmux===1'b0)
            begin
              `ifndef ST_MEM_SLM
                       Mem_prev = Mem[A_bmux];
              `endif
              WriteCycle;
            end

            else begin // WEN_bmux === 1'bx
              Qtemp = WordX;
              if (ValidAddress === 1'b1) begin
                Corrupt_Current_Location;
              end
            end
    end	 
  end // if (last_CK_rw===1'b0 && CK_rw=1'b1
  else if (CK_rw===1'bx) begin
    WriteMemX;
    Qtemp = WordX;
  end
  last_CK_rw = CK_rw;
  Qtemp <= WordZ;
end

task task_initialize_memory;
begin
     if (reg_MEM_INITIALIZE === 1'b1 && $realtime >= reg_File_load_time && file_loaded ) begin   
        `ifdef ST_MEM_SLM
          if (reg_BinaryInit)
             $slm_LoadMemory(slm_handle, reg_InitFileName, "VERILOG_BIN");
          else
             $slm_LoadMemory(slm_handle, reg_InitFileName, "VERILOG_HEX");
        `else
          if (reg_BinaryInit)
             $readmemb(reg_InitFileName, Mem, 0, words-1);
          else
             $readmemh(reg_InitFileName, Mem, 0, words-1);
        `endif
         file_loaded = 1'b0;
     end
end
endtask

task WriteCycle;                  
reg [bits-1:0] Mem_temp;
integer i;
begin
     `ifdef ST_MEM_SLM
          if (repair_access === 0) $slm_WriteMemory(slm_handle, A_bmux, D_bmux, M_inv);
     `else
          
          Mem_temp = {bits{1'bx}};
   
          // Reading the previous contents of memory
           
          if(repair_access === 0) Mem_temp = Mem[A_bmux];
          else if(repair_access === 1) Mem_temp = RedMem[RedMem_address];
          
          // Masking functionality
          for (i=0; i < bits; i=i+1) begin
            if (M_bmux[i] === 1'b0) Mem_temp[i]=D_bmux[i];
            else if (M_bmux[i] === 1'bx) begin
              if (Mem_temp[i] !== D_bmux[i]) Mem_temp[i]=1'bx;
              else Mem_temp[i] = D_bmux[i];
            end
          end // for (...
          
          //Finally writing into the memory address
          if(repair_access === 0 ) begin
             if (ValidAddress === 1'b1) begin
                Mem[A_bmux] = Mem_temp;
             end
          end        
          else if (repair_access === 1 )  RedMem[RedMem_address] = Mem_temp;
     `endif
     task_insert_faults_in_memory;     
end
endtask

task ReadCycle;
begin
     `ifdef ST_MEM_SLM
          if (repair_access === 0)  $slm_ReadMemory(slm_handle, A_bmux, Qtemp);
     `else
          if (repair_access === 0) begin
              if (ValidAddress === 1'b1) begin
                Qtemp = Mem[A_bmux];
              end
              else Qtemp = WordX;
          end    
          else if (repair_access === 1)  Qtemp = RedMem[RedMem_address];
     `endif
   
end
endtask

task WriteMemX;
integer i;
begin

`ifdef ST_MEM_SLM
  $slm_ResetMemory(slm_handle, WordX);
`else
  for (i = 0; i < words; i = i + 1) begin
     Mem[i] = WordX;
  end
  
  for (i = 0; i < RedWords; i = i + 1) begin
     RedMem[i] = WordX;
  end   

`endif
task_insert_faults_in_memory;     
end
endtask

task Corrupt_Current_Location;
begin
  `ifdef ST_MEM_SLM
     if (repair_access === 1'b0) $slm_WriteMemory(slm_handle, A_bmux, WordX);
  `else 
     if (repair_access === 1'b0) begin
       Mem[A_bmux] = WordX;
     end  
     else if (repair_access === 1'b1) begin
       RedMem[RedMem_address] = WordX;
     end    
  `endif
  task_insert_faults_in_memory;     
end
endtask

assign Q_CORE = Qtemp;

//-----------------------------------------------------------------------------------
//        Verilog Simulation Model : "rw" read/write functionality block ends 
//-----------------------------------------------------------------------------------


endmodule

`undef st_delay_seq_taa
`undef st_delay_seq_th
`undef st_msg_cntrl_time
`undef mono_rail
`undef mo_ma_tied
`undef mo_mp_tied
`undef dual_rail
`undef pswsmallma_settling_time
`undef pswlargema_settling_time
`undef pswsmallmp_settling_time
`undef pswlargemp_settling_time




//-------------------------------------------------------
//       module definition for INTERFACE
//-------------------------------------------------------


module ST_SPHD_LOVOLT_1024x32m4_bTMl_INTERFACE (
// functional inputs
A,D,M,CSN,WEN,CK,SE,TBYPASS,IG,SLEEP,ATP,STDBY,INITN,

// BIST inputs
TBIST,TCSN,TA,TED,TOD,TEM,TOM,TWEN,



// bist mux outputs
A_bmux,D_bmux,M_bmux,WEN_bmux,CSN_scff_din,

// Test Enable signals for Scan flops
shift_en_inst,

// Clocks for Scan flops and "rw" block
CK_scff, CK_lock_up_latch, CK_rw,

// Data and Control Scan flops outputs
D_scff_out,BYP_ENint,

// Q Output from rw and omux blocks
Q_CORE, Q, MEM_EN_inst

);

    localparam max_address_bits = 11;
    localparam Addr = 10;
    localparam bits =32;
    localparam words = 1024;
    localparam repair_address_width = 8;
    
    
    localparam mask_bits = 32; 
    

    output [bits-1 : 0] D_bmux;
    output [bits-1 : 0] Q;
    output [bits-1 : 0] M_bmux;
    output [Addr-1 : 0] A_bmux;
    output WEN_bmux, CSN_scff_din;
// CK_scff is the clock for Scan flops and "mp" block
    output CK_scff, CK_lock_up_latch;
// CK_rw is the clock for Read/Write (rw) block    
    output CK_rw, MEM_EN_inst; 

// Scan enable signal for the scan chain ----
    output shift_en_inst;



// --- functional inputs ----
    input SLEEP,ATP,STDBY,INITN;
    input IG,CK,SE;
    input TBYPASS;
    input [bits-1 : 0] D;
    
    input [mask_bits-1 :0] M; 
    
    input [Addr-1 : 0] A;
    
    input [Addr-1 : 0] TA;
    input TBIST,TWEN,TCSN,TED,TOD,TEM,TOM;
    input WEN,CSN;
//---- Output Q of the "mp" block -----
    input [bits-1 : 0] Q_CORE;

//---- 'Q' output of the scan flops -----
    

        input [bits-1 : 0] D_scff_out;
        input BYP_ENint;
    
    
    wire bypass_en_temp, SE_lat;
    reg pos_TBY=0;
    reg neg_SE_tby_high = 0;

    
    wire initn_pulse_done, DE_temp, supply_ok;
    




//Bist Mux Implementation

and (ATP_TBIST, ATP, TBIST);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim CSN_bistmux (ATP_TBIST, CSN, TCSN, CSN_bmux_temp);
buf (CSN_scff_din, CSN_bmux_temp);

ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim WEN_bistmux (ATP_TBIST, WEN, TWEN, WEN_bmux_temp);


assign CSN_bmux = ((ATP === 1'bx) || (ATP===1'b1 && SE === 1'bx)) ? 1'bx : CSN_bmux_temp;
assign WEN_bmux = ((ATP === 1'bx) || (ATP===1'b1 && SE === 1'bx)) ? 1'bx : WEN_bmux_temp;
assign TBYPASSint = (ATP === 1'bx && TBYPASS !== 1'b0) ? 1'bx : TBYPASS;
assign SEint = (ATP === 1'bx) ? 1'bx : SE;


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim addr_bistmux_0 (ATP_TBIST, A[0], TA[0], A_bmux[0]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim addr_bistmux_1 (ATP_TBIST, A[1], TA[1], A_bmux[1]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim addr_bistmux_2 (ATP_TBIST, A[2], TA[2], A_bmux[2]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim addr_bistmux_3 (ATP_TBIST, A[3], TA[3], A_bmux[3]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim addr_bistmux_4 (ATP_TBIST, A[4], TA[4], A_bmux[4]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim addr_bistmux_5 (ATP_TBIST, A[5], TA[5], A_bmux[5]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim addr_bistmux_6 (ATP_TBIST, A[6], TA[6], A_bmux[6]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim addr_bistmux_7 (ATP_TBIST, A[7], TA[7], A_bmux[7]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim addr_bistmux_8 (ATP_TBIST, A[8], TA[8], A_bmux[8]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim addr_bistmux_9 (ATP_TBIST, A[9], TA[9], A_bmux[9]);

ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_0 (ATP_TBIST,D[0], TED, D_bmux[0]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_1 (ATP_TBIST,D[1], TOD, D_bmux[1]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_2 (ATP_TBIST,D[2], TED, D_bmux[2]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_3 (ATP_TBIST,D[3], TOD, D_bmux[3]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_4 (ATP_TBIST,D[4], TED, D_bmux[4]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_5 (ATP_TBIST,D[5], TOD, D_bmux[5]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_6 (ATP_TBIST,D[6], TED, D_bmux[6]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_7 (ATP_TBIST,D[7], TOD, D_bmux[7]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_8 (ATP_TBIST,D[8], TED, D_bmux[8]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_9 (ATP_TBIST,D[9], TOD, D_bmux[9]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_10 (ATP_TBIST,D[10], TED, D_bmux[10]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_11 (ATP_TBIST,D[11], TOD, D_bmux[11]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_12 (ATP_TBIST,D[12], TED, D_bmux[12]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_13 (ATP_TBIST,D[13], TOD, D_bmux[13]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_14 (ATP_TBIST,D[14], TED, D_bmux[14]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_15 (ATP_TBIST,D[15], TOD, D_bmux[15]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_16 (ATP_TBIST,D[16], TED, D_bmux[16]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_17 (ATP_TBIST,D[17], TOD, D_bmux[17]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_18 (ATP_TBIST,D[18], TED, D_bmux[18]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_19 (ATP_TBIST,D[19], TOD, D_bmux[19]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_20 (ATP_TBIST,D[20], TED, D_bmux[20]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_21 (ATP_TBIST,D[21], TOD, D_bmux[21]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_22 (ATP_TBIST,D[22], TED, D_bmux[22]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_23 (ATP_TBIST,D[23], TOD, D_bmux[23]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_24 (ATP_TBIST,D[24], TED, D_bmux[24]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_25 (ATP_TBIST,D[25], TOD, D_bmux[25]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_26 (ATP_TBIST,D[26], TED, D_bmux[26]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_27 (ATP_TBIST,D[27], TOD, D_bmux[27]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_28 (ATP_TBIST,D[28], TED, D_bmux[28]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_29 (ATP_TBIST,D[29], TOD, D_bmux[29]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_30 (ATP_TBIST,D[30], TED, D_bmux[30]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim data_bistmux_31 (ATP_TBIST,D[31], TOD, D_bmux[31]);


  //Mask Bist Mux




ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_0 (ATP_TBIST , M[0], TEM, M_bmux[0]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_1 (ATP_TBIST , M[1], TOM, M_bmux[1]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_2 (ATP_TBIST , M[2], TEM, M_bmux[2]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_3 (ATP_TBIST , M[3], TOM, M_bmux[3]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_4 (ATP_TBIST , M[4], TEM, M_bmux[4]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_5 (ATP_TBIST , M[5], TOM, M_bmux[5]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_6 (ATP_TBIST , M[6], TEM, M_bmux[6]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_7 (ATP_TBIST , M[7], TOM, M_bmux[7]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_8 (ATP_TBIST , M[8], TEM, M_bmux[8]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_9 (ATP_TBIST , M[9], TOM, M_bmux[9]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_10 (ATP_TBIST , M[10], TEM, M_bmux[10]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_11 (ATP_TBIST , M[11], TOM, M_bmux[11]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_12 (ATP_TBIST , M[12], TEM, M_bmux[12]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_13 (ATP_TBIST , M[13], TOM, M_bmux[13]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_14 (ATP_TBIST , M[14], TEM, M_bmux[14]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_15 (ATP_TBIST , M[15], TOM, M_bmux[15]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_16 (ATP_TBIST , M[16], TEM, M_bmux[16]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_17 (ATP_TBIST , M[17], TOM, M_bmux[17]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_18 (ATP_TBIST , M[18], TEM, M_bmux[18]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_19 (ATP_TBIST , M[19], TOM, M_bmux[19]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_20 (ATP_TBIST , M[20], TEM, M_bmux[20]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_21 (ATP_TBIST , M[21], TOM, M_bmux[21]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_22 (ATP_TBIST , M[22], TEM, M_bmux[22]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_23 (ATP_TBIST , M[23], TOM, M_bmux[23]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_24 (ATP_TBIST , M[24], TEM, M_bmux[24]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_25 (ATP_TBIST , M[25], TOM, M_bmux[25]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_26 (ATP_TBIST , M[26], TEM, M_bmux[26]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_27 (ATP_TBIST , M[27], TOM, M_bmux[27]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_28 (ATP_TBIST , M[28], TEM, M_bmux[28]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_29 (ATP_TBIST , M[29], TOM, M_bmux[29]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_30 (ATP_TBIST , M[30], TEM, M_bmux[30]);
 


ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim M_after_bmux_31 (ATP_TBIST , M[31], TOM, M_bmux[31]);
  


// ----------------------------------------
// ------- Clock generation start ---------
// ----------------------------------------

and (GAC, INITN, initn_pulse_done, !STDBY, !SLEEP, supply_ok);

// Shift Enable calculation
and (shift_en_inst,SEint, ATP, GAC);

// Capture Enable calculation
and (capt_byp_en_inst, TBYPASSint, !BYP_ENint, !SEint, ATP, GAC);
and (capt_func_en_inst, !TBYPASSint, !SEint, ATP, GAC);

or (shift_or_capt_inst, shift_en_inst, capt_func_en_inst, capt_byp_en_inst);

// Clock Gating Logic
ST_SPHD_LOVOLT_1024x32m4_bTMl_CGCprim cgc_CK_scff (.EN(shift_or_capt_inst), .CK(CK), .CK_gated(CK_scff));

// Clock for lock-up-latch at the end of scan chains... (scan shift mode)
ST_SPHD_LOVOLT_1024x32m4_bTMl_CGCprim cgc_CK_lkp_latch (.EN(shift_en_inst), .CK(CK), .CK_gated(CK_lock_up_latch));

// ----- Memory enable signal

and (MEM_EN_inst_atp1, GAC, ATP, !SEint, !TBYPASSint, !IG, !CSN_bmux, !DE_temp);
and (MEM_EN_inst_atp0, GAC, !ATP, !IG, !CSN, !DE_temp);
or (MEM_EN_inst, MEM_EN_inst_atp1, MEM_EN_inst_atp0);

// ----- Clock generation for "rw" block
ST_SPHD_LOVOLT_1024x32m4_bTMl_CGCprim cgc_CK_rw (.EN(MEM_EN_inst), .CK(CK), .CK_gated(CK_rw));



// -----------------------------------
// ----- Clock generation ends -------
// -----------------------------------

// Inputs to OMUX : Output Q Enable Signal Calculations

// ----- Mem Enable signal -----
ST_SPHD_LOVOLT_1024x32m4_bTMl_DFFprim_blocking dff_mem_en (1'b0, bypass_en, CK_rw, MEM_EN_inst, MEMEN_reg_temp);
and (MEMEN_reg, MEMEN_reg_temp, !bypass_en); // To Avoid 'Z' violations


// ---- bypass enable signal -----
ST_SPHD_LOVOLT_1024x32m4_bTMl_DLATprim dlat_se (1'b0, 1'b0, !CK, SEint, SE_lat);


and (capt_byp_en_inst, GAC, ATP, !SEint, TBYPASSint, !BYP_ENint);
ST_SPHD_LOVOLT_1024x32m4_bTMl_CGCprim cgc_CK_bypass (.EN(capt_byp_en_inst), .CK(CK), .CK_gated(CK_bypass));

and (TBYP_rise, TBYPASSint, ATP, GAC);

always @(CK_bypass) begin
  if (CK_bypass === 1'b1) begin
    pos_TBY = 1'b0;
    neg_SE_tby_high = 1'b0;
  end
end

always @(TBYP_rise) begin
    if (TBYP_rise !== 1'b0 && (SEint !== 1'b1 || SE_lat === 1'bx)) begin
          pos_TBY = 1'bx;
    end
    else begin
          pos_TBY = 1'b0;
    end
    neg_SE_tby_high = 1'b0;
end

reg last_SElat;
initial begin
    // This #0 is important to avoid race at start of simulation
   #0 last_SElat = SE_lat;
end

always @(SE_lat) begin
  if (last_SElat === 1'b1 && SE_lat === 1'b0 && TBYP_rise === 1'b1) neg_SE_tby_high = 1'b1;
  else if (last_SElat === 1'b1 && SE_lat === 1'b0 && TBYP_rise === 1'bx) neg_SE_tby_high = 1'bx;
  else if (SE_lat === 1'bx && TBYP_rise !== 1'b0) neg_SE_tby_high = 1'bx;
  else begin
	neg_SE_tby_high = 1'b0;
	pos_TBY = 1'b0;
  end
  last_SElat = SE_lat;
end
or (bypass_en_temp, neg_SE_tby_high, pos_TBY);
or (bypass_en, CK_bypass, bypass_en_temp);



/*-------------------------------------------------------------------
        Output MUX : Paths on Output 'Q'
           1) Memory Read path : From "rw" block - Q_CORE
           2) BYPASS path      : From data scff  - D_scff_out
--------------------------------------------------------------------*/
ST_SPHD_LOVOLT_1024x32m4_bTMl_outputmux omux (.Q(Q), .D_scff_out(D_scff_out), .bypass_en(bypass_en), .Q_CORE(Q_CORE), .MEMEN_reg(MEMEN_reg));



endmodule

/*-------------------------------------------------------
        module definition for Output MUX block
--------------------------------------------------------*/

module ST_SPHD_LOVOLT_1024x32m4_bTMl_outputmux ( Q, D_scff_out, bypass_en, Q_CORE, MEMEN_reg);

localparam bits = 32;

input   MEMEN_reg;
input [bits-1:0] Q_CORE;

        input bypass_en;
        input [bits-1 : 0] D_scff_out;


output [bits-1:0] Q;
trireg (medium) [bits-1:0] Q;

ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_0 (MEMEN_reg, Q_CORE[0], Q[0]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_1 (MEMEN_reg, Q_CORE[1], Q[1]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_2 (MEMEN_reg, Q_CORE[2], Q[2]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_3 (MEMEN_reg, Q_CORE[3], Q[3]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_4 (MEMEN_reg, Q_CORE[4], Q[4]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_5 (MEMEN_reg, Q_CORE[5], Q[5]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_6 (MEMEN_reg, Q_CORE[6], Q[6]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_7 (MEMEN_reg, Q_CORE[7], Q[7]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_8 (MEMEN_reg, Q_CORE[8], Q[8]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_9 (MEMEN_reg, Q_CORE[9], Q[9]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_10 (MEMEN_reg, Q_CORE[10], Q[10]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_11 (MEMEN_reg, Q_CORE[11], Q[11]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_12 (MEMEN_reg, Q_CORE[12], Q[12]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_13 (MEMEN_reg, Q_CORE[13], Q[13]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_14 (MEMEN_reg, Q_CORE[14], Q[14]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_15 (MEMEN_reg, Q_CORE[15], Q[15]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_16 (MEMEN_reg, Q_CORE[16], Q[16]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_17 (MEMEN_reg, Q_CORE[17], Q[17]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_18 (MEMEN_reg, Q_CORE[18], Q[18]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_19 (MEMEN_reg, Q_CORE[19], Q[19]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_20 (MEMEN_reg, Q_CORE[20], Q[20]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_21 (MEMEN_reg, Q_CORE[21], Q[21]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_22 (MEMEN_reg, Q_CORE[22], Q[22]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_23 (MEMEN_reg, Q_CORE[23], Q[23]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_24 (MEMEN_reg, Q_CORE[24], Q[24]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_25 (MEMEN_reg, Q_CORE[25], Q[25]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_26 (MEMEN_reg, Q_CORE[26], Q[26]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_27 (MEMEN_reg, Q_CORE[27], Q[27]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_28 (MEMEN_reg, Q_CORE[28], Q[28]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_29 (MEMEN_reg, Q_CORE[29], Q[29]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_30 (MEMEN_reg, Q_CORE[30], Q[30]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim memory_path_31 (MEMEN_reg, Q_CORE[31], Q[31]);

ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_0 (bypass_en, D_scff_out[0], Q[0]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_1 (bypass_en, D_scff_out[1], Q[1]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_2 (bypass_en, D_scff_out[2], Q[2]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_3 (bypass_en, D_scff_out[3], Q[3]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_4 (bypass_en, D_scff_out[4], Q[4]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_5 (bypass_en, D_scff_out[5], Q[5]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_6 (bypass_en, D_scff_out[6], Q[6]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_7 (bypass_en, D_scff_out[7], Q[7]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_8 (bypass_en, D_scff_out[8], Q[8]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_9 (bypass_en, D_scff_out[9], Q[9]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_10 (bypass_en, D_scff_out[10], Q[10]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_11 (bypass_en, D_scff_out[11], Q[11]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_12 (bypass_en, D_scff_out[12], Q[12]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_13 (bypass_en, D_scff_out[13], Q[13]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_14 (bypass_en, D_scff_out[14], Q[14]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_15 (bypass_en, D_scff_out[15], Q[15]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_16 (bypass_en, D_scff_out[16], Q[16]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_17 (bypass_en, D_scff_out[17], Q[17]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_18 (bypass_en, D_scff_out[18], Q[18]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_19 (bypass_en, D_scff_out[19], Q[19]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_20 (bypass_en, D_scff_out[20], Q[20]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_21 (bypass_en, D_scff_out[21], Q[21]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_22 (bypass_en, D_scff_out[22], Q[22]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_23 (bypass_en, D_scff_out[23], Q[23]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_24 (bypass_en, D_scff_out[24], Q[24]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_25 (bypass_en, D_scff_out[25], Q[25]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_26 (bypass_en, D_scff_out[26], Q[26]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_27 (bypass_en, D_scff_out[27], Q[27]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_28 (bypass_en, D_scff_out[28], Q[28]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_29 (bypass_en, D_scff_out[29], Q[29]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_30 (bypass_en, D_scff_out[30], Q[30]);
ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim bypass_path_31 (bypass_en, D_scff_out[31], Q[31]);

endmodule











module ST_SPHD_LOVOLT_1024x32m4_bTMl_WANDprim (out,in1,in2);
input in1,in2;
output out;

assign out = (in1 === 1'b0 || in2 === 1'b0) ? 1'b0 : (in1 === 1'b1 && in2 === 1'b1) ? 1'b1 : (in1 === 1'bz && in2 === 1'bz) ? 1'b0 : 1'bx;
endmodule


module ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim (SEL, A, B, Z);
input SEL, A, B;
output Z;

assign Z = (SEL === 1'b0) ? A : (SEL === 1'b1) ? B : 1'bx;

endmodule



module ST_SPHD_LOVOLT_1024x32m4_bTMl_CGCprim (EN, CK, CK_gated);
input EN, CK;
output reg CK_gated;
reg last_CK;

initial begin
  // This #0 is important to avoid race at start of simulation
  #0 last_CK = CK;
end        

  always @(CK or EN) begin

     if (CK === 1'b0) begin
       CK_gated = CK;
     end
     else if (last_CK === 1'b0 && CK === 1'b1) begin
       CK_gated = EN;
     end
     else if (CK === 1'bx) begin
       if (EN !== 1'b0) CK_gated = 1'bx;
       else CK_gated = 1'b0;
     end  
     last_CK = CK;
  end

endmodule

module ST_SPHD_LOVOLT_1024x32m4_bTMl_lock_up_latch (CK, D, Q);
input CK,D;
output Q;

ST_SPHD_LOVOLT_1024x32m4_bTMl_DLATprim dlat_lockup (1'b0, 1'b0, CK, D, Q);

endmodule

module ST_SPHD_LOVOLT_1024x32m4_bTMl_SCFF (D,TI,TE,CP,Q);
input D,TI,TE,CP;
output Q;

ST_SPHD_LOVOLT_1024x32m4_bTMl_MUXprim mux_in_scff (TE, D, TI, temp);
ST_SPHD_LOVOLT_1024x32m4_bTMl_DFFprim dff_in_scff (1'b0, 1'b0, CP, temp, Q);

endmodule

module ST_SPHD_LOVOLT_1024x32m4_bTMl_DFFprim (SET,CLR,CK,D,Q);
output reg Q;
input D,SET,CLR,CK;
reg Qtemp, last_CK;

        initial begin
         // This #0 is important to avoid race at start of simulation
        #0 last_CK = CK;
        end

        always @ (SET or CLR or CK) begin
          
          if (SET === 1'b1 && CLR === 1'b0) Q = 1'b1;  // Output is SET
          else if (SET === 1'b1 && CLR !== 1'b0) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (SET === 1'b0 && CLR === 1'b1) Q = 1'b0; // Output is RESET
          else if (SET !== 1'b0 && CLR === 1'b1) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (last_CK === 1'b0 && CK === 1'b1) Q <= D;  
          else if (CK === 1'bx) Q <= 1'bx;
          
          last_CK = CK;
        end   

endmodule

module ST_SPHD_LOVOLT_1024x32m4_bTMl_DFFprim_blocking (SET,CLR,CK,D,Q);
output reg Q;
input D,SET,CLR,CK;
reg last_CK;

        initial begin
         // This #0 is important to avoid race at start of simulation
        #0 last_CK = CK;
        end

        always @ (SET or CLR or CK) begin
          
          if (SET === 1'b1 && CLR === 1'b0) Q = 1'b1;  // Output is SET
          else if (SET === 1'b1 && CLR !== 1'b0) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (SET === 1'b0 && CLR === 1'b1) Q = 1'b0; // Output is RESET
          else if (SET !== 1'b0 && CLR === 1'b1) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (last_CK === 1'b0 && CK === 1'b1) Q = D;  
          else if (CK === 1'bx) Q = 1'bx;
          
          last_CK = CK;
        end  

endmodule

module ST_SPHD_LOVOLT_1024x32m4_bTMl_DLATprim (SET,CLR,CK,D,Q);
output reg Q;
input D,SET,CLR,CK;
reg Qprev;

        always @ (SET or CLR or CK or D) begin
          
          if (SET === 1'b1 && CLR === 1'b0) Q = 1'b1;  // Output is SET
          else if (SET === 1'b1 && CLR !== 1'b0) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (SET === 1'b0 && CLR === 1'b1) Q = 1'b0; // Output is RESET
          else if (SET !== 1'b0 && CLR === 1'b1) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (CK === 1'b1) Q = D;  // Latch Transparant
          else if (CK === 1'bx) Q = 1'bx;
        
          Qprev = Q; // Storing the previous value of Q
        
        end

endmodule

module ST_SPHD_LOVOLT_1024x32m4_bTMl_SWprim (control,in,out);
output out;
input control,in;

assign out = (control === 1'b1) ? in : 
             (control === 1'b0) ? 1'bz :
             1'bx;
endmodule


`endcelldefine





        

/***************************************************************************************************************************************************
--  Description       :  Verilog Model 
--  ModelVersion      : 1.9
--  Date              : 24-Sept-2014
--  Changes Made by   : PS
*****************************************************************************************************************************************************/

/************************************** START OF HEADER *****************************************
   This Header Gives Information about the parameters & options present in the Model
   
   words = 512
   bits  = 32
   mux   = 4 
   bank = 1
   bit_mask = yes
   Redundancy = no
   margin_control = yes
   ls_pin = yes
   hs_pin = yes
   Sleep = Yes
   eswitch = No
   power_supply = Default
   
   --------------------------------------------------------------------------------------------
     Signal Name             | Description       |             Port Mode        | Active When
                             |                   |          r    |  w   | rw    |
   --------------------------------------------------------------------------------------------

    A                           Address                     x      x      na       -
    ATP                         ATP pin                     x      x      na       high
    CK                          Clock	                    x      x      na       posedge
    CSN                         Chip Enable                 x      x      na       low
    D 	                        Data in                     na     x      na       -  
    
    HS                          High Speed Mode Enable      x      x      na       High
    IG                          Input Gate Enable           x      x      na       High     
    INITN                       Initialization Pin          x      x      na       Low
    
    LS                          Low Speed Mode Enable       x      x      na       High 
    
    M                           Mask in                     na     x      na       High  
    
    
    
    Q 	                        Data out	            x      na     na       -
    
    RM                           Read Margins                x      x      na       High 
    
    
    SCTRLI                      Scan Input (Control)
    SCTRLO                      Scan Output (Control)
    SDLI                        Scan Input (Data-Left)
    SDLO                        Scan Output (Data-Left)
    SDRI                        Scan Input (Data-Right)
    SDRO                        Scan Output (Data-Right)
    SE                          Scan Enable pin            -      -      -       High
    
    
    
    SMLI                        Scan Input (Mask-Left)        
    SMLO                        Scan Output (Mask-Left)
    SMRI                        Scan Input (Mask-Right)
    SMRO                        Scan Output (Mask-Right)  
    
    
    
    
     

    STDBY                       Stand-by mode enable        x      x      na       High  
    
    TA                          Bist Address
    TBIST                       Bist Enable Pin             x      x      na       High  
    
    TBYPASS                     Memory Bypass               na     na     na       High
    TCSN                        Bist Chip Select            x      x      na       Low
    TED                         Bist Even Data pin
    
    TEM                         Bist Even Mask pin
    TOD                         Bist Odd Data Pin
    
    TOM                         Bist Odd Mask Pin  
     
    TWEN                        Bist Write Enable           na     x      na       Low 
    WEN                         Write Enable                na     x      na       Low 
    
    WM                           Write Margins Code           x      x      na       - 

************************************** END OF HEADER ********************************************/




`celldefine

`ifdef ST_DELAY_SEQ
  `define st_delay_seq_taa `ST_DELAY_SEQ
`else
  `define st_delay_seq_taa 0.001
`endif

`ifdef ST_MEM_RETAIN_TIME
 `define st_delay_seq_th `ST_MEM_RETAIN_TIME
`else
 `define st_delay_seq_th 0.001
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_TIMESCALE
 `ST_TIMESCALE
`else
 `timescale 1ns/1ps
`endif

`ifdef ST_MSG_CONTROL_TIME
        `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
        `define st_msg_cntrl_time 0
`endif

`ifdef ST_MEM_BLOCK_CTRL_TIME
        `define st_mem_block_ctrl_time `ST_MEM_BLOCK_CTRL_TIME
`else
        `define st_mem_block_ctrl_time 0
`endif

`define mono_rail 2'b00
`define mo_ma_tied 2'b01
`define mo_mp_tied 2'b10
`define dual_rail 2'b11


`ifdef ST_MEM_PSWSMALLMA_SETTLING_TIME
  `define pswsmallma_settling_time `ST_MEM_PSWSMALLMA_SETTLING_TIME
`else  
  `define pswsmallma_settling_time 1000
`endif

`ifdef ST_MEM_PSWLARGEMA_SETTLING_TIME
  `define pswlargema_settling_time `ST_MEM_PSWLARGEMA_SETTLING_TIME
`else  
  `define pswlargema_settling_time 1000
`endif

`ifdef ST_MEM_PSWSMALLMP_SETTLING_TIME
  `define pswsmallmp_settling_time `ST_MEM_PSWSMALLMP_SETTLING_TIME
`else  
  `define pswsmallmp_settling_time 1000
`endif

`ifdef ST_MEM_PSWLARGEMP_SETTLING_TIME
  `define pswlargemp_settling_time `ST_MEM_PSWLARGEMP_SETTLING_TIME
`else  
  `define pswlargemp_settling_time 1000
`endif


/*------------------------------------------------------------------------------------------
            ST_SPHD_LOVOLT_512x32m4_bTMl model for Verilog 
-------------------------------------------------------------------------------------------*/

module ST_SPHD_LOVOLT_512x32m4_bTMl (A, ATP, CK, CSN, D , HS, IG, INITN , LS, M, Q, RM, SCTRLI,SCTRLO,SDLI,SDLO,SDRI,SDRO,SE, SMLI,SMLO,SMRI,SMRO,   STDBY ,TA,TBIST, TBYPASS ,TCSN,TED ,TEM  ,TOD  ,TOM , TWEN, WEN, WM);

    
    parameter
        `ifdef ST_MEM_CONFIGFAULT
                ConfigFault = 1,
        `else
                ConfigFault = 0,
        `endif
        
        `ifdef ST_NO_MSG_MODE  
                p_debug_level = 2'b00,
        `elsif ST_ALL_MSG_MODE  
                p_debug_level = 2'b11,
        `elsif ST_ERROR_ONLY_MODE 
                p_debug_level = 2'b01,
        `else 
                p_debug_level = 2'b10,
        `endif
        
        
        power_pins_config = `mono_rail,

        Fault_file_name = "ST_SPHD_LOVOLT_512x32m4_bTMl_faults.txt",
        max_faults = 512+2,
        MEM_INITIALIZE  = 1'b0,
        BinaryInit = 1'b0,
        InitFileName = "ST_SPHD_LOVOLT_512x32m4_bTMl.cde",
        Debug_mode = "all_warning_mode",
        File_load_time=0,
        InstancePath = "ST_SPHD_LOVOLT_512x32m4_bTMl",
        
        p_pswsmallma_settling_time = `pswsmallma_settling_time,
        p_pswlargema_settling_time = `pswlargema_settling_time,
        p_pswsmallmp_settling_time = `pswsmallmp_settling_time,
        p_pswlargemp_settling_time = `pswlargemp_settling_time,
        message_control_time = `st_msg_cntrl_time,
        mem_block_ctrl_time = `st_mem_block_ctrl_time;
        

    localparam
        words = 512,
        bits = 32,
        Addr = 9,
        max_address_bits = 11,
        
        
        mask_bits = 32, 
        
        mux = 4,
        Logmux = 2,
        mux_bits=2,
        bank_bits=0,
        RedWords = mux * 2 * 1,
        Rows = words/mux,
        repair_address_width = 7,
        write_margin_size = 4, 
        read_margin_size = 4;

    localparam 
       scanlen_ctrl=17,
    
       scanlen_r= 16,
       scanlen_l= 16;

    localparam
        WordX = {bits{1'bx}},
        WordZ = {bits{1'bz}},
        AddrX = {Addr{1'bx}},
        Word0 = {bits{1'b0}},
        X = 1'bx;
    

//---------------  IN / OUT Declarations -----------

//--------------------------------------------------
//           Global Active (GAC) Pins 
//--------------------------------------------------
 
        input STDBY;
        input INITN;

//--------------------------------------------------
//              FUNCTIONAL Pins 
//--------------------------------------------------
	output [bits-1 : 0] Q;
        
        input CK;
        input CSN, IG, WEN;
        input [bits-1 : 0] D ;
	input [Addr-1 : 0] A;
        input [mask_bits-1:0] M;

//--------------------------------------------------
//                TEST Mode Pins 
//--------------------------------------------------
        input ATP;
    
    // Scan Flops related pins
        
        input SE;
        input SCTRLI,SDLI,SDRI ,SMLI,SMRI ;
        output SCTRLO, SDLO, SDRO , SMLO, SMRO;
        
    // Bypass pin
        input TBYPASS;
        
    // BIST Related Pins 
         input TBIST;
         input [Addr-1 :0 ] TA;
         input TCSN,TWEN,TED,TOD; 
         input TEM,TOM;
         

        

        

//----------------------------------------------------
//           Margin Control Related Pins
//----------------------------------------------------
        
        
        input [read_margin_size-1 : 0] RM;
        input [write_margin_size-1 : 0] WM;
        

//----------------------------------------------------
//             Speed Mode Related Pins
//----------------------------------------------------
        input LS;
        input HS;

//----------------------------------------------------
//              Eswitch Related Pins
//----------------------------------------------------
        
        

       
        
        
        reg gndm;
        
        
        
        reg vddm;
        
        
        
        
        

//----------------------------------------------------
//           Wire and Reg Declarations
//----------------------------------------------------
        
        wire WEN_bmux;
        wire CK_scff, CK_lock_up_latch;
        wire CK_rw;
        wire [Addr-1 : 0] A_bmux;
        wire [max_address_bits-1 : 0] A_scff_din; 

        wire [bits-1 : 0] M_bmux;
        wire [bits-1 : 0] M_scff_out;

        
        wire [bits-1 : 0] D_bmux;
        wire [bits-1 : 0] D_scff_out;

        wire [scanlen_ctrl-1 : 0] ctrl_scff_in;
        wire [scanlen_ctrl-1 : 0] ctrl_scff_out; 
        wire [bits-1 : 0] Q_int, Q_CORE; 
        
        wire SCTRLO_temp, SDLO_temp  ,SDRO_temp ,SMLO_temp  ,SMRO_temp;
        
        wire CK_buf;
        

        buf (CK_buf, CK); // while blocking the memory, CK_buf will be forced to 'x' 



        reg SLEEP_buf_r;
	reg STDBY_buf_r;
	reg INITN_buf_r;
	reg CSN_buf_r;
	reg IG_buf_r;
	reg WEN_buf_r;
        reg [bits-1 : 0] D_buf_r;
        reg [Addr-1 : 0] A_buf_r;
        reg [mask_bits-1 : 0] M_buf_r;
	reg ATP_buf_r;
	reg SE_buf_r;
	reg SCTRLI_buf_r;
	reg SDLI_buf_r;
	reg SDRI_buf_r;
	
        reg SMLI_buf_r;
	reg SMRI_buf_r;
	
        reg TBYPASS_buf_r;
        reg TBIST_buf_r;
        reg [Addr-1 : 0] TA_buf_r;
	reg TCSN_buf_r;
	reg TWEN_buf_r;
	reg TED_buf_r;
	reg TOD_buf_r;
	reg TEM_buf_r;
	reg TOM_buf_r;


        reg [read_margin_size-1 : 0] RM_buf_r;
        reg [write_margin_size-1 : 0] WM_buf_r;
        reg LS_buf_r;
        reg HS_buf_r;

  
        
        wire SLEEP_buf;
	wire STDBY_buf;
	wire INITN_buf;
	wire CSN_buf;
	wire IG_buf;
	wire WEN_buf;
        wire [bits-1 : 0] D_buf;
        wire [Addr-1 : 0] A_buf;
        wire [mask_bits-1 : 0] M_buf;
	wire ATP_buf;
	wire SE_buf;
	wire SCTRLI_buf;
	wire SDLI_buf;
	wire SDRI_buf;
	
        wire SMLI_buf;
	wire SMRI_buf;
	
        wire TBYPASS_buf;
        wire TBIST_buf;
        wire [Addr-1 : 0] TA_buf;
	wire TCSN_buf;
	wire TWEN_buf;
	wire TED_buf;
	wire TOD_buf;
	wire TEM_buf;
	wire TOM_buf;


        wire [read_margin_size-1 : 0] RM_buf;
        wire [write_margin_size-1 : 0] WM_buf;
        wire LS_buf;
        wire HS_buf;

  

        
        reg [bits-1 : 0] Q_final;
        reg r_supply_trigger;

//----------------------------------------------------
//              Input Non-Blocking Buffers Starts
//----------------------------------------------------

       
        assign SLEEP_buf = 1'b0;
        
        always @(STDBY or r_supply_trigger) begin
          STDBY_buf_r <= STDBY;
        end
        buf (STDBY_buf, STDBY_buf_r);
        
        always @(INITN or r_supply_trigger) begin
          INITN_buf_r <= INITN;
        end
        buf (INITN_buf, INITN_buf_r);
        
        always @(CSN or r_supply_trigger) begin
          CSN_buf_r <= CSN;
        end
        buf (CSN_buf, CSN_buf_r);
        
        always @(IG or r_supply_trigger) begin
          IG_buf_r <= IG;
        end
        buf (IG_buf, IG_buf_r);
        
        always @(WEN or r_supply_trigger) begin
          WEN_buf_r <= WEN;
        end
        buf (WEN_buf, WEN_buf_r);
        
        always @(D or r_supply_trigger) begin
          D_buf_r <= D;
        end
        buf buf_d [bits-1 : 0] (D_buf, D_buf_r);
        
        always @(A or r_supply_trigger) begin
          A_buf_r <= A;
        end
        buf buf_a [Addr-1 : 0] (A_buf, A_buf_r);
        
        always @(M or r_supply_trigger) begin
          M_buf_r <= M;
        end
        buf buf_m [mask_bits-1 : 0] (M_buf, M_buf_r);
        
        always @(ATP or r_supply_trigger) begin
          ATP_buf_r <= ATP;
        end
        buf (ATP_buf, ATP_buf_r);
        
        always @(SE or r_supply_trigger) begin
          SE_buf_r <= SE;
        end
        buf (SE_buf, SE_buf_r);
        
        always @(SCTRLI or r_supply_trigger) begin
          SCTRLI_buf_r <= SCTRLI;
        end
        buf (SCTRLI_buf, SCTRLI_buf_r);
        
        always @(SDLI or r_supply_trigger) begin
          SDLI_buf_r <= SDLI;
        end
        buf (SDLI_buf, SDLI_buf_r);
        
        always @(SDRI or r_supply_trigger) begin
          SDRI_buf_r <= SDRI;
        end
        buf (SDRI_buf, SDRI_buf_r);
        
        
        always @(SMLI or r_supply_trigger) begin
          SMLI_buf_r <= SMLI;
        end
        buf (SMLI_buf, SMLI_buf_r);
        
        always @(SMRI or r_supply_trigger) begin
          SMRI_buf_r <= SMRI;
        end
        buf (SMRI_buf, SMRI_buf_r);
        
        
        
        always @(TBYPASS or r_supply_trigger) begin
          TBYPASS_buf_r <= TBYPASS;
        end
        buf (TBYPASS_buf, TBYPASS_buf_r);
        
        always @(TBIST or r_supply_trigger) begin
          TBIST_buf_r <= TBIST;
        end
        buf (TBIST_buf, TBIST_buf_r);
        
        always @(TA or r_supply_trigger) begin
          TA_buf_r <= TA;
        end
        buf buf_ta [Addr-1 : 0] (TA_buf, TA_buf_r);
        
        always @(TCSN or r_supply_trigger) begin
          TCSN_buf_r <= TCSN;
        end
        buf (TCSN_buf, TCSN_buf_r);
        
        always @(TWEN or r_supply_trigger) begin
          TWEN_buf_r <= TWEN;
        end
        buf (TWEN_buf, TWEN_buf_r);
        
        always @(TED or r_supply_trigger) begin
          TED_buf_r <= TED;
        end
        buf (TED_buf, TED_buf_r);
        
        always @(TOD or r_supply_trigger) begin
          TOD_buf_r <= TOD;
        end
        buf (TOD_buf, TOD_buf_r);
        
        always @(TEM or r_supply_trigger) begin
          TEM_buf_r <= TEM;
        end
        buf (TEM_buf, TEM_buf_r);
        
        always @(TOM or r_supply_trigger) begin
          TOM_buf_r <= TOM;
        end
        buf (TOM_buf, TOM_buf_r);
        
        
        
        
        always @(RM or r_supply_trigger) begin
          RM_buf_r <= RM;
        end
        buf buf_rm [read_margin_size-1 : 0] (RM_buf, RM_buf_r);
        
        always @(WM or r_supply_trigger) begin
          WM_buf_r <= WM;
        end
        buf buf_wm [write_margin_size-1 : 0] (WM_buf, WM_buf_r);
        
        always @(LS or r_supply_trigger) begin
          LS_buf_r <= LS;
        end
        buf (LS_buf, LS_buf_r);
        
        always @(HS or r_supply_trigger) begin
          HS_buf_r <= HS;
        end
        buf (HS_buf, HS_buf_r);
        
        
//----------------------------------------------------
//              Input Non-Blocking Buffers Ends
//----------------------------------------------------


/*---------------------------------------------------------------------------
                     Functional Control Unit.
        1) BIST MUXes
        2) Clock generation : CK_scff, CK_rw, CK_lock_up_latch
        3) Output MUX
----------------------------------------------------------------------------*/

ST_SPHD_LOVOLT_512x32m4_bTMl_INTERFACE IO (

// functional inputs
.A(A_buf),.D(D_buf),.M(M_buf),.CSN(CSN_buf),.WEN(WEN_buf),.CK(CK_buf),.SE(SE_buf),.TBYPASS(TBYPASS_buf),.IG(IG_buf),.SLEEP(SLEEP_buf),.ATP(ATP_buf),.STDBY(STDBY_buf),.INITN(INITN_buf),

// BIST inputs
.TBIST(TBIST_buf),.TCSN(TCSN_buf),.TA(TA_buf),.TED(TED_buf),.TOD(TOD_buf),.TEM(TEM_buf),.TOM(TOM_buf),.TWEN(TWEN_buf),



// bist mux outputs
.A_bmux(A_bmux),.D_bmux(D_bmux),.M_bmux(M_bmux),.WEN_bmux(WEN_bmux),.CSN_scff_din(CSN_scff_din),

// Test Enable signals for Scan flops
.shift_en_inst(shift_en_inst),

// Clocks for Scan flops and "mp" block
.CK_scff(CK_scff),.CK_lock_up_latch(CK_lock_up_latch),.CK_rw(CK_rw),

// Data and Control Scan flops outputs
.D_scff_out(D_scff_out),.BYP_ENint(ctrl_scff_out[16]),

// Q Output from rw and omux blocks
.Q_CORE(Q_CORE), .Q(Q_int), .MEM_EN_inst(MEM_EN_inst)

);

/*---------------------------------------------
        'D' input for Control Scan flops
----------------------------------------------*/

buf (A_scff_din[0], A_bmux[0]);
buf (A_scff_din[1], A_bmux[1]);
buf (A_scff_din[2], A_bmux[2]);
buf (A_scff_din[3], A_bmux[3]);
buf (A_scff_din[4], A_bmux[4]);
buf (A_scff_din[5], A_bmux[5]);
buf (A_scff_din[6], A_bmux[6]);
buf (A_scff_din[7], A_bmux[7]);
buf (A_scff_din[8], A_bmux[8]);

buf (A_scff_din[9],1'b0);
buf (A_scff_din[10],1'b0);

buf (WEN_scff_din, WEN_bmux);

/*------------------------------------     
        CONTROL SCAN CHAIN
------------------------------------*/



buf  (ctrl_scff_in[0], A_scff_din[10]);
buf  (ctrl_scff_in[1], A_scff_din[9]);
buf  (ctrl_scff_in[2], A_scff_din[8]);
buf  (ctrl_scff_in[3], A_scff_din[7]);
buf  (ctrl_scff_in[4], A_scff_din[6]);
buf  (ctrl_scff_in[5], A_scff_din[5]);
buf  (ctrl_scff_in[6], A_scff_din[4]);
buf  (ctrl_scff_in[7], A_scff_din[3]);
buf  (ctrl_scff_in[8], A_scff_din[2]);
buf  (ctrl_scff_in[9], A_scff_din[0]);
buf  (ctrl_scff_in[10], A_scff_din[1]);
buf  (ctrl_scff_in[11], 1'b0);
buf  (ctrl_scff_in[12], 1'b0);
buf  (ctrl_scff_in[13], 1'b0);
buf  (ctrl_scff_in[14], CSN_scff_din);
buf  (ctrl_scff_in[15], WEN_scff_din);
buf  (ctrl_scff_in[16], ctrl_scff_out[16]);

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_0  (.D(ctrl_scff_in[0]), .TI(SCTRLI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[0]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_1 (.D(ctrl_scff_in[1]), .TI(ctrl_scff_out[0]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[1]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_2 (.D(ctrl_scff_in[2]), .TI(ctrl_scff_out[1]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[2]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_3 (.D(ctrl_scff_in[3]), .TI(ctrl_scff_out[2]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[3]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_4 (.D(ctrl_scff_in[4]), .TI(ctrl_scff_out[3]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[4]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_5 (.D(ctrl_scff_in[5]), .TI(ctrl_scff_out[4]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[5]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_6 (.D(ctrl_scff_in[6]), .TI(ctrl_scff_out[5]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[6]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_7 (.D(ctrl_scff_in[7]), .TI(ctrl_scff_out[6]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[7]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_8 (.D(ctrl_scff_in[8]), .TI(ctrl_scff_out[7]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[8]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_9 (.D(ctrl_scff_in[9]), .TI(ctrl_scff_out[8]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[9]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_10 (.D(ctrl_scff_in[10]), .TI(ctrl_scff_out[9]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[10]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_11 (.D(ctrl_scff_in[11]), .TI(ctrl_scff_out[10]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[11]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_12 (.D(ctrl_scff_in[12]), .TI(ctrl_scff_out[11]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[12]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_13 (.D(ctrl_scff_in[13]), .TI(ctrl_scff_out[12]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[13]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_14 (.D(ctrl_scff_in[14]), .TI(ctrl_scff_out[13]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[14]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_15 (.D(ctrl_scff_in[15]), .TI(ctrl_scff_out[14]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[15]));

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_ctrl_16 (.D(ctrl_scff_in[16]), .TI(ctrl_scff_out[15]), .TE(shift_en_inst), .CP(CK_scff), .Q(ctrl_scff_out[16]));

ST_SPHD_LOVOLT_512x32m4_bTMl_lock_up_latch  latch_SCTRLO (.CK(!CK_lock_up_latch), .D(ctrl_scff_out[16]), .Q(SCTRLO_temp));


/*-----------------------------------
        LEFT DATA SCAN CHAIN
------------------------------------*/

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_0 (.D(D_bmux[15]), .TI(SDLI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[15])); 


 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_1 (.D(D_bmux[14]),  .TI(D_scff_out[15]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[14]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_2 (.D(D_bmux[13]),  .TI(D_scff_out[14]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[13]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_3 (.D(D_bmux[12]),  .TI(D_scff_out[13]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[12]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_4 (.D(D_bmux[11]),  .TI(D_scff_out[12]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[11]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_5 (.D(D_bmux[10]),  .TI(D_scff_out[11]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[10]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_6 (.D(D_bmux[9]),  .TI(D_scff_out[10]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[9]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_7 (.D(D_bmux[8]),  .TI(D_scff_out[9]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[8]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_8 (.D(D_bmux[7]),  .TI(D_scff_out[8]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[7]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_9 (.D(D_bmux[6]),  .TI(D_scff_out[7]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[6]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_10 (.D(D_bmux[5]),  .TI(D_scff_out[6]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[5]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_11 (.D(D_bmux[4]),  .TI(D_scff_out[5]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[4]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_12 (.D(D_bmux[3]),  .TI(D_scff_out[4]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[3]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_13 (.D(D_bmux[2]),  .TI(D_scff_out[3]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[2]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_14 (.D(D_bmux[1]),  .TI(D_scff_out[2]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[1]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_left_15 (.D(D_bmux[0]),  .TI(D_scff_out[1]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[0])); 

ST_SPHD_LOVOLT_512x32m4_bTMl_lock_up_latch  latch_SDLO (.CK(!CK_lock_up_latch), .D(D_scff_out[0]), .Q(SDLO_temp)); 




/*-------------------------------------
        RIGHT DATA SCAN CHAIN
--------------------------------------*/

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_0 (.D(D_bmux[31]), .TI(SDRI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[31])); 

 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_1 (.D(D_bmux[30]),  .TI(D_scff_out[31]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[30]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_2 (.D(D_bmux[29]),  .TI(D_scff_out[30]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[29]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_3 (.D(D_bmux[28]),  .TI(D_scff_out[29]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[28]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_4 (.D(D_bmux[27]),  .TI(D_scff_out[28]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[27]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_5 (.D(D_bmux[26]),  .TI(D_scff_out[27]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[26]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_6 (.D(D_bmux[25]),  .TI(D_scff_out[26]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[25]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_7 (.D(D_bmux[24]),  .TI(D_scff_out[25]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[24]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_8 (.D(D_bmux[23]),  .TI(D_scff_out[24]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[23]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_9 (.D(D_bmux[22]),  .TI(D_scff_out[23]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[22]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_10 (.D(D_bmux[21]),  .TI(D_scff_out[22]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[21]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_11 (.D(D_bmux[20]),  .TI(D_scff_out[21]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[20]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_12 (.D(D_bmux[19]),  .TI(D_scff_out[20]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[19]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_13 (.D(D_bmux[18]),  .TI(D_scff_out[19]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[18]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_14 (.D(D_bmux[17]),  .TI(D_scff_out[18]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[17]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_data_right_15 (.D(D_bmux[16]),  .TI(D_scff_out[17]) , .TE(shift_en_inst), .CP(CK_scff), .Q(D_scff_out[16])); 

ST_SPHD_LOVOLT_512x32m4_bTMl_lock_up_latch  latch_SDRO (.CK(!CK_lock_up_latch), .D(D_scff_out[16]), .Q(SDRO_temp));










/*-----------------------------------
        LEFT MASK SCAN CHAIN
------------------------------------*/

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_0 (.D(M_bmux[15]), .TI(SMLI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[15])); 


 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_1 (.D(M_bmux[14]),  .TI(M_scff_out[15]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[14]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_2 (.D(M_bmux[13]),  .TI(M_scff_out[14]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[13]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_3 (.D(M_bmux[12]),  .TI(M_scff_out[13]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[12]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_4 (.D(M_bmux[11]),  .TI(M_scff_out[12]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[11]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_5 (.D(M_bmux[10]),  .TI(M_scff_out[11]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[10]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_6 (.D(M_bmux[9]),  .TI(M_scff_out[10]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[9]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_7 (.D(M_bmux[8]),  .TI(M_scff_out[9]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[8]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_8 (.D(M_bmux[7]),  .TI(M_scff_out[8]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[7]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_9 (.D(M_bmux[6]),  .TI(M_scff_out[7]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[6]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_10 (.D(M_bmux[5]),  .TI(M_scff_out[6]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[5]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_11 (.D(M_bmux[4]),  .TI(M_scff_out[5]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[4]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_12 (.D(M_bmux[3]),  .TI(M_scff_out[4]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[3]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_13 (.D(M_bmux[2]),  .TI(M_scff_out[3]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[2]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_14 (.D(M_bmux[1]),  .TI(M_scff_out[2]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[1]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_left_15 (.D(M_bmux[0]),  .TI(M_scff_out[1]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[0])); 

ST_SPHD_LOVOLT_512x32m4_bTMl_lock_up_latch  latch_SMLO (.CK(!CK_lock_up_latch), .D(M_scff_out[0]), .Q(SMLO_temp)); 




/*-------------------------------------
        RIGHT MASK SCAN CHAIN
--------------------------------------*/

ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_0 (.D(M_bmux[31]), .TI(SMRI_buf), .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[31])); 

 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_1 (.D(M_bmux[30]),  .TI(M_scff_out[31]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[30]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_2 (.D(M_bmux[29]),  .TI(M_scff_out[30]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[29]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_3 (.D(M_bmux[28]),  .TI(M_scff_out[29]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[28]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_4 (.D(M_bmux[27]),  .TI(M_scff_out[28]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[27]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_5 (.D(M_bmux[26]),  .TI(M_scff_out[27]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[26]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_6 (.D(M_bmux[25]),  .TI(M_scff_out[26]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[25]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_7 (.D(M_bmux[24]),  .TI(M_scff_out[25]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[24]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_8 (.D(M_bmux[23]),  .TI(M_scff_out[24]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[23]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_9 (.D(M_bmux[22]),  .TI(M_scff_out[23]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[22]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_10 (.D(M_bmux[21]),  .TI(M_scff_out[22]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[21]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_11 (.D(M_bmux[20]),  .TI(M_scff_out[21]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[20]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_12 (.D(M_bmux[19]),  .TI(M_scff_out[20]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[19]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_13 (.D(M_bmux[18]),  .TI(M_scff_out[19]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[18]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_14 (.D(M_bmux[17]),  .TI(M_scff_out[18]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[17]));
 ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF scff_mask_right_15 (.D(M_bmux[16]),  .TI(M_scff_out[17]) , .TE(shift_en_inst), .CP(CK_scff), .Q(M_scff_out[16])); 

ST_SPHD_LOVOLT_512x32m4_bTMl_lock_up_latch  latch_SMRO (.CK(!CK_lock_up_latch), .D(M_scff_out[16]), .Q(SMRO_temp));       










//-------------------------------------------------------------------------
//           Verilog Simulation Model Specifc functionality starts
//             -> Specify Block, Timing Wrapper
//             -> Power Pins functionality
//             -> Display Message Handling
//             -> Read/Write functionality with Redundancy
//             -> Fault File and Initialization file handling
//-------------------------------------------------------------------------

reg GAC_reg;        
 
reg initn_pulse_done=1;

reg SLEEP_reg, STDBY_reg, INITN_reg, ATP_reg, SE_reg, TBYPASS_reg, IG_reg, CSN_reg, DE_reg, WEN_reg, WEN_bmux_reg, MEMEN_reg, MEMEN_dft_prev, MEMEN_prev;

reg [bits-1 : 0] D_reg,D_bmux_reg;
reg [bits-1 : 0] M_bmux_reg;
reg [Addr-1 : 0] A_reg, A_bmux_reg;
reg lastCK, invalid_next_cycle_dft, invalid_next_cycle_func;
reg [8*44: 0] message_status;
reg [8*10: 0] operating_mode;
reg [1:0] debug_level;
wire DE_temp;
`ifdef ST_MEM_SLM
  integer slm_handle;
  initial begin
    $slm_RegisterMemory(slm_handle, words, bits);
  end
`else
  reg [bits-1 : 0] Mem [words-1 : 0];// RAM array
  reg [bits-1 : 0] RedMem [RedWords-1 : 0]; // Redundancy locations
`endif

reg [bits-1 : 0] Mem_prev;
reg [bits-1 : 0] Qtemp, tempReg;
reg ValidAddress, last_CK_rw;
reg file_loaded;
reg repair_access;


always @(CK) begin
  
  if (lastCK === 1'b0 && CK === 1'b1) begin
    
           GAC_reg = IO.GAC;
           MEMEN_dft_prev = IO.GAC & ATP_buf;
           MEMEN_prev = MEMEN_reg;
           MEMEN_reg = IO.MEM_EN_inst;
           SLEEP_reg = SLEEP_buf;
           STDBY_reg = STDBY_buf;
           INITN_reg = INITN_buf;
           ATP_reg = ATP_buf;
           SE_reg = SE_buf;
           TBYPASS_reg = TBYPASS_buf;
           IG_reg = IG_buf;
           CSN_reg = IO.CSN_bmux;
           WEN_reg = WEN_buf;
           WEN_bmux_reg = WEN_bmux;
           A_reg = A_buf;
           A_bmux_reg = A_bmux;
           D_reg = D_buf;
           D_bmux_reg = D_bmux;
           M_bmux_reg = M_bmux;
           DE_reg = DE_temp;
           
           
  end

  if (lastCK === 1'b0 && CK !== 1'b0) begin
           if (invalid_next_cycle_func === 1'b1) begin
             invalid_next_cycle_func = 1'b0;
             release IO.cgc_CK_rw.CK_gated;
           end     
           if (invalid_next_cycle_dft === 1'b1) begin
             invalid_next_cycle_dft = 1'b0;
             release IO.cgc_CK_lkp_latch.CK_gated;
             release IO.cgc_CK_scff.CK_gated;
           end     
  end
  
  lastCK = CK;
end

task Corrupt_Mem;
begin
        WriteMemX;
end
endtask

task Corrupt_Q;
begin
        IO.dff_mem_en.Q <= 1'bx;
end
endtask

task Corrupt_all_scan_flops_scan_outs;
begin
        Corrupt_ctrl_scan_flops_scan_outs;
        Corrupt_data_scan_flops_scan_outs;
        Corrupt_mask_scan_flops_scan_outs;
end
endtask

task Corrupt_ctrl_scan_flops;  
begin
        scff_ctrl_0.dff_in_scff.Q <= 1'bx;
scff_ctrl_1.dff_in_scff.Q <= 1'bx;
scff_ctrl_2.dff_in_scff.Q <= 1'bx;
scff_ctrl_3.dff_in_scff.Q <= 1'bx;
scff_ctrl_4.dff_in_scff.Q <= 1'bx;
scff_ctrl_5.dff_in_scff.Q <= 1'bx;
scff_ctrl_6.dff_in_scff.Q <= 1'bx;
scff_ctrl_7.dff_in_scff.Q <= 1'bx;
scff_ctrl_8.dff_in_scff.Q <= 1'bx;
scff_ctrl_9.dff_in_scff.Q <= 1'bx;
scff_ctrl_10.dff_in_scff.Q <= 1'bx;
scff_ctrl_11.dff_in_scff.Q <= 1'bx;
scff_ctrl_12.dff_in_scff.Q <= 1'bx;
scff_ctrl_13.dff_in_scff.Q <= 1'bx;
scff_ctrl_14.dff_in_scff.Q <= 1'bx;
scff_ctrl_15.dff_in_scff.Q <= 1'bx;
scff_ctrl_16.dff_in_scff.Q <= 1'bx;
end
endtask

task Corrupt_ctrl_scan_flops_scan_outs;
begin
        Corrupt_ctrl_scan_flops;
        latch_SCTRLO.dlat_lockup.Q <= 1'bx;
end
endtask

task Corrupt_data_scan_flops_scan_outs;
begin
        Corrupt_datal_scan_flops_scan_outs;
        Corrupt_datar_scan_flops_scan_outs;

end
endtask

task Corrupt_datal_scan_flops;
begin
        
       scff_data_left_0.dff_in_scff.Q <= 1'bx;
scff_data_left_1.dff_in_scff.Q <= 1'bx;
scff_data_left_2.dff_in_scff.Q <= 1'bx;
scff_data_left_3.dff_in_scff.Q <= 1'bx;
scff_data_left_4.dff_in_scff.Q <= 1'bx;
scff_data_left_5.dff_in_scff.Q <= 1'bx;
scff_data_left_6.dff_in_scff.Q <= 1'bx;
scff_data_left_7.dff_in_scff.Q <= 1'bx;
scff_data_left_8.dff_in_scff.Q <= 1'bx;
scff_data_left_9.dff_in_scff.Q <= 1'bx;
scff_data_left_10.dff_in_scff.Q <= 1'bx;
scff_data_left_11.dff_in_scff.Q <= 1'bx;
scff_data_left_12.dff_in_scff.Q <= 1'bx;
scff_data_left_13.dff_in_scff.Q <= 1'bx;
scff_data_left_14.dff_in_scff.Q <= 1'bx;
scff_data_left_15.dff_in_scff.Q <= 1'bx; 

end
endtask



task Corrupt_datal_scan_flops_scan_outs;
begin
        Corrupt_datal_scan_flops;
        latch_SDLO.dlat_lockup.Q <= 1'bx;
end
endtask



task Corrupt_datar_scan_flops;
begin
        
       scff_data_right_0.dff_in_scff.Q <= 1'bx;
scff_data_right_1.dff_in_scff.Q <= 1'bx;
scff_data_right_2.dff_in_scff.Q <= 1'bx;
scff_data_right_3.dff_in_scff.Q <= 1'bx;
scff_data_right_4.dff_in_scff.Q <= 1'bx;
scff_data_right_5.dff_in_scff.Q <= 1'bx;
scff_data_right_6.dff_in_scff.Q <= 1'bx;
scff_data_right_7.dff_in_scff.Q <= 1'bx;
scff_data_right_8.dff_in_scff.Q <= 1'bx;
scff_data_right_9.dff_in_scff.Q <= 1'bx;
scff_data_right_10.dff_in_scff.Q <= 1'bx;
scff_data_right_11.dff_in_scff.Q <= 1'bx;
scff_data_right_12.dff_in_scff.Q <= 1'bx;
scff_data_right_13.dff_in_scff.Q <= 1'bx;
scff_data_right_14.dff_in_scff.Q <= 1'bx;
scff_data_right_15.dff_in_scff.Q <= 1'bx;
       
end
endtask


  

task Corrupt_datar_scan_flops_scan_outs;
begin
        Corrupt_datar_scan_flops;
        latch_SDRO.dlat_lockup.Q <= 1'bx;
end
endtask





task Corrupt_mask_scan_flops_scan_outs;
begin
        Corrupt_maskl_scan_flops_scan_outs;
        Corrupt_maskr_scan_flops_scan_outs;

end
endtask

task Corrupt_maskl_scan_flops;
begin
        
       scff_mask_left_0.dff_in_scff.Q <= 1'bx;
scff_mask_left_1.dff_in_scff.Q <= 1'bx;
scff_mask_left_2.dff_in_scff.Q <= 1'bx;
scff_mask_left_3.dff_in_scff.Q <= 1'bx;
scff_mask_left_4.dff_in_scff.Q <= 1'bx;
scff_mask_left_5.dff_in_scff.Q <= 1'bx;
scff_mask_left_6.dff_in_scff.Q <= 1'bx;
scff_mask_left_7.dff_in_scff.Q <= 1'bx;
scff_mask_left_8.dff_in_scff.Q <= 1'bx;
scff_mask_left_9.dff_in_scff.Q <= 1'bx;
scff_mask_left_10.dff_in_scff.Q <= 1'bx;
scff_mask_left_11.dff_in_scff.Q <= 1'bx;
scff_mask_left_12.dff_in_scff.Q <= 1'bx;
scff_mask_left_13.dff_in_scff.Q <= 1'bx;
scff_mask_left_14.dff_in_scff.Q <= 1'bx;
scff_mask_left_15.dff_in_scff.Q <= 1'bx; 
end
endtask



task Corrupt_maskl_scan_flops_scan_outs;
begin
        Corrupt_maskl_scan_flops;
        latch_SMLO.dlat_lockup.Q <= 1'bx;
end
endtask



task Corrupt_maskr_scan_flops;
begin
     
       scff_mask_right_0.dff_in_scff.Q <= 1'bx;
scff_mask_right_1.dff_in_scff.Q <= 1'bx;
scff_mask_right_2.dff_in_scff.Q <= 1'bx;
scff_mask_right_3.dff_in_scff.Q <= 1'bx;
scff_mask_right_4.dff_in_scff.Q <= 1'bx;
scff_mask_right_5.dff_in_scff.Q <= 1'bx;
scff_mask_right_6.dff_in_scff.Q <= 1'bx;
scff_mask_right_7.dff_in_scff.Q <= 1'bx;
scff_mask_right_8.dff_in_scff.Q <= 1'bx;
scff_mask_right_9.dff_in_scff.Q <= 1'bx;
scff_mask_right_10.dff_in_scff.Q <= 1'bx;
scff_mask_right_11.dff_in_scff.Q <= 1'bx;
scff_mask_right_12.dff_in_scff.Q <= 1'bx;
scff_mask_right_13.dff_in_scff.Q <= 1'bx;
scff_mask_right_14.dff_in_scff.Q <= 1'bx;
scff_mask_right_15.dff_in_scff.Q <= 1'bx;
       
end
endtask


  

task Corrupt_maskr_scan_flops_scan_outs;
begin
        Corrupt_maskr_scan_flops;
        latch_SMRO.dlat_lockup.Q <= 1'bx;
end
endtask






`ifdef functional

/*------------------------------------------------------------
        Output Buffers for verilog functional model
-------------------------------------------------------------*/
    
    always @(Q_int) begin
      Q_final = Q_int;
    end  
    buf #(`st_delay_seq_taa) (Q[0], Q_final[0]);
buf #(`st_delay_seq_taa) (Q[1], Q_final[1]);
buf #(`st_delay_seq_taa) (Q[2], Q_final[2]);
buf #(`st_delay_seq_taa) (Q[3], Q_final[3]);
buf #(`st_delay_seq_taa) (Q[4], Q_final[4]);
buf #(`st_delay_seq_taa) (Q[5], Q_final[5]);
buf #(`st_delay_seq_taa) (Q[6], Q_final[6]);
buf #(`st_delay_seq_taa) (Q[7], Q_final[7]);
buf #(`st_delay_seq_taa) (Q[8], Q_final[8]);
buf #(`st_delay_seq_taa) (Q[9], Q_final[9]);
buf #(`st_delay_seq_taa) (Q[10], Q_final[10]);
buf #(`st_delay_seq_taa) (Q[11], Q_final[11]);
buf #(`st_delay_seq_taa) (Q[12], Q_final[12]);
buf #(`st_delay_seq_taa) (Q[13], Q_final[13]);
buf #(`st_delay_seq_taa) (Q[14], Q_final[14]);
buf #(`st_delay_seq_taa) (Q[15], Q_final[15]);
buf #(`st_delay_seq_taa) (Q[16], Q_final[16]);
buf #(`st_delay_seq_taa) (Q[17], Q_final[17]);
buf #(`st_delay_seq_taa) (Q[18], Q_final[18]);
buf #(`st_delay_seq_taa) (Q[19], Q_final[19]);
buf #(`st_delay_seq_taa) (Q[20], Q_final[20]);
buf #(`st_delay_seq_taa) (Q[21], Q_final[21]);
buf #(`st_delay_seq_taa) (Q[22], Q_final[22]);
buf #(`st_delay_seq_taa) (Q[23], Q_final[23]);
buf #(`st_delay_seq_taa) (Q[24], Q_final[24]);
buf #(`st_delay_seq_taa) (Q[25], Q_final[25]);
buf #(`st_delay_seq_taa) (Q[26], Q_final[26]);
buf #(`st_delay_seq_taa) (Q[27], Q_final[27]);
buf #(`st_delay_seq_taa) (Q[28], Q_final[28]);
buf #(`st_delay_seq_taa) (Q[29], Q_final[29]);
buf #(`st_delay_seq_taa) (Q[30], Q_final[30]);
buf #(`st_delay_seq_taa) (Q[31], Q_final[31]);
    
    buf #(`st_delay_seq_taa) (SCTRLO,SCTRLO_temp);
    buf #(`st_delay_seq_taa) (SDLO, SDLO_temp);
    buf #(`st_delay_seq_taa) (SDRO, SDRO_temp);
    
   
    buf #(`st_delay_seq_taa) (SMLO, SMLO_temp);
    buf #(`st_delay_seq_taa) (SMRO, SMRO_temp);
     
    

`else
    
/*--------------------------------------------------------------------
                     TIMING WRAPPER STARTS
---------------------------------------------------------------------*/
integer i;
wire dSLEEP;
wire [bits-1 : 0] dD ;
wire [Addr-1 : 0] dA;

wire [bits-1:0] dM;         
wire dCK,dCSN,dIG ,dSE,dSCTRLI,dSDLI,dSDRI  ,dSMLI,dSMRI   ,dTBYPASS, dWEN;


//Bist wires
wire [Addr-1 :0 ] dTA;
wire dTBIST,dTCSN,dTWEN,dTED,dTOD; 
wire dTEM,dTOM;

reg [bits-1 : 0] Q_int_prev;
reg SCTRLO_final, SCTRLO_prev;
reg SDLO_final, SDLO_prev;
reg SDRO_final, SDRO_prev;





reg SMLO_final, SMLO_prev;
reg SMRO_final, SMRO_prev;


reg [bits-1 : 0] TimingViol_data = 32'b0;
reg [bits-1 : 0] TimingViol_data_last;

reg  [bits-1 : 0] TimingViol_mask = 32'b0;
reg [bits-1 : 0] TimingViol_mask_last;

 reg TimingViol_mask_0;
 reg TimingViol_mask_1;
 reg TimingViol_mask_2;
 reg TimingViol_mask_3;
 reg TimingViol_mask_4;
 reg TimingViol_mask_5;
 reg TimingViol_mask_6;
 reg TimingViol_mask_7;
 reg TimingViol_mask_8;
 reg TimingViol_mask_9;
 reg TimingViol_mask_10;
 reg TimingViol_mask_11;
 reg TimingViol_mask_12;
 reg TimingViol_mask_13;
 reg TimingViol_mask_14;
 reg TimingViol_mask_15;
 reg TimingViol_mask_16;
 reg TimingViol_mask_17;
 reg TimingViol_mask_18;
 reg TimingViol_mask_19;
 reg TimingViol_mask_20;
 reg TimingViol_mask_21;
 reg TimingViol_mask_22;
 reg TimingViol_mask_23;
 reg TimingViol_mask_24;
 reg TimingViol_mask_25;
 reg TimingViol_mask_26;
 reg TimingViol_mask_27;
 reg TimingViol_mask_28;
 reg TimingViol_mask_29;
 reg TimingViol_mask_30;
 reg TimingViol_mask_31;


reg TimingViol_data_0;

reg TimingViol_data_1;

reg TimingViol_data_2;

reg TimingViol_data_3;

reg TimingViol_data_4;

reg TimingViol_data_5;

reg TimingViol_data_6;

reg TimingViol_data_7;

reg TimingViol_data_8;

reg TimingViol_data_9;

reg TimingViol_data_10;

reg TimingViol_data_11;

reg TimingViol_data_12;

reg TimingViol_data_13;

reg TimingViol_data_14;

reg TimingViol_data_15;

reg TimingViol_data_16;

reg TimingViol_data_17;

reg TimingViol_data_18;

reg TimingViol_data_19;

reg TimingViol_data_20;

reg TimingViol_data_21;

reg TimingViol_data_22;

reg TimingViol_data_23;

reg TimingViol_data_24;

reg TimingViol_data_25;

reg TimingViol_data_26;

reg TimingViol_data_27;

reg TimingViol_data_28;

reg TimingViol_data_29;

reg TimingViol_data_30;

reg TimingViol_data_31;

reg TimingViol_addr;
reg TimingViol_CSN, TimingViol_WEN, TimingViol_tbypass;
reg TimingViol_tckh, TimingViol_tckl, TimingViol_tcycle;
reg TimingViol_tckh_se, TimingViol_tckl_se, TimingViol_tcycle_se;
reg TimingViol_sctrli,TimingViol_sdli,TimingViol_sdri,TimingViol_se;



reg TimingViol_smli,TimingViol_smri;



reg TimingViol_initn;
reg TimingViol_ls;
reg TimingViol_hs;
reg TimingViol_sleep;
reg TimingViol_stdby;
reg TimingViol_rm;
reg TimingViol_wm;
reg TimingViol_tbist,TimingViol_ig,TimingViol_atp,TimingViol_TED,TimingViol_TOD,TimingViol_TEM,TimingViol_TOM;
reg TimingViolRRAE,TimingViolRRA;


wire CSTBYPASSN,cond_sdf_tas,cond_sdf_tds,cond_sdf_tms,cond_sdf_tws,cond_sdf_tbas,cond_sdf_tbps,cond_sdf_tbws,cond_sdf_tbdes,cond_sdf_tbdos,cond_sdf_tbmes,cond_sdf_tbmos;
wire SETB_EN,CSIG_EN,MEM_ACT,EN_ADM,CS_EN,CS_ADM,cond_sdf_tps,IG_EN,IG_ADM,cond_sdf_tigs,cond_sdf_taa,cond_sdf_taa_ls1,cond_sdf_taa_hs1,cond_tseq_tm;
wire cond_sdf_tcycle,cond_sdf_tcycle_ls1,cond_sdf_tcycle_hs1,cond_sdf_tcycle_se,cond_sdf_tckl_se,cond_sdf_tsctrlis,cond_sdf_tsdlis,cond_sdf_tsdris;



wire cond_sdf_tsmlis,cond_sdf_tsmris;
wire cond_sdf_taa_smlo_se,cond_sdf_taa_smro_se;
wire cond_sdf_taa_smlo,cond_sdf_taa_smro;


wire cond_sdf_tckh_se,cond_sdf_taa_sctrlo_se,cond_sdf_taa_sdlo_se,cond_sdf_taa_sdro_se;

wire cond_sdf_tckl,cond_sdf_tckh;
wire cond_sdf_ttms,cond_sdf_tbists,INITNandnotSLEEPandATPandnotSE,cond_sdf_taa_sctrlo,cond_sdf_taa_sdlo,cond_sdf_taa_sdro;




wire cond_sdf_taa_tm,cond_sdf_taa_tm_ls1, cond_sdf_taa_tm_hs1,cond_sdf_taa_tckq_tm,cond_sdf_taa_tseq_tm;
wire CSWETBYPASSN;
wire cond_sdf_tstdbys,cond_sdf_tsls,sleep_en,atp_csn_en;
wire cond_sdf_tlss,cond_sdf_thss,cond_sdf_trms,cond_sdf_twms; 
wire cond_sdf_tses,cond_sdf_tinitns;
wire tby_se_en;
wire rra_en;
wire tbist_atp_en;
wire rrae_en;
wire tbist_rrae_en;
wire cond_sdf_trraes;
wire cond_sdf_ttrraes;
wire cond_sdf_taa_trramatch;
wire cond_sdf_ttrraematch;
wire cond_sdf_tamatch;
wire cond_sdf_ttamatch;
wire cond_sdf_tatpmatch;
wire cond_sdf_ttbistmatch;
wire [bits-1 : 0] CSWEMTBYPASS;
 and (CSWEMTBYPASS[0], !M_bmux_reg[0], CSWETBYPASSN);
 and (CSWEMTBYPASS[1], !M_bmux_reg[1], CSWETBYPASSN);
 and (CSWEMTBYPASS[2], !M_bmux_reg[2], CSWETBYPASSN);
 and (CSWEMTBYPASS[3], !M_bmux_reg[3], CSWETBYPASSN);
 and (CSWEMTBYPASS[4], !M_bmux_reg[4], CSWETBYPASSN);
 and (CSWEMTBYPASS[5], !M_bmux_reg[5], CSWETBYPASSN);
 and (CSWEMTBYPASS[6], !M_bmux_reg[6], CSWETBYPASSN);
 and (CSWEMTBYPASS[7], !M_bmux_reg[7], CSWETBYPASSN);
 and (CSWEMTBYPASS[8], !M_bmux_reg[8], CSWETBYPASSN);
 and (CSWEMTBYPASS[9], !M_bmux_reg[9], CSWETBYPASSN);
 and (CSWEMTBYPASS[10], !M_bmux_reg[10], CSWETBYPASSN);
 and (CSWEMTBYPASS[11], !M_bmux_reg[11], CSWETBYPASSN);
 and (CSWEMTBYPASS[12], !M_bmux_reg[12], CSWETBYPASSN);
 and (CSWEMTBYPASS[13], !M_bmux_reg[13], CSWETBYPASSN);
 and (CSWEMTBYPASS[14], !M_bmux_reg[14], CSWETBYPASSN);
 and (CSWEMTBYPASS[15], !M_bmux_reg[15], CSWETBYPASSN);
 and (CSWEMTBYPASS[16], !M_bmux_reg[16], CSWETBYPASSN);
 and (CSWEMTBYPASS[17], !M_bmux_reg[17], CSWETBYPASSN);
 and (CSWEMTBYPASS[18], !M_bmux_reg[18], CSWETBYPASSN);
 and (CSWEMTBYPASS[19], !M_bmux_reg[19], CSWETBYPASSN);
 and (CSWEMTBYPASS[20], !M_bmux_reg[20], CSWETBYPASSN);
 and (CSWEMTBYPASS[21], !M_bmux_reg[21], CSWETBYPASSN);
 and (CSWEMTBYPASS[22], !M_bmux_reg[22], CSWETBYPASSN);
 and (CSWEMTBYPASS[23], !M_bmux_reg[23], CSWETBYPASSN);
 and (CSWEMTBYPASS[24], !M_bmux_reg[24], CSWETBYPASSN);
 and (CSWEMTBYPASS[25], !M_bmux_reg[25], CSWETBYPASSN);
 and (CSWEMTBYPASS[26], !M_bmux_reg[26], CSWETBYPASSN);
 and (CSWEMTBYPASS[27], !M_bmux_reg[27], CSWETBYPASSN);
 and (CSWEMTBYPASS[28], !M_bmux_reg[28], CSWETBYPASSN);
 and (CSWEMTBYPASS[29], !M_bmux_reg[29], CSWETBYPASSN);
 and (CSWEMTBYPASS[30], !M_bmux_reg[30], CSWETBYPASSN);
 and (CSWEMTBYPASS[31], !M_bmux_reg[31], CSWETBYPASSN);

buf (rta_en_cond, 1'b0);
buf (rta_en_cond_reg, 1'b0);


assign IGint = ((ATP_buf === 1'bx) || (ATP_buf===1'b1 && SE_buf === 1'bx)) ? 1'bx : IG_buf;
and (atp_csn_en,!ATP_buf,!IO.CSN_bmux,!IGint,!rta_en_cond);
or (sleep_en,atp_csn_en,ATP_buf);
or (SETB_EN,IO.SEint,TBIST_buf);
and (ATP_SETB_EN,ATP_buf,SETB_EN); 
or (CSIG_EN,IGint,IO.CSN_bmux,rta_en_cond);
and (MEM_ACT,!ATP_buf,CSIG_EN);
or (EN_ADM,MEM_ACT,ATP_SETB_EN);
or (ig_rta_en, IGint, rta_en_cond);
and (CS_EN,!ATP_buf,ig_rta_en);
or (CS_ADM,CS_EN,ATP_SETB_EN);
and (atp_ig_csn_en,!ATP_buf,!IO.CSN_bmux,!IGint,!rta_en_cond);
and (atp_se_en,!SE_buf,ATP_buf);
or (cycle_en,atp_ig_csn_en,atp_se_en);
and (atp_ig_csn_en_reg,!ATP_reg,!CSN_reg,!IG_reg,!rta_en_cond_reg);
and (atp_se_en_reg,!SE_reg,ATP_reg);
or (cycle_en_reg,atp_ig_csn_en,atp_se_en);
and (INITNandnotSLEEPandATPandnotSE,cond_gac,!SE_buf,ATP_buf);
and (csn_ig_en,!IGint,!IO.CSN_bmux);
and (atp_tby_ls_en,atp_se_en,cond_ls_tby_en);
and (IG_EN,!ATP_buf,!IO.CSN_bmux,!rta_en_cond);
or (IG_ADM,IG_EN,atp_se_en);
and (CSWETBYPASSN, !WEN_bmux_reg, 1'b1);



assign cond_sdf_tsls=((sleep_en && INITN_buf && !STDBY_buf) !==0) ? 1:0;
assign cond_sdf_tstdbys=((sleep_en && INITN_buf && !SLEEP_buf) !==0) ? 1:0;
assign cond_sdf_atps=((INITN_buf && !SLEEP_buf && !STDBY_buf) !==0) ? 1:0;
assign cond_gac=((INITN_buf && !SLEEP_buf && !STDBY_buf) !==0) ? 1:0;
assign cond_sdf_tas=((cond_gac && !EN_ADM) !==0) ? 1:0;
assign cond_sdf_tds=((cond_gac && !EN_ADM) !==0) ? 1:0;
assign cond_sdf_tms=((cond_gac && !EN_ADM) !==0) ? 1:0;
assign cond_sdf_tws=((cond_gac && !EN_ADM) !==0) ? 1:0;
assign cond_sdf_tps=((cond_gac && !CS_ADM) !==0) ? 1:0;
assign cond_sdf_tcycle=((cond_gac && cycle_en && !LS_buf && !HS_buf) !==0) ? 1:0;  
assign cond_sdf_tcycle_ls1=((cond_gac && cycle_en && LS_buf && !HS_buf) !==0) ? 1:0;
assign cond_sdf_tcycle_hs1=((cond_gac && cycle_en && !LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_tcycle_ls1_hs1=((cond_gac && cycle_en && LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_tckh=((cond_gac && cycle_en_reg) !==0) ? 1:0;
assign cond_sdf_tckl=((cond_gac && cycle_en) !==0) ? 1:0;
assign cond_sdf_tcycle_se=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tckl_se=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tsctrlis=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tsdlis=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tsdris=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;


assign cond_sdf_tsmlis=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;
assign cond_sdf_tsmris=((cond_gac && ATP_buf && IO.SEint) !==0) ? 1:0;






assign cond_sdf_tckh_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sctrlo_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sdlo_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sdro_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;

assign cond_sdf_taa_smlo_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_smro_se=((cond_gac && SE_reg && ATP_reg) !==0) ? 1:0;

assign cond_sdf_ttms=((cond_gac && !SE_buf && ATP_buf) !==0) ? 1:0;
assign cond_sdf_tbists=((cond_gac && !SE_buf && ATP_buf) !==0) ? 1:0;
assign cond_sdf_taa_sctrlo=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sdlo=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_sdro=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_smlo=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;
assign cond_sdf_taa_smro=((cond_gac && !SE_reg && ATP_reg) !==0) ? 1:0;



assign cond_sdf_taa_tckq_tm=((cond_gac && SE_reg && ATP_reg && TBYPASS_buf) !==0) ? 1:0;
assign cond_ls_en=((atp_ig_csn_en || atp_tby_ls_en) !==0) ? 1:0;
assign cond_sdf_tlss=((cond_ls_en && cond_gac) !==0) ? 1:0;
assign cond_sdf_thss=((cond_ls_en && cond_gac) !==0) ? 1:0;
assign cond_sdf_trms=((cond_gac && !IO.CSN_bmux && !IO.TBYPASSint && !IO.SEint && !IGint && !DE_temp && !rta_en_cond) !==0) ? 1:0; 
assign cond_sdf_twms=((cond_gac && !IO.CSN_bmux && !IO.TBYPASSint && !IO.SEint && !IGint && !DE_temp && !rta_en_cond) !==0) ? 1:0; 
assign cond_sdf_tses=((cond_gac && ATP_buf) !==0) ? 1:0;
assign cond_sdf_tbas=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbps=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbws=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbdes=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbdos=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbmes=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tbmos=((cond_gac && ATP_buf && TBIST_buf && !SE_buf) !==0) ? 1:0;
assign cond_sdf_tigs=((cond_gac && IG_ADM) !==0) ? 1:0;
assign cond_sdf_taa=((MEMEN_reg && WEN_bmux_reg && !LS_buf && !HS_buf && !rta_en_cond) !==0) ? 1:0; 
assign cond_sdf_taa_ls1=((MEMEN_reg && WEN_bmux_reg && LS_buf && !HS_buf) !==0) ? 1:0; 
assign cond_sdf_taa_hs1=((MEMEN_reg && WEN_bmux_reg && !LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_ls1_hs1=((MEMEN_reg && WEN_bmux_reg && LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tm=((INITNandnotSLEEPandATPandnotSE && TBYPASS_buf && !LS_buf && !HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tm_ls1=((INITNandnotSLEEPandATPandnotSE && TBYPASS_buf && LS_buf && !HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tm_hs1=((INITNandnotSLEEPandATPandnotSE && TBYPASS_buf && !LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tm_ls1_hs1=((INITNandnotSLEEPandATPandnotSE && TBYPASS_buf && LS_buf && HS_buf) !==0) ? 1:0;
assign cond_sdf_taa_tseq_tm=((cond_gac && ATP_buf && IO.TBYPASSint) !==0) ? 1:0;

assign cond_sdf_tinitns =(( sleep_en && !STDBY_buf && !SLEEP_buf) !==0) ? 1:0;
assign cond_ls_tby_en=((TBYPASS_buf || csn_ig_en) !==0) ? 1:0;



//specify block begins

specify
    specparam
    
         PATHPULSE$CK$Q = 0,
         PATHPULSE$CK$SCTRLO = 0,
         PATHPULSE$CK$SDLO = 0,
         PATHPULSE$CK$SDRO = 0,
    
        
         PATHPULSE$CK$SMLO = 0,
         PATHPULSE$CK$SMRO = 0,
     
         PATHPULSE$SE$Q = 0,
         

                 
         tlss = 0.0,
         tlsh = 0.0, 
        
         thss = 0.0,
         thsh = 0.0 , 
         tsls = 0.0,
         tslh = 0.0 ,
         tstdbys = 0.0,
         tstdbyh = 0.0 , 
         tcycle = 0.0,
	 
        
         tms = 0.0,
         tmh = 0.0 , 
         tsmlis = 0.0,
         tsmlih = 0.0 ,
         tsmris = 0.0,
         tsmrih = 0.0 ,
 


         
         tcycle_ls1 = 0.0,         
         
         tcycle_hs1 = 0.0,         
         
         tcycle_ls1_hs1 = 0.0,
         tckh = 0.0,
         tckl = 0.0,
         tcycle_se = 0.0,
         tckh_se = 0.0,
         tckl_se = 0.0,
         
         ttms = 0.0,
         ttmh = 0.0 ,
         tps = 0.0,
         tph = 0.0 ,
         tws = 0.0,
         twh = 0.0 ,
         tds = 0.0,
         tdh = 0.0, 
         tas = 0.0,
         tah = 0.0,
         
         tses = 0.0,
         tseh = 0.0 ,
         tsctrlis = 0.0,
         tsctrlih = 0.0,
         tsdlis = 0.0,
         tsdlih = 0.0 ,
         tsdris = 0.0,
         tsdrih = 0.0 , 

         tbists = 0.0,
         tbisth = 0.0 ,
         tbps = 0.0,
         tbph = 0.0 ,
         tbws = 0.0,
         tbwh = 0.0 ,
         tbdes = 0.0,
         tbdeh = 0.0 ,
         tbdos = 0.0,
         tbdoh = 0.0 ,
        
         tbmes = 0.0,
         tbmeh = 0.0 ,
         tbmos = 0.0,
         tbmoh = 0.0 ,  
         tbas = 0.0,
         tbah = 0.0 ,
         
         
         tinitns = 0.0,
         tinitnh = 0.0,
         tatps = 0.0,
         tatph = 0.0,
         tigs = 0.0,
         tigh = 0.0,
         
         
         trms = 0.0,
         trmh = 0.0 ,
         twms = 0.0,
         twmh = 0.0 ,


/*************************************************************************************************/
         taa =`st_delay_seq_taa,
         th = `st_delay_seq_th,


         taa_ls1 =`st_delay_seq_taa,
         th_ls1 = `st_delay_seq_th,

         taa_hs1 =`st_delay_seq_taa,
         th_hs1 = `st_delay_seq_th, 

         taa_ls1_hs1 =`st_delay_seq_taa,
         th_ls1_hs1 = `st_delay_seq_th, 


         taa_tm =`st_delay_seq_taa,
         th_tm = `st_delay_seq_th,

         taa_tm_ls1 =`st_delay_seq_taa,
         th_tm_ls1 = `st_delay_seq_th,

         taa_tm_hs1 =`st_delay_seq_taa,
         th_tm_hs1 = `st_delay_seq_th,         

         taa_tm_ls1_hs1 =`st_delay_seq_taa,
         th_tm_ls1_hs1 = `st_delay_seq_th,         
         taa_tseq_tm =`st_delay_seq_taa,
         th_tseq_tm = `st_delay_seq_th,
         taa_tckq_tm   = `st_delay_seq_taa,
         th_tckq_tm    = `st_delay_seq_th,
         taa_sctrlo =`st_delay_seq_taa,
         th_sctrlo = `st_delay_seq_th,
         taa_sdlo =`st_delay_seq_taa,
         th_sdlo = `st_delay_seq_th,
         taa_sdro =`st_delay_seq_taa,
         th_sdro = `st_delay_seq_th,
         


         taa_smlo =`st_delay_seq_taa,
         th_smlo = `st_delay_seq_th,
         taa_smro =`st_delay_seq_taa,
         th_smro = `st_delay_seq_th,
         taa_smlo_se =`st_delay_seq_taa,
         th_smlo_se = `st_delay_seq_th,
         taa_smro_se =`st_delay_seq_taa,
         th_smro_se = `st_delay_seq_th, 
 
       taa_sctrlo_se =`st_delay_seq_taa,
         th_sctrlo_se = `st_delay_seq_th,
         taa_sdlo_se =`st_delay_seq_taa,
         th_sdlo_se = `st_delay_seq_th,
         taa_sdro_se =`st_delay_seq_taa,
         th_sdro_se = `st_delay_seq_th;
     


/*---------------------- Timing Checks ---------------------*/

	$setup(posedge A[0], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[1], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[2], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[3], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[4], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[5], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[6], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[7], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(posedge A[8], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[0], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[1], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[2], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[3], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[4], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[5], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[6], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[7], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$setup(negedge A[8], posedge CK &&& cond_sdf_tas , tas, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[0], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[1], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[2], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[3], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[4], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[5], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[6], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[7], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, posedge A[8], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[0], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[1], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[2], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[3], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[4], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[5], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[6], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[7], tah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tas, negedge A[8], tah, TimingViol_addr);


	$setup(posedge D[0], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_0);
	$setup(posedge D[1], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_1);
	$setup(posedge D[2], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_2);
	$setup(posedge D[3], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_3);
	$setup(posedge D[4], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_4);
	$setup(posedge D[5], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_5);
	$setup(posedge D[6], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_6);
	$setup(posedge D[7], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_7);
	$setup(posedge D[8], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_8);
	$setup(posedge D[9], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_9);
	$setup(posedge D[10], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_10);
	$setup(posedge D[11], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_11);
	$setup(posedge D[12], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_12);
	$setup(posedge D[13], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_13);
	$setup(posedge D[14], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_14);
	$setup(posedge D[15], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_15);
	$setup(posedge D[16], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_16);
	$setup(posedge D[17], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_17);
	$setup(posedge D[18], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_18);
	$setup(posedge D[19], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_19);
	$setup(posedge D[20], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_20);
	$setup(posedge D[21], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_21);
	$setup(posedge D[22], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_22);
	$setup(posedge D[23], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_23);
	$setup(posedge D[24], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_24);
	$setup(posedge D[25], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_25);
	$setup(posedge D[26], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_26);
	$setup(posedge D[27], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_27);
	$setup(posedge D[28], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_28);
	$setup(posedge D[29], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_29);
	$setup(posedge D[30], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_30);
	$setup(posedge D[31], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_31);
	$setup(negedge D[0], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_0);
	$setup(negedge D[1], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_1);
	$setup(negedge D[2], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_2);
	$setup(negedge D[3], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_3);
	$setup(negedge D[4], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_4);
	$setup(negedge D[5], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_5);
	$setup(negedge D[6], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_6);
	$setup(negedge D[7], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_7);
	$setup(negedge D[8], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_8);
	$setup(negedge D[9], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_9);
	$setup(negedge D[10], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_10);
	$setup(negedge D[11], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_11);
	$setup(negedge D[12], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_12);
	$setup(negedge D[13], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_13);
	$setup(negedge D[14], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_14);
	$setup(negedge D[15], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_15);
	$setup(negedge D[16], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_16);
	$setup(negedge D[17], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_17);
	$setup(negedge D[18], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_18);
	$setup(negedge D[19], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_19);
	$setup(negedge D[20], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_20);
	$setup(negedge D[21], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_21);
	$setup(negedge D[22], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_22);
	$setup(negedge D[23], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_23);
	$setup(negedge D[24], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_24);
	$setup(negedge D[25], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_25);
	$setup(negedge D[26], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_26);
	$setup(negedge D[27], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_27);
	$setup(negedge D[28], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_28);
	$setup(negedge D[29], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_29);
	$setup(negedge D[30], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_30);
	$setup(negedge D[31], posedge CK &&& cond_sdf_tds, tds, TimingViol_data_31);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[0], tdh, TimingViol_data_0);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[1], tdh, TimingViol_data_1);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[2], tdh, TimingViol_data_2);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[3], tdh, TimingViol_data_3);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[4], tdh, TimingViol_data_4);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[5], tdh, TimingViol_data_5);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[6], tdh, TimingViol_data_6);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[7], tdh, TimingViol_data_7);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[8], tdh, TimingViol_data_8);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[9], tdh, TimingViol_data_9);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[10], tdh, TimingViol_data_10);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[11], tdh, TimingViol_data_11);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[12], tdh, TimingViol_data_12);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[13], tdh, TimingViol_data_13);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[14], tdh, TimingViol_data_14);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[15], tdh, TimingViol_data_15);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[16], tdh, TimingViol_data_16);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[17], tdh, TimingViol_data_17);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[18], tdh, TimingViol_data_18);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[19], tdh, TimingViol_data_19);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[20], tdh, TimingViol_data_20);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[21], tdh, TimingViol_data_21);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[22], tdh, TimingViol_data_22);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[23], tdh, TimingViol_data_23);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[24], tdh, TimingViol_data_24);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[25], tdh, TimingViol_data_25);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[26], tdh, TimingViol_data_26);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[27], tdh, TimingViol_data_27);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[28], tdh, TimingViol_data_28);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[29], tdh, TimingViol_data_29);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[30], tdh, TimingViol_data_30);
	$hold(posedge CK &&& cond_sdf_tds, posedge D[31], tdh, TimingViol_data_31);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[0], tdh, TimingViol_data_0);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[1], tdh, TimingViol_data_1);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[2], tdh, TimingViol_data_2);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[3], tdh, TimingViol_data_3);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[4], tdh, TimingViol_data_4);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[5], tdh, TimingViol_data_5);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[6], tdh, TimingViol_data_6);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[7], tdh, TimingViol_data_7);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[8], tdh, TimingViol_data_8);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[9], tdh, TimingViol_data_9);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[10], tdh, TimingViol_data_10);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[11], tdh, TimingViol_data_11);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[12], tdh, TimingViol_data_12);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[13], tdh, TimingViol_data_13);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[14], tdh, TimingViol_data_14);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[15], tdh, TimingViol_data_15);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[16], tdh, TimingViol_data_16);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[17], tdh, TimingViol_data_17);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[18], tdh, TimingViol_data_18);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[19], tdh, TimingViol_data_19);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[20], tdh, TimingViol_data_20);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[21], tdh, TimingViol_data_21);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[22], tdh, TimingViol_data_22);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[23], tdh, TimingViol_data_23);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[24], tdh, TimingViol_data_24);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[25], tdh, TimingViol_data_25);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[26], tdh, TimingViol_data_26);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[27], tdh, TimingViol_data_27);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[28], tdh, TimingViol_data_28);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[29], tdh, TimingViol_data_29);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[30], tdh, TimingViol_data_30);
	$hold(posedge CK &&& cond_sdf_tds, negedge D[31], tdh, TimingViol_data_31);



        $setup(posedge M[0], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_0);
	$setup(negedge M[0], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_0);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[0], tmh, TimingViol_mask_0);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[0], tmh, TimingViol_mask_0);

        $setup(posedge M[1], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_1);
	$setup(negedge M[1], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_1);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[1], tmh, TimingViol_mask_1);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[1], tmh, TimingViol_mask_1);

        $setup(posedge M[2], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_2);
	$setup(negedge M[2], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_2);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[2], tmh, TimingViol_mask_2);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[2], tmh, TimingViol_mask_2);

        $setup(posedge M[3], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_3);
	$setup(negedge M[3], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_3);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[3], tmh, TimingViol_mask_3);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[3], tmh, TimingViol_mask_3);

        $setup(posedge M[4], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_4);
	$setup(negedge M[4], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_4);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[4], tmh, TimingViol_mask_4);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[4], tmh, TimingViol_mask_4);

        $setup(posedge M[5], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_5);
	$setup(negedge M[5], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_5);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[5], tmh, TimingViol_mask_5);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[5], tmh, TimingViol_mask_5);

        $setup(posedge M[6], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_6);
	$setup(negedge M[6], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_6);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[6], tmh, TimingViol_mask_6);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[6], tmh, TimingViol_mask_6);

        $setup(posedge M[7], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_7);
	$setup(negedge M[7], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_7);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[7], tmh, TimingViol_mask_7);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[7], tmh, TimingViol_mask_7);

        $setup(posedge M[8], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_8);
	$setup(negedge M[8], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_8);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[8], tmh, TimingViol_mask_8);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[8], tmh, TimingViol_mask_8);

        $setup(posedge M[9], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_9);
	$setup(negedge M[9], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_9);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[9], tmh, TimingViol_mask_9);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[9], tmh, TimingViol_mask_9);

        $setup(posedge M[10], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_10);
	$setup(negedge M[10], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_10);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[10], tmh, TimingViol_mask_10);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[10], tmh, TimingViol_mask_10);

        $setup(posedge M[11], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_11);
	$setup(negedge M[11], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_11);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[11], tmh, TimingViol_mask_11);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[11], tmh, TimingViol_mask_11);

        $setup(posedge M[12], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_12);
	$setup(negedge M[12], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_12);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[12], tmh, TimingViol_mask_12);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[12], tmh, TimingViol_mask_12);

        $setup(posedge M[13], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_13);
	$setup(negedge M[13], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_13);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[13], tmh, TimingViol_mask_13);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[13], tmh, TimingViol_mask_13);

        $setup(posedge M[14], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_14);
	$setup(negedge M[14], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_14);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[14], tmh, TimingViol_mask_14);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[14], tmh, TimingViol_mask_14);

        $setup(posedge M[15], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_15);
	$setup(negedge M[15], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_15);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[15], tmh, TimingViol_mask_15);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[15], tmh, TimingViol_mask_15);

        $setup(posedge M[16], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_16);
	$setup(negedge M[16], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_16);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[16], tmh, TimingViol_mask_16);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[16], tmh, TimingViol_mask_16);

        $setup(posedge M[17], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_17);
	$setup(negedge M[17], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_17);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[17], tmh, TimingViol_mask_17);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[17], tmh, TimingViol_mask_17);

        $setup(posedge M[18], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_18);
	$setup(negedge M[18], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_18);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[18], tmh, TimingViol_mask_18);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[18], tmh, TimingViol_mask_18);

        $setup(posedge M[19], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_19);
	$setup(negedge M[19], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_19);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[19], tmh, TimingViol_mask_19);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[19], tmh, TimingViol_mask_19);

        $setup(posedge M[20], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_20);
	$setup(negedge M[20], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_20);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[20], tmh, TimingViol_mask_20);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[20], tmh, TimingViol_mask_20);

        $setup(posedge M[21], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_21);
	$setup(negedge M[21], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_21);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[21], tmh, TimingViol_mask_21);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[21], tmh, TimingViol_mask_21);

        $setup(posedge M[22], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_22);
	$setup(negedge M[22], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_22);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[22], tmh, TimingViol_mask_22);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[22], tmh, TimingViol_mask_22);

        $setup(posedge M[23], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_23);
	$setup(negedge M[23], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_23);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[23], tmh, TimingViol_mask_23);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[23], tmh, TimingViol_mask_23);

        $setup(posedge M[24], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_24);
	$setup(negedge M[24], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_24);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[24], tmh, TimingViol_mask_24);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[24], tmh, TimingViol_mask_24);

        $setup(posedge M[25], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_25);
	$setup(negedge M[25], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_25);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[25], tmh, TimingViol_mask_25);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[25], tmh, TimingViol_mask_25);

        $setup(posedge M[26], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_26);
	$setup(negedge M[26], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_26);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[26], tmh, TimingViol_mask_26);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[26], tmh, TimingViol_mask_26);

        $setup(posedge M[27], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_27);
	$setup(negedge M[27], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_27);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[27], tmh, TimingViol_mask_27);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[27], tmh, TimingViol_mask_27);

        $setup(posedge M[28], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_28);
	$setup(negedge M[28], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_28);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[28], tmh, TimingViol_mask_28);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[28], tmh, TimingViol_mask_28);

        $setup(posedge M[29], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_29);
	$setup(negedge M[29], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_29);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[29], tmh, TimingViol_mask_29);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[29], tmh, TimingViol_mask_29);

        $setup(posedge M[30], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_30);
	$setup(negedge M[30], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_30);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[30], tmh, TimingViol_mask_30);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[30], tmh, TimingViol_mask_30);

        $setup(posedge M[31], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_31);
	$setup(negedge M[31], posedge CK &&& cond_sdf_tms, tms, TimingViol_mask_31);
	$hold(posedge CK &&& cond_sdf_tms, posedge M[31], tmh, TimingViol_mask_31);
	$hold(posedge CK &&& cond_sdf_tms, negedge M[31], tmh, TimingViol_mask_31);



        $setup(posedge WEN, posedge CK &&& cond_sdf_tws, tws, TimingViol_WEN);
        $setup(negedge WEN, posedge CK &&& cond_sdf_tws, tws, TimingViol_WEN);
        $hold(posedge CK &&& cond_sdf_tws, posedge WEN, twh, TimingViol_WEN);
        $hold(posedge CK &&& cond_sdf_tws, negedge WEN, twh, TimingViol_WEN);
        $setup(posedge CSN, posedge CK &&& cond_sdf_tps, tps, TimingViol_CSN);
	$setup(negedge CSN, posedge CK &&& cond_sdf_tps, tps, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tps, posedge CSN, tph, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tps, negedge CSN, tph, TimingViol_CSN);
        $period(posedge CK &&& cond_sdf_tcycle, tcycle, TimingViol_tcycle);  


        $period(posedge CK &&& cond_sdf_tcycle_ls1, tcycle_ls1, TimingViol_tcycle); 

        $period(posedge CK &&& cond_sdf_tcycle_hs1, tcycle_hs1, TimingViol_tcycle); 

        $period(posedge CK &&& cond_sdf_tcycle_ls1_hs1, tcycle_ls1_hs1, TimingViol_tcycle); 

        $width(posedge CK  &&& cond_sdf_tckh, tckh, 0, TimingViol_tckh);
        $width(negedge CK  &&& cond_sdf_tckl, tckl, 0, TimingViol_tckl);
        $period(posedge CK &&& cond_sdf_tcycle_se, tcycle_se, TimingViol_tcycle_se);
        $width(posedge CK  &&& cond_sdf_tckh_se, tckh_se, 0, TimingViol_tckh_se);
        $width(negedge CK  &&& cond_sdf_tckl_se, tckl_se, 0, TimingViol_tckl_se);

        $setup(posedge TBYPASS, posedge CK &&& cond_sdf_ttms,ttms, TimingViol_tbypass);
        $setup(negedge TBYPASS, posedge CK &&& cond_sdf_ttms,ttms, TimingViol_tbypass);
        $hold(posedge CK &&& cond_sdf_ttms, posedge TBYPASS, ttmh, TimingViol_tbypass); 
        $hold(posedge CK &&& cond_sdf_ttms, negedge TBYPASS, ttmh, TimingViol_tbypass); 
 


        $setup(posedge LS, posedge CK &&& cond_sdf_tlss,tlss, TimingViol_ls);
        $setup(negedge LS, posedge CK &&& cond_sdf_tlss,tlss, TimingViol_ls);
        $hold(posedge CK &&& cond_sdf_tlss, posedge LS, tlsh, TimingViol_ls); 
        $hold(posedge CK &&& cond_sdf_tlss, negedge LS, tlsh, TimingViol_ls); 


        $setup(posedge HS, posedge CK &&& cond_sdf_thss,thss, TimingViol_hs);
        $setup(negedge HS, posedge CK &&& cond_sdf_thss,thss, TimingViol_hs);
        $hold(posedge CK &&& cond_sdf_thss, posedge HS, thsh, TimingViol_hs); 
        $hold(posedge CK &&& cond_sdf_thss, negedge HS, thsh, TimingViol_hs); 


        $setup(posedge STDBY, posedge CK &&& cond_sdf_tstdbys, tstdbys, TimingViol_stdby);
        $setup(negedge STDBY, posedge CK &&& cond_sdf_tstdbys, tstdbys, TimingViol_stdby);
        $hold(posedge CK &&& cond_sdf_tstdbys, posedge STDBY, tstdbyh, TimingViol_stdby);        
        $hold(posedge CK &&& cond_sdf_tstdbys, negedge STDBY, tstdbyh, TimingViol_stdby); 
        
        
        $setup (posedge SE ,posedge CK &&& cond_sdf_tses,tses,TimingViol_se);
	$setup (negedge SE ,posedge CK &&& cond_sdf_tses,tses,TimingViol_se);
        
        $hold (posedge CK &&& cond_sdf_tses, posedge SE ,tseh,TimingViol_se);
	$hold (posedge CK &&& cond_sdf_tses, negedge SE ,tseh,TimingViol_se);
        
        $setup(posedge SCTRLI, posedge CK  &&& cond_sdf_tsctrlis , tsctrlis, TimingViol_sctrli);
        $setup(negedge SCTRLI, posedge CK  &&& cond_sdf_tsctrlis, tsctrlis, TimingViol_sctrli);
        $hold(posedge CK &&& cond_sdf_tsctrlis , posedge SCTRLI, tsctrlih, TimingViol_sctrli);        
        $hold(posedge CK &&& cond_sdf_tsctrlis , negedge SCTRLI, tsctrlih, TimingViol_sctrli);

        $setup(posedge SDLI, posedge CK &&& cond_sdf_tsdlis, tsdlis, TimingViol_sdli);
        $setup(negedge SDLI, posedge CK &&& cond_sdf_tsdlis, tsdlis, TimingViol_sdli);
        $hold(posedge CK &&& cond_sdf_tsdlis, posedge SDLI, tsdlih, TimingViol_sdli);        
        $hold(posedge CK &&& cond_sdf_tsdlis, negedge SDLI, tsdlih, TimingViol_sdli);

     

        $setup(posedge SDRI, posedge CK &&& cond_sdf_tsdris, tsdris, TimingViol_sdri);
        $setup(negedge SDRI, posedge CK &&& cond_sdf_tsdris, tsdris, TimingViol_sdri);
        $hold(posedge CK &&& cond_sdf_tsdris, posedge SDRI, tsdrih, TimingViol_sdri);        
        $hold(posedge CK &&& cond_sdf_tsdris, negedge SDRI, tsdrih, TimingViol_sdri);
        
 
        $setup(posedge SMLI, posedge CK &&& cond_sdf_tsmlis, tsmlis, TimingViol_smli);
        $setup(negedge SMLI, posedge CK &&& cond_sdf_tsmlis, tsmlis, TimingViol_smli);
        $hold(posedge CK &&& cond_sdf_tsmlis, posedge SMLI, tsmlih, TimingViol_smli);        
        $hold(posedge CK &&& cond_sdf_tsmlis, negedge SMLI, tsmlih, TimingViol_smli);

        $setup(posedge SMRI, posedge CK &&& cond_sdf_tsmris, tsmris, TimingViol_smri);
        $setup(negedge SMRI, posedge CK &&& cond_sdf_tsmris, tsmris, TimingViol_smri);
        $hold(posedge CK &&& cond_sdf_tsmris, posedge SMRI, tsmrih, TimingViol_smri);        
        $hold(posedge CK &&& cond_sdf_tsmris, negedge SMRI, tsmrih, TimingViol_smri);

      
        	
         
        
        $setup(posedge INITN, posedge CK &&& cond_sdf_tinitns, tinitns, TimingViol_initn);
        $setup(negedge INITN, posedge CK &&& cond_sdf_tinitns, tinitns, TimingViol_initn);
        
        $hold (posedge CK &&& cond_sdf_tinitns,posedge INITN, tinitnh, TimingViol_initn);
        $hold (posedge CK &&& cond_sdf_tinitns,negedge INITN, tinitnh, TimingViol_initn);

        $setup(posedge ATP, posedge CK &&& cond_sdf_atps , tatps, TimingViol_atp);
        $setup(negedge ATP, posedge CK &&& cond_sdf_atps , tatps, TimingViol_atp);
        $hold(posedge CK &&& cond_sdf_atps, posedge ATP, tatph, TimingViol_atp);        
        $hold(posedge CK &&& cond_sdf_atps, negedge ATP, tatph, TimingViol_atp);
        
        $setup(posedge IG, posedge CK &&& cond_sdf_tigs , tigs, TimingViol_ig);
        $setup(negedge IG, posedge CK &&& cond_sdf_tigs , tigs, TimingViol_ig);
        $hold(posedge CK &&& cond_sdf_tigs, posedge IG, tigh, TimingViol_ig);        
        $hold(posedge CK &&& cond_sdf_tigs, negedge IG, tigh, TimingViol_ig);



         
$setup(posedge RM[0], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[1], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[2], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[3], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[0], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[1], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[2], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[3], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[0], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[1], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[2], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[3], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[0], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[1], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[2], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[3], trmh, TimingViol_rm); 

        
$setup(posedge WM[0], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(posedge WM[1], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(posedge WM[2], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(posedge WM[3], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(negedge WM[0], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(negedge WM[1], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(negedge WM[2], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$setup(negedge WM[3], posedge CK &&& cond_sdf_twms, twms, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, posedge WM[0], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, posedge WM[1], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, posedge WM[2], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, posedge WM[3], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, negedge WM[0], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, negedge WM[1], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, negedge WM[2], twmh, TimingViol_wm);
$hold(posedge CK &&& cond_sdf_twms, negedge WM[3], twmh, TimingViol_wm);
 
        
        $setup(posedge TBIST, posedge CK &&& cond_sdf_tbists , tbists, TimingViol_tbist);
        $setup(negedge TBIST, posedge CK &&& cond_sdf_tbists , tbists, TimingViol_tbist);
        $hold(posedge CK &&& cond_sdf_tbists, posedge TBIST, tbisth, TimingViol_tbist);        
        $hold(posedge CK &&& cond_sdf_tbists, negedge TBIST, tbisth, TimingViol_tbist);


       	$setup(posedge TA[0], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[1], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[2], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[3], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[4], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[5], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[6], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[7], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(posedge TA[8], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
       	$setup(negedge TA[0], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[1], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[2], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[3], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[4], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[5], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[6], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[7], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
	$setup(negedge TA[8], posedge CK &&& cond_sdf_tbas , tbas, TimingViol_addr);
       	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[0], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[1], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[2], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[3], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[4], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[5], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[6], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[7], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, posedge TA[8], tbah, TimingViol_addr);
       	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[0], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[1], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[2], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[3], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[4], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[5], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[6], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[7], tbah, TimingViol_addr);
	$hold(posedge CK &&& cond_sdf_tbas, negedge TA[8], tbah, TimingViol_addr);


        $setup(posedge TCSN, posedge CK &&& cond_sdf_tbps, tbps, TimingViol_CSN);
	$setup(negedge TCSN, posedge CK &&& cond_sdf_tbps, tbps, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tbps, posedge TCSN, tbph, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tbps, negedge TCSN, tbph, TimingViol_CSN); 
       
        $setup(posedge TWEN, posedge CK &&& cond_sdf_tbws, tbws, TimingViol_WEN);
        $setup(negedge TWEN, posedge CK &&& cond_sdf_tbws, tbws, TimingViol_WEN);
        $hold(posedge CK &&& cond_sdf_tbws, posedge TWEN, tbwh, TimingViol_WEN);
        $hold(posedge CK &&& cond_sdf_tbws, negedge TWEN, tbwh, TimingViol_WEN);
       
       
        $setup(posedge TED, posedge CK &&& cond_sdf_tbdes, tbdes, TimingViol_TED);
        $setup(negedge TED, posedge CK &&& cond_sdf_tbdes, tbdes, TimingViol_TED);
        $hold(posedge CK &&& cond_sdf_tbdes, posedge TED, tbdeh, TimingViol_TED);
        $hold(posedge CK &&& cond_sdf_tbdes, negedge TED, tbdeh, TimingViol_TED);

        $setup(posedge TOD, posedge CK &&& cond_sdf_tbdos, tbdos, TimingViol_TOD);
        $setup(negedge TOD, posedge CK &&& cond_sdf_tbdos, tbdos, TimingViol_TOD);
        $hold(posedge CK &&& cond_sdf_tbdos, posedge TOD, tbdoh, TimingViol_TOD);
        $hold(posedge CK &&& cond_sdf_tbdos, negedge TOD, tbdoh, TimingViol_TOD);

        $setup(posedge TEM, posedge CK &&& cond_sdf_tbmes, tbmes, TimingViol_TEM);
        $setup(negedge TEM, posedge CK &&& cond_sdf_tbmes, tbmes, TimingViol_TEM);
        $hold(posedge CK &&& cond_sdf_tbmes, posedge TEM, tbmeh, TimingViol_TEM);
        $hold(posedge CK &&& cond_sdf_tbmes, negedge TEM, tbmeh, TimingViol_TEM);

        $setup(posedge TOM, posedge CK &&& cond_sdf_tbmos, tbmos, TimingViol_TOM);
        $setup(negedge TOM, posedge CK &&& cond_sdf_tbmos, tbmos, TimingViol_TOM);
        $hold(posedge CK &&& cond_sdf_tbmos, posedge TOM, tbmoh, TimingViol_TOM);
        $hold(posedge CK &&& cond_sdf_tbmos, negedge TOM, tbmoh, TimingViol_TOM);
       
          


          

          /*-------------------- Propagation Delays ------------------*/
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa, taa, th, taa, th, taa);
                
	
        if (cond_sdf_taa) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa, taa, th, taa, th, taa);
                 


/* // //	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[0] +: Q_final[0])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[1] +: Q_final[1])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[2] +: Q_final[2])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[3] +: Q_final[3])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[4] +: Q_final[4])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[5] +: Q_final[5])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[6] +: Q_final[6])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[7] +: Q_final[7])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[8] +: Q_final[8])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[9] +: Q_final[9])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[10] +: Q_final[10])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[11] +: Q_final[11])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[12] +: Q_final[12])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[13] +: Q_final[13])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[14] +: Q_final[14])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[15] +: Q_final[15])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[16] +: Q_final[16])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[17] +: Q_final[17])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[18] +: Q_final[18])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[19] +: Q_final[19])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[20] +: Q_final[20])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[21] +: Q_final[21])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[22] +: Q_final[22])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[23] +: Q_final[23])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[24] +: Q_final[24])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[25] +: Q_final[25])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[26] +: Q_final[26])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[27] +: Q_final[27])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[28] +: Q_final[28])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[29] +: Q_final[29])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[30] +: Q_final[30])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q);
//	if (cond_sdf_taa_tbypass_q) (posedge TBYPASS => (Q[31] +: Q_final[31])) = (taa_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q, th_tbypass_q, taa_tbypass_q); */ 


	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                
	
        if (cond_sdf_taa_ls1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
                 




	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                
	
        if (cond_sdf_taa_hs1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_hs1, taa_hs1, th_hs1, taa_hs1, th_hs1, taa_hs1);
                



	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                
	
        if (cond_sdf_taa_ls1_hs1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1, th_ls1_hs1, taa_ls1_hs1);
                




	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                
	
        if (cond_sdf_taa_tm) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_tm, taa_tm, th_tm, taa_tm, th_tm, taa_tm);
                




	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                
	
        if (cond_sdf_taa_tm_ls1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1, th_tm_ls1, taa_tm_ls1);
                




	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                
	
        if (cond_sdf_taa_tm_hs1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1, th_tm_hs1, taa_tm_hs1);
                




	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[0] +: Q_final[0])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[1] +: Q_final[1])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[2] +: Q_final[2])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[3] +: Q_final[3])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[4] +: Q_final[4])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[5] +: Q_final[5])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[6] +: Q_final[6])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[7] +: Q_final[7])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[8] +: Q_final[8])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[9] +: Q_final[9])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[10] +: Q_final[10])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[11] +: Q_final[11])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[12] +: Q_final[12])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[13] +: Q_final[13])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[14] +: Q_final[14])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[15] +: Q_final[15])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[16] +: Q_final[16])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[17] +: Q_final[17])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[18] +: Q_final[18])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[19] +: Q_final[19])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[20] +: Q_final[20])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[21] +: Q_final[21])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[22] +: Q_final[22])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[23] +: Q_final[23])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[24] +: Q_final[24])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[25] +: Q_final[25])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[26] +: Q_final[26])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[27] +: Q_final[27])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[28] +: Q_final[28])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[29] +: Q_final[29])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[30] +: Q_final[30])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                
	
        if (cond_sdf_taa_tm_ls1_hs1) 
                (posedge CK => (Q[31] +: Q_final[31])) = (taa_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1, th_tm_ls1_hs1, taa_tm_ls1_hs1);
                



	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[0] +: Q_final[0])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[1] +: Q_final[1])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[2] +: Q_final[2])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[3] +: Q_final[3])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[4] +: Q_final[4])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[5] +: Q_final[5])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[6] +: Q_final[6])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[7] +: Q_final[7])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[8] +: Q_final[8])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[9] +: Q_final[9])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[10] +: Q_final[10])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[11] +: Q_final[11])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[12] +: Q_final[12])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[13] +: Q_final[13])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[14] +: Q_final[14])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[15] +: Q_final[15])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[16] +: Q_final[16])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[17] +: Q_final[17])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[18] +: Q_final[18])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[19] +: Q_final[19])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[20] +: Q_final[20])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[21] +: Q_final[21])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[22] +: Q_final[22])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[23] +: Q_final[23])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[24] +: Q_final[24])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[25] +: Q_final[25])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[26] +: Q_final[26])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[27] +: Q_final[27])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[28] +: Q_final[28])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[29] +: Q_final[29])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[30] +: Q_final[30])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                
	
        if (cond_sdf_taa_tseq_tm) 
                (negedge SE => (Q[31] +: Q_final[31])) = (taa_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm, th_tseq_tm, taa_tseq_tm);
                 

	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[0] +: Q_final[0])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[1] +: Q_final[1])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[2] +: Q_final[2])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[3] +: Q_final[3])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[4] +: Q_final[4])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[5] +: Q_final[5])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[6] +: Q_final[6])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[7] +: Q_final[7])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[8] +: Q_final[8])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[9] +: Q_final[9])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[10] +: Q_final[10])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[11] +: Q_final[11])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[12] +: Q_final[12])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[13] +: Q_final[13])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[14] +: Q_final[14])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[15] +: Q_final[15])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[16] +: Q_final[16])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[17] +: Q_final[17])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[18] +: Q_final[18])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[19] +: Q_final[19])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[20] +: Q_final[20])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[21] +: Q_final[21])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[22] +: Q_final[22])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[23] +: Q_final[23])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[24] +: Q_final[24])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[25] +: Q_final[25])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[26] +: Q_final[26])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[27] +: Q_final[27])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[28] +: Q_final[28])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[29] +: Q_final[29])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[30] +: Q_final[30])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                
	
        if (cond_sdf_taa_tckq_tm) 
                (negedge CK => (Q[31] +: Q_final[31])) = (taa_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm, th_tckq_tm, taa_tckq_tm);
                



if (cond_sdf_taa_sctrlo) 
        (posedge CK *> (SCTRLO :  SCTRLO_final)) = (taa_sctrlo,taa_sctrlo,th_sctrlo,taa_sctrlo,th_sctrlo,taa_sctrlo); 

if (cond_sdf_taa_sctrlo_se) 
        (negedge CK *> (SCTRLO : SCTRLO_final)) = (taa_sctrlo_se,taa_sctrlo_se,th_sctrlo_se,taa_sctrlo_se,th_sctrlo_se,taa_sctrlo_se); 
 
if (cond_sdf_taa_sdlo) 
        (posedge CK *> (SDLO :  SDLO_final)) = (taa_sdlo,taa_sdlo,th_sdlo,taa_sdlo,th_sdlo,taa_sdlo); 
if (cond_sdf_taa_sdlo_se) 
        (negedge CK *> (SDLO : SDLO_final)) = (taa_sdlo_se,taa_sdlo_se,th_sdlo_se,taa_sdlo_se,th_sdlo_se,taa_sdlo_se);


if (cond_sdf_taa_sdro) 
        (posedge CK *> (SDRO :  SDRO_final)) = (taa_sdro,taa_sdro,th_sdro,taa_sdro,th_sdro,taa_sdro); 
if (cond_sdf_taa_sdro_se) 
        (negedge CK *> (SDRO : SDRO_final)) = (taa_sdro_se,taa_sdro_se,th_sdro_se,taa_sdro_se,th_sdro_se,taa_sdro_se); 





if (cond_sdf_taa_smlo) 
        (posedge CK *> (SMLO :  SMLO_final)) = (taa_smlo,taa_smlo,th_smlo,taa_smlo,th_smlo,taa_smlo); 
if (cond_sdf_taa_smlo_se) 
        (negedge CK *> (SMLO : SMLO_final)) = (taa_smlo_se,taa_smlo_se,th_smlo_se,taa_smlo_se,th_smlo_se,taa_smlo_se);
if (cond_sdf_taa_smro) 
        (posedge CK *> (SMRO :  SMRO_final)) = (taa_smro,taa_smro,th_smro,taa_smro,th_smro,taa_smro);
if (cond_sdf_taa_smro_se) 
        (negedge CK *> (SMRO : SMRO_final)) = (taa_smro_se,taa_smro_se,th_smro_se,taa_smro_se,th_smro_se,taa_smro_se);


 
     


endspecify //specify block ends

always @(SE_buf)
begin
 if ($realtime > 0) begin
   if (INITN_buf === 1'b1 && SLEEP_buf === 1'b0 && ATP_buf === 1'b1 && STDBY_buf === 0) begin
// reset the next cycle corruption flag // modification done to test the proposal of resetting next cycle corruption flag on toggling of SE. This is because setup/hold of SE is large enough to ensure recovery from MemFSM corruption. 
        invalid_next_cycle_func = 1'b0;
        invalid_next_cycle_dft = 1'b0;
        release IO.cgc_CK_rw.CK_gated;
        release IO.cgc_CK_bypass.CK_gated;
        release IO.cgc_CK_lkp_latch.CK_gated;
        release IO.cgc_CK_scff.CK_gated;
        if (CK === 1'b0) begin
                IO.cgc_CK_rw.CK_gated = 1'b0;
                IO.cgc_CK_bypass.CK_gated = 1'b0;
                IO.cgc_CK_lkp_latch.CK_gated = 1'b0;
                IO.cgc_CK_scff.CK_gated = 1'b0;
        end        
   end 
 end  
end

task Invalid_next_cycle_func_tim;
begin
        
   Corrupt_Mem;
   Corrupt_Q;
   if (INITN !== 1'b0) begin     
        invalid_next_cycle_func <= 1'b1;
        force IO.cgc_CK_rw.CK_gated = 1'bx;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Memory and Output Q are Corrupted. Next Cycle is not functional", $realtime);
   end     
end
endtask

task Invalid_next_cycle_dft_tim;
begin

   Corrupt_all_scan_flops_scan_outs;
   if (INITN !== 1'b0) begin     
        invalid_next_cycle_dft <= 1'b1;
        force IO.cgc_CK_lkp_latch.CK_gated = 1'bx;
        force IO.cgc_CK_scff.CK_gated = 1'bx;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted. Next Cycle is not functional", $realtime);
   end
end
endtask

task WriteLocMskX_bwise;
input [Addr-1 : 0] Address;
input [bits-1 : 0] Mask;
reg [bits-1 : 0] Mask_inv;

reg [bits-1:0] tempReg1;
begin
   tempReg1 = WordX;
   Mask_inv = ~Mask;
   if (^Address !== X )
   begin
      `ifdef ST_MEM_SLM
        $slm_ReadMemory(slm_handle, Address, tempReg1);
      `else
        tempReg1 = Mem[Address];
      `endif
             
      for (i = 0; i < bits; i=i+1) begin
        if (Mask[i] === 1'bx)
            tempReg1[i] = 1'bx;
      end
      `ifdef ST_MEM_SLM
         $slm_WriteMemory(slm_handle, Address, tempReg1, Mask_inv);
      `else
        Mem[Address] = tempReg1;
      `endif
   end//if (^Address !== X
   else begin
      WriteMemX;
   end   
   task_insert_faults_in_memory;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Memory bit location Corrupted", $realtime);
end
endtask


// conversion from registers to array elements for mask setup violation notifiers 

   
always @(TimingViol_mask_0   or TimingViol_TEM   )
begin
          TimingViol_mask[0]=~TimingViol_mask[0]; 
end

   
always @(TimingViol_mask_1   or TimingViol_TOM   )
begin
          TimingViol_mask[1]=~TimingViol_mask[1]; 
end

   
always @(TimingViol_mask_2   or TimingViol_TEM   )
begin
          TimingViol_mask[2]=~TimingViol_mask[2]; 
end

   
always @(TimingViol_mask_3   or TimingViol_TOM   )
begin
          TimingViol_mask[3]=~TimingViol_mask[3]; 
end

   
always @(TimingViol_mask_4   or TimingViol_TEM   )
begin
          TimingViol_mask[4]=~TimingViol_mask[4]; 
end

   
always @(TimingViol_mask_5   or TimingViol_TOM   )
begin
          TimingViol_mask[5]=~TimingViol_mask[5]; 
end

   
always @(TimingViol_mask_6   or TimingViol_TEM   )
begin
          TimingViol_mask[6]=~TimingViol_mask[6]; 
end

   
always @(TimingViol_mask_7   or TimingViol_TOM   )
begin
          TimingViol_mask[7]=~TimingViol_mask[7]; 
end

   
always @(TimingViol_mask_8   or TimingViol_TEM   )
begin
          TimingViol_mask[8]=~TimingViol_mask[8]; 
end

   
always @(TimingViol_mask_9   or TimingViol_TOM   )
begin
          TimingViol_mask[9]=~TimingViol_mask[9]; 
end

   
always @(TimingViol_mask_10   or TimingViol_TEM   )
begin
          TimingViol_mask[10]=~TimingViol_mask[10]; 
end

   
always @(TimingViol_mask_11   or TimingViol_TOM   )
begin
          TimingViol_mask[11]=~TimingViol_mask[11]; 
end

   
always @(TimingViol_mask_12   or TimingViol_TEM   )
begin
          TimingViol_mask[12]=~TimingViol_mask[12]; 
end

   
always @(TimingViol_mask_13   or TimingViol_TOM   )
begin
          TimingViol_mask[13]=~TimingViol_mask[13]; 
end

   
always @(TimingViol_mask_14   or TimingViol_TEM   )
begin
          TimingViol_mask[14]=~TimingViol_mask[14]; 
end

   
always @(TimingViol_mask_15   or TimingViol_TOM   )
begin
          TimingViol_mask[15]=~TimingViol_mask[15]; 
end

   
always @(TimingViol_mask_16   or TimingViol_TEM   )
begin
          TimingViol_mask[16]=~TimingViol_mask[16]; 
end

   
always @(TimingViol_mask_17   or TimingViol_TOM   )
begin
          TimingViol_mask[17]=~TimingViol_mask[17]; 
end

   
always @(TimingViol_mask_18   or TimingViol_TEM   )
begin
          TimingViol_mask[18]=~TimingViol_mask[18]; 
end

   
always @(TimingViol_mask_19   or TimingViol_TOM   )
begin
          TimingViol_mask[19]=~TimingViol_mask[19]; 
end

   
always @(TimingViol_mask_20   or TimingViol_TEM   )
begin
          TimingViol_mask[20]=~TimingViol_mask[20]; 
end

   
always @(TimingViol_mask_21   or TimingViol_TOM   )
begin
          TimingViol_mask[21]=~TimingViol_mask[21]; 
end

   
always @(TimingViol_mask_22   or TimingViol_TEM   )
begin
          TimingViol_mask[22]=~TimingViol_mask[22]; 
end

   
always @(TimingViol_mask_23   or TimingViol_TOM   )
begin
          TimingViol_mask[23]=~TimingViol_mask[23]; 
end

   
always @(TimingViol_mask_24   or TimingViol_TEM   )
begin
          TimingViol_mask[24]=~TimingViol_mask[24]; 
end

   
always @(TimingViol_mask_25   or TimingViol_TOM   )
begin
          TimingViol_mask[25]=~TimingViol_mask[25]; 
end

   
always @(TimingViol_mask_26   or TimingViol_TEM   )
begin
          TimingViol_mask[26]=~TimingViol_mask[26]; 
end

   
always @(TimingViol_mask_27   or TimingViol_TOM   )
begin
          TimingViol_mask[27]=~TimingViol_mask[27]; 
end

   
always @(TimingViol_mask_28   or TimingViol_TEM   )
begin
          TimingViol_mask[28]=~TimingViol_mask[28]; 
end

   
always @(TimingViol_mask_29   or TimingViol_TOM   )
begin
          TimingViol_mask[29]=~TimingViol_mask[29]; 
end

   
always @(TimingViol_mask_30   or TimingViol_TEM   )
begin
          TimingViol_mask[30]=~TimingViol_mask[30]; 
end

   
always @(TimingViol_mask_31   or TimingViol_TOM   )
begin
          TimingViol_mask[31]=~TimingViol_mask[31]; 
end







// conversion from registers to array elements for data setup violation notifiers

always @(TimingViol_data_0   or TimingViol_TED  )
begin
        TimingViol_data[0]=~TimingViol_data[0];   
end


always @(TimingViol_data_1   or TimingViol_TOD  )
begin
        TimingViol_data[1]=~TimingViol_data[1];   
end


always @(TimingViol_data_2   or TimingViol_TED  )
begin
        TimingViol_data[2]=~TimingViol_data[2];   
end


always @(TimingViol_data_3   or TimingViol_TOD  )
begin
        TimingViol_data[3]=~TimingViol_data[3];   
end


always @(TimingViol_data_4   or TimingViol_TED  )
begin
        TimingViol_data[4]=~TimingViol_data[4];   
end


always @(TimingViol_data_5   or TimingViol_TOD  )
begin
        TimingViol_data[5]=~TimingViol_data[5];   
end


always @(TimingViol_data_6   or TimingViol_TED  )
begin
        TimingViol_data[6]=~TimingViol_data[6];   
end


always @(TimingViol_data_7   or TimingViol_TOD  )
begin
        TimingViol_data[7]=~TimingViol_data[7];   
end


always @(TimingViol_data_8   or TimingViol_TED  )
begin
        TimingViol_data[8]=~TimingViol_data[8];   
end


always @(TimingViol_data_9   or TimingViol_TOD  )
begin
        TimingViol_data[9]=~TimingViol_data[9];   
end


always @(TimingViol_data_10   or TimingViol_TED  )
begin
        TimingViol_data[10]=~TimingViol_data[10];   
end


always @(TimingViol_data_11   or TimingViol_TOD  )
begin
        TimingViol_data[11]=~TimingViol_data[11];   
end


always @(TimingViol_data_12   or TimingViol_TED  )
begin
        TimingViol_data[12]=~TimingViol_data[12];   
end


always @(TimingViol_data_13   or TimingViol_TOD  )
begin
        TimingViol_data[13]=~TimingViol_data[13];   
end


always @(TimingViol_data_14   or TimingViol_TED  )
begin
        TimingViol_data[14]=~TimingViol_data[14];   
end


always @(TimingViol_data_15   or TimingViol_TOD  )
begin
        TimingViol_data[15]=~TimingViol_data[15];   
end


always @(TimingViol_data_16   or TimingViol_TED  )
begin
        TimingViol_data[16]=~TimingViol_data[16];   
end


always @(TimingViol_data_17   or TimingViol_TOD  )
begin
        TimingViol_data[17]=~TimingViol_data[17];   
end


always @(TimingViol_data_18   or TimingViol_TED  )
begin
        TimingViol_data[18]=~TimingViol_data[18];   
end


always @(TimingViol_data_19   or TimingViol_TOD  )
begin
        TimingViol_data[19]=~TimingViol_data[19];   
end


always @(TimingViol_data_20   or TimingViol_TED  )
begin
        TimingViol_data[20]=~TimingViol_data[20];   
end


always @(TimingViol_data_21   or TimingViol_TOD  )
begin
        TimingViol_data[21]=~TimingViol_data[21];   
end


always @(TimingViol_data_22   or TimingViol_TED  )
begin
        TimingViol_data[22]=~TimingViol_data[22];   
end


always @(TimingViol_data_23   or TimingViol_TOD  )
begin
        TimingViol_data[23]=~TimingViol_data[23];   
end


always @(TimingViol_data_24   or TimingViol_TED  )
begin
        TimingViol_data[24]=~TimingViol_data[24];   
end


always @(TimingViol_data_25   or TimingViol_TOD  )
begin
        TimingViol_data[25]=~TimingViol_data[25];   
end


always @(TimingViol_data_26   or TimingViol_TED  )
begin
        TimingViol_data[26]=~TimingViol_data[26];   
end


always @(TimingViol_data_27   or TimingViol_TOD  )
begin
        TimingViol_data[27]=~TimingViol_data[27];   
end


always @(TimingViol_data_28   or TimingViol_TED  )
begin
        TimingViol_data[28]=~TimingViol_data[28];   
end


always @(TimingViol_data_29   or TimingViol_TOD  )
begin
        TimingViol_data[29]=~TimingViol_data[29];   
end


always @(TimingViol_data_30   or TimingViol_TED  )
begin
        TimingViol_data[30]=~TimingViol_data[30];   
end


always @(TimingViol_data_31   or TimingViol_TOD  )
begin
        TimingViol_data[31]=~TimingViol_data[31];   
end


//------------------------------------------------------------------------
//           Actions taken on timing violations starts 
//------------------------------------------------------------------------

 always @(TimingViol_data)
// tds or tdh violation
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
  for (i = 0; i < bits; i = i + 1) begin   
    if (CSWEMTBYPASS[i] !== 0) begin
     if((TimingViol_data[i] !== TimingViol_data_last[i])) begin
         M_bmux_reg[i] = 1'bx;
     end    
    end   
   end 
   if (CSWEMTBYPASS !== 0) WriteLocMskX_bwise(A_bmux_reg,M_bmux_reg);
  end
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin
   Corrupt_data_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Data Scan Flops and Scan Outs are Corrupted", $realtime);
  end
  TimingViol_data_last = TimingViol_data; 
end


always @(TimingViol_mask)
// tms or tmh violation
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
     if(CSWETBYPASSN !== 0) begin
          for (i = 0; i < bits; i = i+1) begin   
             if ( (TimingViol_mask_last[i] !== TimingViol_mask[i])) begin
                `ifdef ST_MEM_SLM
                        M_bmux_reg[i] = 1'bx;
                `else
                        if (D_bmux[i] !== Mem_prev[i]) begin
                         M_bmux_reg[i] = 1'bx;
                        end
                `endif
             end   
          end      
          WriteLocMskX_bwise(A_bmux_reg, M_bmux_reg);
     end      
  end
  
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
        Corrupt_mask_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Mask Scan Flops and Scan Outs are Corrupted", $realtime);
  end

  TimingViol_mask_last = TimingViol_mask; 
 end 

always @(TimingViol_addr)
// tas or tah
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Invalid_next_cycle_func_tim;
  end
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
      Corrupt_ctrl_scan_flops_scan_outs;
      if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Control Scan Flops and Scan Outs are Corrupted", $realtime);
  end
end

always @(TimingViol_WEN)
//tws or twh
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Qtemp = WordX;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Output Q Corrupted", $realtime);
   
   if (ValidAddress === 1'b1) begin
           Corrupt_Current_Location;
           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Current Address Location Corrupted", $realtime);
   end
   else if (ValidAddress === 1'bx) begin
           WriteMemX;
           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Entire Memory Array Corrupted", $realtime);
   end        
  end
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
   Corrupt_ctrl_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Control Scan Flops and Scan Outs are Corrupted", $realtime);
  end
end 

always @(TimingViol_CSN )
// tps or tph 
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Invalid_next_cycle_func_tim;
  end
  if (INITN_buf !== 0 && STDBY_buf !== 1 && SLEEP_buf !== 1 && ATP_buf !== 0 ) begin      
   Corrupt_ctrl_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Control Scan Flops and Scan Outs are Corrupted", $realtime);
  end
end

always @(TimingViol_tcycle )
//tcycle
begin
#0
   if ((IO.GAC && ATP_buf) !== 0 && MEMEN_dft_prev !== 0) begin
    Invalid_next_cycle_dft_tim;
   end
   if (IO.MEM_EN_inst !== 0 && MEMEN_prev !== 0) begin
    Invalid_next_cycle_func_tim;
   end
end

always @(TimingViol_tckl )
// tckl 
begin
#0
   if (INITN_buf !== 0 && STDBY_buf !== 1 && SLEEP_buf !== 1 && ATP_buf !== 0 ) begin      
    Invalid_next_cycle_dft_tim;
   end
   if (INITN_buf !== 0 && STDBY_buf !== 1 && SLEEP_buf !== 1 && IO.CSN_bmux !== 1 && IGint !== 1 && DE_temp !== 1 && (ATP_buf !== 1 ||(ATP_buf === 1 && SE_buf !== 1 && TBYPASS_buf !== 1))) begin
    Invalid_next_cycle_func_tim;
   end
end

always @(TimingViol_tckh) begin
#0
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
    Invalid_next_cycle_dft_tim;
   end
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
    Invalid_next_cycle_func_tim;
   end
end


always @(TimingViol_tcycle_se )
//tcycle_se
begin
#0
   if ((IO.GAC && ATP_buf) !== 0 && MEMEN_dft_prev !== 0) begin
         Invalid_next_cycle_dft_tim;
   end
end

always @(TimingViol_tckl_se  )
begin
#0
   if (INITN_buf !== 0 && STDBY_buf !== 1 && SLEEP_buf !== 1 && ATP_buf !== 0 ) begin      
         Invalid_next_cycle_dft_tim;
   end
end

always @(TimingViol_tckh_se) begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
         Invalid_next_cycle_dft_tim;
   end
end

always @(TimingViol_tbist) begin
#0
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
    Corrupt_all_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted", $realtime);
   end
   if (IO.TBYPASSint !== 1'b0) begin 
    Corrupt_Q;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Output Q Corrupted", $realtime);
   end 
   if (INITN_reg !==0 && STDBY_reg !== 1 && TBYPASS_reg !== 1 && SLEEP_reg !== 1 && SE_reg !== 1 && IG_reg !== 1 && DE_reg !== 1) begin
    Invalid_next_cycle_func_tim;
   end
end


always @(TimingViol_ls) begin
 #0 
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && (RM_buf === 0) && (WM_buf === 0)) begin
    Invalid_next_cycle_func_tim;
   end
end



always @(TimingViol_hs) begin
 #0 
   if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && (RM_buf === 0) && (WM_buf === 0)) begin   
    Invalid_next_cycle_func_tim;
   end
end 


always @(TimingViol_tbypass)
//ttmck
begin
#0  
  Corrupt_Q;
  if (INITN_reg !== 0 && SLEEP_reg !== 1 && SE_reg !== 1 && STDBY_reg !== 1 &&  DE_reg !== 1) begin
   Invalid_next_cycle_dft_tim;
  end
  if (CSN_reg !== 1 && IG_reg !== 1 && DE_reg !== 1 && SLEEP_reg !== 1 && STDBY_reg !== 1 && INITN_reg !== 0) begin 
    Invalid_next_cycle_func_tim;
  end
end


always @(TimingViol_sleep)
begin
#0
  if (INITN_reg !== 0 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && DE_reg !== 1) begin
   Invalid_next_cycle_func_tim;
  end  
  if (INITN_reg !== 0 && STDBY_reg !== 1 && ATP_reg !== 0) begin
     if (SE_reg !== 1'b1) begin
        Invalid_next_cycle_dft_tim;
     end
     else begin
        Corrupt_all_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted", $realtime);
     end        
  end
end

always @(TimingViol_stdby)
begin
#0
  if (CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && DE_reg !== 1) begin 
   Invalid_next_cycle_func_tim;
  end  
  if (ATP_reg !== 0) begin 
     if (SE_reg !== 1'b1) begin
        Invalid_next_cycle_dft_tim;
     end
     else begin
        Corrupt_all_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted", $realtime);
     end        
  end
end






always @(TimingViol_se) begin
#0
  if (TBYPASS_reg === 1'b1) begin 
     Corrupt_Q;
     if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Output Q Corrupted", $realtime);
  end 
  else begin 
        Invalid_next_cycle_func_tim;
  end 
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
    Corrupt_all_scan_flops_scan_outs;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted", $realtime);
    if (TBYPASS_reg === 1'bx && SE_buf !== 1'b1) begin
        Invalid_next_cycle_dft_tim;
    end
  end
end

always @(TimingViol_sctrli) begin
    Corrupt_ctrl_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Control Scan Flops Corrupted", $realtime);
end

always @(TimingViol_sdli) begin
    Corrupt_datal_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Data Left Scan Flops Corrupted", $realtime);
end

always @(TimingViol_sdri) begin
    Corrupt_datar_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Data Right Scan Flops Corrupted", $realtime);
end




always @(TimingViol_smli) begin
    Corrupt_maskl_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Mask Left Scan Flops Corrupted", $realtime);
end

always @(TimingViol_smri) begin
    Corrupt_maskr_scan_flops;
    if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Mask Right Scan Flops Corrupted", $realtime);
end




        

always @(TimingViol_initn) begin
#0
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && DE_reg !== 1) begin
   Corrupt_Mem;
   Corrupt_Q;
   invalid_next_cycle_func <= 1'b1;
   force IO.cgc_CK_rw.CK_gated = 1'bx;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : Memory and Output Q are Corrupted. Next Cycle is not functional", $realtime);
  end  
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && ATP_reg !== 0) begin
     if (SE_reg !== 1'b1) begin
        Corrupt_all_scan_flops_scan_outs;
        invalid_next_cycle_dft <= 1'b1;
        force IO.cgc_CK_lkp_latch.CK_gated = 1'bx;
        force IO.cgc_CK_scff.CK_gated = 1'bx;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops and Scan Outs are Corrupted. Next Cycle is not functional", $realtime);
     end
     else begin
        Corrupt_all_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops are Corrupted", $realtime);
     end        
  end
end

always @(TimingViol_ig) begin
#0
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && INITN_reg !== 0 && DE_reg !== 1) begin
   Invalid_next_cycle_func_tim;
  end  
  if (INITN_reg !== 0 && STDBY_reg !== 1 && SLEEP_reg !== 1 && ATP_reg !== 0 ) begin      
   Corrupt_all_scan_flops_scan_outs;
   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING : All Scan Flops are Corrupted", $realtime);
  end
end

always @(TimingViol_atp) begin
#0
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && INITN_reg !== 0) begin  
   Invalid_next_cycle_func_tim;
  end  
  if (SLEEP_reg !== 1 && STDBY_reg !== 1 && INITN_reg !== 0) begin
   Invalid_next_cycle_dft_tim;
  end
end


always @(TimingViol_rm) begin
#0
   if (INITN_reg !== 0 && SLEEP_reg !== 1 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && (LS_buf !== X) && (HS_buf !== X) && (WM_buf === 0)) begin 
    Invalid_next_cycle_func_tim;
   end
end
always @(TimingViol_wm) begin
#0
   if (INITN_reg !== 0 && SLEEP_reg !== 1 && STDBY_reg !== 1 && CSN_reg !== 1 && (ATP_reg !== 1 ||(ATP_reg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IG_reg !== 1 && (LS_buf !== X) && (HS_buf !== X) && (RM_buf === 0)) begin 
    Invalid_next_cycle_func_tim;
   end
end 



//------------------------------------------------------------------------
//           Actions taken on timing violations ends 
//------------------------------------------------------------------------

//------------------------------------------------------------
//    Glitch generation on Output(s) in Timing Mode Starts
//------------------------------------------------------------

always @(Q_int)
begin
        for (i=0; i <= bits-1; i=i+1)
        begin
          if (Q_int_prev[i] !== Q_int[i])
          begin
            if (Q_int[i] !== 1'bx) Q_final[i] = 1'bx;
            Q_final[i] <= Q_int[i];
          end
          else 
          begin
            Q_final[i] <= Q_int[i];
          end            
          Q_int_prev[i] = Q_int[i];
        end

end

always @(SCTRLO_temp)
begin
        if (SCTRLO_prev !== SCTRLO_temp)
        begin
          if (SCTRLO_temp !== 1'bx) SCTRLO_final = 1'bx;
          SCTRLO_final <= SCTRLO_temp;
        end
        else 
        begin
          SCTRLO_final <= SCTRLO_temp;
        end
        SCTRLO_prev = SCTRLO_temp;
end

always @(SDLO_temp)
begin
        if (SDLO_prev !== SDLO_temp)
        begin
          if (SDLO_temp !== 1'bx) SDLO_final = 1'bx;
          SDLO_final <= SDLO_temp;
        end
        else 
        begin
          SDLO_final <= SDLO_temp;
        end
        SDLO_prev = SDLO_temp;
end



always @(SDRO_temp)
begin
        if (SDRO_prev !== SDRO_temp)
        begin
          if (SDRO_temp !== 1'bx) SDRO_final = 1'bx;
          SDRO_final <= SDRO_temp;
        end
        else 
        begin
          SDRO_final <= SDRO_temp;
        end
        SDRO_prev = SDRO_temp;
end

    



always @(SMLO_temp)
begin
        if (SMLO_prev !== SMLO_temp)
        begin
          if (SMLO_temp !== 1'bx) SMLO_final = 1'bx;
          SMLO_final <= SMLO_temp;
        end
        else 
        begin
          SMLO_final <= SMLO_temp;
        end
        SMLO_prev = SMLO_temp;
end
    
always @(SMRO_temp)
begin
        if (SMRO_prev !== SMRO_temp)
        begin
          if (SMRO_temp !== 1'bx) SMRO_final = 1'bx;
          SMRO_final <= SMRO_temp;
        end
        else 
        begin
          SMRO_final <= SMRO_temp;
        end
        SMRO_prev = SMRO_temp;
end
    






//------------------------------------------------------------
//    Glitch generation on Output(s) in Timing Mode Ends
//------------------------------------------------------------

//------------------------------------------------------------
//        Output Buffers for verilog timing model
//------------------------------------------------------------


buf (Q[0],Q_final[0]);

buf (Q[1],Q_final[1]);

buf (Q[2],Q_final[2]);

buf (Q[3],Q_final[3]);

buf (Q[4],Q_final[4]);

buf (Q[5],Q_final[5]);

buf (Q[6],Q_final[6]);

buf (Q[7],Q_final[7]);

buf (Q[8],Q_final[8]);

buf (Q[9],Q_final[9]);

buf (Q[10],Q_final[10]);

buf (Q[11],Q_final[11]);

buf (Q[12],Q_final[12]);

buf (Q[13],Q_final[13]);

buf (Q[14],Q_final[14]);

buf (Q[15],Q_final[15]);

buf (Q[16],Q_final[16]);

buf (Q[17],Q_final[17]);

buf (Q[18],Q_final[18]);

buf (Q[19],Q_final[19]);

buf (Q[20],Q_final[20]);

buf (Q[21],Q_final[21]);

buf (Q[22],Q_final[22]);

buf (Q[23],Q_final[23]);

buf (Q[24],Q_final[24]);

buf (Q[25],Q_final[25]);

buf (Q[26],Q_final[26]);

buf (Q[27],Q_final[27]);

buf (Q[28],Q_final[28]);

buf (Q[29],Q_final[29]);

buf (Q[30],Q_final[30]);

buf (Q[31],Q_final[31]);

buf (SCTRLO,SCTRLO_final);
buf (SDLO, SDLO_final);
buf (SDRO, SDRO_final);


buf (SMLO, SMLO_final);
buf (SMRO, SMRO_final);





`endif // ifdef functional

//--------------------------------------------------------------------
//                     TIMING WRAPPER ENDS
//--------------------------------------------------------------------

wire supply_ok;

`ifdef ST_MEM_POWER_SEQUENCING_OFF
  
  assign supply_ok = 1'b1;

`else
//--------------------------------------------------------------------
//                 POWER PINS FUNCTIONALITY STARTS
//--------------------------------------------------------------------
reg mem_blocked = 1'b0;
reg Proper_shutdown;

wire vddmp_int, vddsmp_int, vddma_int, vddmo_int, gndm_int, gndsm_int;
reg [63 : 0]  sleep_toggle_time, vddmp_toggle_time, vddsmp_toggle_time, vddma_toggle_time, vddmo_toggle_time; 
reg [63 : 0] t_ma_mo=0, t_mp_mo=0, t_mo_ma=0, t_mo_smp=0, t_mo_mp=0, t_sl_ma=0, t_sl_mp=0, t_smp_mp=0, t_mp_smp=0, t_sl_mo=0;
wire PSWSMALLMA_int,PSWSMALLMP_int,PSWLARGEMA_int,PSWLARGEMP_int;
wire vddmpi_int, vddmai_int;



//-----------------------------------------------------------------
//   Calculating the valid states for all power supplies starts
//   Example : 
//        -> For flip-well vddsm valid range is -1 to 0
//        -> For noflip-well vddsm valid range is 0 to 1
//-----------------------------------------------------------------

localparam
        p_ok = 1'b1,
        p_not_ok = 1'b0,
        unknown = 1'bx;

assign vddmp_int = vddm;
assign vddma_int = vddm;
assign vddmo_int = vddm; 
assign gndm_int  = (gndm == 1'b0) ? p_ok : p_not_ok;




assign PSWSMALLMA_int = 1'b0;
assign PSWSMALLMP_int = 1'b0; 
assign PSWLARGEMA_int = 1'b0;
assign PSWLARGEMP_int = 1'b0;

ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim SLEEP_MUX (vddmo_int,1'b0,SLEEP_buf,SLEEP_gated);

and (pswsmallma_int,SLEEP_gated,PSWSMALLMA_int);
and (pswlargema_int,SLEEP_gated,PSWLARGEMA_int);
not (pswsmallma_close, pswsmallma_int);
not (pswlargema_close, pswlargema_int);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim switch_pswsmallma (pswsmallma_close,vddma_int,vddmai_small);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim switch_pswlargema (pswlargema_close,vddma_int,vddmai_large);
ST_SPHD_LOVOLT_512x32m4_bTMl_WANDprim wand_vddmai (vddmai_int,vddmai_small,vddmai_large);

and (pswsmallmp_int,SLEEP_gated,PSWSMALLMP_int);
and (pswlargemp_int,SLEEP_gated,PSWLARGEMP_int);
not (pswsmallmp_close, pswsmallmp_int);
not (pswlargemp_close, pswlargemp_int);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim switch_pswsmallmp (pswsmallmp_close,vddmp_int,vddmpi_small);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim switch_pswlargemp (pswlargemp_close,vddmp_int,vddmpi_large);
ST_SPHD_LOVOLT_512x32m4_bTMl_WANDprim wand_vddmpi (vddmpi_int,vddmpi_small,vddmpi_large);


//-----------------------------------------------------------------
//   Calculating the valid states for all power supplies ends
//-----------------------------------------------------------------
reg pswsmallmp_stable=1'b1,pswlargema_stable=1'b1,pswlargemp_stable=1'b1,pswsmallma_stable=1'b1;
reg pswsmallmp_toggle=1'b0,pswlargema_toggle=1'b0,pswlargemp_toggle=1'b0,pswsmallma_toggle=1'b0;

assign supply_ok = (vddmo_int === p_ok && vddmpi_int === p_ok && vddmai_int === p_ok && gndm_int === p_ok)? 1'b1 : 1'b0;

//-----------------------------------------------------------------
//        Actions taken on Power supplies toggling starts
//-----------------------------------------------------------------

always @(SLEEP_gated or r_supply_trigger) begin
   if ($realtime > 0) begin	
	sleep_toggle_time = $realtobits($realtime);
	if (SLEEP_gated !== 1'b1 && vddmo_int === 1'b1)begin	
          if (pswsmallma_stable !== 1'b1 || pswsmallmp_stable !== 1'b1 || pswlargema_stable !== 1'b1 || pswlargemp_stable !== 1'b1 || PSWLARGEMA_int !== 1'b0 || PSWSMALLMA_int !== 1'b0 || PSWLARGEMP_int !== 1'b0 || PSWSMALLMP_int !== 1'b0)begin
            Block_Memory("SLEEP");
          end    
          if (power_pins_config !== `mono_rail)begin
            #`st_delay_seq_taa;  
            Proper_Shutdown_Checker;
              if (Proper_shutdown !== 1'b1 && supply_ok === 1'b0)Block_Memory("SLEEP");
          end
        end  
   end
end    

always @(vddmpi_int or r_supply_trigger) begin
   if ($realtime > 0) begin	
	vddmp_toggle_time = $realtobits($realtime);
        #`st_delay_seq_taa;
        Proper_Shutdown_Checker;
        if (Proper_shutdown !== 1'b1)begin
          if (power_pins_config === `dual_rail || power_pins_config === `mo_ma_tied)begin
            if (SLEEP_gated === 1'b1) begin
		if (vddmpi_int !== 1'b1) begin
		Corrupt_Periphery("vddm");
		Supply_timings_checker ("vddm",vddmpi_int, vddmp_toggle_time, sleep_toggle_time, vddmo_toggle_time, t_sl_mp, t_mo_mp);
                end
	    end
            else Block_Memory("vddm");
          end
          else if (power_pins_config === `mo_mp_tied)begin
	    if (SLEEP_gated === 1'b1 || (vddmo_int === 1'bx && (vddmai_int === 1'b0 || vddmai_int === 1'bz))) begin
		if (vddmpi_int !== 1'b1) begin
		Corrupt_Periphery("vddm");
		Supply_timings_checker ("vddm",vddmpi_int, vddmp_toggle_time, sleep_toggle_time, vddmo_toggle_time, t_sl_mp, t_mo_mp);
                end
	    end
            else Block_Memory("vddm");
          end 
          else begin    //monorail
            if (supply_ok !== 1'b1)begin
              Corrupt_Periphery("vddm");
            end
          end
        end  
   end 
end




always @(vddmai_int or r_supply_trigger) begin
   if ($realtime > 0) begin	
	vddma_toggle_time = $realtobits($realtime);
        #`st_delay_seq_taa;
        Proper_Shutdown_Checker;
	if (Proper_shutdown !== 1'b1)begin
          if (power_pins_config === `dual_rail || power_pins_config === `mo_mp_tied)begin
            if (SLEEP_gated === 1'b1) begin
		if (vddmai_int !== 1'b1) begin
                Corrupt_Array("vddm");
		Supply_timings_checker ("vddm",vddmai_int, vddma_toggle_time, sleep_toggle_time, vddmo_toggle_time, t_sl_ma, t_mo_ma);
                end
            end      
            else Block_Memory("vddm");
          end
          else if (power_pins_config === `mo_ma_tied)begin
	    if (SLEEP_gated === 1'b1 || (vddmo_int === 1'bx && (vddmpi_int === 1'b0 || vddmpi_int === 1'bz))) begin
		if (vddmai_int !== 1'b1) begin
		Corrupt_Array("vddm");
		Supply_timings_checker ("vddm",vddmai_int, vddma_toggle_time, sleep_toggle_time, vddmo_toggle_time, t_sl_ma, t_mo_ma);
                end
	    end
            else Block_Memory("vddm");
          end 
          else begin
            if (supply_ok !== 1'b1)begin
              Corrupt_Array("vddm");
            end
          end  
	end
   end
end




always @(gndm_int or r_supply_trigger) begin
   if ($realtime > 0) begin
        if (gndm_int !== p_ok) Block_Memory("gndm");	
   end     
end



always @ (Proper_shutdown)begin
  if (Proper_shutdown !== 1'b0)begin
    Corrupt_all("vddm");
    
  end   
end  

//------------- eswitch functionality starts ------------------//

always @(PSWSMALLMA_int or PSWLARGEMA_int or PSWSMALLMP_int or PSWLARGEMP_int)begin
  if ($realtime > 0) begin
    if (SLEEP_gated === 1'bx && vddmo_int !== 1'bx)begin
      Block_Memory("SLEEP");
    end
  end
end  

always @(pswsmallma_int)begin
  pswsmallma_toggle = 1'b1;
  pswsmallma_toggle <= 1'b0;
end  

always @(pswsmallma_toggle)begin
  if ($realtime > 0)begin
      if(pswsmallma_int !== 1'b0)pswsmallma_stable = 1'b0;
      if (pswsmallma_int !== 1'b1)fork: block_pswsmallma
        begin
          #(p_pswsmallma_settling_time);
          pswsmallma_stable = 1'b1;
          disable block_pswsmallma;
        end  
        @(pswsmallma_int)begin
          pswsmallma_stable = 1'b0;
          disable block_pswsmallma;
        end
      join
  end
end  

always @(pswlargema_int)begin
  pswlargema_toggle = 1'b1;
  pswlargema_toggle <= 1'b0;
end  

always @ (pswlargema_toggle)begin
  if ($realtime > 0)begin
      if(pswlargema_int !== 1'b0)pswlargema_stable = 1'b0;
      if (pswlargema_int !== 1'b1)begin
        if (pswsmallma_int !== 1'b1 && pswsmallma_stable === 1'b1)fork: block_pswlargema
        begin
          #(p_pswlargema_settling_time);
          pswlargema_stable = 1'b1;
          disable block_pswlargema;
        end  
        @(pswsmallma_int or pswlargema_int or pswsmallma_stable)begin
          pswlargema_stable = 1'b0;
          disable block_pswlargema;
        end  
        join
        else begin
            Block_Memory("PSWLARGEM");
        end      
      end  
  end
end  

always @(pswsmallmp_int)begin
  pswsmallmp_toggle = 1'b1;
  pswsmallmp_toggle <= 1'b0;
end  

always @(pswsmallmp_toggle)begin
  if ($realtime > 0)begin
      if(pswsmallmp_int !== 1'b0)pswsmallmp_stable = 1'b0;
      if (pswsmallmp_int !== 1'b1)fork: block_pswsmallmp
        begin
          #(p_pswsmallmp_settling_time);
          pswsmallmp_stable = 1'b1;
          disable block_pswsmallmp;
        end  
        @(pswsmallmp_int)begin
          pswsmallmp_stable = 1'b0;
          disable block_pswsmallmp;
        end
      join
  end
end  

always @(pswlargemp_int)begin
  pswlargemp_toggle = 1'b1;
  pswlargemp_toggle <= 1'b0;
end  

always @ (pswlargemp_toggle)begin
  if ($realtime > 0)begin
      if(pswlargemp_int !== 1'b0)pswlargemp_stable = 1'b0;
      if (pswlargemp_int !== 1'b1)begin
        if (pswsmallmp_int !== 1'b1 && pswsmallmp_stable === 1'b1)fork: block_pswlargemp
        begin
          #(p_pswlargemp_settling_time);
          pswlargemp_stable = 1'b1;
          disable block_pswlargemp;
        end  
        @(pswsmallmp_int or pswlargemp_int or pswsmallmp_stable)begin
          pswlargemp_stable = 1'b0;
          disable block_pswlargemp;
        end  
        join
        else begin
            Block_Memory("PSWLARGEM");
        end      
      end  
  end
end  

//---------------------- eswitch functionality ends -----------------------//


//-----------------------------------------------------------------
//          Actions taken on Power supplies toggling ends
//-----------------------------------------------------------------

task Proper_Shutdown_Checker;
begin
  if (vddmo_int === 1'b0 && (vddmai_int === 1'b0 || vddmai_int === 1'bz) && (vddmpi_int === 1'b0 || vddmpi_int === 1'bz))begin
    Proper_shutdown = 1'b1;
  end
  else if (vddmo_int === 1'bx && vddma_int === 1'bx && vddmp_int === 1'bx) begin
    Proper_shutdown = 1'bx;
  end
  else begin
    Proper_shutdown = 1'b0;
  end
end
endtask

task Supply_timings_checker;
input [1023 : 0] input_string;
input input1;
input [63 : 0] real_time;
input [63 : 0] shut_time, rampup_time;
input [63 : 0] t_off, t_on;
begin
        if (input1 === 1'b0) begin
		if ((real_time - $bitstoreal(shut_time)) <= $bitstoreal(t_off)) Block_Memory(input_string);
	end
	else if (input1 === 1'b1) begin
		if ((real_time - $bitstoreal(rampup_time)) <= $bitstoreal(t_on)) Block_Memory(input_string);
	end
end
endtask

task Corrupt_Periphery;
input [1023:0] input_string;
begin
        Corrupt_Q;
        Corrupt_all_scan_flops_scan_outs;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid Value/Sequence on %0s. Output Q and Scan flops corrupted", $realtime, input_string);
end
endtask

task Corrupt_Array;
input [1023:0] input_string;
begin
        Corrupt_Mem;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid Value/Sequence on %0s. Memory corrupted", $realtime, input_string);
end
endtask

task Corrupt_all;
input [1023:0] input_string;
begin
        Corrupt_Periphery(input_string);
        Corrupt_Array(input_string);
end
endtask

task Block_Memory;
input [1023:0] input_string;
begin
  `ifdef ST_MEM_NO_BLOCK_MEM
        Corrupt_Q;
        Corrupt_all_scan_flops_scan_outs;
        Corrupt_Mem;
        if ( (debug_level > 0) && ($realtime > message_control_time) ) $display ("%m - %t ST_ERROR : Invalid Value/Sequence on %0s. Memory Contents, Output Q and Scan flops corrupted", $realtime, input_string);
  `else 
      if ($realtime > mem_block_ctrl_time) begin
          force CK_buf = 1'bx;
          force IO.CK_rw = 1'bx;
          force IO.CK_bypass = 1'bx;
          force IO.CK_scff = 1'bx;
          force IO.CK_lock_up_latch = 1'bx;
          mem_blocked = 1'b1;
          if ( (debug_level > 0) && ($realtime > message_control_time) ) $display ("%m - %t ST_ERROR : Invalid Value/Sequence on %0s. Memory Contents, Output Q and Scan flops corrupted. All further operations on the Memory are Blocked", $realtime, input_string);
      end
      else begin
        Corrupt_Q;
        Corrupt_all_scan_flops_scan_outs;
        Corrupt_Mem;
        if ( (debug_level > 0) && ($realtime > message_control_time) ) $display ("%m - %t ST_ERROR : Invalid Value/Sequence on %0s. Memory Contents, Output Q and Scan flops corrupted", $realtime, input_string);
      end
  `endif
end
endtask

task UnBlock_Memory;
begin
  release CK_buf;
  release IO.CK_rw;
  release IO.CK_bypass;
  release IO.CK_scff;
  release IO.CK_lock_up_latch;
  mem_blocked = 1'b0;
  pswsmallma_stable = 1'b1;       
  pswlargema_stable = 1'b1;
  pswsmallmp_stable = 1'b1;
  pswlargemp_stable = 1'b1;

end
endtask

//--------------------------------------------------------------------
//                 POWER PINS FUNCTIONALITY ENDS
//--------------------------------------------------------------------
`endif

assign IO.supply_ok = supply_ok;

//--------------------------------------------------------------------
//              FAULT FILE HANDLING FUNCTIONALITY STARTS 
//--------------------------------------------------------------------
 
integer file_ptr, ret_val;
integer fault_word;
integer fault_bit;
integer fcnt, Fault_in_memory,faultnum,stop_loop,count;
integer t;  
integer FailureLocn [max_faults -1 :0];
integer Failurebit [max_faults -1 :0];
reg [100 : 0] stuck_at;
reg [100 : 0] fault_array;
reg [200 : 0] tempStr;
reg [7:0] fault_char;
reg [7:0] fault_char1; // 8 Bit File Pointer
reg [Addr -1 : 0] std_fault_word;
reg [Addr -1 : mux_bits] fault_row_add [max_faults -1 :0];
reg [max_faults -1 :0] fault_repair_flag;
reg [max_faults -1 :0] dont_insert_fault;
reg [max_faults -1 :0] repair_flag;
reg [100 : 0] array_stuck_at[max_faults -1 : 0] ;
reg [100 : 0] mem_red_array_stuck_at[max_faults -1 : 0] ; 
reg msgcnt;

reg [bits - 1: 0] stuck_at_0fault [max_faults -1 : 0];
reg [bits - 1: 0] stuck_at_1fault [max_faults -1 : 0];
reg [bits -1 : 0] stuck0;
reg [bits -1 : 0] stuck1;
reg [2047:0] reg_Fault_file_name;
reg reg_ConfigFault;
reg reg_MEM_INITIALIZE;
reg reg_BinaryInit;
reg [2047:0] reg_InitFileName;
time reg_File_load_time;

integer flag_error;





task task_insert_faults_in_memory;
reg [bits -1 : 0] slm_temp_data;
integer i;
begin
   if (reg_ConfigFault)
   begin   
     for(i = 0;i< fcnt;i = i+ 1) begin
        if(mem_red_array_stuck_at[i] === "mem_array") begin
          if (array_stuck_at[i] === "sa0") begin
           `ifdef ST_MEM_SLM
            //Read first
            $slm_ReadMemory(slm_handle, FailureLocn[i], slm_temp_data);
            //operation
            slm_temp_data = slm_temp_data & stuck_at_0fault[i];
            //write back
            $slm_WriteMemory(slm_handle, FailureLocn[i], slm_temp_data);
          `else
            Mem[FailureLocn[i]] = Mem[FailureLocn[i]] & stuck_at_0fault[i];
          `endif
         end //if(array_stuck_at)
                                        
         if(array_stuck_at[i] === "sa1") begin
         `ifdef ST_MEM_SLM
            //Read first
            $slm_ReadMemory(slm_handle, FailureLocn[i], slm_temp_data);
            //operation
            slm_temp_data = slm_temp_data | stuck_at_1fault[i];
            //write back
            $slm_WriteMemory(slm_handle, FailureLocn[i], slm_temp_data);
         `else
            Mem[FailureLocn[i]] = Mem[FailureLocn[i]] | stuck_at_1fault[i]; 
         `endif
         end //if(array_stuck_at)
       end //if mem_red_array_stuck_at
    
    
     end    // end of for
   end  
end
endtask



task task_read_fault_file;
integer i;
begin

/*  -----------Implemetation for config fault starts------*/
   msgcnt = X;
   t = 0;
   fault_repair_flag = {max_faults{1'b1}};
   repair_flag = {max_faults{1'b1}};
   if(reg_ConfigFault) 
   begin
      file_ptr = $fopen(reg_Fault_file_name , "r");
      if(file_ptr == 0)
      begin     
          if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Fault File cannot be opened ",$realtime);
      end        
      else                
      begin : read_fault_file
        t = 0;
        for (i = 0; i< max_faults; i= i + 1)
        begin
         
           stuck0 = {bits{1'b1}};
           stuck1 = {bits{1'b0}};
           fault_char1 = $fgetc (file_ptr);
           if (fault_char1 == 8'b11111111)
              disable read_fault_file;
           ret_val = $ungetc (fault_char1, file_ptr);
           ret_val = $fgets(tempStr, file_ptr);
           ret_val = $sscanf(tempStr, "%s %d %d %s",fault_array,fault_word, fault_bit, stuck_at) ;
           flag_error = 0; 
           if(ret_val !== 0)
           begin         
              if(ret_val == 3 || ret_val == 4)
              begin
                if(ret_val == 3)
                   stuck_at = "sa0";

                if(stuck_at !== "sa0" && stuck_at !== "sa1" && stuck_at !== "none")
                begin
                   if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Wrong value for stuck at in fault file ",$realtime);
                   flag_error = 1;
                end    
                      
                if(fault_word >= words)
                begin
                   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Address out of range in fault file ",$realtime);
                   flag_error = 1;
                end    

                if(fault_bit >= bits)
                begin  
                  if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Faulty bit out of range in fault file ",$realtime);
                  flag_error = 1;
                end    

                
                        
                if(fault_array !== "mem_array")
                begin
                  if( (debug_level > 1) && ($realtime > message_control_time)) $display("%m - %t ST_WARNING: Fault array is not mem_array ",$realtime);
                  flag_error = 1;
                end

                if(fault_array === "red_array")
                begin
                  if( (debug_level > 1) && ($realtime > message_control_time)) $display("%m - %t ST_WARNING: Fault array can't be on redundancy array in non redundancy cut.",$realtime);
                  flag_error = 1;
                end

                
                

                if(flag_error == 0)
                //Correct Inputs
                begin
                   if(stuck_at === "none")
                   begin
                       if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: No fault injected, empty fault file ",$realtime);
                   end
                   else
                   //Adding the faults
                   begin
                      FailureLocn[t] = fault_word;
                      Failurebit[t]  = fault_bit ;
                      std_fault_word = fault_word;
                      fault_row_add[t] = std_fault_word[Addr-1:mux_bits];
                      mem_red_array_stuck_at[t] = fault_array;
                      fault_repair_flag[t] = 1'b0;
                      if (stuck_at === "sa0" )
                      begin
                         stuck0[fault_bit] = 1'b0;         
                         stuck_at_0fault[t] = stuck0;
                      end     
                      if (stuck_at === "sa1" )
                      begin
                         stuck1[fault_bit] = 1'b1;
                         stuck_at_1fault[t] = stuck1; 
                      end

                      array_stuck_at[t] = stuck_at;
                      t = t + 1;
                   end //if(stuck_at === "none")  
                end //if(flag_error == 0)
              end //if(ret_val == 2 || ret_val == 3 
              else
              //wrong number of arguments
              begin
                if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: WRONG VALUES ENTERED FOR FAULTY WORD OR FAULTY BIT OR STUCK_AT IN Fault_file_name ",$realtime);
                flag_error = 1;
              end
           end //if(ret_val !== 0)
           else
           begin 
               if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: No fault injected, empty fault file ",$realtime);
           end    
        end //for (i = 0; i< m
      end //begin: read_fault_file  
      $fclose (file_ptr);

      fcnt = t;
      
      //fault injection at time 0.
      task_insert_faults_in_memory;
  end // config_fault 
end
endtask

//--------------------------------------------------------------------
//             FAULT FILE HANDLING FUNCTIONALITY ENDS
//--------------------------------------------------------------------

//--------------------------------------------------------------------
//                     DISPLAY MESSAGES STARTS
//--------------------------------------------------------------------

wire BYP_EN_scff_din;
reg lastCK_rw;
reg MEM_EN_reg, bypass_en_reg;
reg delay;

initial
begin
   
  `ifdef ST_MEM_SLM
     `ifdef functional 
          operating_mode = "SLM + FUNCTIONAL";
     `else 
          operating_mode = "SLM + TIMING";
     `endif     
  `elsif functional
     operating_mode = "FUNCTIONAL";
  `else
     operating_mode = "TIMING";
  `endif

   debug_level= p_debug_level;
  
  if (debug_level === 2'b00) begin
          message_status = "All Info/Warning/Error Messages are Switched OFF";
  end        
  else if (debug_level === 2'b11) begin
          message_status = "All Info/Warning/Error Messages are Switched ON";
  end        
  else if (debug_level === 2'b01) begin
          message_status = "Error messages are switched ON. Warning/Info Messages are Switched OFF";
  end        
  else begin
          message_status = "Error/Warning messages are switched ON. Info Messages are Switched OFF";
  end        
  
  $timeformat (-9, 6, " ns --", 10);  
  reg_Fault_file_name = Fault_file_name; 
  reg_MEM_INITIALIZE  = MEM_INITIALIZE;
  reg_ConfigFault     = ConfigFault;
  reg_BinaryInit      = BinaryInit;
  reg_InitFileName    = InitFileName;
  reg_File_load_time  = File_load_time;
  
  file_loaded = 1'b0;
  if (reg_MEM_INITIALIZE === 1'b1) begin
          file_loaded = 1'b1;
  end
  delay = 1'b0;
  `ifndef ST_MEM_POWER_SEQUENCING_OFF
    Proper_shutdown = 1'b0;
  `endif  
  
  gndm = 1'b0;
  
  
  
  vddm = 1'b1;
  
  
  
  r_supply_trigger <= 1'b1;
  
  initn_pulse_done = 1; 
  
  if (INITN_buf === 1'b0 && supply_ok === 1) begin 
        initn_pulse_done = 1;  
  end
  task_read_fault_file;
  
  // IMP : Please Dont add any other statements beyond this in initial block
  #0; // This #0 is important to avoid race at start of simulation
  lastCK = CK;
  last_CK_rw = CK_rw;
  lastCK_rw = CK_rw;
  
  #(message_control_time + `st_delay_seq_taa)
  if (debug_level > 2) begin
    $display ("%m - %t ST_INFO : ***************************************", $realtime);
    $display ("%m - %t ST_INFO : The Model is Operating in %s MODE", $realtime, operating_mode);
    if (operating_mode == "TIMING") $display ("%m - %t ST_INFO : Please ensure SDF is properly annotated otherwise dummy values will be used", $realtime);
    $display ("%m - %t ST_INFO : %s", $realtime, message_status);
    
    if(ConfigFault) $display ("%m - %t ST_INFO : Configurable Fault Functionality is ON", $realtime);   
    else  $display ("%m - %t ST_INFO : Configurable Fault Functionality is OFF", $realtime);   
    
    $display ("%m - %t ST_INFO : Fault File used by the model Fault_File_Name=%s", $realtime, Fault_file_name);
    $display ("%m - %t ST_INFO : Values of Config_fault used in model=%d", $realtime, ConfigFault);
    $display ("%m - %t ST_INFO : Values of Mem_INITALIZE used in model=%d", $realtime, MEM_INITIALIZE);
    $display ("%m - %t ST_INFO : Values of BinaryInit used in model=%d", $realtime, BinaryInit);
    $display ("%m - %t ST_INFO : Values of InitFileName used in model=%s", $realtime, InitFileName);
    $display ("%m - %t ST_INFO : Values of File_load_time used in model=%t", $realtime, File_load_time);  
    
    $display ("%m - %t ST_INFO : ***************************************", $realtime);
  end
  // BEWARE : There is a seq delay. DO NOT add any statements after this.
end


always @(IO.bypass_en) 
begin
   if (IO.bypass_en === 1'bx) begin
           if (SLEEP_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SLEEP pin. Output Q corrupted", $realtime);
           end
           if (STDBY_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on STDBY pin. Output Q corrupted", $realtime);
           end   
           if (INITN_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on INITN pin. Output Q corrupted", $realtime);
           end   
           if (ATP_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on ATP pin. Output Q corrupted", $realtime);
           end   
           if (TBYPASS_buf === 1'bx) begin
              if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TBYPASS pin. Output Q corrupted", $realtime);
           end   

   end               
end


always @(CK_rw) 
begin

   if (lastCK_rw === 1'b0 && CK_rw === 1'b1) begin
 
           if (WEN_bmux === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on WEN/TWEN pin. Memory and Output Q corrupted", $realtime);
           end  
           
           #0; // This is to ensure ValidAddress calculation in "rw" block
           if (ValidAddress === 1'bx) begin 
                   if (WEN_bmux === 1'b0) begin
                           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on A/TA pin. Memory corrupted", $realtime);
                   end
                   else begin
                           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on A/TA pin. Memory and Output Q corrupted", $realtime);
                   end
           end
           else if (ValidAddress === 1'b0) begin
                   if (WEN_bmux !== 1'b1) begin
                           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Address Out of Range. No Memory Operation", $realtime);
                   end
                   else begin
                           if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Address Out of Range. Output Q corrupted", $realtime);
                   end
           end        
   end
   
   else if (CK_rw === 1'bx) begin
         
           if (SLEEP_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SLEEP pin. Memory and Output Q corrupted", $realtime);
           end
           if (STDBY_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on STDBY pin. Memory and Output Q corrupted", $realtime);
           end
           if (INITN_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on INITN pin. Memory and Output Q corrupted", $realtime);
           end  
           if (ATP_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on ATP pin. Memory and Output Q corrupted", $realtime);
           end  
           if (SE_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SE pin. Memory and Output Q corrupted", $realtime);
           end  
           if (TBYPASS_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TBYPASS pin. Memory and Output Q corrupted", $realtime);
           end
           if (IG_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on IG pin. Memory and Output Q corrupted", $realtime);
           end  
           if (CSN_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on CSN pin. Memory and Output Q corrupted", $realtime);
           end
           if (TBIST_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TBIST pin. Memory and Output Q corrupted", $realtime);
           end  
           if (TBIST_buf === 1'b1 && TCSN_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TCSN pin. Memory and Output Q corrupted", $realtime);
           end  
           if (LS_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on LS pin. Memory and Output Q corrupted", $realtime);
           end
           if (HS_buf === 1'bx) begin 
                   if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on HS pin. Memory and Output Q corrupted", $realtime);
           end
   
   end

   lastCK_rw = CK_rw;

end

always @(CK_scff) begin
   if (CK_scff === 1'bx) begin
       if (CK === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on CK pin. All Scan Flops are corrupted", $realtime);
       end         
       if (SLEEP_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SLEEP pin. All Scan Flops are corrupted", $realtime);
       end         
       if (STDBY_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on STDBY pin. All Scan Flops are corrupted", $realtime);
       end         
       if (INITN_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on INITN pin. All Scan Flops are corrupted", $realtime);
       end         
       if (ATP_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on ATP pin. All Scan Flops are corrupted", $realtime);
       end         
       if (SE_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SE pin. All Scan Flops are corrupted", $realtime);
       end         
       if (TBYPASS_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on TBYPASS pin. All Scan Flops are corrupted", $realtime);
       end
       else if (IO.shift_en_inst === 1'b0 && TBYPASS_buf === 1'b1 && BYP_EN_scff_din === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on LP-FLOP pin. All Scan Flops are corrupted", $realtime);
       end         
   end
end

always @(CK_lock_up_latch) begin
   if (CK_lock_up_latch === 1'bx) begin
       if (CK === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on CK pin. All Scan Outs are corrupted", $realtime);
       end         
       if (SLEEP_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SLEEP pin. All Scan Outs are corrupted", $realtime);
       end         
       if (STDBY_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on STDBY pin. All Scan Outs are corrupted", $realtime);
       end         
       if (INITN_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on INITN pin. All Scan Outs are corrupted", $realtime);
       end         
       if (SE_buf === 1'bx) begin
                if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : Invalid value on SE pin. All Scan Outs are corrupted", $realtime);
       end         
   end
end

//----------------------------------------------------------------------
//                        DISPLAY MESSAGES ENDS
//----------------------------------------------------------------------

//--------------------------------------------------------------------------------
//               Features not supported in TMAX model - starts
//         
//         1) INITN pulse checking
//         2) GAC toggling during clock high period in scan shift mode
//         3) LS, HS functionality
//         4) RM, WM functionality
//         5) RTA, RTAE, RTABANK functionality
//         
//--------------------------------------------------------------------------------

assign LSint = LS_buf;
assign HSint = HS_buf;

assign DE_temp = (LSint === 1'bx || (HSint === 1'bx) || RM_buf !== 0 || WM_buf !== 0) ? 1'bx : 1'b0;
assign IO.DE_temp = DE_temp;

always @(INITN_buf)
begin
   if (INITN_buf === 1'b0 && supply_ok === 1'b1) begin
       `ifdef ST_MEM_INITN_OUTPUT_RESET
          Q_final <= 32'b0;
       `endif   
       initn_pulse_done = 1'b1;
       invalid_next_cycle_dft = 1'b0;
       invalid_next_cycle_func = 1'b0;
       release IO.cgc_CK_rw.CK_gated;
       release IO.cgc_CK_lkp_latch.CK_gated;
       release IO.cgc_CK_scff.CK_gated;
   end        
end

always @(supply_ok)
begin
 if (INITN_buf === 1'b0 && supply_ok === 1'b1) begin
     initn_pulse_done = 1'b1;
     invalid_next_cycle_dft = 1'b0;
     invalid_next_cycle_func = 1'b0;
     release IO.cgc_CK_rw.CK_gated;
     release IO.cgc_CK_lkp_latch.CK_gated;
     release IO.cgc_CK_scff.CK_gated;
 end   
end

assign IO.initn_pulse_done = initn_pulse_done;

always @(IO.GAC) begin
  
  if (IO.CK_lock_up_latch === 1'b1 && GAC_reg === 1'b1 && IO.GAC !== 1'b1) begin
	IO.cgc_CK_scff.CK_gated <= 1'bx;
	IO.cgc_CK_lkp_latch.CK_gated <= 1'bx;
        if ( (debug_level > 1) && ($realtime > message_control_time) ) $display ("%m - %t ST_WARNING : SLEEP / STDBY / INITN pin toggled during clock high time in scan shift mode. All Scan flops and Scan Outs Corrupted", $realtime);

  end

end



//--------------------------------------------------------------------------------
//               Features not supported in TMAX model - ends
//--------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------
//        Verilog Simulation Model : "rw" read/write functionality block starts 
//-----------------------------------------------------------------------------------

wire [bits-1 : 0] M_inv;
assign M_inv = ~M_bmux;

wire red_en = 0;
wire [repair_address_width-1 : 0] repair_add = 7'b0;
wire [repair_address_width-1 : 0] next_repair_add = 7'b0;
reg [mux_bits-1:0]Col_Add;
integer Col_Add_integer,Bank_sel_integer,RedMem_address;

always @(CK_rw)
begin
  if (last_CK_rw===1'b0 && CK_rw===1'b1) begin
     
    task_initialize_memory;
     
    if (^A_bmux === 1'bx) ValidAddress = 1'bx;
    else if (A_bmux < words) ValidAddress = 1'b1;
    else ValidAddress = 1'b0;

    repair_access = 0;
    
      
    if (ValidAddress === 1'bx) begin // Address 'X'
    	 WriteMemX;
       if (WEN_bmux !== 1'b0) Qtemp = WordX;
    end
    else begin // Address is valid	
            // Read Operation...
            if (WEN_bmux===1'b1)
            begin
              ReadCycle;
            end
            
            // Write Operation...
            else if (WEN_bmux===1'b0)
            begin
              `ifndef ST_MEM_SLM
                       Mem_prev = Mem[A_bmux];
              `endif
              WriteCycle;
            end

            else begin // WEN_bmux === 1'bx
              Qtemp = WordX;
              if (ValidAddress === 1'b1) begin
                Corrupt_Current_Location;
              end
            end
    end	 
  end // if (last_CK_rw===1'b0 && CK_rw=1'b1
  else if (CK_rw===1'bx) begin
    WriteMemX;
    Qtemp = WordX;
  end
  last_CK_rw = CK_rw;
  Qtemp <= WordZ;
end

task task_initialize_memory;
begin
     if (reg_MEM_INITIALIZE === 1'b1 && $realtime >= reg_File_load_time && file_loaded ) begin   
        `ifdef ST_MEM_SLM
          if (reg_BinaryInit)
             $slm_LoadMemory(slm_handle, reg_InitFileName, "VERILOG_BIN");
          else
             $slm_LoadMemory(slm_handle, reg_InitFileName, "VERILOG_HEX");
        `else
          if (reg_BinaryInit)
             $readmemb(reg_InitFileName, Mem, 0, words-1);
          else
             $readmemh(reg_InitFileName, Mem, 0, words-1);
        `endif
         file_loaded = 1'b0;
     end
end
endtask

task WriteCycle;                  
reg [bits-1:0] Mem_temp;
integer i;
begin
     `ifdef ST_MEM_SLM
          if (repair_access === 0) $slm_WriteMemory(slm_handle, A_bmux, D_bmux, M_inv);
     `else
          
          Mem_temp = {bits{1'bx}};
   
          // Reading the previous contents of memory
           
          if(repair_access === 0) Mem_temp = Mem[A_bmux];
          else if(repair_access === 1) Mem_temp = RedMem[RedMem_address];
          
          // Masking functionality
          for (i=0; i < bits; i=i+1) begin
            if (M_bmux[i] === 1'b0) Mem_temp[i]=D_bmux[i];
            else if (M_bmux[i] === 1'bx) begin
              if (Mem_temp[i] !== D_bmux[i]) Mem_temp[i]=1'bx;
              else Mem_temp[i] = D_bmux[i];
            end
          end // for (...
          
          //Finally writing into the memory address
          if(repair_access === 0 ) begin
             if (ValidAddress === 1'b1) begin
                Mem[A_bmux] = Mem_temp;
             end
          end        
          else if (repair_access === 1 )  RedMem[RedMem_address] = Mem_temp;
     `endif
     task_insert_faults_in_memory;     
end
endtask

task ReadCycle;
begin
     `ifdef ST_MEM_SLM
          if (repair_access === 0)  $slm_ReadMemory(slm_handle, A_bmux, Qtemp);
     `else
          if (repair_access === 0) begin
              if (ValidAddress === 1'b1) begin
                Qtemp = Mem[A_bmux];
              end
              else Qtemp = WordX;
          end    
          else if (repair_access === 1)  Qtemp = RedMem[RedMem_address];
     `endif
   
end
endtask

task WriteMemX;
integer i;
begin

`ifdef ST_MEM_SLM
  $slm_ResetMemory(slm_handle, WordX);
`else
  for (i = 0; i < words; i = i + 1) begin
     Mem[i] = WordX;
  end
  
  for (i = 0; i < RedWords; i = i + 1) begin
     RedMem[i] = WordX;
  end   

`endif
task_insert_faults_in_memory;     
end
endtask

task Corrupt_Current_Location;
begin
  `ifdef ST_MEM_SLM
     if (repair_access === 1'b0) $slm_WriteMemory(slm_handle, A_bmux, WordX);
  `else 
     if (repair_access === 1'b0) begin
       Mem[A_bmux] = WordX;
     end  
     else if (repair_access === 1'b1) begin
       RedMem[RedMem_address] = WordX;
     end    
  `endif
  task_insert_faults_in_memory;     
end
endtask

assign Q_CORE = Qtemp;

//-----------------------------------------------------------------------------------
//        Verilog Simulation Model : "rw" read/write functionality block ends 
//-----------------------------------------------------------------------------------


endmodule

`undef st_delay_seq_taa
`undef st_delay_seq_th
`undef st_msg_cntrl_time
`undef mono_rail
`undef mo_ma_tied
`undef mo_mp_tied
`undef dual_rail
`undef pswsmallma_settling_time
`undef pswlargema_settling_time
`undef pswsmallmp_settling_time
`undef pswlargemp_settling_time




//-------------------------------------------------------
//       module definition for INTERFACE
//-------------------------------------------------------


module ST_SPHD_LOVOLT_512x32m4_bTMl_INTERFACE (
// functional inputs
A,D,M,CSN,WEN,CK,SE,TBYPASS,IG,SLEEP,ATP,STDBY,INITN,

// BIST inputs
TBIST,TCSN,TA,TED,TOD,TEM,TOM,TWEN,



// bist mux outputs
A_bmux,D_bmux,M_bmux,WEN_bmux,CSN_scff_din,

// Test Enable signals for Scan flops
shift_en_inst,

// Clocks for Scan flops and "rw" block
CK_scff, CK_lock_up_latch, CK_rw,

// Data and Control Scan flops outputs
D_scff_out,BYP_ENint,

// Q Output from rw and omux blocks
Q_CORE, Q, MEM_EN_inst

);

    localparam max_address_bits = 11;
    localparam Addr = 9;
    localparam bits =32;
    localparam words = 512;
    localparam repair_address_width = 7;
    
    
    localparam mask_bits = 32; 
    

    output [bits-1 : 0] D_bmux;
    output [bits-1 : 0] Q;
    output [bits-1 : 0] M_bmux;
    output [Addr-1 : 0] A_bmux;
    output WEN_bmux, CSN_scff_din;
// CK_scff is the clock for Scan flops and "mp" block
    output CK_scff, CK_lock_up_latch;
// CK_rw is the clock for Read/Write (rw) block    
    output CK_rw, MEM_EN_inst; 

// Scan enable signal for the scan chain ----
    output shift_en_inst;



// --- functional inputs ----
    input SLEEP,ATP,STDBY,INITN;
    input IG,CK,SE;
    input TBYPASS;
    input [bits-1 : 0] D;
    
    input [mask_bits-1 :0] M; 
    
    input [Addr-1 : 0] A;
    
    input [Addr-1 : 0] TA;
    input TBIST,TWEN,TCSN,TED,TOD,TEM,TOM;
    input WEN,CSN;
//---- Output Q of the "mp" block -----
    input [bits-1 : 0] Q_CORE;

//---- 'Q' output of the scan flops -----
    

        input [bits-1 : 0] D_scff_out;
        input BYP_ENint;
    
    
    wire bypass_en_temp, SE_lat;
    reg pos_TBY=0;
    reg neg_SE_tby_high = 0;

    
    wire initn_pulse_done, DE_temp, supply_ok;
    




//Bist Mux Implementation

and (ATP_TBIST, ATP, TBIST);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim CSN_bistmux (ATP_TBIST, CSN, TCSN, CSN_bmux_temp);
buf (CSN_scff_din, CSN_bmux_temp);

ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim WEN_bistmux (ATP_TBIST, WEN, TWEN, WEN_bmux_temp);


assign CSN_bmux = ((ATP === 1'bx) || (ATP===1'b1 && SE === 1'bx)) ? 1'bx : CSN_bmux_temp;
assign WEN_bmux = ((ATP === 1'bx) || (ATP===1'b1 && SE === 1'bx)) ? 1'bx : WEN_bmux_temp;
assign TBYPASSint = (ATP === 1'bx && TBYPASS !== 1'b0) ? 1'bx : TBYPASS;
assign SEint = (ATP === 1'bx) ? 1'bx : SE;


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim addr_bistmux_0 (ATP_TBIST, A[0], TA[0], A_bmux[0]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim addr_bistmux_1 (ATP_TBIST, A[1], TA[1], A_bmux[1]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim addr_bistmux_2 (ATP_TBIST, A[2], TA[2], A_bmux[2]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim addr_bistmux_3 (ATP_TBIST, A[3], TA[3], A_bmux[3]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim addr_bistmux_4 (ATP_TBIST, A[4], TA[4], A_bmux[4]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim addr_bistmux_5 (ATP_TBIST, A[5], TA[5], A_bmux[5]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim addr_bistmux_6 (ATP_TBIST, A[6], TA[6], A_bmux[6]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim addr_bistmux_7 (ATP_TBIST, A[7], TA[7], A_bmux[7]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim addr_bistmux_8 (ATP_TBIST, A[8], TA[8], A_bmux[8]);

ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_0 (ATP_TBIST,D[0], TED, D_bmux[0]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_1 (ATP_TBIST,D[1], TOD, D_bmux[1]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_2 (ATP_TBIST,D[2], TED, D_bmux[2]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_3 (ATP_TBIST,D[3], TOD, D_bmux[3]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_4 (ATP_TBIST,D[4], TED, D_bmux[4]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_5 (ATP_TBIST,D[5], TOD, D_bmux[5]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_6 (ATP_TBIST,D[6], TED, D_bmux[6]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_7 (ATP_TBIST,D[7], TOD, D_bmux[7]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_8 (ATP_TBIST,D[8], TED, D_bmux[8]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_9 (ATP_TBIST,D[9], TOD, D_bmux[9]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_10 (ATP_TBIST,D[10], TED, D_bmux[10]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_11 (ATP_TBIST,D[11], TOD, D_bmux[11]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_12 (ATP_TBIST,D[12], TED, D_bmux[12]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_13 (ATP_TBIST,D[13], TOD, D_bmux[13]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_14 (ATP_TBIST,D[14], TED, D_bmux[14]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_15 (ATP_TBIST,D[15], TOD, D_bmux[15]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_16 (ATP_TBIST,D[16], TED, D_bmux[16]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_17 (ATP_TBIST,D[17], TOD, D_bmux[17]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_18 (ATP_TBIST,D[18], TED, D_bmux[18]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_19 (ATP_TBIST,D[19], TOD, D_bmux[19]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_20 (ATP_TBIST,D[20], TED, D_bmux[20]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_21 (ATP_TBIST,D[21], TOD, D_bmux[21]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_22 (ATP_TBIST,D[22], TED, D_bmux[22]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_23 (ATP_TBIST,D[23], TOD, D_bmux[23]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_24 (ATP_TBIST,D[24], TED, D_bmux[24]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_25 (ATP_TBIST,D[25], TOD, D_bmux[25]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_26 (ATP_TBIST,D[26], TED, D_bmux[26]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_27 (ATP_TBIST,D[27], TOD, D_bmux[27]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_28 (ATP_TBIST,D[28], TED, D_bmux[28]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_29 (ATP_TBIST,D[29], TOD, D_bmux[29]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_30 (ATP_TBIST,D[30], TED, D_bmux[30]);
ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim data_bistmux_31 (ATP_TBIST,D[31], TOD, D_bmux[31]);


  //Mask Bist Mux




ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_0 (ATP_TBIST , M[0], TEM, M_bmux[0]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_1 (ATP_TBIST , M[1], TOM, M_bmux[1]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_2 (ATP_TBIST , M[2], TEM, M_bmux[2]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_3 (ATP_TBIST , M[3], TOM, M_bmux[3]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_4 (ATP_TBIST , M[4], TEM, M_bmux[4]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_5 (ATP_TBIST , M[5], TOM, M_bmux[5]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_6 (ATP_TBIST , M[6], TEM, M_bmux[6]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_7 (ATP_TBIST , M[7], TOM, M_bmux[7]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_8 (ATP_TBIST , M[8], TEM, M_bmux[8]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_9 (ATP_TBIST , M[9], TOM, M_bmux[9]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_10 (ATP_TBIST , M[10], TEM, M_bmux[10]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_11 (ATP_TBIST , M[11], TOM, M_bmux[11]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_12 (ATP_TBIST , M[12], TEM, M_bmux[12]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_13 (ATP_TBIST , M[13], TOM, M_bmux[13]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_14 (ATP_TBIST , M[14], TEM, M_bmux[14]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_15 (ATP_TBIST , M[15], TOM, M_bmux[15]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_16 (ATP_TBIST , M[16], TEM, M_bmux[16]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_17 (ATP_TBIST , M[17], TOM, M_bmux[17]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_18 (ATP_TBIST , M[18], TEM, M_bmux[18]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_19 (ATP_TBIST , M[19], TOM, M_bmux[19]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_20 (ATP_TBIST , M[20], TEM, M_bmux[20]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_21 (ATP_TBIST , M[21], TOM, M_bmux[21]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_22 (ATP_TBIST , M[22], TEM, M_bmux[22]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_23 (ATP_TBIST , M[23], TOM, M_bmux[23]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_24 (ATP_TBIST , M[24], TEM, M_bmux[24]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_25 (ATP_TBIST , M[25], TOM, M_bmux[25]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_26 (ATP_TBIST , M[26], TEM, M_bmux[26]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_27 (ATP_TBIST , M[27], TOM, M_bmux[27]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_28 (ATP_TBIST , M[28], TEM, M_bmux[28]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_29 (ATP_TBIST , M[29], TOM, M_bmux[29]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_30 (ATP_TBIST , M[30], TEM, M_bmux[30]);
 


ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim M_after_bmux_31 (ATP_TBIST , M[31], TOM, M_bmux[31]);
  


// ----------------------------------------
// ------- Clock generation start ---------
// ----------------------------------------

and (GAC, INITN, initn_pulse_done, !STDBY, !SLEEP, supply_ok);

// Shift Enable calculation
and (shift_en_inst,SEint, ATP, GAC);

// Capture Enable calculation
and (capt_byp_en_inst, TBYPASSint, !BYP_ENint, !SEint, ATP, GAC);
and (capt_func_en_inst, !TBYPASSint, !SEint, ATP, GAC);

or (shift_or_capt_inst, shift_en_inst, capt_func_en_inst, capt_byp_en_inst);

// Clock Gating Logic
ST_SPHD_LOVOLT_512x32m4_bTMl_CGCprim cgc_CK_scff (.EN(shift_or_capt_inst), .CK(CK), .CK_gated(CK_scff));

// Clock for lock-up-latch at the end of scan chains... (scan shift mode)
ST_SPHD_LOVOLT_512x32m4_bTMl_CGCprim cgc_CK_lkp_latch (.EN(shift_en_inst), .CK(CK), .CK_gated(CK_lock_up_latch));

// ----- Memory enable signal

and (MEM_EN_inst_atp1, GAC, ATP, !SEint, !TBYPASSint, !IG, !CSN_bmux, !DE_temp);
and (MEM_EN_inst_atp0, GAC, !ATP, !IG, !CSN, !DE_temp);
or (MEM_EN_inst, MEM_EN_inst_atp1, MEM_EN_inst_atp0);

// ----- Clock generation for "rw" block
ST_SPHD_LOVOLT_512x32m4_bTMl_CGCprim cgc_CK_rw (.EN(MEM_EN_inst), .CK(CK), .CK_gated(CK_rw));



// -----------------------------------
// ----- Clock generation ends -------
// -----------------------------------

// Inputs to OMUX : Output Q Enable Signal Calculations

// ----- Mem Enable signal -----
ST_SPHD_LOVOLT_512x32m4_bTMl_DFFprim_blocking dff_mem_en (1'b0, bypass_en, CK_rw, MEM_EN_inst, MEMEN_reg_temp);
and (MEMEN_reg, MEMEN_reg_temp, !bypass_en); // To Avoid 'Z' violations


// ---- bypass enable signal -----
ST_SPHD_LOVOLT_512x32m4_bTMl_DLATprim dlat_se (1'b0, 1'b0, !CK, SEint, SE_lat);


and (capt_byp_en_inst, GAC, ATP, !SEint, TBYPASSint, !BYP_ENint);
ST_SPHD_LOVOLT_512x32m4_bTMl_CGCprim cgc_CK_bypass (.EN(capt_byp_en_inst), .CK(CK), .CK_gated(CK_bypass));

and (TBYP_rise, TBYPASSint, ATP, GAC);

always @(CK_bypass) begin
  if (CK_bypass === 1'b1) begin
    pos_TBY = 1'b0;
    neg_SE_tby_high = 1'b0;
  end
end

always @(TBYP_rise) begin
    if (TBYP_rise !== 1'b0 && (SEint !== 1'b1 || SE_lat === 1'bx)) begin
          pos_TBY = 1'bx;
    end
    else begin
          pos_TBY = 1'b0;
    end
    neg_SE_tby_high = 1'b0;
end

reg last_SElat;
initial begin
    // This #0 is important to avoid race at start of simulation
   #0 last_SElat = SE_lat;
end

always @(SE_lat) begin
  if (last_SElat === 1'b1 && SE_lat === 1'b0 && TBYP_rise === 1'b1) neg_SE_tby_high = 1'b1;
  else if (last_SElat === 1'b1 && SE_lat === 1'b0 && TBYP_rise === 1'bx) neg_SE_tby_high = 1'bx;
  else if (SE_lat === 1'bx && TBYP_rise !== 1'b0) neg_SE_tby_high = 1'bx;
  else begin
	neg_SE_tby_high = 1'b0;
	pos_TBY = 1'b0;
  end
  last_SElat = SE_lat;
end
or (bypass_en_temp, neg_SE_tby_high, pos_TBY);
or (bypass_en, CK_bypass, bypass_en_temp);



/*-------------------------------------------------------------------
        Output MUX : Paths on Output 'Q'
           1) Memory Read path : From "rw" block - Q_CORE
           2) BYPASS path      : From data scff  - D_scff_out
--------------------------------------------------------------------*/
ST_SPHD_LOVOLT_512x32m4_bTMl_outputmux omux (.Q(Q), .D_scff_out(D_scff_out), .bypass_en(bypass_en), .Q_CORE(Q_CORE), .MEMEN_reg(MEMEN_reg));



endmodule

/*-------------------------------------------------------
        module definition for Output MUX block
--------------------------------------------------------*/

module ST_SPHD_LOVOLT_512x32m4_bTMl_outputmux ( Q, D_scff_out, bypass_en, Q_CORE, MEMEN_reg);

localparam bits = 32;

input   MEMEN_reg;
input [bits-1:0] Q_CORE;

        input bypass_en;
        input [bits-1 : 0] D_scff_out;


output [bits-1:0] Q;
trireg (medium) [bits-1:0] Q;

ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_0 (MEMEN_reg, Q_CORE[0], Q[0]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_1 (MEMEN_reg, Q_CORE[1], Q[1]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_2 (MEMEN_reg, Q_CORE[2], Q[2]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_3 (MEMEN_reg, Q_CORE[3], Q[3]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_4 (MEMEN_reg, Q_CORE[4], Q[4]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_5 (MEMEN_reg, Q_CORE[5], Q[5]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_6 (MEMEN_reg, Q_CORE[6], Q[6]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_7 (MEMEN_reg, Q_CORE[7], Q[7]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_8 (MEMEN_reg, Q_CORE[8], Q[8]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_9 (MEMEN_reg, Q_CORE[9], Q[9]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_10 (MEMEN_reg, Q_CORE[10], Q[10]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_11 (MEMEN_reg, Q_CORE[11], Q[11]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_12 (MEMEN_reg, Q_CORE[12], Q[12]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_13 (MEMEN_reg, Q_CORE[13], Q[13]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_14 (MEMEN_reg, Q_CORE[14], Q[14]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_15 (MEMEN_reg, Q_CORE[15], Q[15]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_16 (MEMEN_reg, Q_CORE[16], Q[16]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_17 (MEMEN_reg, Q_CORE[17], Q[17]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_18 (MEMEN_reg, Q_CORE[18], Q[18]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_19 (MEMEN_reg, Q_CORE[19], Q[19]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_20 (MEMEN_reg, Q_CORE[20], Q[20]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_21 (MEMEN_reg, Q_CORE[21], Q[21]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_22 (MEMEN_reg, Q_CORE[22], Q[22]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_23 (MEMEN_reg, Q_CORE[23], Q[23]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_24 (MEMEN_reg, Q_CORE[24], Q[24]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_25 (MEMEN_reg, Q_CORE[25], Q[25]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_26 (MEMEN_reg, Q_CORE[26], Q[26]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_27 (MEMEN_reg, Q_CORE[27], Q[27]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_28 (MEMEN_reg, Q_CORE[28], Q[28]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_29 (MEMEN_reg, Q_CORE[29], Q[29]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_30 (MEMEN_reg, Q_CORE[30], Q[30]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim memory_path_31 (MEMEN_reg, Q_CORE[31], Q[31]);

ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_0 (bypass_en, D_scff_out[0], Q[0]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_1 (bypass_en, D_scff_out[1], Q[1]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_2 (bypass_en, D_scff_out[2], Q[2]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_3 (bypass_en, D_scff_out[3], Q[3]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_4 (bypass_en, D_scff_out[4], Q[4]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_5 (bypass_en, D_scff_out[5], Q[5]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_6 (bypass_en, D_scff_out[6], Q[6]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_7 (bypass_en, D_scff_out[7], Q[7]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_8 (bypass_en, D_scff_out[8], Q[8]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_9 (bypass_en, D_scff_out[9], Q[9]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_10 (bypass_en, D_scff_out[10], Q[10]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_11 (bypass_en, D_scff_out[11], Q[11]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_12 (bypass_en, D_scff_out[12], Q[12]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_13 (bypass_en, D_scff_out[13], Q[13]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_14 (bypass_en, D_scff_out[14], Q[14]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_15 (bypass_en, D_scff_out[15], Q[15]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_16 (bypass_en, D_scff_out[16], Q[16]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_17 (bypass_en, D_scff_out[17], Q[17]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_18 (bypass_en, D_scff_out[18], Q[18]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_19 (bypass_en, D_scff_out[19], Q[19]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_20 (bypass_en, D_scff_out[20], Q[20]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_21 (bypass_en, D_scff_out[21], Q[21]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_22 (bypass_en, D_scff_out[22], Q[22]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_23 (bypass_en, D_scff_out[23], Q[23]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_24 (bypass_en, D_scff_out[24], Q[24]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_25 (bypass_en, D_scff_out[25], Q[25]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_26 (bypass_en, D_scff_out[26], Q[26]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_27 (bypass_en, D_scff_out[27], Q[27]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_28 (bypass_en, D_scff_out[28], Q[28]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_29 (bypass_en, D_scff_out[29], Q[29]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_30 (bypass_en, D_scff_out[30], Q[30]);
ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim bypass_path_31 (bypass_en, D_scff_out[31], Q[31]);

endmodule











module ST_SPHD_LOVOLT_512x32m4_bTMl_WANDprim (out,in1,in2);
input in1,in2;
output out;

assign out = (in1 === 1'b0 || in2 === 1'b0) ? 1'b0 : (in1 === 1'b1 && in2 === 1'b1) ? 1'b1 : (in1 === 1'bz && in2 === 1'bz) ? 1'b0 : 1'bx;
endmodule


module ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim (SEL, A, B, Z);
input SEL, A, B;
output Z;

assign Z = (SEL === 1'b0) ? A : (SEL === 1'b1) ? B : 1'bx;

endmodule



module ST_SPHD_LOVOLT_512x32m4_bTMl_CGCprim (EN, CK, CK_gated);
input EN, CK;
output reg CK_gated;
reg last_CK;

initial begin
  // This #0 is important to avoid race at start of simulation
  #0 last_CK = CK;
end        

  always @(CK or EN) begin

     if (CK === 1'b0) begin
       CK_gated = CK;
     end
     else if (last_CK === 1'b0 && CK === 1'b1) begin
       CK_gated = EN;
     end
     else if (CK === 1'bx) begin
       if (EN !== 1'b0) CK_gated = 1'bx;
       else CK_gated = 1'b0;
     end  
     last_CK = CK;
  end

endmodule

module ST_SPHD_LOVOLT_512x32m4_bTMl_lock_up_latch (CK, D, Q);
input CK,D;
output Q;

ST_SPHD_LOVOLT_512x32m4_bTMl_DLATprim dlat_lockup (1'b0, 1'b0, CK, D, Q);

endmodule

module ST_SPHD_LOVOLT_512x32m4_bTMl_SCFF (D,TI,TE,CP,Q);
input D,TI,TE,CP;
output Q;

ST_SPHD_LOVOLT_512x32m4_bTMl_MUXprim mux_in_scff (TE, D, TI, temp);
ST_SPHD_LOVOLT_512x32m4_bTMl_DFFprim dff_in_scff (1'b0, 1'b0, CP, temp, Q);

endmodule

module ST_SPHD_LOVOLT_512x32m4_bTMl_DFFprim (SET,CLR,CK,D,Q);
output reg Q;
input D,SET,CLR,CK;
reg Qtemp, last_CK;

        initial begin
         // This #0 is important to avoid race at start of simulation
        #0 last_CK = CK;
        end

        always @ (SET or CLR or CK) begin
          
          if (SET === 1'b1 && CLR === 1'b0) Q = 1'b1;  // Output is SET
          else if (SET === 1'b1 && CLR !== 1'b0) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (SET === 1'b0 && CLR === 1'b1) Q = 1'b0; // Output is RESET
          else if (SET !== 1'b0 && CLR === 1'b1) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (last_CK === 1'b0 && CK === 1'b1) Q <= D;  
          else if (CK === 1'bx) Q <= 1'bx;
          
          last_CK = CK;
        end   

endmodule

module ST_SPHD_LOVOLT_512x32m4_bTMl_DFFprim_blocking (SET,CLR,CK,D,Q);
output reg Q;
input D,SET,CLR,CK;
reg last_CK;

        initial begin
         // This #0 is important to avoid race at start of simulation
        #0 last_CK = CK;
        end

        always @ (SET or CLR or CK) begin
          
          if (SET === 1'b1 && CLR === 1'b0) Q = 1'b1;  // Output is SET
          else if (SET === 1'b1 && CLR !== 1'b0) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (SET === 1'b0 && CLR === 1'b1) Q = 1'b0; // Output is RESET
          else if (SET !== 1'b0 && CLR === 1'b1) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (last_CK === 1'b0 && CK === 1'b1) Q = D;  
          else if (CK === 1'bx) Q = 1'bx;
          
          last_CK = CK;
        end  

endmodule

module ST_SPHD_LOVOLT_512x32m4_bTMl_DLATprim (SET,CLR,CK,D,Q);
output reg Q;
input D,SET,CLR,CK;
reg Qprev;

        always @ (SET or CLR or CK or D) begin
          
          if (SET === 1'b1 && CLR === 1'b0) Q = 1'b1;  // Output is SET
          else if (SET === 1'b1 && CLR !== 1'b0) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (SET === 1'b0 && CLR === 1'b1) Q = 1'b0; // Output is RESET
          else if (SET !== 1'b0 && CLR === 1'b1) Q = 1'bx; // Race bet SET and CLR. Q = X
          else if (CK === 1'b1) Q = D;  // Latch Transparant
          else if (CK === 1'bx) Q = 1'bx;
        
          Qprev = Q; // Storing the previous value of Q
        
        end

endmodule

module ST_SPHD_LOVOLT_512x32m4_bTMl_SWprim (control,in,out);
output out;
input control,in;

assign out = (control === 1'b1) ? in : 
             (control === 1'b0) ? 1'bz :
             1'bx;
endmodule


`endcelldefine



