//  
//  
//  ------------------------------------------------------------
//    STMicroelectronics N.V. 2014
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
//    User           : antonio pullini-ext     
//    Project        : ULPSOC                  
//    Division       : Not known               
//    Creation date  : 17 October 2014         
//    Generator mode : MemConfMAT10/distributed
//    
//    WebGen configuration               : C28SOI_MEM_ROM_LOLEAK:765,7:MemConfMAT10/distributed:1.1-00
//  
//    HDL C32_ST_SP_ROM Compiler version : 1.1.a@20140110.0 at Jan-10-2014 (PTBL date)                 
//    
//  
//  For more information about the cuts or the generation environment, please
//  refer to files uk.env and ugnGuiSetupDB in directory DESIGN_DATA.
//   
//  
//  





/****************************************************************
--  Description         :  Verilog Model 
--  ModelVersion        : 1.1.a
--  Date                : Jan, 2014
--  Changes Made by	: PS
--  Modifications in this release : Bug Fix : Compilation Error in Allpins model
--
****************************************************************/

/******************** START OF HEADER****************************
   This Header Gives Information about the parameters & options present in the Model
   
   words = 1024
   bits  = 64
   mux   = 32 
   
   
   margin_control = yes 
   
   
   
   
   Scan = Yes
   
   
   Bist Mux = Yes
   
  
    ------------------------------------------------------------------------------------
     Signal Name             | Description       |             Port Mode        | Active When
                             |                   |          r    |  w   | rw    |
   ------------------------------------------------------------------------------------

    
    IG    Input Gate Enable           x      x      na       High     
    ATP            ATPG Enable                 x      x      na       High     
    INITN                 INITN pin                   x      x      na       Low
    
    LS             Low Speed pin               x      x      na       High 
    Q 	        Data out	            x      na     na       -
    A              Address                     x      x      na       high and low
    
    CK                Clock	                    x      x      na       posedge
    CSN          Chip Enable                 x      x      na       low
    
    RM         Read Margins                 x      x      na       High 
    SCTRLI         Scan Input (Control)
    SCTRLO        Scan Output (Control)
    SE          Scan Enable pin 
    STDBY              Standby pin                 x      x      na       High
    
     
    TBIST          Bist Enable Pin 
    TA         Bist Read Address
    TCSN     Bist Read Chip Select

**********************END OF HEADER ******************************/
`celldefine
`ifdef ST_TIMESCALE
  `ST_TIMESCALE
`else
  `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif


`ifdef ST_DELAY_SEQ
  `define access_time  `ST_DELAY_SEQ
`else
 `define access_time 0.001
`endif

`ifdef ST_MEM_RETAIN_TIME
 `define retain_time `ST_MEM_RETAIN_TIME
 `else
  `define retain_time 0.001
`endif

`ifdef ST_MSG_CONTROL_TIME
      `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
      `define st_msg_cntrl_time 0
`endif      


//********************************************//
// ST_ROM_LOLEAK_1024x64m32B2_TMl model for  Verilog //
//********************************************//




module ST_ROM_LOLEAK_1024x64m32B2_TMl (A,ATP,CK,CSN,IG,INITN ,LS  ,Q ,RM  ,SCTRLI,SCTRLO,SE, STDBY  ,TA,TBIST   ,TCSN  ); 

parameter 
     `ifdef ST_NO_MSG_MODE
      p_debug_level = 2'b00,
     `elsif ST_ALL_MSG_MODE
      p_debug_level = 2'b11,
     `elsif ST_ERROR_ONLY_MODE
      p_debug_level = 2'b01,
     `else 
      p_debug_level = 2'b10,
     `endif
    
    
        Fault_file_name = "ST_ROM_LOLEAK_1024x64m32B2_TMl_faults.txt",
        `ifdef ST_MEM_CONFIGFAULT
        ConfigFault = 1,
        `else
        ConfigFault = 0,
        `endif
        max_faults = 1024+2,
         
        BinaryInit = 0,  
        InitFileName = "boot/boot_code.cde",
        message_control_time = `st_msg_cntrl_time,
        File_load_time=0,
        Initn_reset_value={64{1'b0}},
        InstancePath = "ST_ROM_LOLEAK_1024x64m32B2_TMl";
    
    localparam
        Words = 1024,
        Bits = 64,
        Addr = 10,
        mux = 32,

        bank = 2, 
        Red_extrabit=0,

        mux_bits=5,
        Rows = Words/mux;
    localparam 
        
           scanchains=3,    
        
        scanlen_ctrl=18,  
        

        
        scanlen_r=(Bits)/2,
        
        scanlen_l=(Bits+1)/2 ; 


    localparam
        read_margin_size = 3,
        write_margin_size = 2;
   
    localparam
        WordX = {Bits{1'bx}},
        AddrX = {Addr{1'bx}},
        Word0 = {Bits{1'b0}},
        X = 1'bx;
    

 //  INPUT OUTPUT PORTS DECLARATION DONE SEPARATELY FOR SPREG and ROM
 // ========================
        output [Bits-1 : 0] Q;
         
        output SCTRLO;
        input SE,SCTRLI;
        
        input [Addr-1 : 0] A;
        
        input [read_margin_size-1 : 0] RM;
        
         
        input CK,CSN,INITN,IG,ATP; 
        
        input LS; 
        
        input [Addr-1 :0 ] TA;
input TBIST,TCSN ;
        
        input STDBY;
        
        
        

        

//  WIRE DECLARATION RELATED TO POWER PINS
//  ======================================
	
        wire supply_ok;
        
        wire core_supply_ok;
        wire peri_supply_ok;
        wire gndmint, gndsmint;
        
        wire vddmint,vddsmint; 
        wire vddmoint;
        
        
//  WIRE DECLARATION 
//  ==================
        wire [Bits-1 : 0] CSWEMTBYPASS;
        wire [Bits-1 : 0] Dint,Mint;
        wire [Bits-1 : 0] Dsys,Msys;
	wire [Addr-1 : 0] Aint;
        wire [Addr-1 : 0] Asys;
        
        
	wire [14 : 0] Aint_capt;   
	wire CKint_dft;
	wire CKint_func;
	wire CSNint;
        wire MEMEN;
        wire cond_sdf_trms;
        wire cond_sdf_tlss; 
        wire MEMEN_dft;
        wire cond_sdf_tses;
        wire TSE;

	wire WENint;
	wire WENsys;
        wire SLEEPint;
        wire STDBYint;
        wire cond_sdf_tinitns;
        wire SEint;
        wire SEsys;
        wire SCTRLIint;
        wire SDLIint;
        wire SDRIint;
        
        wire INITNint;
        wire TBYPASSint;
        wire TBYPASSsys;
        wire LSint; 
        wire HSint; 
        wire ATPint;
        wire DEint;
        wire [Addr-1 : 0] TAint;
        wire TBISTint;
        wire TBISTsys;
        wire TCSNint;
        wire TEDint;
        wire TODint;
        wire TEMint;
        wire TOMint;
        wire [Bits-1 : 0] TMint;
        wire [Bits-1 : 0] TDint;
        wire TWENint;
        wire IGint;
        wire IGbuf;
        wire CSNbuf;
        wire WENbuf;
        wire [read_margin_size-1:0] RMint;
        wire [write_margin_size-1:0] WMint;

        //Wires for scan chains
        //  ====================     
        wire [scanlen_ctrl -1:0]scanreg_ctrl_wire;
        wire [scanlen_l -1:0]  scanreg_dl_wire; 
        wire [scanlen_r -1:0]  scanreg_dr_wire; 
   
        wire [scanlen_l -1:0]  scanreg_ml_wire; 
        wire [scanlen_r -1:0]  scanreg_mr_wire; 

//  REG DECLARATION
//  ====================     
        reg MEMEN_reg;
        reg MEMEN_prev;
        reg reg_mem_block;
        reg flag_mem_block;
        reg SCTRLIint_temp;
        reg SDLIint_temp;
        reg SDRIint_temp;
        reg SMLIint_temp;
        reg SMRIint_temp;

        //  REG DECLARATION
        //  ====================
        reg SCTRLOint;
        
        reg next_cycle_corrupt_func;
        reg next_cycle_corrupt_dft;
        reg [Bits-1 : 0] delOutReg_data;//delayed Output Register
        reg [Bits-1 : 0] OutReg_data;   // Data Output register
        reg [Bits-1 : 0] OutReg_data_tbypass;   // Data Output register
        reg [Bits-1 : 0] OutReg_data_scan;   // Data Output registe
        reg [Bits-1 : 0] OutReg_rado_retained;   // register for retaining rado data when SLEEP --> 1
        reg delSCTRLO_data,SCTRLO_data;      // delayed Output Register
        reg delSDLO_data,SDLO_data;      // delayed Output Register
        reg delSDRO_data,SDRO_data;      // delayed Output Register
        
        
        // SCAN CHAINS register
        reg [scanlen_ctrl -1:0] scanreg_ctrl; 
        reg [scanlen_l -1:0]  scanreg_dl; 
        reg [scanlen_r -1:0]  scanreg_dr; 
  
        
        
        reg lastCK_dft,CKreg_dft;
        reg lastCK_func,CKreg_func;
        reg lastSLEEP;
        reg lastPSWLARGEMP,lastPSWLARGEMA,lastPSWSMALLMP,lastPSWSMALLMA;
        reg CSNreg;
        reg init_pulse_done; //if == 1 then it implies that initb low pulse has been applied
        reg power_up_done; //if == 1 then it implies that power up has been done

        `ifdef ST_MEM_SLM
        `else
        reg [Bits-1 : 0] Mem [Words-1 : 0];       // RAM array
        `endif
        reg [Bits-1 :0] Mem_temp; 
        reg [Bits-1 :0] Mem_slm; 
	reg ValidAddress;
	reg ValidDebugCode;
        reg decoding_start;
        reg file_loaded;
        reg [Bits-1 :0] Dreg;
        reg [Bits-1 :0] Mreg;
        reg WENreg;
        reg [Addr-1 :0] Areg;
        reg SE_reg;
        reg TBYPASS_reg;
        reg INITNreg;
        reg IGreg;
        reg DEreg;
        reg SLEEPreg;
        reg STDBYreg;
        reg ATPreg;
        reg MEMEN_dft_reg;
        reg MEMEN_dft_prev;

        //parameter registers
        reg [2047:0] reg_Fault_file_name;
        reg reg_ConfigFault;
        reg reg_BinaryInit;
        reg [2047:0] reg_InitFileName;
        reg [Bits -1 :0] reg_Initn_reset_value;
        time reg_File_load_time;

        //Power Supply Registers        
        reg vddmireg;
        reg vddmoreg;
        reg vddmreg;
        reg vddsmreg;
        reg gndmreg;
        reg gndsmreg;        

  /* This register is used to force all warning messages 
  ** OFF during run time.
  ** It is a 2 bit register.
  ** USAGE :
  ** debug_level_off = 2'b11 -> ALL MESSAGES(ST_INFO/ST_WARNINGS/ST_ERRORS) will be DISPLAYED 
  ** debug_level = 2'b10     -> ONLY ST_WARNINGS/ST_ERRORS WILL BE DISPLAYED.
  ** debug_level = 2'b01     -> ONLY ST_ERRORS WILL BE DISPLAYED.
  ** debug_level = 2'b00     -> NO MESSAGES will be DISPLAYED.
  */ 
        reg [1:0] debug_level;
        reg [8*10: 0] operating_mode;
        reg [8*44: 0] message_status;

        integer i, k, j, l,m,q,w,r,s,num1,redcnt,n,num2,FirstHalf,Bfaileff,memcnt,ptr;
        integer decoder[Bits-1:0];
        `ifdef ST_MEM_SLM
           integer slm_handle;
        `endif


        //************************************************************
        //****** CONFIG FAULT IMPLEMENTATION VARIABLES*************** 
        //************************************************************ 

        integer file_ptr, ret_val;
        integer fault_word;
        integer fault_bit;
        integer fcnt, Fault_in_memory,faultnum,stop_loop,count;
        integer t;  
        integer FailureLocn [max_faults -1 :0];
        integer Failurebit [max_faults -1 :0];
        reg [100 : 0] stuck_at;
        reg [200 : 0] tempStr;
        reg [7:0] fault_char;
        reg [7:0] fault_char1; // 8 Bit File Pointer
        reg [Addr -1 : 0] std_fault_word;
        reg [max_faults -1 :0] fault_repair_flag;
        reg [max_faults -1 :0] dont_insert_fault;
        reg [max_faults -1 :0] repair_flag;
        reg [100 : 0] array_stuck_at[max_faults -1 : 0] ; 
        reg msgcnt;
        
        reg [Bits - 1: 0] stuck_at_0fault [max_faults -1 : 0];
        reg [Bits - 1: 0] stuck_at_1fault [max_faults -1 : 0];
        reg [Bits -1 : 0] stuck0;
        reg [Bits -1 : 0] stuck1;
        reg [Bits-1 :0] Mem_last;

        `ifdef ST_MEM_SLM
        reg [Bits -1 : 0] slm_temp_data;
        `endif
        
        real time_CK_func_rise , time_RADCK_rise;
        real time_fall_sleep,time_fall_PSWLARGEMP,time_fall_PSWLARGEMP_0,time_fall_PSWLARGEMA,time_fall_PSWLARGEMA_0,time_fall_PSWSMALLMP,time_fall_PSWSMALLMA;
        integer flag_error;
        
//BUFFER INSTANTIATION
//=========================
       `ifdef functional
       
         buf (SCTRLO,delSCTRLO_data); 
         buf bufq [Bits-1:0] (Q,delOutReg_data);
      `else
       
         buf (SCTRLO,SCTRLO_data);
         buf bufq [Bits-1:0] (Q,OutReg_data);  
      `endif
      
  
        buf (SEsys,SE);
	buf (SCTRLIint, SCTRLI);
   

	buf (CKint_func, CK);
	buf (CKint_dft, CK);
        buf bufaddr [Addr-1:0] (Asys,A);
        buf (INITNint,INITN);
        
        buf (LSint,LS); 
        buf (IGbuf,IG);
        buf (ATPint,ATP);

        buf bufTaddr [Addr-1 : 0] (TAint,TA);
        buf (TBISTsys,TBIST);
        buf (TCSNint,TCSN);

        buf (CSNsys,CSN);
        buf (STDBYint,STDBY );   
        
        buf (SLEEPint,1'b0 );

        buf bufrm [read_margin_size-1:0] (RMint, RM); 

        
        buf (PSWLARGEMPint,1'b0);
        buf (PSWSMALLMPint,1'b0); 
        buf (PSWLARGEMAint,1'b0);
        buf (PSWSMALLMAint,1'b0);  

assign TBYPASSsys = 0;
assign WENsys = 1;
assign HSint = 0;
assign WMint = 0;
assign TWENint = 1;

        



        assign scanreg_ctrl_wire={scanreg_ctrl[scanlen_ctrl - 2:0],SCTRLIint};
        assign scanreg_dl_wire={scanreg_dl[scanlen_l - 2:0],SDLIint};
        assign scanreg_dr_wire={scanreg_dr[scanlen_r - 2:0],SDRIint};
        
        assign Aint   = (TBISTint === 1'b0 ) ? Asys : (TBISTint === 1'bx ) ? {Addr{1'bx}} : TAint;  

        
        assign Aint_capt = Aint;
	
        assign WENint = 1'b1; 
        
        assign CSNbuf = (TBISTint === 1'b0 ) ? CSNsys : (TBISTint === 1'bx ) ? 1'bx : TCSNint;  

        assign CSNint = (ATPint === 1'b1) ? (SEint === 1'b0 ) ? CSNbuf : (SEint === 1'bx ) ? 1'bx :scanreg_ctrl[scanlen_ctrl - 3] : (ATPint === 1'b0 ) ? CSNsys : 1'bx ; 
        
        assign IGint = (ATPint === 1'b1) ? (SEint === 1'b0 ) ? IGbuf : (SEint === 1'bx ) ? 1'bx :scanreg_ctrl[scanlen_ctrl - 2] : (ATPint === 1'b0 ) ? IGbuf : 1'bx;

        
        assign DEint = (LSint === 1'bx || (LSint === 1'b0 && HSint === 1'bx) || ^RMint !== 1'b0 || ^WMint !== 1'b0 ) ? 1'bx : 1'b0;
        
     
     and (TBISTint, ATPint, TBISTsys);
     and (SEint, ATPint, SEsys);
     and (TBYPASSint, ATPint, TBYPASSsys);
     and (TSE,TBYPASSint,!SEsys);
     and (MEMEN,INITNint,!CSNint,!SLEEPint,!TBYPASSint,!SEint,!IGint,!DEint,!STDBYint );
     assign cond_sdf_tlss = ((INITNint && !CSNint && !SLEEPint && !TBYPASSint && !SEint && !IGint && !DEint && !STDBYint) !== 1'b0) ? 1'b1 : 1'b0;
     assign cond_sdf_trms = ((INITNint && !CSNint && !SLEEPint && !TBYPASSint && !SEint && !IGint && !DEint && !STDBYint ) !== 1'b0) ? 1'b1 : 1'b0;
     and (MEMEN_dft,INITNint, !SLEEPint, ATPint,!STDBYint);
     assign cond_sdf_tses = ((INITNint && !SLEEPint && ATPint && !STDBYint) !== 1'b0) ? 1'b1 : 1'b0;



// Power pins declaration


         reg vddm;
         reg r_supply_trigger;
          
         reg gndm ;
                  
         
         

// assigned Power pins 

         
  initial begin
         vddm = 1;
          
         gndm = 0;
                  
         
  end       
          
         assign gndmint = (reg_mem_block === 0) ? gndm : 1'b1;
         
         assign vddmint = vddm;
         assign vddmoint = vddm;
         
          

        //CPF Changes

        initial
        begin : cpfvddm 
           vddmreg = vddmint;
        end

        always @(vddmint) begin
           vddmreg = vddmint;
        end
 
        initial
        begin : cpfgndm 
           gndmreg = gndmint;
        end

        always @(gndmint) begin
           gndmreg = gndmint;
        end

        
        


        initial begin
         vddmoreg = 1'b1;
        end 



 `ifdef functional
  `else
  
//////////////////////////
 //REG DECLARATIONS
   //======================

   reg [Bits-1 : 0] TimingViol_data, TimingViol_mask;
   reg [Bits-1 : 0] TimingViol_data_last, TimingViol_mask_last;
	reg TimingViol_data_0, TimingViol_mask_0;
	reg TimingViol_data_1, TimingViol_mask_1;
	reg TimingViol_data_2, TimingViol_mask_2;
	reg TimingViol_data_3, TimingViol_mask_3;
	reg TimingViol_data_4, TimingViol_mask_4;
	reg TimingViol_data_5, TimingViol_mask_5;
	reg TimingViol_data_6, TimingViol_mask_6;
	reg TimingViol_data_7, TimingViol_mask_7;
	reg TimingViol_data_8, TimingViol_mask_8;
	reg TimingViol_data_9, TimingViol_mask_9;
	reg TimingViol_data_10, TimingViol_mask_10;
	reg TimingViol_data_11, TimingViol_mask_11;
	reg TimingViol_data_12, TimingViol_mask_12;
	reg TimingViol_data_13, TimingViol_mask_13;
	reg TimingViol_data_14, TimingViol_mask_14;
	reg TimingViol_data_15, TimingViol_mask_15;
	reg TimingViol_data_16, TimingViol_mask_16;
	reg TimingViol_data_17, TimingViol_mask_17;
	reg TimingViol_data_18, TimingViol_mask_18;
	reg TimingViol_data_19, TimingViol_mask_19;
	reg TimingViol_data_20, TimingViol_mask_20;
	reg TimingViol_data_21, TimingViol_mask_21;
	reg TimingViol_data_22, TimingViol_mask_22;
	reg TimingViol_data_23, TimingViol_mask_23;
	reg TimingViol_data_24, TimingViol_mask_24;
	reg TimingViol_data_25, TimingViol_mask_25;
	reg TimingViol_data_26, TimingViol_mask_26;
	reg TimingViol_data_27, TimingViol_mask_27;
	reg TimingViol_data_28, TimingViol_mask_28;
	reg TimingViol_data_29, TimingViol_mask_29;
	reg TimingViol_data_30, TimingViol_mask_30;
	reg TimingViol_data_31, TimingViol_mask_31;
	reg TimingViol_data_32, TimingViol_mask_32;
	reg TimingViol_data_33, TimingViol_mask_33;
	reg TimingViol_data_34, TimingViol_mask_34;
	reg TimingViol_data_35, TimingViol_mask_35;
	reg TimingViol_data_36, TimingViol_mask_36;
	reg TimingViol_data_37, TimingViol_mask_37;
	reg TimingViol_data_38, TimingViol_mask_38;
	reg TimingViol_data_39, TimingViol_mask_39;
	reg TimingViol_data_40, TimingViol_mask_40;
	reg TimingViol_data_41, TimingViol_mask_41;
	reg TimingViol_data_42, TimingViol_mask_42;
	reg TimingViol_data_43, TimingViol_mask_43;
	reg TimingViol_data_44, TimingViol_mask_44;
	reg TimingViol_data_45, TimingViol_mask_45;
	reg TimingViol_data_46, TimingViol_mask_46;
	reg TimingViol_data_47, TimingViol_mask_47;
	reg TimingViol_data_48, TimingViol_mask_48;
	reg TimingViol_data_49, TimingViol_mask_49;
	reg TimingViol_data_50, TimingViol_mask_50;
	reg TimingViol_data_51, TimingViol_mask_51;
	reg TimingViol_data_52, TimingViol_mask_52;
	reg TimingViol_data_53, TimingViol_mask_53;
	reg TimingViol_data_54, TimingViol_mask_54;
	reg TimingViol_data_55, TimingViol_mask_55;
	reg TimingViol_data_56, TimingViol_mask_56;
	reg TimingViol_data_57, TimingViol_mask_57;
	reg TimingViol_data_58, TimingViol_mask_58;
	reg TimingViol_data_59, TimingViol_mask_59;
	reg TimingViol_data_60, TimingViol_mask_60;
	reg TimingViol_data_61, TimingViol_mask_61;
	reg TimingViol_data_62, TimingViol_mask_62;
	reg TimingViol_data_63, TimingViol_mask_63;
   reg TimingViol_addr;
   reg TimingViol_CSN, TimingViol_WEN, TimingViol_tbypass;
   reg TimingViol_tckh, TimingViol_tckl, TimingViol_tcycle;
   reg TimingViol_tckh_se, TimingViol_tckl_se, TimingViol_tcycle_se;
   reg TimingViol_sctrli,TimingViol_sdli,TimingViol_sdri,TimingViol_se;
   reg TimingViol_smli,TimingViol_smri;
   reg TimingViol_sctrli_flag,TimingViol_sdli_flag,TimingViol_sdri_flag;
   reg TimingViol_smli_flag,TimingViol_smri_flag;
   reg TimingViol_initnl;
   reg TimingViol_initn;
   reg TimingViol_ls;
   reg TimingViol_hs;
   reg TimingViol_sleep;
   reg TimingViol_stdby;
   reg TimingViol_rm;
   reg TimingViol_wm;
   reg TimingViol_tbist,TimingViol_ig,TimingViol_atp,TimingViol_TED,TimingViol_TOD,TimingViol_TEM,TimingViol_TOM;
   
   wire cond_sdf_atps,cond_gac, CSTBYPASSN,cond_sdf_tas,cond_sdf_tbas,cond_sdf_tbps,SETB_EN,CSIG_EN,MEM_ACT,EN_ADM,CS_EN,CS_ADM,cond_sdf_tps,IG_EN,IG_ADM,cond_sdf_tigs,cond_sdf_taa,cond_sdf_taa_ls1,cond_tseq_tm,cond_sdf_tcycle,cond_sdf_tcycle_ls1,cond_sdf_tcycle_se,cond_sdf_tckl_se,cond_sdf_tsctrlis ,cond_sdf_tckh_se,cond_sdf_taa_sctrlo_se,cond_sdf_tckl,cond_sdf_tckh,cond_sdf_tbists,cond_sdf_taa_sctrlo,  SETOR;

wire CSWETBYPASSN;
wire cond_sdf_tstdbys,cond_sdf_tsls,notSLEEP_temp,sleep_en,atp_csn_en;

 and (CSWEMTBYPASS[0], !Mreg[0], CSWETBYPASSN);
 and (CSWEMTBYPASS[1], !Mreg[1], CSWETBYPASSN);
 and (CSWEMTBYPASS[2], !Mreg[2], CSWETBYPASSN);
 and (CSWEMTBYPASS[3], !Mreg[3], CSWETBYPASSN);
 and (CSWEMTBYPASS[4], !Mreg[4], CSWETBYPASSN);
 and (CSWEMTBYPASS[5], !Mreg[5], CSWETBYPASSN);
 and (CSWEMTBYPASS[6], !Mreg[6], CSWETBYPASSN);
 and (CSWEMTBYPASS[7], !Mreg[7], CSWETBYPASSN);
 and (CSWEMTBYPASS[8], !Mreg[8], CSWETBYPASSN);
 and (CSWEMTBYPASS[9], !Mreg[9], CSWETBYPASSN);
 and (CSWEMTBYPASS[10], !Mreg[10], CSWETBYPASSN);
 and (CSWEMTBYPASS[11], !Mreg[11], CSWETBYPASSN);
 and (CSWEMTBYPASS[12], !Mreg[12], CSWETBYPASSN);
 and (CSWEMTBYPASS[13], !Mreg[13], CSWETBYPASSN);
 and (CSWEMTBYPASS[14], !Mreg[14], CSWETBYPASSN);
 and (CSWEMTBYPASS[15], !Mreg[15], CSWETBYPASSN);
 and (CSWEMTBYPASS[16], !Mreg[16], CSWETBYPASSN);
 and (CSWEMTBYPASS[17], !Mreg[17], CSWETBYPASSN);
 and (CSWEMTBYPASS[18], !Mreg[18], CSWETBYPASSN);
 and (CSWEMTBYPASS[19], !Mreg[19], CSWETBYPASSN);
 and (CSWEMTBYPASS[20], !Mreg[20], CSWETBYPASSN);
 and (CSWEMTBYPASS[21], !Mreg[21], CSWETBYPASSN);
 and (CSWEMTBYPASS[22], !Mreg[22], CSWETBYPASSN);
 and (CSWEMTBYPASS[23], !Mreg[23], CSWETBYPASSN);
 and (CSWEMTBYPASS[24], !Mreg[24], CSWETBYPASSN);
 and (CSWEMTBYPASS[25], !Mreg[25], CSWETBYPASSN);
 and (CSWEMTBYPASS[26], !Mreg[26], CSWETBYPASSN);
 and (CSWEMTBYPASS[27], !Mreg[27], CSWETBYPASSN);
 and (CSWEMTBYPASS[28], !Mreg[28], CSWETBYPASSN);
 and (CSWEMTBYPASS[29], !Mreg[29], CSWETBYPASSN);
 and (CSWEMTBYPASS[30], !Mreg[30], CSWETBYPASSN);
 and (CSWEMTBYPASS[31], !Mreg[31], CSWETBYPASSN);
 and (CSWEMTBYPASS[32], !Mreg[32], CSWETBYPASSN);
 and (CSWEMTBYPASS[33], !Mreg[33], CSWETBYPASSN);
 and (CSWEMTBYPASS[34], !Mreg[34], CSWETBYPASSN);
 and (CSWEMTBYPASS[35], !Mreg[35], CSWETBYPASSN);
 and (CSWEMTBYPASS[36], !Mreg[36], CSWETBYPASSN);
 and (CSWEMTBYPASS[37], !Mreg[37], CSWETBYPASSN);
 and (CSWEMTBYPASS[38], !Mreg[38], CSWETBYPASSN);
 and (CSWEMTBYPASS[39], !Mreg[39], CSWETBYPASSN);
 and (CSWEMTBYPASS[40], !Mreg[40], CSWETBYPASSN);
 and (CSWEMTBYPASS[41], !Mreg[41], CSWETBYPASSN);
 and (CSWEMTBYPASS[42], !Mreg[42], CSWETBYPASSN);
 and (CSWEMTBYPASS[43], !Mreg[43], CSWETBYPASSN);
 and (CSWEMTBYPASS[44], !Mreg[44], CSWETBYPASSN);
 and (CSWEMTBYPASS[45], !Mreg[45], CSWETBYPASSN);
 and (CSWEMTBYPASS[46], !Mreg[46], CSWETBYPASSN);
 and (CSWEMTBYPASS[47], !Mreg[47], CSWETBYPASSN);
 and (CSWEMTBYPASS[48], !Mreg[48], CSWETBYPASSN);
 and (CSWEMTBYPASS[49], !Mreg[49], CSWETBYPASSN);
 and (CSWEMTBYPASS[50], !Mreg[50], CSWETBYPASSN);
 and (CSWEMTBYPASS[51], !Mreg[51], CSWETBYPASSN);
 and (CSWEMTBYPASS[52], !Mreg[52], CSWETBYPASSN);
 and (CSWEMTBYPASS[53], !Mreg[53], CSWETBYPASSN);
 and (CSWEMTBYPASS[54], !Mreg[54], CSWETBYPASSN);
 and (CSWEMTBYPASS[55], !Mreg[55], CSWETBYPASSN);
 and (CSWEMTBYPASS[56], !Mreg[56], CSWETBYPASSN);
 and (CSWEMTBYPASS[57], !Mreg[57], CSWETBYPASSN);
 and (CSWEMTBYPASS[58], !Mreg[58], CSWETBYPASSN);
 and (CSWEMTBYPASS[59], !Mreg[59], CSWETBYPASSN);
 and (CSWEMTBYPASS[60], !Mreg[60], CSWETBYPASSN);
 and (CSWEMTBYPASS[61], !Mreg[61], CSWETBYPASSN);
 and (CSWEMTBYPASS[62], !Mreg[62], CSWETBYPASSN);
 and (CSWEMTBYPASS[63], !Mreg[63], CSWETBYPASSN);

and (atp_csn_en,!ATPint,!CSNint,!IGint);
or (sleep_en,atp_csn_en,ATPint);
assign cond_sdf_tsls = ((sleep_en && INITNint && !STDBYint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tstdbys = ((sleep_en && INITNint && !SLEEPint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_atps = ((INITNint && !SLEEPint && !STDBYint) !== 1'b0) ? 1'b1 : 1'b0;
and (cond_gac,INITNint,!SLEEPint,!STDBYint);
or (SETB_EN,SEint,TBISTint);
or (CSIG_EN,IGint,CSNint);
and (MEM_ACT,!ATPint,CSIG_EN);
or (EN_ADM,MEM_ACT,SETB_EN);
assign cond_sdf_tas = ((cond_gac && !EN_ADM) !== 1'b0) ? 1'b1 : 1'b0;
and (CS_EN,!ATPint,IGint);
and (CS_ADM,CS_EN,SETB_EN);
assign cond_sdf_tps = ((cond_gac && !CS_ADM) !== 1'b0) ? 1'b1 : 1'b0;
or (SETOR,!SE_reg,!ATPreg); 
assign cond_sdf_tckl = ((cond_gac && !SEint) !== 1'b0) ? 1'b1 : 1'b0; 
assign cond_sdf_tckh = ((cond_gac && SETOR) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tcycle = ((cond_gac && !SEint && !LSint && !HSint) !== 1'b0) ? 1'b1 : 1'b0;  
assign cond_sdf_tcycle_ls1 = ((cond_gac && !SEint && LSint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tcycle_se = ((cond_gac && SEint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tckl_se = ((cond_gac && SEint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tsctrlis = ((cond_gac && SEint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tckh_se  = ((cond_gac && SE_reg && ATPreg) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_taa_sctrlo_se = ((cond_gac && SE_reg && ATPreg) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tbists = ((cond_gac && !SEsys && ATPint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_taa_sctrlo = ((cond_gac && !SE_reg && ATPreg) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tbas = ((cond_gac && TBISTint && !SEsys) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tbps = ((cond_gac && TBISTint && !SEsys) !== 1'b0) ? 1'b1 : 1'b0;
and (IG_EN,!ATPint,CSNint);
and (IG_ADM,IG_EN,SETB_EN);
assign cond_sdf_tigs = ((cond_gac && !IG_ADM) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_taa = ((MEMEN_reg && WENreg && !LSint && !HSint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_taa_ls1 = ((MEMEN_reg && WENreg && LSint) !== 1'b0) ? 1'b1 : 1'b0; 
and (CSWETBYPASSN, !WENreg, 1'b1);

or (notSLEEP_temp,STDBYint,!sleep_en,SLEEPint);
assign cond_sdf_tinitns = ((notSLEEP_temp) !==1'b1) ? 1'b1 : 1'b0 ;

//specify block begins

specify
    specparam
    
         PATHPULSE$CK$Q = 0,
         PATHPULSE$CK$SCTRLO = 0,


         
         tlss = 0.0,
         tlsh = 0.0,
        
         
        
         tstdbys = 0.0,
         tstdbyh = 0.0, 
	 

         tcycle = 0.0,
         
         tcycle_ls1 = 0.0,

         
         tckh = 0.0,
         tckl = 0.0,
         tcycle_se = 0.0,
         tckh_se = 0.0,
         tckl_se = 0.0,

         tps = 0.0,
         tph = 0.0,

         tas = 0.0,
         tah = 0.0,
         tses= 0.0,
         tseh= 0.0,
         tsctrlis=0.0,
         tsctrlih=0.0,

         tbists=0.0,
         tbisth=0.0,
         tbps=0.0,
         tbph=0.0,

         tbas=0.0,
         tbah=0.0,
         tinitnl=0.0,
         tinitns=0.0,
         tinitnh=0.0,
         tatps=0.0,
         tatph=0.0,
         tigs=0.0,
         tigh=0.0,
         
         trms=0.0,
         trmh=0.0,
 

/*************************************************************************************************/
            taa = `access_time,
            th = `retain_time,
            taa_ls1 = `access_time,
            th_ls1 = `retain_time,

            taa_sctrlo=`access_time,
            th_sctrlo=`retain_time,

            taa_sctrlo_se=`access_time,
            th_sctrlo_se=`retain_time; 

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

        $setup(posedge CSN, posedge CK &&& cond_sdf_tps, tps, TimingViol_CSN);
	$setup(negedge CSN, posedge CK &&& cond_sdf_tps, tps, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tps, posedge CSN, tph, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tps, negedge CSN, tph, TimingViol_CSN);
        $period(posedge CK &&& cond_sdf_tcycle, tcycle, TimingViol_tcycle);  
        
        $period(posedge CK &&& cond_sdf_tcycle_ls1, tcycle_ls1, TimingViol_tcycle);
        
        $width(posedge CK  &&& cond_sdf_tckh, tckh, 0, TimingViol_tckh);
        $width(negedge CK  &&& cond_sdf_tckl, tckl, 0, TimingViol_tckl);
        $period(posedge CK &&& cond_sdf_tcycle_se, tcycle_se, TimingViol_tcycle_se);
        $width(posedge CK  &&& cond_sdf_tckh_se, tckh_se, 0, TimingViol_tckh_se);
        $width(negedge CK  &&& cond_sdf_tckl_se, tckl_se, 0, TimingViol_tckl_se);


        $setup(posedge LS, posedge CK &&& cond_sdf_tlss,tlss, TimingViol_ls);
        $setup(negedge LS, posedge CK &&& cond_sdf_tlss,tlss, TimingViol_ls);
        $hold(posedge CK &&& cond_sdf_tlss, posedge LS, tlsh, TimingViol_ls); 
        $hold(posedge CK &&& cond_sdf_tlss, negedge LS, tlsh, TimingViol_ls); 


        

        $setup(posedge STDBY, posedge CK &&& cond_sdf_tstdbys, tstdbys, TimingViol_stdby);
        $setup(negedge STDBY, posedge CK &&& cond_sdf_tstdbys, tstdbys, TimingViol_stdby);
        $hold(posedge CK &&& cond_sdf_tstdbys, posedge STDBY, tstdbyh, TimingViol_stdby);        
        $hold(posedge CK &&& cond_sdf_tstdbys, negedge STDBY, tstdbyh, TimingViol_stdby); 
        
        
        $setup (posedge SE ,posedge CK &&& cond_sdf_tses,tses,TimingViol_se);
	$setup (negedge SE ,posedge CK &&& cond_sdf_tses,tses,TimingViol_se);
        
        $hold (posedge CK &&& cond_sdf_tses, posedge SE ,tseh,TimingViol_se);
	$hold (posedge CK &&& cond_sdf_tses, negedge SE ,tseh,TimingViol_se);
        
        $setup(posedge SCTRLI, posedge CK  &&& cond_sdf_tsctrlis , tsctrlis, TimingViol_sctrli);
        $setup(negedge SCTRLI, posedge CK  &&& cond_sdf_tsctrlis , tsctrlis, TimingViol_sctrli);
        $hold(posedge CK &&& cond_sdf_tsctrlis , posedge SCTRLI, tsctrlih, TimingViol_sctrli);        
        $hold(posedge CK &&& cond_sdf_tsctrlis , negedge SCTRLI, tsctrlih, TimingViol_sctrli);

 
        $width(negedge INITN , tinitnl, 0, TimingViol_initnl);
        
        $setup(posedge INITN, posedge CK &&& cond_sdf_tinitns, tinitns, TimingViol_initn);
        $setup(negedge INITN, posedge CK &&& cond_sdf_tinitns, tinitns, TimingViol_initn);
        
        $hold (posedge CK &&& cond_sdf_tinitns,posedge INITN, tinitnh, TimingViol_initn);
        $hold (posedge CK &&& cond_sdf_tinitns,negedge INITN, tinitnh, TimingViol_initn);

        $setup(posedge ATP, posedge CK &&& cond_sdf_atps, tatps, TimingViol_atp);
        $setup(negedge ATP, posedge CK &&& cond_sdf_atps, tatps, TimingViol_atp);
        $hold(posedge CK &&& cond_sdf_atps, posedge ATP, tatph, TimingViol_atp);        
        $hold(posedge CK &&& cond_sdf_atps, negedge ATP, tatph, TimingViol_atp);
        
        $setup(posedge IG, posedge CK &&& cond_sdf_tigs , tigs, TimingViol_ig);
        $setup(negedge IG, posedge CK &&& cond_sdf_tigs , tigs, TimingViol_ig);
        $hold(posedge CK &&& cond_sdf_tigs, posedge IG, tigh, TimingViol_ig);        
        $hold(posedge CK &&& cond_sdf_tigs, negedge IG, tigh, TimingViol_ig);

         
$setup(posedge RM[0], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[1], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[2], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[0], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[1], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[2], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[0], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[1], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[2], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[0], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[1], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[2], trmh, TimingViol_rm); 

 
        
        $setup(posedge TBIST, posedge CK &&& cond_sdf_tbists, tbists, TimingViol_tbist);
        $setup(negedge TBIST, posedge CK &&& cond_sdf_tbists, tbists, TimingViol_tbist);
        $hold(posedge CK &&& cond_sdf_tbists, posedge TBIST, tbisth, TimingViol_tbist);        
        $hold(posedge CK &&& cond_sdf_tbists, negedge TBIST, tbisth, TimingViol_tbist);
        
        	$setup(posedge TA[0], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[1], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[2], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[3], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[4], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[5], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[6], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[7], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[8], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[9], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
        	$setup(negedge TA[0], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[1], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[2], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[3], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[4], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[5], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[6], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[7], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[8], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[9], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
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
       
    

          /*-------------------- Propagation Delays ------------------*/
	if (cond_sdf_taa) (posedge CK => (Q[0] +: OutReg_data[0])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[1] +: OutReg_data[1])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[2] +: OutReg_data[2])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[3] +: OutReg_data[3])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[4] +: OutReg_data[4])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[5] +: OutReg_data[5])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[6] +: OutReg_data[6])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[7] +: OutReg_data[7])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[8] +: OutReg_data[8])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[9] +: OutReg_data[9])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[10] +: OutReg_data[10])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[11] +: OutReg_data[11])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[12] +: OutReg_data[12])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[13] +: OutReg_data[13])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[14] +: OutReg_data[14])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[15] +: OutReg_data[15])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[16] +: OutReg_data[16])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[17] +: OutReg_data[17])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[18] +: OutReg_data[18])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[19] +: OutReg_data[19])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[20] +: OutReg_data[20])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[21] +: OutReg_data[21])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[22] +: OutReg_data[22])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[23] +: OutReg_data[23])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[24] +: OutReg_data[24])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[25] +: OutReg_data[25])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[26] +: OutReg_data[26])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[27] +: OutReg_data[27])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[28] +: OutReg_data[28])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[29] +: OutReg_data[29])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[30] +: OutReg_data[30])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[31] +: OutReg_data[31])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[32] +: OutReg_data[32])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[33] +: OutReg_data[33])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[34] +: OutReg_data[34])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[35] +: OutReg_data[35])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[36] +: OutReg_data[36])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[37] +: OutReg_data[37])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[38] +: OutReg_data[38])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[39] +: OutReg_data[39])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[40] +: OutReg_data[40])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[41] +: OutReg_data[41])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[42] +: OutReg_data[42])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[43] +: OutReg_data[43])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[44] +: OutReg_data[44])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[45] +: OutReg_data[45])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[46] +: OutReg_data[46])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[47] +: OutReg_data[47])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[48] +: OutReg_data[48])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[49] +: OutReg_data[49])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[50] +: OutReg_data[50])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[51] +: OutReg_data[51])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[52] +: OutReg_data[52])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[53] +: OutReg_data[53])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[54] +: OutReg_data[54])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[55] +: OutReg_data[55])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[56] +: OutReg_data[56])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[57] +: OutReg_data[57])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[58] +: OutReg_data[58])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[59] +: OutReg_data[59])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[60] +: OutReg_data[60])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[61] +: OutReg_data[61])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[62] +: OutReg_data[62])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[63] +: OutReg_data[63])) = (taa, taa, th, taa, th, taa); 

	if (cond_sdf_taa_ls1) (posedge CK => (Q[0] +: OutReg_data[0])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[1] +: OutReg_data[1])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[2] +: OutReg_data[2])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[3] +: OutReg_data[3])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[4] +: OutReg_data[4])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[5] +: OutReg_data[5])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[6] +: OutReg_data[6])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[7] +: OutReg_data[7])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[8] +: OutReg_data[8])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[9] +: OutReg_data[9])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[10] +: OutReg_data[10])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[11] +: OutReg_data[11])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[12] +: OutReg_data[12])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[13] +: OutReg_data[13])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[14] +: OutReg_data[14])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[15] +: OutReg_data[15])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[16] +: OutReg_data[16])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[17] +: OutReg_data[17])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[18] +: OutReg_data[18])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[19] +: OutReg_data[19])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[20] +: OutReg_data[20])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[21] +: OutReg_data[21])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[22] +: OutReg_data[22])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[23] +: OutReg_data[23])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[24] +: OutReg_data[24])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[25] +: OutReg_data[25])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[26] +: OutReg_data[26])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[27] +: OutReg_data[27])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[28] +: OutReg_data[28])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[29] +: OutReg_data[29])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[30] +: OutReg_data[30])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[31] +: OutReg_data[31])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[32] +: OutReg_data[32])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[33] +: OutReg_data[33])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[34] +: OutReg_data[34])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[35] +: OutReg_data[35])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[36] +: OutReg_data[36])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[37] +: OutReg_data[37])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[38] +: OutReg_data[38])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[39] +: OutReg_data[39])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[40] +: OutReg_data[40])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[41] +: OutReg_data[41])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[42] +: OutReg_data[42])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[43] +: OutReg_data[43])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[44] +: OutReg_data[44])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[45] +: OutReg_data[45])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[46] +: OutReg_data[46])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[47] +: OutReg_data[47])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[48] +: OutReg_data[48])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[49] +: OutReg_data[49])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[50] +: OutReg_data[50])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[51] +: OutReg_data[51])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[52] +: OutReg_data[52])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[53] +: OutReg_data[53])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[54] +: OutReg_data[54])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[55] +: OutReg_data[55])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[56] +: OutReg_data[56])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[57] +: OutReg_data[57])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[58] +: OutReg_data[58])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[59] +: OutReg_data[59])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[60] +: OutReg_data[60])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[61] +: OutReg_data[61])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[62] +: OutReg_data[62])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[63] +: OutReg_data[63])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1); 





if (cond_sdf_taa_sctrlo) (posedge CK *> (SCTRLO :  SCTRLI)) = (taa_sctrlo,taa_sctrlo,th_sctrlo,taa_sctrlo,th_sctrlo,taa_sctrlo); 

if (cond_sdf_taa_sctrlo_se) (negedge CK *> (SCTRLO : SCTRLI)) = (taa_sctrlo_se,taa_sctrlo_se,th_sctrlo_se,taa_sctrlo_se,th_sctrlo_se,taa_sctrlo_se); 
 
 
     
 endspecify //specify block ends



`endif


// TASK DEFINITION DESCRIPTION
// ================================


task task_insert_faults_in_memory;
begin
   if (reg_ConfigFault)
   begin   
     for(i = 0;i< fcnt;i = i+ 1) begin
          if (array_stuck_at[i] === "sa0") begin
           `ifdef ST_MEM_SLM
            //Read first
            $slm_ReadMemoryS(slm_handle, FailureLocn[i], slm_temp_data);
            //operation
            slm_temp_data = slm_temp_data & stuck_at_0fault[i];
            //write back
            $slm_WriteMemoryS(slm_handle, FailureLocn[i], slm_temp_data);
          `else
            Mem[FailureLocn[i]] = Mem[FailureLocn[i]] & stuck_at_0fault[i];
          `endif
         end //if(array_stuck_at)
                                        
         if(array_stuck_at[i] === "sa1") begin
         `ifdef ST_MEM_SLM
            //Read first
            $slm_ReadMemoryS(slm_handle, FailureLocn[i], slm_temp_data);
            //operation
            slm_temp_data = slm_temp_data | stuck_at_1fault[i];
            //write back
            $slm_WriteMemoryS(slm_handle, FailureLocn[i], slm_temp_data);
         `else
            Mem[FailureLocn[i]] = Mem[FailureLocn[i]] | stuck_at_1fault[i]; 
         `endif
         end //if(array_stuck_at)
     end    // end of for
   end  
end
endtask

task task_read_fault_file;
begin
   Fault_in_memory=0;
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
          if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: File cannot be opened ",$realtime);
      end        
      else                
      begin : read_fault_file
        t = 0;
        for (i = 0; i< max_faults; i= i + 1)
        begin
         
           stuck0 = {Bits{1'b1}};
           stuck1 = {Bits{1'b0}};
           fault_char1 = $fgetc (file_ptr);
           if (fault_char1 == 8'b11111111)
              disable read_fault_file;
           ret_val = $ungetc (fault_char1, file_ptr);
           ret_val = $fgets(tempStr, file_ptr);
           ret_val = $sscanf(tempStr, "%d %d %s",fault_word, fault_bit, stuck_at) ;
           flag_error = 0; 
           if(ret_val !== 0)
           begin         
              if(ret_val == 2 || ret_val == 3)
              begin
                if(ret_val == 2)
                   stuck_at = "sa0";

                if(stuck_at !== "sa0" && stuck_at !== "sa1" && stuck_at !== "none")
                begin
                    if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Wrong value for stuck at in fault file ",$realtime);
                   flag_error = 1;
                end    
                      
                if(fault_word > Words)
                begin
                   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Address out of range in fault file ",$realtime);
                   flag_error = 1;
                end    

                if(fault_bit > Bits)
                begin  
                    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Faulty bit out of range in fault file ",$realtime);
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
      for (faultnum=0; faultnum<Bits;faultnum=faultnum+1) begin
         stop_loop = 1;
       for (count = 0; count < fcnt; count = count +1) begin 
        if ((Failurebit[count] == faultnum) && (stop_loop == 1)) begin
         Fault_in_memory=Fault_in_memory+1;
         stop_loop = 0;
        end
       end        
      end
  
      //fault injection at time 0.
   task_insert_faults_in_memory;
  end // config_fault 
end
endtask


task WriteOutX;                
begin
   OutReg_data <= #0 WordX;
end
endtask


task Invalid_next_cycle_func;
begin
  WriteOutX;
  if (INITNint !== 0) begin
    `ifdef ST_FUNCTION_NEXT_CYCLE_CORRUPTION_ON         
       #0 next_cycle_corrupt_func = 1;
     `else 
       #0 next_cycle_corrupt_func = 0; 
     `endif  
   end 
end
endtask

task Invalid_next_cycle_dft;
begin
  ScanChainX;
  ScanOutX;   
  if( TBYPASSint !== 0 && SEint !== 1) begin
    WriteOutX;
  end
  if (INITNint !== 0) begin
    `ifdef ST_FUNCTION_NEXT_CYCLE_CORRUPTION_ON         
       #0 next_cycle_corrupt_dft = 1;
     `else 
       #0 next_cycle_corrupt_dft = 0; 
     `endif  
  end
end
endtask


task ScanOutX;                
begin
   SCTRLOint=X;
   
   `ifdef functional
   `else
   SCTRLO_data<=1'bx;
   
 `endif
end
endtask

task delScanOutX;                
begin
   delSCTRLO_data<=X;
   
end
endtask

task ScanChainX;                
begin
 scanreg_ctrl={scanlen_ctrl{1'bx}}; 
 
end
endtask

task mem_blocked;
begin
   WriteOutX;
   ScanChainX;
   ScanOutX;//immediately;
   delScanOutX;//immediately
   `ifdef POWER_SEQUENCING_OFF
   `else
   reg_mem_block=1;
   `endif
   debug_level = 2'b00;
end
endtask

task corrupt_all;
begin
 if (SLEEPint !== 0) begin
   WriteOutX;
   OutReg_data = WordX; 
   delOutReg_data=WordX;
   ScanChainX;
   ScanOutX;//immediately;
   delScanOutX;//immediately
 end  
end
endtask



task ReadCycle;
input [Addr-1 : 0] Address;

reg [Bits-1:0] MemData_tmp;
reg [Bits-1:0] MemData;

integer a,numr;

begin
   if (ValidAddress )
   begin        
      `ifdef ST_MEM_SLM
         $slm_ReadMemory(slm_handle, Address, MemData);
      `else
         MemData_tmp = Mem[Address];
      `endif
   end //if (ValidAddress)  
   
  `ifdef ST_MEM_SLM
  `else
       MemData=MemData_tmp; 
  `endif 
   
   if(ValidAddress === X)
   begin

         if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Read Port:  Illegal Value on Address Bus. Output Corrupted ",$realtime); 
         MemData = WordX;
      #0 next_cycle_corrupt_func = 1;
   end                        
   else if (ValidAddress === 0  )
   begin                        
       if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Read Port:  Address Out Of Range. Output Corrupted ",$realtime);
      MemData = WordX;
   end
   for (a = 0; a < Bits; a = a + 1)
   begin
      if (MemData[a] !== OutReg_data[a])
         OutReg_data[a] = WordX[a];
   end//for (a = 0; a <  
         OutReg_data <= MemData;
end
endtask


 //////// CAPTURE TASK //////
task scan_acquire;
begin
   if (supply_ok === 1) begin 
      if ( SEsys === 0) begin
         scanreg_ctrl=0;//all the unused address bits are tied to 0
         
         
                 
         scanreg_ctrl[0]               =Aint_capt[0];///check the order of bits
         scanreg_ctrl[1]               =Aint_capt[1];///check the order of bits
         scanreg_ctrl[2]               =Aint_capt[2];///check the order of bits
         scanreg_ctrl[3]               =Aint_capt[3];///check the order of bits
         scanreg_ctrl[4]               =Aint_capt[4];///check the order of bits
         scanreg_ctrl[5]               =Aint_capt[5];///check the order of bits
         scanreg_ctrl[6]               =Aint_capt[6];///check the order of bits
         scanreg_ctrl[7]               =Aint_capt[7];///check the order of bits
         scanreg_ctrl[8]               =Aint_capt[8];///check the order of bits
         scanreg_ctrl[9]               =Aint_capt[9];///check the order of bits
         scanreg_ctrl[10]              =Aint_capt[10];///check the order of bits
         scanreg_ctrl[11]              =Aint_capt[11];///check the order of bits
         scanreg_ctrl[12]              =Aint_capt[12];///check the order of bits
         scanreg_ctrl[13]              =Aint_capt[13];///check the order of bits
         scanreg_ctrl[14]              =Aint_capt[14];///check the order of bits
         scanreg_ctrl[15]              =1'b0;
         scanreg_ctrl[16]              =CSNint;
         scanreg_ctrl[17]              =IGint;        
         
          
         

         

      end //if ( SEint === 0
   end//if(supply_ok 
end
endtask

task scan_shift;
begin
 if (supply_ok === 1) begin
   if (STDBYint === 0 && SLEEPint === 0) begin
      if (CKint_dft === X && INITNint !== 0 && SLEEPint !== 1 && STDBYint !== 1 && ATPint !== 0) begin
         ScanChainX;
         ScanOutX;
      end
      else if (CKint_dft === 1 && lastCK_dft === 0 ) begin
          //// SHIFT
        if (SEsys === 1) begin
           scanreg_ctrl[scanlen_ctrl -1:1]=scanreg_ctrl[scanlen_ctrl -2:0];
           scanreg_ctrl[0]             = SCTRLIint_temp;
           scanreg_dl[scanlen_l -1:1]=scanreg_dl[scanlen_l -2:0];  
           scanreg_dl[0]               = SDLIint_temp; 
           
           
           scanreg_dr[scanlen_r -1:1]=scanreg_dr[scanlen_r -2:0];  
           scanreg_dr[0]               = SDRIint_temp; 
           
           
        //// SHIFT Ends
        end //if (SEsys === 1
        else if (SEsys === X) begin
            ScanChainX;
            ScanOutX;
            delScanOutX;
        end//if (SEint ==X
      
      end///if (CKint === 
    
      else if (CKint_dft === 0 && lastCK_dft === 1 ) begin
         SCTRLOint   = scanreg_ctrl[scanlen_ctrl -1];
         
   
         if (SCTRLOint !== SCTRLO_data) begin 
             SCTRLO_data=1'bx;
             SCTRLO_data <= SCTRLOint;
            end
   
  `ifdef functional
   `else
             if (TimingViol_sctrli_flag === 1'b1) begin
               SCTRLO_data<=X;
               scanreg_ctrl={scanlen_ctrl{1'bx}};
               TimingViol_sctrli_flag=0;
             end   
   
   `endif

      end
    end  //if (STDByint === 0 && SLEEPint === 0
 end//if(supply_ok
end
endtask





always @(scanreg_ctrl_wire[0]) begin
  SCTRLIint_temp=scanreg_ctrl_wire[0];
end

        
 
always @(scanreg_ctrl_wire[1]) begin
  scanreg_ctrl[0]=scanreg_ctrl_wire[1];
end

 
always @(scanreg_ctrl_wire[2]) begin
  scanreg_ctrl[1]=scanreg_ctrl_wire[2];
end

 
always @(scanreg_ctrl_wire[3]) begin
  scanreg_ctrl[2]=scanreg_ctrl_wire[3];
end

 
always @(scanreg_ctrl_wire[4]) begin
  scanreg_ctrl[3]=scanreg_ctrl_wire[4];
end

 
always @(scanreg_ctrl_wire[5]) begin
  scanreg_ctrl[4]=scanreg_ctrl_wire[5];
end

 
always @(scanreg_ctrl_wire[6]) begin
  scanreg_ctrl[5]=scanreg_ctrl_wire[6];
end

 
always @(scanreg_ctrl_wire[7]) begin
  scanreg_ctrl[6]=scanreg_ctrl_wire[7];
end

 
always @(scanreg_ctrl_wire[8]) begin
  scanreg_ctrl[7]=scanreg_ctrl_wire[8];
end

 
always @(scanreg_ctrl_wire[9]) begin
  scanreg_ctrl[8]=scanreg_ctrl_wire[9];
end

 
always @(scanreg_ctrl_wire[10]) begin
  scanreg_ctrl[9]=scanreg_ctrl_wire[10];
end

 
always @(scanreg_ctrl_wire[11]) begin
  scanreg_ctrl[10]=scanreg_ctrl_wire[11];
end

 
always @(scanreg_ctrl_wire[12]) begin
  scanreg_ctrl[11]=scanreg_ctrl_wire[12];
end

 
always @(scanreg_ctrl_wire[13]) begin
  scanreg_ctrl[12]=scanreg_ctrl_wire[13];
end

 
always @(scanreg_ctrl_wire[14]) begin
  scanreg_ctrl[13]=scanreg_ctrl_wire[14];
end

 
always @(scanreg_ctrl_wire[15]) begin
  scanreg_ctrl[14]=scanreg_ctrl_wire[15];
end

 
always @(scanreg_ctrl_wire[16]) begin
  scanreg_ctrl[15]=scanreg_ctrl_wire[16];
end

 
always @(scanreg_ctrl_wire[17]) begin
  scanreg_ctrl[16]=scanreg_ctrl_wire[17];
end



always @(scanreg_dl_wire[0]) begin
  SDLIint_temp=scanreg_dl_wire[0];
end
 
always @(scanreg_dl_wire[1]) begin
  scanreg_dl[0]=scanreg_dl_wire[1];
end

 
always @(scanreg_dl_wire[2]) begin
  scanreg_dl[1]=scanreg_dl_wire[2];
end

 
always @(scanreg_dl_wire[3]) begin
  scanreg_dl[2]=scanreg_dl_wire[3];
end

 
always @(scanreg_dl_wire[4]) begin
  scanreg_dl[3]=scanreg_dl_wire[4];
end

 
always @(scanreg_dl_wire[5]) begin
  scanreg_dl[4]=scanreg_dl_wire[5];
end

 
always @(scanreg_dl_wire[6]) begin
  scanreg_dl[5]=scanreg_dl_wire[6];
end

 
always @(scanreg_dl_wire[7]) begin
  scanreg_dl[6]=scanreg_dl_wire[7];
end

 
always @(scanreg_dl_wire[8]) begin
  scanreg_dl[7]=scanreg_dl_wire[8];
end

 
always @(scanreg_dl_wire[9]) begin
  scanreg_dl[8]=scanreg_dl_wire[9];
end

 
always @(scanreg_dl_wire[10]) begin
  scanreg_dl[9]=scanreg_dl_wire[10];
end

 
always @(scanreg_dl_wire[11]) begin
  scanreg_dl[10]=scanreg_dl_wire[11];
end

 
always @(scanreg_dl_wire[12]) begin
  scanreg_dl[11]=scanreg_dl_wire[12];
end

 
always @(scanreg_dl_wire[13]) begin
  scanreg_dl[12]=scanreg_dl_wire[13];
end

 
always @(scanreg_dl_wire[14]) begin
  scanreg_dl[13]=scanreg_dl_wire[14];
end

 
always @(scanreg_dl_wire[15]) begin
  scanreg_dl[14]=scanreg_dl_wire[15];
end

 
always @(scanreg_dl_wire[16]) begin
  scanreg_dl[15]=scanreg_dl_wire[16];
end

 
always @(scanreg_dl_wire[17]) begin
  scanreg_dl[16]=scanreg_dl_wire[17];
end

 
always @(scanreg_dl_wire[18]) begin
  scanreg_dl[17]=scanreg_dl_wire[18];
end

 
always @(scanreg_dl_wire[19]) begin
  scanreg_dl[18]=scanreg_dl_wire[19];
end

 
always @(scanreg_dl_wire[20]) begin
  scanreg_dl[19]=scanreg_dl_wire[20];
end

 
always @(scanreg_dl_wire[21]) begin
  scanreg_dl[20]=scanreg_dl_wire[21];
end

 
always @(scanreg_dl_wire[22]) begin
  scanreg_dl[21]=scanreg_dl_wire[22];
end

 
always @(scanreg_dl_wire[23]) begin
  scanreg_dl[22]=scanreg_dl_wire[23];
end

 
always @(scanreg_dl_wire[24]) begin
  scanreg_dl[23]=scanreg_dl_wire[24];
end

 
always @(scanreg_dl_wire[25]) begin
  scanreg_dl[24]=scanreg_dl_wire[25];
end

 
always @(scanreg_dl_wire[26]) begin
  scanreg_dl[25]=scanreg_dl_wire[26];
end

 
always @(scanreg_dl_wire[27]) begin
  scanreg_dl[26]=scanreg_dl_wire[27];
end

 
always @(scanreg_dl_wire[28]) begin
  scanreg_dl[27]=scanreg_dl_wire[28];
end

 
always @(scanreg_dl_wire[29]) begin
  scanreg_dl[28]=scanreg_dl_wire[29];
end

 
always @(scanreg_dl_wire[30]) begin
  scanreg_dl[29]=scanreg_dl_wire[30];
end

 
always @(scanreg_dl_wire[31]) begin
  scanreg_dl[30]=scanreg_dl_wire[31];
end


always @(scanreg_dr_wire[0]) begin
  SDRIint_temp=scanreg_dr_wire[0];
end
 
always @(scanreg_dr_wire[1]) begin
  scanreg_dr[0]=scanreg_dr_wire[1];
end

 
always @(scanreg_dr_wire[2]) begin
  scanreg_dr[1]=scanreg_dr_wire[2];
end

 
always @(scanreg_dr_wire[3]) begin
  scanreg_dr[2]=scanreg_dr_wire[3];
end

 
always @(scanreg_dr_wire[4]) begin
  scanreg_dr[3]=scanreg_dr_wire[4];
end

 
always @(scanreg_dr_wire[5]) begin
  scanreg_dr[4]=scanreg_dr_wire[5];
end

 
always @(scanreg_dr_wire[6]) begin
  scanreg_dr[5]=scanreg_dr_wire[6];
end

 
always @(scanreg_dr_wire[7]) begin
  scanreg_dr[6]=scanreg_dr_wire[7];
end

 
always @(scanreg_dr_wire[8]) begin
  scanreg_dr[7]=scanreg_dr_wire[8];
end

 
always @(scanreg_dr_wire[9]) begin
  scanreg_dr[8]=scanreg_dr_wire[9];
end

 
always @(scanreg_dr_wire[10]) begin
  scanreg_dr[9]=scanreg_dr_wire[10];
end

 
always @(scanreg_dr_wire[11]) begin
  scanreg_dr[10]=scanreg_dr_wire[11];
end

 
always @(scanreg_dr_wire[12]) begin
  scanreg_dr[11]=scanreg_dr_wire[12];
end

 
always @(scanreg_dr_wire[13]) begin
  scanreg_dr[12]=scanreg_dr_wire[13];
end

 
always @(scanreg_dr_wire[14]) begin
  scanreg_dr[13]=scanreg_dr_wire[14];
end

 
always @(scanreg_dr_wire[15]) begin
  scanreg_dr[14]=scanreg_dr_wire[15];
end

 
always @(scanreg_dr_wire[16]) begin
  scanreg_dr[15]=scanreg_dr_wire[16];
end

 
always @(scanreg_dr_wire[17]) begin
  scanreg_dr[16]=scanreg_dr_wire[17];
end

 
always @(scanreg_dr_wire[18]) begin
  scanreg_dr[17]=scanreg_dr_wire[18];
end

 
always @(scanreg_dr_wire[19]) begin
  scanreg_dr[18]=scanreg_dr_wire[19];
end

 
always @(scanreg_dr_wire[20]) begin
  scanreg_dr[19]=scanreg_dr_wire[20];
end

 
always @(scanreg_dr_wire[21]) begin
  scanreg_dr[20]=scanreg_dr_wire[21];
end

 
always @(scanreg_dr_wire[22]) begin
  scanreg_dr[21]=scanreg_dr_wire[22];
end

 
always @(scanreg_dr_wire[23]) begin
  scanreg_dr[22]=scanreg_dr_wire[23];
end

 
always @(scanreg_dr_wire[24]) begin
  scanreg_dr[23]=scanreg_dr_wire[24];
end

 
always @(scanreg_dr_wire[25]) begin
  scanreg_dr[24]=scanreg_dr_wire[25];
end

 
always @(scanreg_dr_wire[26]) begin
  scanreg_dr[25]=scanreg_dr_wire[26];
end

 
always @(scanreg_dr_wire[27]) begin
  scanreg_dr[26]=scanreg_dr_wire[27];
end

 
always @(scanreg_dr_wire[28]) begin
  scanreg_dr[27]=scanreg_dr_wire[28];
end

 
always @(scanreg_dr_wire[29]) begin
  scanreg_dr[28]=scanreg_dr_wire[29];
end

 
always @(scanreg_dr_wire[30]) begin
  scanreg_dr[29]=scanreg_dr_wire[30];
end

 
always @(scanreg_dr_wire[31]) begin
  scanreg_dr[30]=scanreg_dr_wire[31];
end




 

ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_12 (scanreg_ctrl_wire[12],scanreg_ctrl[12]);
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_13 (scanreg_ctrl_wire[13],scanreg_ctrl[13] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_14 (scanreg_ctrl_wire[14],scanreg_ctrl[14] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_15 (scanreg_ctrl_wire[15],scanreg_ctrl[15] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_0 (scanreg_ctrl_wire[0],scanreg_ctrl[0]);
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_1 (scanreg_ctrl_wire[1],scanreg_ctrl[1] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_2 (scanreg_ctrl_wire[2],scanreg_ctrl[2] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_3 (scanreg_ctrl_wire[3],scanreg_ctrl[3] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_4 (scanreg_ctrl_wire[4],scanreg_ctrl[4] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_5 (scanreg_ctrl_wire[5],scanreg_ctrl[5] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_6 (scanreg_ctrl_wire[6],scanreg_ctrl[6] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_7 (scanreg_ctrl_wire[7],scanreg_ctrl[7] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_8 (scanreg_ctrl_wire[8],scanreg_ctrl[8] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_9 (scanreg_ctrl_wire[9],scanreg_ctrl[9] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_10 (scanreg_ctrl_wire[10],scanreg_ctrl[10] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_11 (scanreg_ctrl_wire[11],scanreg_ctrl[11] );
ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_16 (scanreg_ctrl_wire[16],scanreg_ctrl[16] );

ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF scff_ctrl_17 (scanreg_ctrl_wire[17],scanreg_ctrl[17] );





ST_ROM_LOLEAK_1024x64m32B2_TMl_lockup dff_SCTRLO_SE (SCTRLO);

  

// BEHAVIOURAL MODULE DESCRIPTION
// ================================

initial
begin
  // Define format for timing value
  $timeformat (-9, 6, " ns --", 10);
 
 `ifdef ST_MEM_SLM
  $slm_RegisterMemory(slm_handle, Words, Bits);
  `endif   
 
   reg_mem_block=0;
   flag_mem_block=0;
  
  
  `ifdef functional
  `else
   TimingViol_data=0;
   TimingViol_mask=0;
   `endif
 
 decoding_start=0;
  
   //Parameter Assignment
   
   reg_Fault_file_name = Fault_file_name; 
   reg_ConfigFault     = ConfigFault;
   reg_BinaryInit      = BinaryInit;
   reg_InitFileName    = InitFileName;
   reg_Initn_reset_value = Initn_reset_value;
   reg_File_load_time    = File_load_time;

   next_cycle_corrupt_func=0;
   next_cycle_corrupt_dft=0;
   init_pulse_done = 0;
   power_up_done = 0;
   file_loaded=1;
   debug_level= p_debug_level; 
   
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
       
  task_read_fault_file; 
   if(!INITNint) begin
    if(supply_ok ) begin 
      init_pulse_done = 1;
      power_up_done = 1;
     
    end 
   end 
        
   lastCK_func = CKint_func;
   lastCK_dft = CKint_dft;

 `ifdef ST_MEM_CONTENTS_SLEEP
   ptr=$fopen("MEMORY_CONTENTS_SLEEP_ASSERT.dat","w");
   $fclose(ptr);
   ptr=$fopen("MEMORY_CONTENTS_SLEEP_DEASSERT.dat","w");
   $fclose(ptr);
   ptr=$fopen("MEMORY_CONTENTS_SLEEP_INVALID.dat","w");
   $fclose(ptr);
 `endif 

#(message_control_time + `access_time); 
  if (debug_level === 2'b00) begin
    message_status = "All Message are Switched OFF";
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

  if  (debug_level > 2) 
          begin
          
   $display ("%m - %t ST_INFO: *****************************************", $realtime);
   $display ("%m - %t ST_INFO: The Model is Operating in %s MODE", $realtime, operating_mode);
   $display ("%m - %t ST_INFO: Please make sure that SDF is properly annotated otherwise dummy values will be used", $realtime);
   $display ("%m - %t ST_INFO: %s", $realtime, message_status);
   $display ("%m - %t ST_INFO: ***************************************", $realtime);
  end
 
end  // initial block ends

//+++++++++++++++++++++++++++++++ CONFIG FAULT IMPLEMETATION ENDS+++++++++++++++++++++++++++++++//
        
//INITN block starts
//================================
always @(INITNint  or supply_ok )
begin
 if (INITNint === 1'b0) begin
   if(supply_ok) begin
     init_pulse_done = 1;
     power_up_done = 1;
     lastCK_func=CKint_func;
     lastCK_dft=CKint_dft;
     next_cycle_corrupt_func = 0;
     next_cycle_corrupt_dft = 0;
       
   end 
 end        

 if (CKint_dft === 1'b1 && SE_reg !== 0 && ATPreg !== 0 && INITNreg === 1'b1 && STDBYreg === 1'b0 && SLEEPreg === 1'b0 && INITNint !== 1)
   begin
     ScanOutX;
     ScanChainX;
   end  
         
 if (init_pulse_done === 0 && INITNint !== 0) begin
     if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
 end
 
end//always @(INITNint)


// Functional CK block starts
//======================================
always @(CKint_func)
begin
   lastCK_func=CKreg_func;  
   CKreg_func=CKint_func;
 if(supply_ok === 1) begin
   if (init_pulse_done === 0) begin
        if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
   end
   else begin
      if (CKreg_func === 1'bX || (CKreg_func === 1'b1 && lastCK_func === 1'bx)) begin
        if (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && CSNint !== 1 && IGint !== 1 && DEint !== 1 && (ATPint !== 1 ||(ATPint === 1 && SEsys !== 1 && TBYPASSsys !== 1))) begin

         if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: CK pin  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime);  
         Invalid_next_cycle_func;
        end
      end
      else if (CKreg_func === 1'b1 && lastCK_func === 1'b0 ) begin
        time_CK_func_rise=$realtime;
        MEMEN_prev = MEMEN_reg;
        MEMEN_reg = MEMEN;
        CSNreg = CSNint;
        IGreg = IGint;
        DEreg = DEint;
        SE_reg = SEsys;
        TBYPASS_reg = TBYPASSsys;
        ATPreg = ATPint;
        INITNreg = INITNint;
        SLEEPreg = SLEEPint;
        STDBYreg = STDBYint;
    `ifdef functional
    `else
        `ifdef ST_MEM_SLM
                $slm_ReadMemory(slm_handle, Aint, Mem_last);
        `else
                Mem_last=Mem[Aint]; 
        `endif
    `endif 
        if (INITNreg === X && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin

            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.INITN pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg === X && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.SLEEP pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime);  
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg === X && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.STANDBY pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg === X && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
         
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.chip select  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg === X && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
         
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.IG pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg === X && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
         
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.Debug pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg === X && (SE_reg !== 1 && TBYPASS_reg !== 1))) begin

            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.ATP pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && ATPreg !== 0 && SE_reg === X && TBYPASS_reg !== 1) begin
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.SE pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && ATPreg !== 0 && SE_reg !== 1 && TBYPASS_reg === X) begin
         
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.TBYPASS pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if ((INITNreg === 1 && STDBYreg === 0 && SLEEPreg === 0 && CSNreg === 0 && IGreg === 0 && DEreg === 0 && (ATPreg === 0 ||(ATPreg === 1 && SE_reg === 0 && TBYPASS_reg === 0))) && WENint === X) begin
            // Uncertain write cycle

            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: write enable going to X  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end 
        else if (next_cycle_corrupt_func === 1) begin
          next_cycle_corrupt_func = X;
        end
        else if (next_cycle_corrupt_func === 1'bx) begin
          next_cycle_corrupt_func = 0;
        end 
        
        if (next_cycle_corrupt_func !== 1 ) begin 
         
          /*---------------------- File initialization -----------------*/
          
          if (INITNreg === 1 && STDBYreg === 0 && SLEEPreg === 0 && CSNreg === 0 && IGreg === 0 && DEreg === 0 && (ATPreg === 0 ||(ATPreg === 1 && SE_reg === 0 && TBYPASS_reg === 0)) && flag_mem_block === 1'b0) begin
                 Areg=Aint;
                 Dreg=Dint;
                 Mreg=Mint;
                 WENreg=WENint;     
             if ($realtime >= reg_File_load_time && file_loaded ) begin   
                `ifdef ST_MEM_SLM
                  if (reg_BinaryInit)
                     $slm_LoadMemory(slm_handle, reg_InitFileName, "VERILOG_BIN");
                  else
                     $slm_LoadMemory(slm_handle, reg_InitFileName, "VERILOG_HEX");
   
                `else
                  if (reg_BinaryInit)
                     $readmemb(reg_InitFileName, Mem, 0, Words-1);
                  else
                     $readmemh(reg_InitFileName, Mem, 0, Words-1);
                `endif
                 file_loaded = 0;
             end
   
             if (^Aint === X)
               ValidAddress = X;
             else if (Aint < Words)
               ValidAddress = 1;
             else    
               ValidAddress = 0;
   
             if (ValidAddress)
               `ifdef ST_MEM_SLM
                   $slm_ReadMemoryS(slm_handle, Aint, Mem_temp);
               `else
                    Mem_temp = Mem[Aint];
               `endif
             else
                Mem_temp = WordX;  
          
     /*---------------------- Normal Read and Write -----------------*/
     
             if (WENint === 1 && next_cycle_corrupt_func === 0) begin
               ReadCycle(Aint);
             end
   
                
          
          end //  if (MEMEN === 1'b1 
       
        end  // if (next_cycle_corrupt_func === 0
      
      end // if (CKint = 1   
   end // if (init_pulse_done === 1           
 end 
end // always @(CKint_func)
        
always @(MEMEN)
begin
 if(supply_ok === 1) begin
  if ((INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && CSNint !== 1 && IGint !== 1 && DEint !== 1 && (ATPint !== 1 ||(ATPint === 1 && SEsys !== 1 && TBYPASSsys !== 1))) && CKint_func === 1'bx) begin

    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.CK pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
    Invalid_next_cycle_func;
  end
 end 
end

// DFT CK block starts
//======================================
always @(CKint_dft) 
begin
   lastCK_dft=CKreg_dft;
   CKreg_dft=CKint_dft;
 if(supply_ok === 1) begin
   if (init_pulse_done === 0) begin
     if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
   end
   else begin
     if (CKreg_dft === 1'bX || (CKreg_dft === 1'b1 && lastCK_dft === 1'bx)) begin
       if (INITNint !== 0 && SLEEPint !== 1 && STDBYint !== 1 && ATPint !== 0 ) begin

         if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: DFT clock  Memory State Machine is corrupted. ScanChains and ScanOuts Corrupted ",$realtime); 
         Invalid_next_cycle_dft;
         if (TBYPASSsys !== 0 && ATPint !== 0 && SEsys !== 1) begin
           WriteOutX;
         end
       end
     end 
     
     if(CKint_dft === 0 && lastCK_dft === 1) begin
      if(ATPreg === 1'b1 && INITNreg === 1'b1 && SLEEPreg === 1'b0 && STDBYreg === 1'b0) begin
       if(SE_reg === 1'b1 && SEsys === 1'b0) begin
        if(TBYPASSint === 1'b1) begin   
    
    OutReg_data_scan = { scanreg_dr[0],
scanreg_dr[1],
scanreg_dr[2],
scanreg_dr[3],
scanreg_dr[4],
scanreg_dr[5],
scanreg_dr[6],
scanreg_dr[7],
scanreg_dr[8],
scanreg_dr[9],
scanreg_dr[10],
scanreg_dr[11],
scanreg_dr[12],
scanreg_dr[13],
scanreg_dr[14],
scanreg_dr[15],
scanreg_dr[16],
scanreg_dr[17],
scanreg_dr[18],
scanreg_dr[19],
scanreg_dr[20],
scanreg_dr[21],
scanreg_dr[22],
scanreg_dr[23],
scanreg_dr[24],
scanreg_dr[25],
scanreg_dr[26],
scanreg_dr[27],
scanreg_dr[28],
scanreg_dr[29],
scanreg_dr[30],
scanreg_dr[31],scanreg_dl[0],
scanreg_dl[1],
scanreg_dl[2],
scanreg_dl[3],
scanreg_dl[4],
scanreg_dl[5],
scanreg_dl[6],
scanreg_dl[7],
scanreg_dl[8],
scanreg_dl[9],
scanreg_dl[10],
scanreg_dl[11],
scanreg_dl[12],
scanreg_dl[13],
scanreg_dl[14],
scanreg_dl[15],
scanreg_dl[16],
scanreg_dl[17],
scanreg_dl[18],
scanreg_dl[19],
scanreg_dl[20],
scanreg_dl[21],
scanreg_dl[22],
scanreg_dl[23],
scanreg_dl[24],
scanreg_dl[25],
scanreg_dl[26],
scanreg_dl[27],
scanreg_dl[28],
scanreg_dl[29],
scanreg_dl[30], scanreg_dl[scanlen_l-1]}; 
         for (i = 0; i < Bits; i = i + 1)
         begin
          if (OutReg_data[i] !== OutReg_data_scan[i])
          OutReg_data[i] = WordX[i];
         end  //for (i = 0; i <  
        OutReg_data <= OutReg_data_scan;
        end 
       end
      end
     end 
     
     else if (CKreg_dft === 1'b1 && lastCK_dft === 1'b0 ) begin
       SE_reg = SEsys;
       TBYPASS_reg = TBYPASSsys;
       ATPreg = ATPint;
       INITNreg = INITNint;
       SLEEPreg = SLEEPint;
       STDBYreg = STDBYint;
       MEMEN_dft_prev = MEMEN_dft_reg;
       MEMEN_dft_reg = MEMEN_dft;
       if (INITNreg === X && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
           if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: INITN pin  Memory State Machine is corrupted. ScanChains and ScanOuts Corrupted ",$realtime); 
           Invalid_next_cycle_dft;
           if (TBYPASSsys !== 0 && ATPint !== 0 && SEsys !== 1) begin
             WriteOutX;
           end
       end
       else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg === X && ATPreg !== 0 ) begin      
           if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: SLEEP pin  Memory State Machine is corrupted. ScanChains and ScanOuts Corrupted ",$realtime); 
           Invalid_next_cycle_dft;
           if (TBYPASSsys !== 0 && ATPint !== 0 && SEsys !== 1) begin
             WriteOutX;
           end
       end
       else if (INITNreg !== 0 && STDBYreg === X && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
           if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: STDBY pin  Memory State Machine is corrupted. ScanChains and ScanOuts Corrupted ",$realtime); 
           Invalid_next_cycle_dft;
           if (TBYPASSsys !== 0 && ATPint !== 0 && SEsys !== 1) begin
             WriteOutX;
           end
       end
       else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg === X ) begin      
           if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: ATP pin  Memory State Machine is corrupted. ScanChains and ScanOuts Corrupted ",$realtime); 
           Invalid_next_cycle_dft;
           if (TBYPASSsys !== 0 && ATPint !== 0 && SEsys !== 1) begin
             WriteOutX;
           end
       end
       else if (next_cycle_corrupt_dft === 1'b1) begin 
         next_cycle_corrupt_dft = X;
       end 
       else if (next_cycle_corrupt_dft === 1'bx) begin
         next_cycle_corrupt_dft = 0;
       end
       
       if (next_cycle_corrupt_dft === 0 ) begin
         
         if (INITNreg === 1 && STDBYreg === 0 && SLEEPreg === 0 && ATPreg === 1 && flag_mem_block === 1'b0) begin
           
           if (TBYPASSsys === 1 && ATPint === 1 && SEsys === 0) begin
              OutReg_data_tbypass = Dint;
              for (i = 0; i < Bits; i = i + 1)
              begin
               if (OutReg_data_tbypass[i] !== OutReg_data[i])
                 OutReg_data[i] = WordX[i];
              end//for (i = 0; i < */ 
              OutReg_data <= OutReg_data_tbypass;
           end
           
             scan_acquire;
             SCTRLOint = scanreg_ctrl[scanlen_ctrl -1];
    
           if (SCTRLOint !== SCTRLO_data) begin 
              SCTRLO_data=1'bx;
              SCTRLO_data <= SCTRLOint;
             end
    
         end //MEMEN_dft == 1        
       end // if ( next_cycle_corrupt_dft
       
     end // if (CKint_dft === 1'b1
     if (next_cycle_corrupt_dft === 0 ) begin 
       if (SE_reg !== 0) begin
         if (INITNreg === 1 && STDBYreg === 0 && SLEEPreg === 0 && ATPreg === 1  && flag_mem_block === 1'b0) begin
           scan_shift;
         end
       end
     end // if ( next_cycle_corrupt_dft    
   end // if (init_pulse_done 
 end // if (supply_ok 
end // always @(CKint_dft)

always @(MEMEN_dft)
begin
 if(supply_ok === 1) begin
  if ((INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 ) && CKint_dft === 1'bx)  begin
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.MEMEN_dft and clock should not be X at this time instant. ScanChains and ScanOuts Corrupted ",$realtime); 
    Invalid_next_cycle_dft;
    
    if (TBYPASSsys !== 0 && ATPint !== 0 && SEsys !== 1) begin
      WriteOutX;
    end
  end
  if ( MEMEN_dft !== 0 && TBYPASSsys === X && SEsys !== 1) begin
     WriteOutX;
     OutReg_data = WordX; 
     delOutReg_data=WordX;
  end
 end 
end //always @(MEMEN_dft

always @(TBYPASSsys or ATPint)
begin
   if(supply_ok === 1'b1) begin 
    if (TBYPASSsys === 1 && ATPint === 1 && SEsys === 0) begin
      if ((SEsys === 1'b0) || (CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg === X && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
      else if ((SEsys === 1'b0) || (CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg === X && ATPreg !== 0 ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
      else if ((SEsys === 1'b0) || (CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg === X ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
      else if ((SEsys === 1'b0) || (CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg !== 0 && STDBYreg === X && SLEEPreg !== 1 && ATPreg !== 0 ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
    end  
    else if ((TBYPASSsys === X && ATPint !== 0 && SEsys !== 1)) begin
     OutReg_data = WordX;
     delOutReg_data = WordX;
    end
    else if ((TBYPASSsys !== 0 && ATPint === X && SEsys !== 1) ) begin
     OutReg_data = WordX;
     delOutReg_data = WordX;
    end
    else if ((TBYPASSsys !== 0 && ATPint !== 0 && SEsys === X)) begin
     OutReg_data = WordX;
     delOutReg_data = WordX;
    end
 end 
end //always @(TBYPASSint

always @(SEsys)
begin
 if(supply_ok === 1'b1) begin 
  if(CKint_dft === 0 && ATPint === 1'b1 && INITNreg === 1'b1 && SLEEPreg === 1'b0 && STDBYreg === 1'b0) begin
    if(SE_reg === 1'b1 && SEsys === 1'b0) begin
      if(TBYPASSsys === 1'b1) begin
  
        OutReg_data_scan = { scanreg_dr[0],
scanreg_dr[1],
scanreg_dr[2],
scanreg_dr[3],
scanreg_dr[4],
scanreg_dr[5],
scanreg_dr[6],
scanreg_dr[7],
scanreg_dr[8],
scanreg_dr[9],
scanreg_dr[10],
scanreg_dr[11],
scanreg_dr[12],
scanreg_dr[13],
scanreg_dr[14],
scanreg_dr[15],
scanreg_dr[16],
scanreg_dr[17],
scanreg_dr[18],
scanreg_dr[19],
scanreg_dr[20],
scanreg_dr[21],
scanreg_dr[22],
scanreg_dr[23],
scanreg_dr[24],
scanreg_dr[25],
scanreg_dr[26],
scanreg_dr[27],
scanreg_dr[28],
scanreg_dr[29],
scanreg_dr[30],
scanreg_dr[31],scanreg_dl[0],
scanreg_dl[1],
scanreg_dl[2],
scanreg_dl[3],
scanreg_dl[4],
scanreg_dl[5],
scanreg_dl[6],
scanreg_dl[7],
scanreg_dl[8],
scanreg_dl[9],
scanreg_dl[10],
scanreg_dl[11],
scanreg_dl[12],
scanreg_dl[13],
scanreg_dl[14],
scanreg_dl[15],
scanreg_dl[16],
scanreg_dl[17],
scanreg_dl[18],
scanreg_dl[19],
scanreg_dl[20],
scanreg_dl[21],
scanreg_dl[22],
scanreg_dl[23],
scanreg_dl[24],
scanreg_dl[25],
scanreg_dl[26],
scanreg_dl[27],
scanreg_dl[28],
scanreg_dl[29],
scanreg_dl[30], scanreg_dl[scanlen_l-1]}; 
        for (i = 0; i < Bits; i = i + 1)
        begin
         if (OutReg_data[i] !== OutReg_data_scan[i])
          OutReg_data[i] = WordX[i];
        end  //for (i = 0; i <  
        OutReg_data <= OutReg_data_scan;
      end
    end
  end
  if (TBYPASSsys === 1 && ATPint === 1 && SEsys === 0) begin
      if ((CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg === X && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
      else if ((CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg === X && ATPreg !== 0 ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
      else if ((CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg === X ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
      else if ((CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg !== 0 && STDBYreg === X && SLEEPreg !== 1 && ATPreg !== 0 ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
  end 
  else if ((TBYPASSsys === X && ATPint !== 0 && SEsys !== 1)) begin
     OutReg_data = WordX;
     delOutReg_data = WordX;
    end
  else if ((TBYPASSsys !== 0 && ATPint === X && SEsys !== 1)) begin
     OutReg_data = WordX;
     delOutReg_data = WordX;
    end
  else if ((TBYPASSsys !== 0 && ATPint !== 0 && SEsys === X)) begin
     OutReg_data = WordX;
     delOutReg_data = WordX;
    end
 end   
end

//assign output data
`ifdef functional        

   
always @(SCTRLOint)
#`access_time delSCTRLO_data<=SCTRLOint;


always @(OutReg_data)
   #`access_time delOutReg_data = OutReg_data;
`else
`endif

/***************************** Embeded switch functionality starts here ***********************************/





always @(STDBYint)
begin
  if (supply_ok === 1'b1) begin
   if (init_pulse_done === 0)
     begin
       if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
     end
   else if (CKint_dft === 1'b1 && SE_reg !== 0 && ATPreg !== 0 && INITNreg === 1'b1 && SLEEPreg === 1'b0 && STDBYreg === 1'b0 && STDBYint !== 1'b0)
    begin
      ScanOutX;
      ScanChainX;
    end
  end
end



always @(SLEEPint)
begin



  if (supply_ok === 1'b1) begin
   if (init_pulse_done === 0)
     begin
       if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
     end
   else if (CKint_dft === 1'b1 && SE_reg !== 0 && ATPreg !== 0 && INITNreg === 1'b1 && STDBYreg === 1'b0 && SLEEPreg === 1'b0 && SLEEPint !== 0)
    begin
      ScanOutX;
      ScanChainX;
    end
  end

// if (init_pulse_done === 0)
//   begin
//     if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
//   end
//
// else if ( SLEEPint !== 1 && (supply_ok !==1) ) begin
//    WriteOutX;
//    OutReg_data = WordX; 
//    delOutReg_data=WordX;
//    ScanOutX;//immediately;
//    delScanOutX;//immediately;
//    ScanChainX;
//    if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Invalid state of power supplies with sleep/Power down signal being low.This scenario can lead to high dc currents and some reliability issues Memory,Output,ScanChains,ScanOuts & Redundancy chain are corrupted. ",$realtime); 
// end

 print_sleep;    
 lastSLEEP=SLEEPint;
end

/********************************** Embeded switch functionality ends here *******************************/

task print_sleep;
begin
  if (SLEEPint === 1'b0) begin
      if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: SLEEP pin has been deasserted.The contents of memory are dumped in a file named MEM_CONTENTS_SLEEP_INACTIVE in the current simulation directory. ",$realtime);
      `ifdef ST_MEM_CONTENTS_SLEEP
        ptr=$fopen("MEMORY_CONTENTS_SLEEP_DEASSERT.dat","a");
        for(memcnt = 0; memcnt < Words; memcnt = memcnt+ 1) begin 
         $fdisplay(ptr,"contents at location %d are = %b ",memcnt,Mem[memcnt],$realtime);
        end
        $fclose(ptr);
      `endif
  end  
  else if (SLEEPint === 1'b1) begin
      if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: SLEEP pin has been asserted.The contents of memory are dumped in a file named MEM_CONTENTS_SLEEP_ACTIVE in the current simulation directory. ",$realtime);
      `ifdef ST_MEM_CONTENTS_SLEEP
        ptr=$fopen("MEMORY_CONTENTS_SLEEP_ASSERT.dat","a");
        for(memcnt = 0; memcnt < Words; memcnt = memcnt+ 1) begin 
         $fdisplay(ptr,"contents at location %d are = %b ",memcnt,Mem[memcnt],$realtime);
        end
        $fclose(ptr);
      `endif

  end        
  else begin
      if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: SLEEP pin is at an invalid state.The contents of memory are dumped in a file named MEM_CONTENTS_SLEEP_INVALID in the current simulation directory. ",$realtime);
      `ifdef ST_MEM_CONTENTS_SLEEP
        ptr=$fopen("MEMORY_CONTENTS_SLEEP_INVALID.dat","a");
        for(memcnt = 0; memcnt < Words; memcnt = memcnt+ 1) begin 
         $fdisplay(ptr,"contents at location %d are = %b ",memcnt,Mem[memcnt],$realtime);
        end
        $fclose(ptr);
      `endif
  end        
end
endtask


//// power pins func ends
always @( vddmreg or gndmreg or r_supply_trigger)
begin
  if ( vddmreg !== 1'b1  || gndmreg !== 1'b0) begin
     if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Invalid state of power supplies. Memory,Output,ScanChains,ScanOuts & Redundancy chain are corrupted. ",$realtime);
     WriteOutX;
     ScanChainX;
     ScanOutX;
     delScanOutX;//immediately;
     OutReg_data = WordX; 
     delOutReg_data=WordX;
     WriteOutX;
     init_pulse_done = 0;
  end
end

/*
always @(negedge supply_ok)
begin
 
 if (init_pulse_done === 0)
    begin
      if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
 end

 else if (SLEEPint !== 1) begin
     WriteOutX;
     ScanChainX;
     ScanOutX;
     delScanOutX;//immediately;
     OutReg_data = WordX; 
     delOutReg_data=WordX;
     WriteOutX;
       init_pulse_done = 0;
    if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Invalid state of power supplies with sleep/Power down signal being low.This scenario can lead to high dc currents and some reliability issues Memory,Output,ScanChains,ScanOuts & Redundancy chain are corrupted. ",$realtime);
     @(posedge supply_ok)
      begin
        if (!INITNint) begin
         init_pulse_done = 1;
        end  
        else begin
         if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Initialization pulse required as supplies have been turned on after being turned off in SLEEP = 0 mode ",$realtime); 
        end
       
     end
 end
end

always @( gndmreg) begin
 if (init_pulse_done === 0)
    begin
      if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
 end

 else if (gndmreg !== 0  ) begin
   corrupt_all;
   if (SLEEPint === 1) begin
     if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: In sleep/deep sleep mode the memory must get powered up/down in a particular sequence as defined in spec.The power sequencing has been violated at this instant of time.Ground must be maintained at 0 Memory,Output,ScanChains,ScanOuts & Redundancy chain are corrupted.All further operations(R/W,Scan,TBYPASS etc) on memory are blocked. ",$realtime);
     mem_blocked;
   end
 end
end


always @(vddmreg ) begin
 if (init_pulse_done === 0)
    begin
      if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
 end

 else if (vddmreg !==1  ) begin
  if (SLEEPint === 1'b1 && core_supply_ok === 1 ) begin
     WriteOutX;
   OutReg_data = WordX; 
   delOutReg_data=WordX;  
   ScanChainX;
   ScanOutX;//immediately; 
   delScanOutX;//immediately;
  end  
  else if (SLEEPint !== 1) begin
     WriteOutX;
   OutReg_data = WordX; 
   delOutReg_data=WordX;
   ScanChainX;
   ScanOutX;//immediately;
   delScanOutX;//immediately;
  end   
 end
end


*/

always @(gndmreg) begin
 if (gndmreg === 0) begin
  if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: gndm or Common ground is being powered up. ",$realtime);
 end
 else if (gndmreg === 1) begin
  if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: gndm or Common ground is being powered down. ",$realtime);
 end
 else begin
  if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Invalid value on power supply pin ",$realtime);
 end
end




always @(vddmreg) begin
 if (vddmreg === 0) begin 
  if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: vddm or Array Power supply is being powered down. ",$realtime);
 end
 else if (vddmreg === 1) begin
  if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: vddm or Array Power supply is being powered up. ",$realtime);
 end
 else begin
  if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Invalid value on power supply pin ",$realtime);
 end 
end



assign supply_ok          =  (vddmreg === 1'b1 && vddmoreg === 1'b1  && gndmreg === 1'b0 && ((SLEEPint & PSWLARGEMAint) === 1'b0) && ((SLEEPint & PSWLARGEMPint) === 1'b0) && ((SLEEPint & PSWSMALLMAint) === 1'b0) && ((SLEEPint & PSWSMALLMPint) === 1'b0)) ? 1'b1 : 1'b0;
assign core_supply_ok     =  (vddmreg === 1'b1 && gndmreg === 1'b0) ? 1'b1 : 1'b0;
assign peri_supply_ok     =  (vddmreg === 1'b1 && gndmreg === 1'b0  ) ? 1'b1 : 1'b0;




always @(vddmoreg) begin 
     if(vddmoreg !==  1'b1 ) begin 
       corrupt_all ;
    end
end 



`ifdef functional
`else


always @(TimingViol_addr)
// tas or tah
begin
#0
  if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Address pin timing violation Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  end
  if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
      scanreg_ctrl={scanlen_ctrl{1'bx}}; 
      SCTRLOint=X;
      `ifdef functional
      `else
      SCTRLO_data=1'bx;
      `endif
  end
end



always @(TimingViol_CSN )
// tps or tph 
begin
#0
  if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: CSN timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  end
  if (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 ) begin      
   scanreg_ctrl={scanlen_ctrl{1'bx}}; 
   SCTRLOint=X;
   `ifdef functional
   `else
   SCTRLO_data=1'bx;
   `endif
  end
end

always @(TimingViol_tcycle )
//tcycle
begin
#0
   if (MEMEN_dft !== 0 && MEMEN_dft_prev !== 0) begin
    Invalid_next_cycle_dft;
   end
   if (MEMEN !== 0 && MEMEN_prev !== 0) begin
    Invalid_next_cycle_func;
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: CK pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime);
   end
end

always @(TimingViol_tckl )
// tckl 
begin
#0
   if (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 ) begin      
    Invalid_next_cycle_dft;
   end
   if (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && CSNint !== 1 && IGint !== 1 && DEint !== 1 && (ATPint !== 1 ||(ATPint === 1 && SEsys !== 1 && TBYPASSsys !== 1))) begin
    Invalid_next_cycle_func;
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: CK pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
   end
end

always @(TimingViol_tckh) begin
#0
   if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
    Invalid_next_cycle_dft;
   end
   if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
    Invalid_next_cycle_func;
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: CK pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
   end
end


always @(TimingViol_tcycle_se )
//tcycle_se
begin
#0
   if (MEMEN_dft !== 0 && MEMEN_dft_prev !== 0) begin
    Invalid_next_cycle_dft;
   end
end

always @(TimingViol_tckl_se  )
begin
#0
   if (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 ) begin      
    Invalid_next_cycle_dft;
   end
end

always @(TimingViol_tckh_se) begin
#0
  if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
    Invalid_next_cycle_dft;
   end
end

always @(TimingViol_tbist) begin
#0
   if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
    ScanChainX;
    ScanOutX;
    delScanOutX;       
   end
   if (TBYPASSint !== 1'b0) begin 
    WriteOutX;
   end 
   if (INITNreg !==0 && STDBYreg !== 1 && TBYPASS_reg !== 1 && SLEEPreg !== 1 && SE_reg !== 1 && IGreg !== 1 && DEreg !== 1) begin
    Invalid_next_cycle_func;
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: TBIST pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
   end
end

always @(TimingViol_ls) begin
 #0 
   if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IGreg !== 1 && (HSint !== X) && (^RMint === 1'b0) && (^WMint === 0)) begin
    Invalid_next_cycle_func;
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: LS pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
   end
end







always @(TimingViol_stdby)
begin
#0
  if (CSNreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IGreg !== 1 && DEreg !== 1) begin 
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: STDBY pin timing violation Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  end  
  if (ATPreg !== 0) begin 
   Invalid_next_cycle_dft;
  end
end


always @(TimingViol_se) begin
#0
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: SE timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
    ScanChainX;
    ScanOutX;
    delScanOutX;       
  end
end

always @(TimingViol_sctrli) begin
  TimingViol_sctrli_flag = 1'b1;
end


always @(TimingViol_initnl) begin
init_pulse_done=0;
WriteOutX;
OutReg_data = WordX; 
delOutReg_data=WordX;
ScanOutX;
delScanOutX;
ScanChainX;
end

always @(TimingViol_initn) begin
#0
  if (SLEEPreg !== 1 && STDBYreg !== 1 && CSNreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IGreg !== 1 && DEreg !== 1) begin
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: INITN timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  end  
  if (SLEEPreg !== 1 && STDBYreg !== 1 && ATPreg !== 0) begin
   Invalid_next_cycle_dft;
  end
end

always @(TimingViol_ig) begin
#0
  if (SLEEPreg !== 1 && STDBYreg !== 1 && CSNreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && INITNreg !== 0 && DEreg !== 1) begin
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: IG pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  end  
  if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
   ScanChainX;
   ScanOutX;
   delScanOutX;       
  end
end

always @(TimingViol_atp) begin
#0
  if (SLEEPreg !== 1 && STDBYreg !== 1 && TBYPASSsys !== 1 && SEsys !== 1 && INITNreg !== 0 && DEreg !== 1) begin  
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: ATP pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  end  
  if (SLEEPreg !== 1 && STDBYreg !== 1 && INITNreg !== 0) begin
   Invalid_next_cycle_dft;
  end
end


always @(TimingViol_rm) begin
#0
   if (INITNreg !== 0 && SLEEPreg !== 1 && STDBYreg !== 1 && CSNreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IGreg !== 1 && (LSint !== X) && (HSint !== X) && (^WMint === 0)) begin 
    Invalid_next_cycle_func;
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: RM pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime);  
   end
end



`endif


endmodule




module ST_ROM_LOLEAK_1024x64m32B2_TMl_SCFF(TI,Q);
input Q;
inout TI;
endmodule

module ST_ROM_LOLEAK_1024x64m32B2_TMl_lockup(Q);
input Q;
endmodule


`endcelldefine


 `undef access_time 
 `undef retain_time
 `undef st_msg_cntrl_time 







/****************************************************************
--  Description         :  Verilog Model 
--  ModelVersion        : 1.1.a
--  Date                : Jan, 2014
--  Changes Made by	: PS
--  Modifications in this release : Bug Fix : Compilation Error in Allpins model
--
****************************************************************/

/******************** START OF HEADER****************************
   This Header Gives Information about the parameters & options present in the Model
   
   words = 1024
   bits  = 64
   mux   = 16 
   
   
   margin_control = yes 
   
   
   
   
   Scan = Yes
   
   
   Bist Mux = Yes
   
  
    ------------------------------------------------------------------------------------
     Signal Name             | Description       |             Port Mode        | Active When
                             |                   |          r    |  w   | rw    |
   ------------------------------------------------------------------------------------

    
    IG    Input Gate Enable           x      x      na       High     
    ATP            ATPG Enable                 x      x      na       High     
    INITN                 INITN pin                   x      x      na       Low
    
    LS             Low Speed pin               x      x      na       High 
    Q 	        Data out	            x      na     na       -
    A              Address                     x      x      na       high and low
    
    CK                Clock	                    x      x      na       posedge
    CSN          Chip Enable                 x      x      na       low
    
    RM         Read Margins                 x      x      na       High 
    SCTRLI         Scan Input (Control)
    SCTRLO        Scan Output (Control)
    SE          Scan Enable pin 
    STDBY              Standby pin                 x      x      na       High
    
     
    TBIST          Bist Enable Pin 
    TA         Bist Read Address
    TCSN     Bist Read Chip Select

**********************END OF HEADER ******************************/
`celldefine
`ifdef ST_TIMESCALE
  `ST_TIMESCALE
`else
  `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif


`ifdef ST_DELAY_SEQ
  `define access_time  `ST_DELAY_SEQ
`else
 `define access_time 0.001
`endif

`ifdef ST_MEM_RETAIN_TIME
 `define retain_time `ST_MEM_RETAIN_TIME
 `else
  `define retain_time 0.001
`endif

`ifdef ST_MSG_CONTROL_TIME
      `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
      `define st_msg_cntrl_time 0
`endif      


//********************************************//
// ST_ROM_LOLEAK_1024x64m16B2_TMl model for  Verilog //
//********************************************//




module ST_ROM_LOLEAK_1024x64m16B2_TMl (A,ATP,CK,CSN,IG,INITN ,LS  ,Q ,RM  ,SCTRLI,SCTRLO,SE, STDBY  ,TA,TBIST   ,TCSN  ); 

parameter 
     `ifdef ST_NO_MSG_MODE
      p_debug_level = 2'b00,
     `elsif ST_ALL_MSG_MODE
      p_debug_level = 2'b11,
     `elsif ST_ERROR_ONLY_MODE
      p_debug_level = 2'b01,
     `else 
      p_debug_level = 2'b10,
     `endif
    
    
        Fault_file_name = "ST_ROM_LOLEAK_1024x64m16B2_TMl_faults.txt",
        `ifdef ST_MEM_CONFIGFAULT
        ConfigFault = 1,
        `else
        ConfigFault = 0,
        `endif
        max_faults = 1024+2,
         
        BinaryInit = 0,  
        InitFileName = "boot/boot_code.cde",
        message_control_time = `st_msg_cntrl_time,
        File_load_time=0,
        Initn_reset_value={64{1'b0}},
        InstancePath = "ST_ROM_LOLEAK_1024x64m16B2_TMl";
    
    localparam
        Words = 1024,
        Bits = 64,
        Addr = 10,
        mux = 16,

        bank = 2, 
        Red_extrabit=0,

        mux_bits=4,
        Rows = Words/mux;
    localparam 
        
           scanchains=3,    
        
        scanlen_ctrl=18,  
        

        
        scanlen_r=(Bits)/2,
        
        scanlen_l=(Bits+1)/2 ; 


    localparam
        read_margin_size = 3,
        write_margin_size = 2;
   
    localparam
        WordX = {Bits{1'bx}},
        AddrX = {Addr{1'bx}},
        Word0 = {Bits{1'b0}},
        X = 1'bx;
    

 //  INPUT OUTPUT PORTS DECLARATION DONE SEPARATELY FOR SPREG and ROM
 // ========================
        output [Bits-1 : 0] Q;
         
        output SCTRLO;
        input SE,SCTRLI;
        
        input [Addr-1 : 0] A;
        
        input [read_margin_size-1 : 0] RM;
        
         
        input CK,CSN,INITN,IG,ATP; 
        
        input LS; 
        
        input [Addr-1 :0 ] TA;
input TBIST,TCSN ;
        
        input STDBY;
        
        
        

        

//  WIRE DECLARATION RELATED TO POWER PINS
//  ======================================
	
        wire supply_ok;
        
        wire core_supply_ok;
        wire peri_supply_ok;
        wire gndmint, gndsmint;
        
        wire vddmint,vddsmint; 
        wire vddmoint;
        
        
//  WIRE DECLARATION 
//  ==================
        wire [Bits-1 : 0] CSWEMTBYPASS;
        wire [Bits-1 : 0] Dint,Mint;
        wire [Bits-1 : 0] Dsys,Msys;
	wire [Addr-1 : 0] Aint;
        wire [Addr-1 : 0] Asys;
                
	wire [13 : 0] Aint_capt;  
	wire CKint_dft;
	wire CKint_func;
	wire CSNint;
        wire MEMEN;
        wire cond_sdf_trms;
        wire cond_sdf_tlss; 
        wire MEMEN_dft;
        wire cond_sdf_tses;
        wire TSE;

	wire WENint;
	wire WENsys;
        wire SLEEPint;
        wire STDBYint;
        wire cond_sdf_tinitns;
        wire SEint;
        wire SEsys;
        wire SCTRLIint;
        wire SDLIint;
        wire SDRIint;
        
        wire INITNint;
        wire TBYPASSint;
        wire TBYPASSsys;
        wire LSint; 
        wire HSint; 
        wire ATPint;
        wire DEint;
        wire [Addr-1 : 0] TAint;
        wire TBISTint;
        wire TBISTsys;
        wire TCSNint;
        wire TEDint;
        wire TODint;
        wire TEMint;
        wire TOMint;
        wire [Bits-1 : 0] TMint;
        wire [Bits-1 : 0] TDint;
        wire TWENint;
        wire IGint;
        wire IGbuf;
        wire CSNbuf;
        wire WENbuf;
        wire [read_margin_size-1:0] RMint;
        wire [write_margin_size-1:0] WMint;

        //Wires for scan chains
        //  ====================     
        wire [scanlen_ctrl -1:0]scanreg_ctrl_wire;
        wire [scanlen_l -1:0]  scanreg_dl_wire; 
        wire [scanlen_r -1:0]  scanreg_dr_wire; 
   
        wire [scanlen_l -1:0]  scanreg_ml_wire; 
        wire [scanlen_r -1:0]  scanreg_mr_wire; 

//  REG DECLARATION
//  ====================     
        reg MEMEN_reg;
        reg MEMEN_prev;
        reg reg_mem_block;
        reg flag_mem_block;
        reg SCTRLIint_temp;
        reg SDLIint_temp;
        reg SDRIint_temp;
        reg SMLIint_temp;
        reg SMRIint_temp;

        //  REG DECLARATION
        //  ====================
        reg SCTRLOint;
        
        reg next_cycle_corrupt_func;
        reg next_cycle_corrupt_dft;
        reg [Bits-1 : 0] delOutReg_data;//delayed Output Register
        reg [Bits-1 : 0] OutReg_data;   // Data Output register
        reg [Bits-1 : 0] OutReg_data_tbypass;   // Data Output register
        reg [Bits-1 : 0] OutReg_data_scan;   // Data Output registe
        reg [Bits-1 : 0] OutReg_rado_retained;   // register for retaining rado data when SLEEP --> 1
        reg delSCTRLO_data,SCTRLO_data;      // delayed Output Register
        reg delSDLO_data,SDLO_data;      // delayed Output Register
        reg delSDRO_data,SDRO_data;      // delayed Output Register
        
        
        // SCAN CHAINS register
        reg [scanlen_ctrl -1:0] scanreg_ctrl; 
        reg [scanlen_l -1:0]  scanreg_dl; 
        reg [scanlen_r -1:0]  scanreg_dr; 
  
        
        
        reg lastCK_dft,CKreg_dft;
        reg lastCK_func,CKreg_func;
        reg lastSLEEP;
        reg lastPSWLARGEMP,lastPSWLARGEMA,lastPSWSMALLMP,lastPSWSMALLMA;
        reg CSNreg;
        reg init_pulse_done; //if == 1 then it implies that initb low pulse has been applied
        reg power_up_done; //if == 1 then it implies that power up has been done

        `ifdef ST_MEM_SLM
        `else
        reg [Bits-1 : 0] Mem [Words-1 : 0];       // RAM array
        `endif
        reg [Bits-1 :0] Mem_temp; 
        reg [Bits-1 :0] Mem_slm; 
	reg ValidAddress;
	reg ValidDebugCode;
        reg decoding_start;
        reg file_loaded;
        reg [Bits-1 :0] Dreg;
        reg [Bits-1 :0] Mreg;
        reg WENreg;
        reg [Addr-1 :0] Areg;
        reg SE_reg;
        reg TBYPASS_reg;
        reg INITNreg;
        reg IGreg;
        reg DEreg;
        reg SLEEPreg;
        reg STDBYreg;
        reg ATPreg;
        reg MEMEN_dft_reg;
        reg MEMEN_dft_prev;

        //parameter registers
        reg [2047:0] reg_Fault_file_name;
        reg reg_ConfigFault;
        reg reg_BinaryInit;
        reg [2047:0] reg_InitFileName;
        reg [Bits -1 :0] reg_Initn_reset_value;
        time reg_File_load_time;

        //Power Supply Registers        
        reg vddmireg;
        reg vddmoreg;
        reg vddmreg;
        reg vddsmreg;
        reg gndmreg;
        reg gndsmreg;        

  /* This register is used to force all warning messages 
  ** OFF during run time.
  ** It is a 2 bit register.
  ** USAGE :
  ** debug_level_off = 2'b11 -> ALL MESSAGES(ST_INFO/ST_WARNINGS/ST_ERRORS) will be DISPLAYED 
  ** debug_level = 2'b10     -> ONLY ST_WARNINGS/ST_ERRORS WILL BE DISPLAYED.
  ** debug_level = 2'b01     -> ONLY ST_ERRORS WILL BE DISPLAYED.
  ** debug_level = 2'b00     -> NO MESSAGES will be DISPLAYED.
  */ 
        reg [1:0] debug_level;
        reg [8*10: 0] operating_mode;
        reg [8*44: 0] message_status;

        integer i, k, j, l,m,q,w,r,s,num1,redcnt,n,num2,FirstHalf,Bfaileff,memcnt,ptr;
        integer decoder[Bits-1:0];
        `ifdef ST_MEM_SLM
           integer slm_handle;
        `endif


        //************************************************************
        //****** CONFIG FAULT IMPLEMENTATION VARIABLES*************** 
        //************************************************************ 

        integer file_ptr, ret_val;
        integer fault_word;
        integer fault_bit;
        integer fcnt, Fault_in_memory,faultnum,stop_loop,count;
        integer t;  
        integer FailureLocn [max_faults -1 :0];
        integer Failurebit [max_faults -1 :0];
        reg [100 : 0] stuck_at;
        reg [200 : 0] tempStr;
        reg [7:0] fault_char;
        reg [7:0] fault_char1; // 8 Bit File Pointer
        reg [Addr -1 : 0] std_fault_word;
        reg [max_faults -1 :0] fault_repair_flag;
        reg [max_faults -1 :0] dont_insert_fault;
        reg [max_faults -1 :0] repair_flag;
        reg [100 : 0] array_stuck_at[max_faults -1 : 0] ; 
        reg msgcnt;
        
        reg [Bits - 1: 0] stuck_at_0fault [max_faults -1 : 0];
        reg [Bits - 1: 0] stuck_at_1fault [max_faults -1 : 0];
        reg [Bits -1 : 0] stuck0;
        reg [Bits -1 : 0] stuck1;
        reg [Bits-1 :0] Mem_last;

        `ifdef ST_MEM_SLM
        reg [Bits -1 : 0] slm_temp_data;
        `endif
        
        real time_CK_func_rise , time_RADCK_rise;
        real time_fall_sleep,time_fall_PSWLARGEMP,time_fall_PSWLARGEMP_0,time_fall_PSWLARGEMA,time_fall_PSWLARGEMA_0,time_fall_PSWSMALLMP,time_fall_PSWSMALLMA;
        integer flag_error;
        
//BUFFER INSTANTIATION
//=========================
       `ifdef functional
       
         buf (SCTRLO,delSCTRLO_data); 
         buf bufq [Bits-1:0] (Q,delOutReg_data);
      `else
       
         buf (SCTRLO,SCTRLO_data);
         buf bufq [Bits-1:0] (Q,OutReg_data);  
      `endif
      
  
        buf (SEsys,SE);
	buf (SCTRLIint, SCTRLI);
   

	buf (CKint_func, CK);
	buf (CKint_dft, CK);
        buf bufaddr [Addr-1:0] (Asys,A);
        buf (INITNint,INITN);
        
        buf (LSint,LS); 
        buf (IGbuf,IG);
        buf (ATPint,ATP);

        buf bufTaddr [Addr-1 : 0] (TAint,TA);
        buf (TBISTsys,TBIST);
        buf (TCSNint,TCSN);

        buf (CSNsys,CSN);
        buf (STDBYint,STDBY );   
        
        buf (SLEEPint,1'b0 );

        buf bufrm [read_margin_size-1:0] (RMint, RM); 

        
        buf (PSWLARGEMPint,1'b0);
        buf (PSWSMALLMPint,1'b0); 
        buf (PSWLARGEMAint,1'b0);
        buf (PSWSMALLMAint,1'b0);  

assign TBYPASSsys = 0;
assign WENsys = 1;
assign HSint = 0;
assign WMint = 0;
assign TWENint = 1;

        



        assign scanreg_ctrl_wire={scanreg_ctrl[scanlen_ctrl - 2:0],SCTRLIint};
        assign scanreg_dl_wire={scanreg_dl[scanlen_l - 2:0],SDLIint};
        assign scanreg_dr_wire={scanreg_dr[scanlen_r - 2:0],SDRIint};
        
        assign Aint   = (TBISTint === 1'b0 ) ? Asys : (TBISTint === 1'bx ) ? {Addr{1'bx}} : TAint;  

        
        assign Aint_capt = Aint;
	
        assign WENint = 1'b1; 
        
        assign CSNbuf = (TBISTint === 1'b0 ) ? CSNsys : (TBISTint === 1'bx ) ? 1'bx : TCSNint;  

        assign CSNint = (ATPint === 1'b1) ? (SEint === 1'b0 ) ? CSNbuf : (SEint === 1'bx ) ? 1'bx :scanreg_ctrl[scanlen_ctrl - 3] : (ATPint === 1'b0 ) ? CSNsys : 1'bx ; 
        
        assign IGint = (ATPint === 1'b1) ? (SEint === 1'b0 ) ? IGbuf : (SEint === 1'bx ) ? 1'bx :scanreg_ctrl[scanlen_ctrl - 2] : (ATPint === 1'b0 ) ? IGbuf : 1'bx;

        
        assign DEint = (LSint === 1'bx || (LSint === 1'b0 && HSint === 1'bx) || ^RMint !== 1'b0 || ^WMint !== 1'b0 ) ? 1'bx : 1'b0;
        
     
     and (TBISTint, ATPint, TBISTsys);
     and (SEint, ATPint, SEsys);
     and (TBYPASSint, ATPint, TBYPASSsys);
     and (TSE,TBYPASSint,!SEsys);
     and (MEMEN,INITNint,!CSNint,!SLEEPint,!TBYPASSint,!SEint,!IGint,!DEint,!STDBYint );
     assign cond_sdf_tlss = ((INITNint && !CSNint && !SLEEPint && !TBYPASSint && !SEint && !IGint && !DEint && !STDBYint) !== 1'b0) ? 1'b1 : 1'b0;
     assign cond_sdf_trms = ((INITNint && !CSNint && !SLEEPint && !TBYPASSint && !SEint && !IGint && !DEint && !STDBYint ) !== 1'b0) ? 1'b1 : 1'b0;
     and (MEMEN_dft,INITNint, !SLEEPint, ATPint,!STDBYint);
     assign cond_sdf_tses = ((INITNint && !SLEEPint && ATPint && !STDBYint) !== 1'b0) ? 1'b1 : 1'b0;



// Power pins declaration


         reg vddm;
         reg r_supply_trigger;
          
         reg gndm ;
                  
         
         

// assigned Power pins 

         
  initial begin
         vddm = 1;
          
         gndm = 0;
                  
         
  end       
          
         assign gndmint = (reg_mem_block === 0) ? gndm : 1'b1;
         
         assign vddmint = vddm;
         assign vddmoint = vddm;
         
          

        //CPF Changes

        initial
        begin : cpfvddm 
           vddmreg = vddmint;
        end

        always @(vddmint) begin
           vddmreg = vddmint;
        end
 
        initial
        begin : cpfgndm 
           gndmreg = gndmint;
        end

        always @(gndmint) begin
           gndmreg = gndmint;
        end

        
        


        initial begin
         vddmoreg = 1'b1;
        end 



 `ifdef functional
  `else
  
//////////////////////////
 //REG DECLARATIONS
   //======================

   reg [Bits-1 : 0] TimingViol_data, TimingViol_mask;
   reg [Bits-1 : 0] TimingViol_data_last, TimingViol_mask_last;
	reg TimingViol_data_0, TimingViol_mask_0;
	reg TimingViol_data_1, TimingViol_mask_1;
	reg TimingViol_data_2, TimingViol_mask_2;
	reg TimingViol_data_3, TimingViol_mask_3;
	reg TimingViol_data_4, TimingViol_mask_4;
	reg TimingViol_data_5, TimingViol_mask_5;
	reg TimingViol_data_6, TimingViol_mask_6;
	reg TimingViol_data_7, TimingViol_mask_7;
	reg TimingViol_data_8, TimingViol_mask_8;
	reg TimingViol_data_9, TimingViol_mask_9;
	reg TimingViol_data_10, TimingViol_mask_10;
	reg TimingViol_data_11, TimingViol_mask_11;
	reg TimingViol_data_12, TimingViol_mask_12;
	reg TimingViol_data_13, TimingViol_mask_13;
	reg TimingViol_data_14, TimingViol_mask_14;
	reg TimingViol_data_15, TimingViol_mask_15;
	reg TimingViol_data_16, TimingViol_mask_16;
	reg TimingViol_data_17, TimingViol_mask_17;
	reg TimingViol_data_18, TimingViol_mask_18;
	reg TimingViol_data_19, TimingViol_mask_19;
	reg TimingViol_data_20, TimingViol_mask_20;
	reg TimingViol_data_21, TimingViol_mask_21;
	reg TimingViol_data_22, TimingViol_mask_22;
	reg TimingViol_data_23, TimingViol_mask_23;
	reg TimingViol_data_24, TimingViol_mask_24;
	reg TimingViol_data_25, TimingViol_mask_25;
	reg TimingViol_data_26, TimingViol_mask_26;
	reg TimingViol_data_27, TimingViol_mask_27;
	reg TimingViol_data_28, TimingViol_mask_28;
	reg TimingViol_data_29, TimingViol_mask_29;
	reg TimingViol_data_30, TimingViol_mask_30;
	reg TimingViol_data_31, TimingViol_mask_31;
	reg TimingViol_data_32, TimingViol_mask_32;
	reg TimingViol_data_33, TimingViol_mask_33;
	reg TimingViol_data_34, TimingViol_mask_34;
	reg TimingViol_data_35, TimingViol_mask_35;
	reg TimingViol_data_36, TimingViol_mask_36;
	reg TimingViol_data_37, TimingViol_mask_37;
	reg TimingViol_data_38, TimingViol_mask_38;
	reg TimingViol_data_39, TimingViol_mask_39;
	reg TimingViol_data_40, TimingViol_mask_40;
	reg TimingViol_data_41, TimingViol_mask_41;
	reg TimingViol_data_42, TimingViol_mask_42;
	reg TimingViol_data_43, TimingViol_mask_43;
	reg TimingViol_data_44, TimingViol_mask_44;
	reg TimingViol_data_45, TimingViol_mask_45;
	reg TimingViol_data_46, TimingViol_mask_46;
	reg TimingViol_data_47, TimingViol_mask_47;
	reg TimingViol_data_48, TimingViol_mask_48;
	reg TimingViol_data_49, TimingViol_mask_49;
	reg TimingViol_data_50, TimingViol_mask_50;
	reg TimingViol_data_51, TimingViol_mask_51;
	reg TimingViol_data_52, TimingViol_mask_52;
	reg TimingViol_data_53, TimingViol_mask_53;
	reg TimingViol_data_54, TimingViol_mask_54;
	reg TimingViol_data_55, TimingViol_mask_55;
	reg TimingViol_data_56, TimingViol_mask_56;
	reg TimingViol_data_57, TimingViol_mask_57;
	reg TimingViol_data_58, TimingViol_mask_58;
	reg TimingViol_data_59, TimingViol_mask_59;
	reg TimingViol_data_60, TimingViol_mask_60;
	reg TimingViol_data_61, TimingViol_mask_61;
	reg TimingViol_data_62, TimingViol_mask_62;
	reg TimingViol_data_63, TimingViol_mask_63;
   reg TimingViol_addr;
   reg TimingViol_CSN, TimingViol_WEN, TimingViol_tbypass;
   reg TimingViol_tckh, TimingViol_tckl, TimingViol_tcycle;
   reg TimingViol_tckh_se, TimingViol_tckl_se, TimingViol_tcycle_se;
   reg TimingViol_sctrli,TimingViol_sdli,TimingViol_sdri,TimingViol_se;
   reg TimingViol_smli,TimingViol_smri;
   reg TimingViol_sctrli_flag,TimingViol_sdli_flag,TimingViol_sdri_flag;
   reg TimingViol_smli_flag,TimingViol_smri_flag;
   reg TimingViol_initnl;
   reg TimingViol_initn;
   reg TimingViol_ls;
   reg TimingViol_hs;
   reg TimingViol_sleep;
   reg TimingViol_stdby;
   reg TimingViol_rm;
   reg TimingViol_wm;
   reg TimingViol_tbist,TimingViol_ig,TimingViol_atp,TimingViol_TED,TimingViol_TOD,TimingViol_TEM,TimingViol_TOM;
   
   wire cond_sdf_atps,cond_gac, CSTBYPASSN,cond_sdf_tas,cond_sdf_tbas,cond_sdf_tbps,SETB_EN,CSIG_EN,MEM_ACT,EN_ADM,CS_EN,CS_ADM,cond_sdf_tps,IG_EN,IG_ADM,cond_sdf_tigs,cond_sdf_taa,cond_sdf_taa_ls1,cond_tseq_tm,cond_sdf_tcycle,cond_sdf_tcycle_ls1,cond_sdf_tcycle_se,cond_sdf_tckl_se,cond_sdf_tsctrlis ,cond_sdf_tckh_se,cond_sdf_taa_sctrlo_se,cond_sdf_tckl,cond_sdf_tckh,cond_sdf_tbists,cond_sdf_taa_sctrlo,  SETOR;

wire CSWETBYPASSN;
wire cond_sdf_tstdbys,cond_sdf_tsls,notSLEEP_temp,sleep_en,atp_csn_en;

 and (CSWEMTBYPASS[0], !Mreg[0], CSWETBYPASSN);
 and (CSWEMTBYPASS[1], !Mreg[1], CSWETBYPASSN);
 and (CSWEMTBYPASS[2], !Mreg[2], CSWETBYPASSN);
 and (CSWEMTBYPASS[3], !Mreg[3], CSWETBYPASSN);
 and (CSWEMTBYPASS[4], !Mreg[4], CSWETBYPASSN);
 and (CSWEMTBYPASS[5], !Mreg[5], CSWETBYPASSN);
 and (CSWEMTBYPASS[6], !Mreg[6], CSWETBYPASSN);
 and (CSWEMTBYPASS[7], !Mreg[7], CSWETBYPASSN);
 and (CSWEMTBYPASS[8], !Mreg[8], CSWETBYPASSN);
 and (CSWEMTBYPASS[9], !Mreg[9], CSWETBYPASSN);
 and (CSWEMTBYPASS[10], !Mreg[10], CSWETBYPASSN);
 and (CSWEMTBYPASS[11], !Mreg[11], CSWETBYPASSN);
 and (CSWEMTBYPASS[12], !Mreg[12], CSWETBYPASSN);
 and (CSWEMTBYPASS[13], !Mreg[13], CSWETBYPASSN);
 and (CSWEMTBYPASS[14], !Mreg[14], CSWETBYPASSN);
 and (CSWEMTBYPASS[15], !Mreg[15], CSWETBYPASSN);
 and (CSWEMTBYPASS[16], !Mreg[16], CSWETBYPASSN);
 and (CSWEMTBYPASS[17], !Mreg[17], CSWETBYPASSN);
 and (CSWEMTBYPASS[18], !Mreg[18], CSWETBYPASSN);
 and (CSWEMTBYPASS[19], !Mreg[19], CSWETBYPASSN);
 and (CSWEMTBYPASS[20], !Mreg[20], CSWETBYPASSN);
 and (CSWEMTBYPASS[21], !Mreg[21], CSWETBYPASSN);
 and (CSWEMTBYPASS[22], !Mreg[22], CSWETBYPASSN);
 and (CSWEMTBYPASS[23], !Mreg[23], CSWETBYPASSN);
 and (CSWEMTBYPASS[24], !Mreg[24], CSWETBYPASSN);
 and (CSWEMTBYPASS[25], !Mreg[25], CSWETBYPASSN);
 and (CSWEMTBYPASS[26], !Mreg[26], CSWETBYPASSN);
 and (CSWEMTBYPASS[27], !Mreg[27], CSWETBYPASSN);
 and (CSWEMTBYPASS[28], !Mreg[28], CSWETBYPASSN);
 and (CSWEMTBYPASS[29], !Mreg[29], CSWETBYPASSN);
 and (CSWEMTBYPASS[30], !Mreg[30], CSWETBYPASSN);
 and (CSWEMTBYPASS[31], !Mreg[31], CSWETBYPASSN);
 and (CSWEMTBYPASS[32], !Mreg[32], CSWETBYPASSN);
 and (CSWEMTBYPASS[33], !Mreg[33], CSWETBYPASSN);
 and (CSWEMTBYPASS[34], !Mreg[34], CSWETBYPASSN);
 and (CSWEMTBYPASS[35], !Mreg[35], CSWETBYPASSN);
 and (CSWEMTBYPASS[36], !Mreg[36], CSWETBYPASSN);
 and (CSWEMTBYPASS[37], !Mreg[37], CSWETBYPASSN);
 and (CSWEMTBYPASS[38], !Mreg[38], CSWETBYPASSN);
 and (CSWEMTBYPASS[39], !Mreg[39], CSWETBYPASSN);
 and (CSWEMTBYPASS[40], !Mreg[40], CSWETBYPASSN);
 and (CSWEMTBYPASS[41], !Mreg[41], CSWETBYPASSN);
 and (CSWEMTBYPASS[42], !Mreg[42], CSWETBYPASSN);
 and (CSWEMTBYPASS[43], !Mreg[43], CSWETBYPASSN);
 and (CSWEMTBYPASS[44], !Mreg[44], CSWETBYPASSN);
 and (CSWEMTBYPASS[45], !Mreg[45], CSWETBYPASSN);
 and (CSWEMTBYPASS[46], !Mreg[46], CSWETBYPASSN);
 and (CSWEMTBYPASS[47], !Mreg[47], CSWETBYPASSN);
 and (CSWEMTBYPASS[48], !Mreg[48], CSWETBYPASSN);
 and (CSWEMTBYPASS[49], !Mreg[49], CSWETBYPASSN);
 and (CSWEMTBYPASS[50], !Mreg[50], CSWETBYPASSN);
 and (CSWEMTBYPASS[51], !Mreg[51], CSWETBYPASSN);
 and (CSWEMTBYPASS[52], !Mreg[52], CSWETBYPASSN);
 and (CSWEMTBYPASS[53], !Mreg[53], CSWETBYPASSN);
 and (CSWEMTBYPASS[54], !Mreg[54], CSWETBYPASSN);
 and (CSWEMTBYPASS[55], !Mreg[55], CSWETBYPASSN);
 and (CSWEMTBYPASS[56], !Mreg[56], CSWETBYPASSN);
 and (CSWEMTBYPASS[57], !Mreg[57], CSWETBYPASSN);
 and (CSWEMTBYPASS[58], !Mreg[58], CSWETBYPASSN);
 and (CSWEMTBYPASS[59], !Mreg[59], CSWETBYPASSN);
 and (CSWEMTBYPASS[60], !Mreg[60], CSWETBYPASSN);
 and (CSWEMTBYPASS[61], !Mreg[61], CSWETBYPASSN);
 and (CSWEMTBYPASS[62], !Mreg[62], CSWETBYPASSN);
 and (CSWEMTBYPASS[63], !Mreg[63], CSWETBYPASSN);

and (atp_csn_en,!ATPint,!CSNint,!IGint);
or (sleep_en,atp_csn_en,ATPint);
assign cond_sdf_tsls = ((sleep_en && INITNint && !STDBYint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tstdbys = ((sleep_en && INITNint && !SLEEPint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_atps = ((INITNint && !SLEEPint && !STDBYint) !== 1'b0) ? 1'b1 : 1'b0;
and (cond_gac,INITNint,!SLEEPint,!STDBYint);
or (SETB_EN,SEint,TBISTint);
or (CSIG_EN,IGint,CSNint);
and (MEM_ACT,!ATPint,CSIG_EN);
or (EN_ADM,MEM_ACT,SETB_EN);
assign cond_sdf_tas = ((cond_gac && !EN_ADM) !== 1'b0) ? 1'b1 : 1'b0;
and (CS_EN,!ATPint,IGint);
and (CS_ADM,CS_EN,SETB_EN);
assign cond_sdf_tps = ((cond_gac && !CS_ADM) !== 1'b0) ? 1'b1 : 1'b0;
or (SETOR,!SE_reg,!ATPreg); 
assign cond_sdf_tckl = ((cond_gac && !SEint) !== 1'b0) ? 1'b1 : 1'b0; 
assign cond_sdf_tckh = ((cond_gac && SETOR) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tcycle = ((cond_gac && !SEint && !LSint && !HSint) !== 1'b0) ? 1'b1 : 1'b0;  
assign cond_sdf_tcycle_ls1 = ((cond_gac && !SEint && LSint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tcycle_se = ((cond_gac && SEint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tckl_se = ((cond_gac && SEint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tsctrlis = ((cond_gac && SEint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tckh_se  = ((cond_gac && SE_reg && ATPreg) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_taa_sctrlo_se = ((cond_gac && SE_reg && ATPreg) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tbists = ((cond_gac && !SEsys && ATPint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_taa_sctrlo = ((cond_gac && !SE_reg && ATPreg) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tbas = ((cond_gac && TBISTint && !SEsys) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_tbps = ((cond_gac && TBISTint && !SEsys) !== 1'b0) ? 1'b1 : 1'b0;
and (IG_EN,!ATPint,CSNint);
and (IG_ADM,IG_EN,SETB_EN);
assign cond_sdf_tigs = ((cond_gac && !IG_ADM) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_taa = ((MEMEN_reg && WENreg && !LSint && !HSint) !== 1'b0) ? 1'b1 : 1'b0;
assign cond_sdf_taa_ls1 = ((MEMEN_reg && WENreg && LSint) !== 1'b0) ? 1'b1 : 1'b0; 
and (CSWETBYPASSN, !WENreg, 1'b1);

or (notSLEEP_temp,STDBYint,!sleep_en,SLEEPint);
assign cond_sdf_tinitns = ((notSLEEP_temp) !==1'b1) ? 1'b1 : 1'b0 ;

//specify block begins

specify
    specparam
    
         PATHPULSE$CK$Q = 0,
         PATHPULSE$CK$SCTRLO = 0,


         
         tlss = 0.0,
         tlsh = 0.0,
        
         
        
         tstdbys = 0.0,
         tstdbyh = 0.0, 
	 

         tcycle = 0.0,
         
         tcycle_ls1 = 0.0,

         
         tckh = 0.0,
         tckl = 0.0,
         tcycle_se = 0.0,
         tckh_se = 0.0,
         tckl_se = 0.0,

         tps = 0.0,
         tph = 0.0,

         tas = 0.0,
         tah = 0.0,
         tses= 0.0,
         tseh= 0.0,
         tsctrlis=0.0,
         tsctrlih=0.0,

         tbists=0.0,
         tbisth=0.0,
         tbps=0.0,
         tbph=0.0,

         tbas=0.0,
         tbah=0.0,
         tinitnl=0.0,
         tinitns=0.0,
         tinitnh=0.0,
         tatps=0.0,
         tatph=0.0,
         tigs=0.0,
         tigh=0.0,
         
         trms=0.0,
         trmh=0.0,
 

/*************************************************************************************************/
            taa = `access_time,
            th = `retain_time,
            taa_ls1 = `access_time,
            th_ls1 = `retain_time,

            taa_sctrlo=`access_time,
            th_sctrlo=`retain_time,

            taa_sctrlo_se=`access_time,
            th_sctrlo_se=`retain_time; 

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

        $setup(posedge CSN, posedge CK &&& cond_sdf_tps, tps, TimingViol_CSN);
	$setup(negedge CSN, posedge CK &&& cond_sdf_tps, tps, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tps, posedge CSN, tph, TimingViol_CSN);
	$hold(posedge CK &&& cond_sdf_tps, negedge CSN, tph, TimingViol_CSN);
        $period(posedge CK &&& cond_sdf_tcycle, tcycle, TimingViol_tcycle);  
        
        $period(posedge CK &&& cond_sdf_tcycle_ls1, tcycle_ls1, TimingViol_tcycle);
        
        $width(posedge CK  &&& cond_sdf_tckh, tckh, 0, TimingViol_tckh);
        $width(negedge CK  &&& cond_sdf_tckl, tckl, 0, TimingViol_tckl);
        $period(posedge CK &&& cond_sdf_tcycle_se, tcycle_se, TimingViol_tcycle_se);
        $width(posedge CK  &&& cond_sdf_tckh_se, tckh_se, 0, TimingViol_tckh_se);
        $width(negedge CK  &&& cond_sdf_tckl_se, tckl_se, 0, TimingViol_tckl_se);


        $setup(posedge LS, posedge CK &&& cond_sdf_tlss,tlss, TimingViol_ls);
        $setup(negedge LS, posedge CK &&& cond_sdf_tlss,tlss, TimingViol_ls);
        $hold(posedge CK &&& cond_sdf_tlss, posedge LS, tlsh, TimingViol_ls); 
        $hold(posedge CK &&& cond_sdf_tlss, negedge LS, tlsh, TimingViol_ls); 


        

        $setup(posedge STDBY, posedge CK &&& cond_sdf_tstdbys, tstdbys, TimingViol_stdby);
        $setup(negedge STDBY, posedge CK &&& cond_sdf_tstdbys, tstdbys, TimingViol_stdby);
        $hold(posedge CK &&& cond_sdf_tstdbys, posedge STDBY, tstdbyh, TimingViol_stdby);        
        $hold(posedge CK &&& cond_sdf_tstdbys, negedge STDBY, tstdbyh, TimingViol_stdby); 
        
        
        $setup (posedge SE ,posedge CK &&& cond_sdf_tses,tses,TimingViol_se);
	$setup (negedge SE ,posedge CK &&& cond_sdf_tses,tses,TimingViol_se);
        
        $hold (posedge CK &&& cond_sdf_tses, posedge SE ,tseh,TimingViol_se);
	$hold (posedge CK &&& cond_sdf_tses, negedge SE ,tseh,TimingViol_se);
        
        $setup(posedge SCTRLI, posedge CK  &&& cond_sdf_tsctrlis , tsctrlis, TimingViol_sctrli);
        $setup(negedge SCTRLI, posedge CK  &&& cond_sdf_tsctrlis , tsctrlis, TimingViol_sctrli);
        $hold(posedge CK &&& cond_sdf_tsctrlis , posedge SCTRLI, tsctrlih, TimingViol_sctrli);        
        $hold(posedge CK &&& cond_sdf_tsctrlis , negedge SCTRLI, tsctrlih, TimingViol_sctrli);

 
        $width(negedge INITN , tinitnl, 0, TimingViol_initnl);
        
        $setup(posedge INITN, posedge CK &&& cond_sdf_tinitns, tinitns, TimingViol_initn);
        $setup(negedge INITN, posedge CK &&& cond_sdf_tinitns, tinitns, TimingViol_initn);
        
        $hold (posedge CK &&& cond_sdf_tinitns,posedge INITN, tinitnh, TimingViol_initn);
        $hold (posedge CK &&& cond_sdf_tinitns,negedge INITN, tinitnh, TimingViol_initn);

        $setup(posedge ATP, posedge CK &&& cond_sdf_atps, tatps, TimingViol_atp);
        $setup(negedge ATP, posedge CK &&& cond_sdf_atps, tatps, TimingViol_atp);
        $hold(posedge CK &&& cond_sdf_atps, posedge ATP, tatph, TimingViol_atp);        
        $hold(posedge CK &&& cond_sdf_atps, negedge ATP, tatph, TimingViol_atp);
        
        $setup(posedge IG, posedge CK &&& cond_sdf_tigs , tigs, TimingViol_ig);
        $setup(negedge IG, posedge CK &&& cond_sdf_tigs , tigs, TimingViol_ig);
        $hold(posedge CK &&& cond_sdf_tigs, posedge IG, tigh, TimingViol_ig);        
        $hold(posedge CK &&& cond_sdf_tigs, negedge IG, tigh, TimingViol_ig);

         
$setup(posedge RM[0], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[1], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(posedge RM[2], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[0], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[1], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$setup(negedge RM[2], posedge CK &&& cond_sdf_trms, trms, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[0], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[1], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, posedge RM[2], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[0], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[1], trmh, TimingViol_rm);
$hold(posedge CK &&& cond_sdf_trms, negedge RM[2], trmh, TimingViol_rm); 

 
        
        $setup(posedge TBIST, posedge CK &&& cond_sdf_tbists, tbists, TimingViol_tbist);
        $setup(negedge TBIST, posedge CK &&& cond_sdf_tbists, tbists, TimingViol_tbist);
        $hold(posedge CK &&& cond_sdf_tbists, posedge TBIST, tbisth, TimingViol_tbist);        
        $hold(posedge CK &&& cond_sdf_tbists, negedge TBIST, tbisth, TimingViol_tbist);
        
        	$setup(posedge TA[0], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[1], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[2], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[3], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[4], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[5], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[6], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[7], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[8], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(posedge TA[9], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
        	$setup(negedge TA[0], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[1], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[2], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[3], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[4], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[5], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[6], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[7], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[8], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
	$setup(negedge TA[9], posedge CK &&& cond_sdf_tbas, tbas, TimingViol_addr);
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
       
    

          /*-------------------- Propagation Delays ------------------*/
	if (cond_sdf_taa) (posedge CK => (Q[0] +: OutReg_data[0])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[1] +: OutReg_data[1])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[2] +: OutReg_data[2])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[3] +: OutReg_data[3])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[4] +: OutReg_data[4])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[5] +: OutReg_data[5])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[6] +: OutReg_data[6])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[7] +: OutReg_data[7])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[8] +: OutReg_data[8])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[9] +: OutReg_data[9])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[10] +: OutReg_data[10])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[11] +: OutReg_data[11])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[12] +: OutReg_data[12])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[13] +: OutReg_data[13])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[14] +: OutReg_data[14])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[15] +: OutReg_data[15])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[16] +: OutReg_data[16])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[17] +: OutReg_data[17])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[18] +: OutReg_data[18])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[19] +: OutReg_data[19])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[20] +: OutReg_data[20])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[21] +: OutReg_data[21])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[22] +: OutReg_data[22])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[23] +: OutReg_data[23])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[24] +: OutReg_data[24])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[25] +: OutReg_data[25])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[26] +: OutReg_data[26])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[27] +: OutReg_data[27])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[28] +: OutReg_data[28])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[29] +: OutReg_data[29])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[30] +: OutReg_data[30])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[31] +: OutReg_data[31])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[32] +: OutReg_data[32])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[33] +: OutReg_data[33])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[34] +: OutReg_data[34])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[35] +: OutReg_data[35])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[36] +: OutReg_data[36])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[37] +: OutReg_data[37])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[38] +: OutReg_data[38])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[39] +: OutReg_data[39])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[40] +: OutReg_data[40])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[41] +: OutReg_data[41])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[42] +: OutReg_data[42])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[43] +: OutReg_data[43])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[44] +: OutReg_data[44])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[45] +: OutReg_data[45])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[46] +: OutReg_data[46])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[47] +: OutReg_data[47])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[48] +: OutReg_data[48])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[49] +: OutReg_data[49])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[50] +: OutReg_data[50])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[51] +: OutReg_data[51])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[52] +: OutReg_data[52])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[53] +: OutReg_data[53])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[54] +: OutReg_data[54])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[55] +: OutReg_data[55])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[56] +: OutReg_data[56])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[57] +: OutReg_data[57])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[58] +: OutReg_data[58])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[59] +: OutReg_data[59])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[60] +: OutReg_data[60])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[61] +: OutReg_data[61])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[62] +: OutReg_data[62])) = (taa, taa, th, taa, th, taa);
	if (cond_sdf_taa) (posedge CK => (Q[63] +: OutReg_data[63])) = (taa, taa, th, taa, th, taa); 

	if (cond_sdf_taa_ls1) (posedge CK => (Q[0] +: OutReg_data[0])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[1] +: OutReg_data[1])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[2] +: OutReg_data[2])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[3] +: OutReg_data[3])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[4] +: OutReg_data[4])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[5] +: OutReg_data[5])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[6] +: OutReg_data[6])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[7] +: OutReg_data[7])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[8] +: OutReg_data[8])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[9] +: OutReg_data[9])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[10] +: OutReg_data[10])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[11] +: OutReg_data[11])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[12] +: OutReg_data[12])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[13] +: OutReg_data[13])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[14] +: OutReg_data[14])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[15] +: OutReg_data[15])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[16] +: OutReg_data[16])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[17] +: OutReg_data[17])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[18] +: OutReg_data[18])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[19] +: OutReg_data[19])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[20] +: OutReg_data[20])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[21] +: OutReg_data[21])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[22] +: OutReg_data[22])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[23] +: OutReg_data[23])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[24] +: OutReg_data[24])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[25] +: OutReg_data[25])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[26] +: OutReg_data[26])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[27] +: OutReg_data[27])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[28] +: OutReg_data[28])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[29] +: OutReg_data[29])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[30] +: OutReg_data[30])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[31] +: OutReg_data[31])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[32] +: OutReg_data[32])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[33] +: OutReg_data[33])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[34] +: OutReg_data[34])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[35] +: OutReg_data[35])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[36] +: OutReg_data[36])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[37] +: OutReg_data[37])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[38] +: OutReg_data[38])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[39] +: OutReg_data[39])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[40] +: OutReg_data[40])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[41] +: OutReg_data[41])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[42] +: OutReg_data[42])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[43] +: OutReg_data[43])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[44] +: OutReg_data[44])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[45] +: OutReg_data[45])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[46] +: OutReg_data[46])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[47] +: OutReg_data[47])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[48] +: OutReg_data[48])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[49] +: OutReg_data[49])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[50] +: OutReg_data[50])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[51] +: OutReg_data[51])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[52] +: OutReg_data[52])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[53] +: OutReg_data[53])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[54] +: OutReg_data[54])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[55] +: OutReg_data[55])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[56] +: OutReg_data[56])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[57] +: OutReg_data[57])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[58] +: OutReg_data[58])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[59] +: OutReg_data[59])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[60] +: OutReg_data[60])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[61] +: OutReg_data[61])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[62] +: OutReg_data[62])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1);
	if (cond_sdf_taa_ls1) (posedge CK => (Q[63] +: OutReg_data[63])) = (taa_ls1, taa_ls1, th_ls1, taa_ls1, th_ls1, taa_ls1); 





if (cond_sdf_taa_sctrlo) (posedge CK *> (SCTRLO :  SCTRLI)) = (taa_sctrlo,taa_sctrlo,th_sctrlo,taa_sctrlo,th_sctrlo,taa_sctrlo); 

if (cond_sdf_taa_sctrlo_se) (negedge CK *> (SCTRLO : SCTRLI)) = (taa_sctrlo_se,taa_sctrlo_se,th_sctrlo_se,taa_sctrlo_se,th_sctrlo_se,taa_sctrlo_se); 
 
 
     
 endspecify //specify block ends



`endif


// TASK DEFINITION DESCRIPTION
// ================================


task task_insert_faults_in_memory;
begin
   if (reg_ConfigFault)
   begin   
     for(i = 0;i< fcnt;i = i+ 1) begin
          if (array_stuck_at[i] === "sa0") begin
           `ifdef ST_MEM_SLM
            //Read first
            $slm_ReadMemoryS(slm_handle, FailureLocn[i], slm_temp_data);
            //operation
            slm_temp_data = slm_temp_data & stuck_at_0fault[i];
            //write back
            $slm_WriteMemoryS(slm_handle, FailureLocn[i], slm_temp_data);
          `else
            Mem[FailureLocn[i]] = Mem[FailureLocn[i]] & stuck_at_0fault[i];
          `endif
         end //if(array_stuck_at)
                                        
         if(array_stuck_at[i] === "sa1") begin
         `ifdef ST_MEM_SLM
            //Read first
            $slm_ReadMemoryS(slm_handle, FailureLocn[i], slm_temp_data);
            //operation
            slm_temp_data = slm_temp_data | stuck_at_1fault[i];
            //write back
            $slm_WriteMemoryS(slm_handle, FailureLocn[i], slm_temp_data);
         `else
            Mem[FailureLocn[i]] = Mem[FailureLocn[i]] | stuck_at_1fault[i]; 
         `endif
         end //if(array_stuck_at)
     end    // end of for
   end  
end
endtask

task task_read_fault_file;
begin
   Fault_in_memory=0;
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
          if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: File cannot be opened ",$realtime);
      end        
      else                
      begin : read_fault_file
        t = 0;
        for (i = 0; i< max_faults; i= i + 1)
        begin
         
           stuck0 = {Bits{1'b1}};
           stuck1 = {Bits{1'b0}};
           fault_char1 = $fgetc (file_ptr);
           if (fault_char1 == 8'b11111111)
              disable read_fault_file;
           ret_val = $ungetc (fault_char1, file_ptr);
           ret_val = $fgets(tempStr, file_ptr);
           ret_val = $sscanf(tempStr, "%d %d %s",fault_word, fault_bit, stuck_at) ;
           flag_error = 0; 
           if(ret_val !== 0)
           begin         
              if(ret_val == 2 || ret_val == 3)
              begin
                if(ret_val == 2)
                   stuck_at = "sa0";

                if(stuck_at !== "sa0" && stuck_at !== "sa1" && stuck_at !== "none")
                begin
                    if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Wrong value for stuck at in fault file ",$realtime);
                   flag_error = 1;
                end    
                      
                if(fault_word > Words)
                begin
                   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Address out of range in fault file ",$realtime);
                   flag_error = 1;
                end    

                if(fault_bit > Bits)
                begin  
                    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Faulty bit out of range in fault file ",$realtime);
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
      for (faultnum=0; faultnum<Bits;faultnum=faultnum+1) begin
         stop_loop = 1;
       for (count = 0; count < fcnt; count = count +1) begin 
        if ((Failurebit[count] == faultnum) && (stop_loop == 1)) begin
         Fault_in_memory=Fault_in_memory+1;
         stop_loop = 0;
        end
       end        
      end
  
      //fault injection at time 0.
   task_insert_faults_in_memory;
  end // config_fault 
end
endtask


task WriteOutX;                
begin
   OutReg_data <= #0 WordX;
end
endtask


task Invalid_next_cycle_func;
begin
  WriteOutX;
  if (INITNint !== 0) begin
    `ifdef ST_FUNCTION_NEXT_CYCLE_CORRUPTION_ON         
       #0 next_cycle_corrupt_func = 1;
     `else 
       #0 next_cycle_corrupt_func = 0; 
     `endif  
   end 
end
endtask

task Invalid_next_cycle_dft;
begin
  ScanChainX;
  ScanOutX;   
  if( TBYPASSint !== 0 && SEint !== 1) begin
    WriteOutX;
  end
  if (INITNint !== 0) begin
    `ifdef ST_FUNCTION_NEXT_CYCLE_CORRUPTION_ON         
       #0 next_cycle_corrupt_dft = 1;
     `else 
       #0 next_cycle_corrupt_dft = 0; 
     `endif  
  end
end
endtask


task ScanOutX;                
begin
   SCTRLOint=X;
   
   `ifdef functional
   `else
   SCTRLO_data<=1'bx;
   
 `endif
end
endtask

task delScanOutX;                
begin
   delSCTRLO_data<=X;
   
end
endtask

task ScanChainX;                
begin
 scanreg_ctrl={scanlen_ctrl{1'bx}}; 
 
end
endtask

task mem_blocked;
begin
   WriteOutX;
   ScanChainX;
   ScanOutX;//immediately;
   delScanOutX;//immediately
   `ifdef POWER_SEQUENCING_OFF
   `else
   reg_mem_block=1;
   `endif
   debug_level = 2'b00;
end
endtask

task corrupt_all;
begin
 if (SLEEPint !== 0) begin
   WriteOutX;
   OutReg_data = WordX; 
   delOutReg_data=WordX;
   ScanChainX;
   ScanOutX;//immediately;
   delScanOutX;//immediately
 end  
end
endtask



task ReadCycle;
input [Addr-1 : 0] Address;

reg [Bits-1:0] MemData_tmp;
reg [Bits-1:0] MemData;

integer a,numr;

begin
   if (ValidAddress )
   begin        
      `ifdef ST_MEM_SLM
         $slm_ReadMemory(slm_handle, Address, MemData);
      `else
         MemData_tmp = Mem[Address];
      `endif
   end //if (ValidAddress)  
   
  `ifdef ST_MEM_SLM
  `else
       MemData=MemData_tmp; 
  `endif 
   
   if(ValidAddress === X)
   begin

         if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Read Port:  Illegal Value on Address Bus. Output Corrupted ",$realtime); 
         MemData = WordX;
      #0 next_cycle_corrupt_func = 1;
   end                        
   else if (ValidAddress === 0  )
   begin                        
       if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Read Port:  Address Out Of Range. Output Corrupted ",$realtime);
      MemData = WordX;
   end
   for (a = 0; a < Bits; a = a + 1)
   begin
      if (MemData[a] !== OutReg_data[a])
         OutReg_data[a] = WordX[a];
   end//for (a = 0; a <  
         OutReg_data <= MemData;
end
endtask


 //////// CAPTURE TASK //////
task scan_acquire;
begin
   if (supply_ok === 1) begin 
      if ( SEsys === 0) begin
         scanreg_ctrl=0;//all the unused address bits are tied to 0
                 
         scanreg_ctrl[0]               =Aint_capt[0];///check the order of bits
         scanreg_ctrl[1]               =Aint_capt[1];///check the order of bits
         scanreg_ctrl[2]               =Aint_capt[2];///check the order of bits
         scanreg_ctrl[3]               =Aint_capt[3];///check the order of bits
         scanreg_ctrl[4]               =1'b0;
         scanreg_ctrl[5]               =Aint_capt[4];///check the order of bits
         scanreg_ctrl[6]               =Aint_capt[5];///check the order of bits
         scanreg_ctrl[7]               =Aint_capt[6];///check the order of bits
         scanreg_ctrl[8]               =Aint_capt[7];///check the order of bits
         scanreg_ctrl[9]               =Aint_capt[8];///check the order of bits
         scanreg_ctrl[10]              =Aint_capt[9];///check the order of bits
         scanreg_ctrl[11]              =Aint_capt[10];///check the order of bits
         scanreg_ctrl[12]              =Aint_capt[11];///check the order of bits
         scanreg_ctrl[13]              =Aint_capt[12];///check the order of bits
         scanreg_ctrl[14]              =Aint_capt[13];///check the order of bits
         scanreg_ctrl[15]              =1'b0;
         scanreg_ctrl[16]              =CSNint;
         scanreg_ctrl[17]              =IGint;
         
         
         
          
         

         

      end //if ( SEint === 0
   end//if(supply_ok 
end
endtask

task scan_shift;
begin
 if (supply_ok === 1) begin
   if (STDBYint === 0 && SLEEPint === 0) begin
      if (CKint_dft === X && INITNint !== 0 && SLEEPint !== 1 && STDBYint !== 1 && ATPint !== 0) begin
         ScanChainX;
         ScanOutX;
      end
      else if (CKint_dft === 1 && lastCK_dft === 0 ) begin
          //// SHIFT
        if (SEsys === 1) begin
           scanreg_ctrl[scanlen_ctrl -1:1]=scanreg_ctrl[scanlen_ctrl -2:0];
           scanreg_ctrl[0]             = SCTRLIint_temp;
           scanreg_dl[scanlen_l -1:1]=scanreg_dl[scanlen_l -2:0];  
           scanreg_dl[0]               = SDLIint_temp; 
           
           
           scanreg_dr[scanlen_r -1:1]=scanreg_dr[scanlen_r -2:0];  
           scanreg_dr[0]               = SDRIint_temp; 
           
           
        //// SHIFT Ends
        end //if (SEsys === 1
        else if (SEsys === X) begin
            ScanChainX;
            ScanOutX;
            delScanOutX;
        end//if (SEint ==X
      
      end///if (CKint === 
    
      else if (CKint_dft === 0 && lastCK_dft === 1 ) begin
         SCTRLOint   = scanreg_ctrl[scanlen_ctrl -1];
         
   
         if (SCTRLOint !== SCTRLO_data) begin 
             SCTRLO_data=1'bx;
             SCTRLO_data <= SCTRLOint;
            end
   
  `ifdef functional
   `else
             if (TimingViol_sctrli_flag === 1'b1) begin
               SCTRLO_data<=X;
               scanreg_ctrl={scanlen_ctrl{1'bx}};
               TimingViol_sctrli_flag=0;
             end   
   
   `endif

      end
    end  //if (STDByint === 0 && SLEEPint === 0
 end//if(supply_ok
end
endtask





always @(scanreg_ctrl_wire[0]) begin
  SCTRLIint_temp=scanreg_ctrl_wire[0];
end


 
always @(scanreg_ctrl_wire[1]) begin
  scanreg_ctrl[0]=scanreg_ctrl_wire[1];
end

 
always @(scanreg_ctrl_wire[2]) begin
  scanreg_ctrl[1]=scanreg_ctrl_wire[2];
end

 
always @(scanreg_ctrl_wire[3]) begin
  scanreg_ctrl[2]=scanreg_ctrl_wire[3];
end

 
always @(scanreg_ctrl_wire[4]) begin
  scanreg_ctrl[3]=scanreg_ctrl_wire[4];
end

 
always @(scanreg_ctrl_wire[5]) begin
  scanreg_ctrl[4]=scanreg_ctrl_wire[5];
end

 
always @(scanreg_ctrl_wire[6]) begin
  scanreg_ctrl[5]=scanreg_ctrl_wire[6];
end

 
always @(scanreg_ctrl_wire[7]) begin
  scanreg_ctrl[6]=scanreg_ctrl_wire[7];
end

 
always @(scanreg_ctrl_wire[8]) begin
  scanreg_ctrl[7]=scanreg_ctrl_wire[8];
end

 
always @(scanreg_ctrl_wire[9]) begin
  scanreg_ctrl[8]=scanreg_ctrl_wire[9];
end

 
always @(scanreg_ctrl_wire[10]) begin
  scanreg_ctrl[9]=scanreg_ctrl_wire[10];
end

 
always @(scanreg_ctrl_wire[11]) begin
  scanreg_ctrl[10]=scanreg_ctrl_wire[11];
end

 
always @(scanreg_ctrl_wire[12]) begin
  scanreg_ctrl[11]=scanreg_ctrl_wire[12];
end

 
always @(scanreg_ctrl_wire[13]) begin
  scanreg_ctrl[12]=scanreg_ctrl_wire[13];
end

 
always @(scanreg_ctrl_wire[14]) begin
  scanreg_ctrl[13]=scanreg_ctrl_wire[14];
end

 
always @(scanreg_ctrl_wire[15]) begin
  scanreg_ctrl[14]=scanreg_ctrl_wire[15];
end

 
always @(scanreg_ctrl_wire[16]) begin
  scanreg_ctrl[15]=scanreg_ctrl_wire[16];
end

 
always @(scanreg_ctrl_wire[17]) begin
  scanreg_ctrl[16]=scanreg_ctrl_wire[17];
end



always @(scanreg_dl_wire[0]) begin
  SDLIint_temp=scanreg_dl_wire[0];
end
 
always @(scanreg_dl_wire[1]) begin
  scanreg_dl[0]=scanreg_dl_wire[1];
end

 
always @(scanreg_dl_wire[2]) begin
  scanreg_dl[1]=scanreg_dl_wire[2];
end

 
always @(scanreg_dl_wire[3]) begin
  scanreg_dl[2]=scanreg_dl_wire[3];
end

 
always @(scanreg_dl_wire[4]) begin
  scanreg_dl[3]=scanreg_dl_wire[4];
end

 
always @(scanreg_dl_wire[5]) begin
  scanreg_dl[4]=scanreg_dl_wire[5];
end

 
always @(scanreg_dl_wire[6]) begin
  scanreg_dl[5]=scanreg_dl_wire[6];
end

 
always @(scanreg_dl_wire[7]) begin
  scanreg_dl[6]=scanreg_dl_wire[7];
end

 
always @(scanreg_dl_wire[8]) begin
  scanreg_dl[7]=scanreg_dl_wire[8];
end

 
always @(scanreg_dl_wire[9]) begin
  scanreg_dl[8]=scanreg_dl_wire[9];
end

 
always @(scanreg_dl_wire[10]) begin
  scanreg_dl[9]=scanreg_dl_wire[10];
end

 
always @(scanreg_dl_wire[11]) begin
  scanreg_dl[10]=scanreg_dl_wire[11];
end

 
always @(scanreg_dl_wire[12]) begin
  scanreg_dl[11]=scanreg_dl_wire[12];
end

 
always @(scanreg_dl_wire[13]) begin
  scanreg_dl[12]=scanreg_dl_wire[13];
end

 
always @(scanreg_dl_wire[14]) begin
  scanreg_dl[13]=scanreg_dl_wire[14];
end

 
always @(scanreg_dl_wire[15]) begin
  scanreg_dl[14]=scanreg_dl_wire[15];
end

 
always @(scanreg_dl_wire[16]) begin
  scanreg_dl[15]=scanreg_dl_wire[16];
end

 
always @(scanreg_dl_wire[17]) begin
  scanreg_dl[16]=scanreg_dl_wire[17];
end

 
always @(scanreg_dl_wire[18]) begin
  scanreg_dl[17]=scanreg_dl_wire[18];
end

 
always @(scanreg_dl_wire[19]) begin
  scanreg_dl[18]=scanreg_dl_wire[19];
end

 
always @(scanreg_dl_wire[20]) begin
  scanreg_dl[19]=scanreg_dl_wire[20];
end

 
always @(scanreg_dl_wire[21]) begin
  scanreg_dl[20]=scanreg_dl_wire[21];
end

 
always @(scanreg_dl_wire[22]) begin
  scanreg_dl[21]=scanreg_dl_wire[22];
end

 
always @(scanreg_dl_wire[23]) begin
  scanreg_dl[22]=scanreg_dl_wire[23];
end

 
always @(scanreg_dl_wire[24]) begin
  scanreg_dl[23]=scanreg_dl_wire[24];
end

 
always @(scanreg_dl_wire[25]) begin
  scanreg_dl[24]=scanreg_dl_wire[25];
end

 
always @(scanreg_dl_wire[26]) begin
  scanreg_dl[25]=scanreg_dl_wire[26];
end

 
always @(scanreg_dl_wire[27]) begin
  scanreg_dl[26]=scanreg_dl_wire[27];
end

 
always @(scanreg_dl_wire[28]) begin
  scanreg_dl[27]=scanreg_dl_wire[28];
end

 
always @(scanreg_dl_wire[29]) begin
  scanreg_dl[28]=scanreg_dl_wire[29];
end

 
always @(scanreg_dl_wire[30]) begin
  scanreg_dl[29]=scanreg_dl_wire[30];
end

 
always @(scanreg_dl_wire[31]) begin
  scanreg_dl[30]=scanreg_dl_wire[31];
end


always @(scanreg_dr_wire[0]) begin
  SDRIint_temp=scanreg_dr_wire[0];
end
 
always @(scanreg_dr_wire[1]) begin
  scanreg_dr[0]=scanreg_dr_wire[1];
end

 
always @(scanreg_dr_wire[2]) begin
  scanreg_dr[1]=scanreg_dr_wire[2];
end

 
always @(scanreg_dr_wire[3]) begin
  scanreg_dr[2]=scanreg_dr_wire[3];
end

 
always @(scanreg_dr_wire[4]) begin
  scanreg_dr[3]=scanreg_dr_wire[4];
end

 
always @(scanreg_dr_wire[5]) begin
  scanreg_dr[4]=scanreg_dr_wire[5];
end

 
always @(scanreg_dr_wire[6]) begin
  scanreg_dr[5]=scanreg_dr_wire[6];
end

 
always @(scanreg_dr_wire[7]) begin
  scanreg_dr[6]=scanreg_dr_wire[7];
end

 
always @(scanreg_dr_wire[8]) begin
  scanreg_dr[7]=scanreg_dr_wire[8];
end

 
always @(scanreg_dr_wire[9]) begin
  scanreg_dr[8]=scanreg_dr_wire[9];
end

 
always @(scanreg_dr_wire[10]) begin
  scanreg_dr[9]=scanreg_dr_wire[10];
end

 
always @(scanreg_dr_wire[11]) begin
  scanreg_dr[10]=scanreg_dr_wire[11];
end

 
always @(scanreg_dr_wire[12]) begin
  scanreg_dr[11]=scanreg_dr_wire[12];
end

 
always @(scanreg_dr_wire[13]) begin
  scanreg_dr[12]=scanreg_dr_wire[13];
end

 
always @(scanreg_dr_wire[14]) begin
  scanreg_dr[13]=scanreg_dr_wire[14];
end

 
always @(scanreg_dr_wire[15]) begin
  scanreg_dr[14]=scanreg_dr_wire[15];
end

 
always @(scanreg_dr_wire[16]) begin
  scanreg_dr[15]=scanreg_dr_wire[16];
end

 
always @(scanreg_dr_wire[17]) begin
  scanreg_dr[16]=scanreg_dr_wire[17];
end

 
always @(scanreg_dr_wire[18]) begin
  scanreg_dr[17]=scanreg_dr_wire[18];
end

 
always @(scanreg_dr_wire[19]) begin
  scanreg_dr[18]=scanreg_dr_wire[19];
end

 
always @(scanreg_dr_wire[20]) begin
  scanreg_dr[19]=scanreg_dr_wire[20];
end

 
always @(scanreg_dr_wire[21]) begin
  scanreg_dr[20]=scanreg_dr_wire[21];
end

 
always @(scanreg_dr_wire[22]) begin
  scanreg_dr[21]=scanreg_dr_wire[22];
end

 
always @(scanreg_dr_wire[23]) begin
  scanreg_dr[22]=scanreg_dr_wire[23];
end

 
always @(scanreg_dr_wire[24]) begin
  scanreg_dr[23]=scanreg_dr_wire[24];
end

 
always @(scanreg_dr_wire[25]) begin
  scanreg_dr[24]=scanreg_dr_wire[25];
end

 
always @(scanreg_dr_wire[26]) begin
  scanreg_dr[25]=scanreg_dr_wire[26];
end

 
always @(scanreg_dr_wire[27]) begin
  scanreg_dr[26]=scanreg_dr_wire[27];
end

 
always @(scanreg_dr_wire[28]) begin
  scanreg_dr[27]=scanreg_dr_wire[28];
end

 
always @(scanreg_dr_wire[29]) begin
  scanreg_dr[28]=scanreg_dr_wire[29];
end

 
always @(scanreg_dr_wire[30]) begin
  scanreg_dr[29]=scanreg_dr_wire[30];
end

 
always @(scanreg_dr_wire[31]) begin
  scanreg_dr[30]=scanreg_dr_wire[31];
end




 

ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_13 (scanreg_ctrl_wire[13],scanreg_ctrl[13]);
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_14 (scanreg_ctrl_wire[14],scanreg_ctrl[14] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_15 (scanreg_ctrl_wire[15],scanreg_ctrl[15] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_0 (scanreg_ctrl_wire[0],scanreg_ctrl[0]);
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_1 (scanreg_ctrl_wire[1],scanreg_ctrl[1] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_2 (scanreg_ctrl_wire[2],scanreg_ctrl[2] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_3 (scanreg_ctrl_wire[3],scanreg_ctrl[3] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_4 (scanreg_ctrl_wire[4],scanreg_ctrl[4] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_5 (scanreg_ctrl_wire[5],scanreg_ctrl[5] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_6 (scanreg_ctrl_wire[6],scanreg_ctrl[6] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_7 (scanreg_ctrl_wire[7],scanreg_ctrl[7] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_8 (scanreg_ctrl_wire[8],scanreg_ctrl[8] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_9 (scanreg_ctrl_wire[9],scanreg_ctrl[9] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_10 (scanreg_ctrl_wire[10],scanreg_ctrl[10] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_11 (scanreg_ctrl_wire[11],scanreg_ctrl[11] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_12 (scanreg_ctrl_wire[12],scanreg_ctrl[12] );
ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_16 (scanreg_ctrl_wire[16],scanreg_ctrl[16] );

ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF scff_ctrl_17 (scanreg_ctrl_wire[17],scanreg_ctrl[17] );




ST_ROM_LOLEAK_1024x64m16B2_TMl_lockup dff_SCTRLO_SE (SCTRLO);

  

// BEHAVIOURAL MODULE DESCRIPTION
// ================================

initial
begin
  // Define format for timing value
  $timeformat (-9, 6, " ns --", 10);
 
 `ifdef ST_MEM_SLM
  $slm_RegisterMemory(slm_handle, Words, Bits);
  `endif   
 
   reg_mem_block=0;
   flag_mem_block=0;
  
  
  `ifdef functional
  `else
   TimingViol_data=0;
   TimingViol_mask=0;
   `endif
 
 decoding_start=0;
  
   //Parameter Assignment
   
   reg_Fault_file_name = Fault_file_name; 
   reg_ConfigFault     = ConfigFault;
   reg_BinaryInit      = BinaryInit;
   reg_InitFileName    = InitFileName;
   reg_Initn_reset_value = Initn_reset_value;
   reg_File_load_time    = File_load_time;

   next_cycle_corrupt_func=0;
   next_cycle_corrupt_dft=0;
   init_pulse_done = 0;
   power_up_done = 0;
   file_loaded=1;
   debug_level= p_debug_level; 
   
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
       
  task_read_fault_file; 
   if(!INITNint) begin
    if(supply_ok ) begin 
      init_pulse_done = 1;
      power_up_done = 1;
     
    end 
   end 
        
   lastCK_func = CKint_func;
   lastCK_dft = CKint_dft;

 `ifdef ST_MEM_CONTENTS_SLEEP
   ptr=$fopen("MEMORY_CONTENTS_SLEEP_ASSERT.dat","w");
   $fclose(ptr);
   ptr=$fopen("MEMORY_CONTENTS_SLEEP_DEASSERT.dat","w");
   $fclose(ptr);
   ptr=$fopen("MEMORY_CONTENTS_SLEEP_INVALID.dat","w");
   $fclose(ptr);
 `endif 

#(message_control_time + `access_time); 
  if (debug_level === 2'b00) begin
    message_status = "All Message are Switched OFF";
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

  if  (debug_level > 2) 
          begin
          
   $display ("%m - %t ST_INFO: *****************************************", $realtime);
   $display ("%m - %t ST_INFO: The Model is Operating in %s MODE", $realtime, operating_mode);
   $display ("%m - %t ST_INFO: Please make sure that SDF is properly annotated otherwise dummy values will be used", $realtime);
   $display ("%m - %t ST_INFO: %s", $realtime, message_status);
   $display ("%m - %t ST_INFO: ***************************************", $realtime);
  end
 
end  // initial block ends

//+++++++++++++++++++++++++++++++ CONFIG FAULT IMPLEMETATION ENDS+++++++++++++++++++++++++++++++//
        
//INITN block starts
//================================
always @(INITNint  or supply_ok )
begin
 if (INITNint === 1'b0) begin
   if(supply_ok) begin
     init_pulse_done = 1;
     power_up_done = 1;
     lastCK_func=CKint_func;
     lastCK_dft=CKint_dft;
     next_cycle_corrupt_func = 0;
     next_cycle_corrupt_dft = 0;
       
   end 
 end        

 if (CKint_dft === 1'b1 && SE_reg !== 0 && ATPreg !== 0 && INITNreg === 1'b1 && STDBYreg === 1'b0 && SLEEPreg === 1'b0 && INITNint !== 1)
   begin
     ScanOutX;
     ScanChainX;
   end  
         
 if (init_pulse_done === 0 && INITNint !== 0) begin
     if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
 end
 
end//always @(INITNint)


// Functional CK block starts
//======================================
always @(CKint_func)
begin
   lastCK_func=CKreg_func;  
   CKreg_func=CKint_func;
 if(supply_ok === 1) begin
   if (init_pulse_done === 0) begin
        if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
   end
   else begin
      if (CKreg_func === 1'bX || (CKreg_func === 1'b1 && lastCK_func === 1'bx)) begin
        if (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && CSNint !== 1 && IGint !== 1 && DEint !== 1 && (ATPint !== 1 ||(ATPint === 1 && SEsys !== 1 && TBYPASSsys !== 1))) begin

         if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: CK pin  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime);  
         Invalid_next_cycle_func;
        end
      end
      else if (CKreg_func === 1'b1 && lastCK_func === 1'b0 ) begin
        time_CK_func_rise=$realtime;
        MEMEN_prev = MEMEN_reg;
        MEMEN_reg = MEMEN;
        CSNreg = CSNint;
        IGreg = IGint;
        DEreg = DEint;
        SE_reg = SEsys;
        TBYPASS_reg = TBYPASSsys;
        ATPreg = ATPint;
        INITNreg = INITNint;
        SLEEPreg = SLEEPint;
        STDBYreg = STDBYint;
    `ifdef functional
    `else
        `ifdef ST_MEM_SLM
                $slm_ReadMemory(slm_handle, Aint, Mem_last);
        `else
                Mem_last=Mem[Aint]; 
        `endif
    `endif 
        if (INITNreg === X && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin

            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.INITN pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg === X && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.SLEEP pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime);  
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg === X && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.STANDBY pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg === X && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
         
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.chip select  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg === X && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
         
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.IG pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg === X && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
         
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.Debug pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg === X && (SE_reg !== 1 && TBYPASS_reg !== 1))) begin

            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.ATP pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && ATPreg !== 0 && SE_reg === X && TBYPASS_reg !== 1) begin
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.SE pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && ATPreg !== 0 && SE_reg !== 1 && TBYPASS_reg === X) begin
         
            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.TBYPASS pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end
        else if ((INITNreg === 1 && STDBYreg === 0 && SLEEPreg === 0 && CSNreg === 0 && IGreg === 0 && DEreg === 0 && (ATPreg === 0 ||(ATPreg === 1 && SE_reg === 0 && TBYPASS_reg === 0))) && WENint === X) begin
            // Uncertain write cycle

            if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: write enable going to X  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
            Invalid_next_cycle_func;
        end 
        else if (next_cycle_corrupt_func === 1) begin
          next_cycle_corrupt_func = X;
        end
        else if (next_cycle_corrupt_func === 1'bx) begin
          next_cycle_corrupt_func = 0;
        end 
        
        if (next_cycle_corrupt_func !== 1 ) begin 
         
          /*---------------------- File initialization -----------------*/
          
          if (INITNreg === 1 && STDBYreg === 0 && SLEEPreg === 0 && CSNreg === 0 && IGreg === 0 && DEreg === 0 && (ATPreg === 0 ||(ATPreg === 1 && SE_reg === 0 && TBYPASS_reg === 0)) && flag_mem_block === 1'b0) begin
                 Areg=Aint;
                 Dreg=Dint;
                 Mreg=Mint;
                 WENreg=WENint;     
             if ($realtime >= reg_File_load_time && file_loaded ) begin   
                `ifdef ST_MEM_SLM
                  if (reg_BinaryInit)
                     $slm_LoadMemory(slm_handle, reg_InitFileName, "VERILOG_BIN");
                  else
                     $slm_LoadMemory(slm_handle, reg_InitFileName, "VERILOG_HEX");
   
                `else
                  if (reg_BinaryInit)
                     $readmemb(reg_InitFileName, Mem, 0, Words-1);
                  else
                     $readmemh(reg_InitFileName, Mem, 0, Words-1);
                `endif
                 file_loaded = 0;
             end
   
             if (^Aint === X)
               ValidAddress = X;
             else if (Aint < Words)
               ValidAddress = 1;
             else    
               ValidAddress = 0;
   
             if (ValidAddress)
               `ifdef ST_MEM_SLM
                   $slm_ReadMemoryS(slm_handle, Aint, Mem_temp);
               `else
                    Mem_temp = Mem[Aint];
               `endif
             else
                Mem_temp = WordX;  
          
     /*---------------------- Normal Read and Write -----------------*/
     
             if (WENint === 1 && next_cycle_corrupt_func === 0) begin
               ReadCycle(Aint);
             end
   
                
          
          end //  if (MEMEN === 1'b1 
       
        end  // if (next_cycle_corrupt_func === 0
      
      end // if (CKint = 1   
   end // if (init_pulse_done === 1           
 end 
end // always @(CKint_func)
        
always @(MEMEN)
begin
 if(supply_ok === 1) begin
  if ((INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && CSNint !== 1 && IGint !== 1 && DEint !== 1 && (ATPint !== 1 ||(ATPint === 1 && SEsys !== 1 && TBYPASSsys !== 1))) && CKint_func === 1'bx) begin

    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.CK pin  should not be X at this time instant. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
    Invalid_next_cycle_func;
  end
 end 
end

// DFT CK block starts
//======================================
always @(CKint_dft) 
begin
   lastCK_dft=CKreg_dft;
   CKreg_dft=CKint_dft;
 if(supply_ok === 1) begin
   if (init_pulse_done === 0) begin
     if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
   end
   else begin
     if (CKreg_dft === 1'bX || (CKreg_dft === 1'b1 && lastCK_dft === 1'bx)) begin
       if (INITNint !== 0 && SLEEPint !== 1 && STDBYint !== 1 && ATPint !== 0 ) begin

         if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: DFT clock  Memory State Machine is corrupted. ScanChains and ScanOuts Corrupted ",$realtime); 
         Invalid_next_cycle_dft;
         if (TBYPASSsys !== 0 && ATPint !== 0 && SEsys !== 1) begin
           WriteOutX;
         end
       end
     end 
     
     if(CKint_dft === 0 && lastCK_dft === 1) begin
      if(ATPreg === 1'b1 && INITNreg === 1'b1 && SLEEPreg === 1'b0 && STDBYreg === 1'b0) begin
       if(SE_reg === 1'b1 && SEsys === 1'b0) begin
        if(TBYPASSint === 1'b1) begin   
    
    OutReg_data_scan = { scanreg_dr[0],
scanreg_dr[1],
scanreg_dr[2],
scanreg_dr[3],
scanreg_dr[4],
scanreg_dr[5],
scanreg_dr[6],
scanreg_dr[7],
scanreg_dr[8],
scanreg_dr[9],
scanreg_dr[10],
scanreg_dr[11],
scanreg_dr[12],
scanreg_dr[13],
scanreg_dr[14],
scanreg_dr[15],
scanreg_dr[16],
scanreg_dr[17],
scanreg_dr[18],
scanreg_dr[19],
scanreg_dr[20],
scanreg_dr[21],
scanreg_dr[22],
scanreg_dr[23],
scanreg_dr[24],
scanreg_dr[25],
scanreg_dr[26],
scanreg_dr[27],
scanreg_dr[28],
scanreg_dr[29],
scanreg_dr[30],
scanreg_dr[31],scanreg_dl[0],
scanreg_dl[1],
scanreg_dl[2],
scanreg_dl[3],
scanreg_dl[4],
scanreg_dl[5],
scanreg_dl[6],
scanreg_dl[7],
scanreg_dl[8],
scanreg_dl[9],
scanreg_dl[10],
scanreg_dl[11],
scanreg_dl[12],
scanreg_dl[13],
scanreg_dl[14],
scanreg_dl[15],
scanreg_dl[16],
scanreg_dl[17],
scanreg_dl[18],
scanreg_dl[19],
scanreg_dl[20],
scanreg_dl[21],
scanreg_dl[22],
scanreg_dl[23],
scanreg_dl[24],
scanreg_dl[25],
scanreg_dl[26],
scanreg_dl[27],
scanreg_dl[28],
scanreg_dl[29],
scanreg_dl[30], scanreg_dl[scanlen_l-1]}; 
         for (i = 0; i < Bits; i = i + 1)
         begin
          if (OutReg_data[i] !== OutReg_data_scan[i])
          OutReg_data[i] = WordX[i];
         end  //for (i = 0; i <  
        OutReg_data <= OutReg_data_scan;
        end 
       end
      end
     end 
     
     else if (CKreg_dft === 1'b1 && lastCK_dft === 1'b0 ) begin
       SE_reg = SEsys;
       TBYPASS_reg = TBYPASSsys;
       ATPreg = ATPint;
       INITNreg = INITNint;
       SLEEPreg = SLEEPint;
       STDBYreg = STDBYint;
       MEMEN_dft_prev = MEMEN_dft_reg;
       MEMEN_dft_reg = MEMEN_dft;
       if (INITNreg === X && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
           if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: INITN pin  Memory State Machine is corrupted. ScanChains and ScanOuts Corrupted ",$realtime); 
           Invalid_next_cycle_dft;
           if (TBYPASSsys !== 0 && ATPint !== 0 && SEsys !== 1) begin
             WriteOutX;
           end
       end
       else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg === X && ATPreg !== 0 ) begin      
           if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: SLEEP pin  Memory State Machine is corrupted. ScanChains and ScanOuts Corrupted ",$realtime); 
           Invalid_next_cycle_dft;
           if (TBYPASSsys !== 0 && ATPint !== 0 && SEsys !== 1) begin
             WriteOutX;
           end
       end
       else if (INITNreg !== 0 && STDBYreg === X && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
           if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: STDBY pin  Memory State Machine is corrupted. ScanChains and ScanOuts Corrupted ",$realtime); 
           Invalid_next_cycle_dft;
           if (TBYPASSsys !== 0 && ATPint !== 0 && SEsys !== 1) begin
             WriteOutX;
           end
       end
       else if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg === X ) begin      
           if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: ATP pin  Memory State Machine is corrupted. ScanChains and ScanOuts Corrupted ",$realtime); 
           Invalid_next_cycle_dft;
           if (TBYPASSsys !== 0 && ATPint !== 0 && SEsys !== 1) begin
             WriteOutX;
           end
       end
       else if (next_cycle_corrupt_dft === 1'b1) begin 
         next_cycle_corrupt_dft = X;
       end 
       else if (next_cycle_corrupt_dft === 1'bx) begin
         next_cycle_corrupt_dft = 0;
       end
       
       if (next_cycle_corrupt_dft === 0 ) begin
         
         if (INITNreg === 1 && STDBYreg === 0 && SLEEPreg === 0 && ATPreg === 1 && flag_mem_block === 1'b0) begin
           
           if (TBYPASSsys === 1 && ATPint === 1 && SEsys === 0) begin
              OutReg_data_tbypass = Dint;
              for (i = 0; i < Bits; i = i + 1)
              begin
               if (OutReg_data_tbypass[i] !== OutReg_data[i])
                 OutReg_data[i] = WordX[i];
              end//for (i = 0; i < */ 
              OutReg_data <= OutReg_data_tbypass;
           end
           
             scan_acquire;
             SCTRLOint = scanreg_ctrl[scanlen_ctrl -1];
    
           if (SCTRLOint !== SCTRLO_data) begin 
              SCTRLO_data=1'bx;
              SCTRLO_data <= SCTRLOint;
             end
    
         end //MEMEN_dft == 1        
       end // if ( next_cycle_corrupt_dft
       
     end // if (CKint_dft === 1'b1
     if (next_cycle_corrupt_dft === 0 ) begin 
       if (SE_reg !== 0) begin
         if (INITNreg === 1 && STDBYreg === 0 && SLEEPreg === 0 && ATPreg === 1  && flag_mem_block === 1'b0) begin
           scan_shift;
         end
       end
     end // if ( next_cycle_corrupt_dft    
   end // if (init_pulse_done 
 end // if (supply_ok 
end // always @(CKint_dft)

always @(MEMEN_dft)
begin
 if(supply_ok === 1) begin
  if ((INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 ) && CKint_dft === 1'bx)  begin
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Memory State Machine is corrupted.MEMEN_dft and clock should not be X at this time instant. ScanChains and ScanOuts Corrupted ",$realtime); 
    Invalid_next_cycle_dft;
    
    if (TBYPASSsys !== 0 && ATPint !== 0 && SEsys !== 1) begin
      WriteOutX;
    end
  end
  if ( MEMEN_dft !== 0 && TBYPASSsys === X && SEsys !== 1) begin
     WriteOutX;
     OutReg_data = WordX; 
     delOutReg_data=WordX;
  end
 end 
end //always @(MEMEN_dft

always @(TBYPASSsys or ATPint)
begin
   if(supply_ok === 1'b1) begin 
    if (TBYPASSsys === 1 && ATPint === 1 && SEsys === 0) begin
      if ((SEsys === 1'b0) || (CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg === X && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
      else if ((SEsys === 1'b0) || (CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg === X && ATPreg !== 0 ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
      else if ((SEsys === 1'b0) || (CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg === X ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
      else if ((SEsys === 1'b0) || (CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg !== 0 && STDBYreg === X && SLEEPreg !== 1 && ATPreg !== 0 ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
    end  
    else if ((TBYPASSsys === X && ATPint !== 0 && SEsys !== 1)) begin
     OutReg_data = WordX;
     delOutReg_data = WordX;
    end
    else if ((TBYPASSsys !== 0 && ATPint === X && SEsys !== 1) ) begin
     OutReg_data = WordX;
     delOutReg_data = WordX;
    end
    else if ((TBYPASSsys !== 0 && ATPint !== 0 && SEsys === X)) begin
     OutReg_data = WordX;
     delOutReg_data = WordX;
    end
 end 
end //always @(TBYPASSint

always @(SEsys)
begin
 if(supply_ok === 1'b1) begin 
  if(CKint_dft === 0 && ATPint === 1'b1 && INITNreg === 1'b1 && SLEEPreg === 1'b0 && STDBYreg === 1'b0) begin
    if(SE_reg === 1'b1 && SEsys === 1'b0) begin
      if(TBYPASSsys === 1'b1) begin
  
        OutReg_data_scan = { scanreg_dr[0],
scanreg_dr[1],
scanreg_dr[2],
scanreg_dr[3],
scanreg_dr[4],
scanreg_dr[5],
scanreg_dr[6],
scanreg_dr[7],
scanreg_dr[8],
scanreg_dr[9],
scanreg_dr[10],
scanreg_dr[11],
scanreg_dr[12],
scanreg_dr[13],
scanreg_dr[14],
scanreg_dr[15],
scanreg_dr[16],
scanreg_dr[17],
scanreg_dr[18],
scanreg_dr[19],
scanreg_dr[20],
scanreg_dr[21],
scanreg_dr[22],
scanreg_dr[23],
scanreg_dr[24],
scanreg_dr[25],
scanreg_dr[26],
scanreg_dr[27],
scanreg_dr[28],
scanreg_dr[29],
scanreg_dr[30],
scanreg_dr[31],scanreg_dl[0],
scanreg_dl[1],
scanreg_dl[2],
scanreg_dl[3],
scanreg_dl[4],
scanreg_dl[5],
scanreg_dl[6],
scanreg_dl[7],
scanreg_dl[8],
scanreg_dl[9],
scanreg_dl[10],
scanreg_dl[11],
scanreg_dl[12],
scanreg_dl[13],
scanreg_dl[14],
scanreg_dl[15],
scanreg_dl[16],
scanreg_dl[17],
scanreg_dl[18],
scanreg_dl[19],
scanreg_dl[20],
scanreg_dl[21],
scanreg_dl[22],
scanreg_dl[23],
scanreg_dl[24],
scanreg_dl[25],
scanreg_dl[26],
scanreg_dl[27],
scanreg_dl[28],
scanreg_dl[29],
scanreg_dl[30], scanreg_dl[scanlen_l-1]}; 
        for (i = 0; i < Bits; i = i + 1)
        begin
         if (OutReg_data[i] !== OutReg_data_scan[i])
          OutReg_data[i] = WordX[i];
        end  //for (i = 0; i <  
        OutReg_data <= OutReg_data_scan;
      end
    end
  end
  if (TBYPASSsys === 1 && ATPint === 1 && SEsys === 0) begin
      if ((CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg === X && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
      else if ((CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg === X && ATPreg !== 0 ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
      else if ((CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg === X ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
      else if ((CKint_dft === 1'bx && (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 )) || (CKint_dft !== 1'b0 && (INITNreg !== 0 && STDBYreg === X && SLEEPreg !== 1 && ATPreg !== 0 ))) begin
       OutReg_data = WordX;
       delOutReg_data = WordX;       
      end
  end 
  else if ((TBYPASSsys === X && ATPint !== 0 && SEsys !== 1)) begin
     OutReg_data = WordX;
     delOutReg_data = WordX;
    end
  else if ((TBYPASSsys !== 0 && ATPint === X && SEsys !== 1)) begin
     OutReg_data = WordX;
     delOutReg_data = WordX;
    end
  else if ((TBYPASSsys !== 0 && ATPint !== 0 && SEsys === X)) begin
     OutReg_data = WordX;
     delOutReg_data = WordX;
    end
 end   
end

//assign output data
`ifdef functional        

   
always @(SCTRLOint)
#`access_time delSCTRLO_data<=SCTRLOint;


always @(OutReg_data)
   #`access_time delOutReg_data = OutReg_data;
`else
`endif

/***************************** Embeded switch functionality starts here ***********************************/





always @(STDBYint)
begin
  if (supply_ok === 1'b1) begin
   if (init_pulse_done === 0)
     begin
       if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
     end
   else if (CKint_dft === 1'b1 && SE_reg !== 0 && ATPreg !== 0 && INITNreg === 1'b1 && SLEEPreg === 1'b0 && STDBYreg === 1'b0 && STDBYint !== 1'b0)
    begin
      ScanOutX;
      ScanChainX;
    end
  end
end



always @(SLEEPint)
begin



  if (supply_ok === 1'b1) begin
   if (init_pulse_done === 0)
     begin
       if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
     end
   else if (CKint_dft === 1'b1 && SE_reg !== 0 && ATPreg !== 0 && INITNreg === 1'b1 && STDBYreg === 1'b0 && SLEEPreg === 1'b0 && SLEEPint !== 0)
    begin
      ScanOutX;
      ScanChainX;
    end
  end

// if (init_pulse_done === 0)
//   begin
//     if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
//   end
//
// else if ( SLEEPint !== 1 && (supply_ok !==1) ) begin
//    WriteOutX;
//    OutReg_data = WordX; 
//    delOutReg_data=WordX;
//    ScanOutX;//immediately;
//    delScanOutX;//immediately;
//    ScanChainX;
//    if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Invalid state of power supplies with sleep/Power down signal being low.This scenario can lead to high dc currents and some reliability issues Memory,Output,ScanChains,ScanOuts & Redundancy chain are corrupted. ",$realtime); 
// end

 print_sleep;    
 lastSLEEP=SLEEPint;
end

/********************************** Embeded switch functionality ends here *******************************/

task print_sleep;
begin
  if (SLEEPint === 1'b0) begin
      if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: SLEEP pin has been deasserted.The contents of memory are dumped in a file named MEM_CONTENTS_SLEEP_INACTIVE in the current simulation directory. ",$realtime);
      `ifdef ST_MEM_CONTENTS_SLEEP
        ptr=$fopen("MEMORY_CONTENTS_SLEEP_DEASSERT.dat","a");
        for(memcnt = 0; memcnt < Words; memcnt = memcnt+ 1) begin 
         $fdisplay(ptr,"contents at location %d are = %b ",memcnt,Mem[memcnt],$realtime);
        end
        $fclose(ptr);
      `endif
  end  
  else if (SLEEPint === 1'b1) begin
      if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: SLEEP pin has been asserted.The contents of memory are dumped in a file named MEM_CONTENTS_SLEEP_ACTIVE in the current simulation directory. ",$realtime);
      `ifdef ST_MEM_CONTENTS_SLEEP
        ptr=$fopen("MEMORY_CONTENTS_SLEEP_ASSERT.dat","a");
        for(memcnt = 0; memcnt < Words; memcnt = memcnt+ 1) begin 
         $fdisplay(ptr,"contents at location %d are = %b ",memcnt,Mem[memcnt],$realtime);
        end
        $fclose(ptr);
      `endif

  end        
  else begin
      if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: SLEEP pin is at an invalid state.The contents of memory are dumped in a file named MEM_CONTENTS_SLEEP_INVALID in the current simulation directory. ",$realtime);
      `ifdef ST_MEM_CONTENTS_SLEEP
        ptr=$fopen("MEMORY_CONTENTS_SLEEP_INVALID.dat","a");
        for(memcnt = 0; memcnt < Words; memcnt = memcnt+ 1) begin 
         $fdisplay(ptr,"contents at location %d are = %b ",memcnt,Mem[memcnt],$realtime);
        end
        $fclose(ptr);
      `endif
  end        
end
endtask


//// power pins func ends
always @( vddmreg or gndmreg or r_supply_trigger)
begin
  if ( vddmreg !== 1'b1  || gndmreg !== 1'b0) begin
     if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Invalid state of power supplies. Memory,Output,ScanChains,ScanOuts & Redundancy chain are corrupted. ",$realtime);
     WriteOutX;
     ScanChainX;
     ScanOutX;
     delScanOutX;//immediately;
     OutReg_data = WordX; 
     delOutReg_data=WordX;
     WriteOutX;
     init_pulse_done = 0;
  end
end

/*
always @(negedge supply_ok)
begin
 
 if (init_pulse_done === 0)
    begin
      if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
 end

 else if (SLEEPint !== 1) begin
     WriteOutX;
     ScanChainX;
     ScanOutX;
     delScanOutX;//immediately;
     OutReg_data = WordX; 
     delOutReg_data=WordX;
     WriteOutX;
       init_pulse_done = 0;
    if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Invalid state of power supplies with sleep/Power down signal being low.This scenario can lead to high dc currents and some reliability issues Memory,Output,ScanChains,ScanOuts & Redundancy chain are corrupted. ",$realtime);
     @(posedge supply_ok)
      begin
        if (!INITNint) begin
         init_pulse_done = 1;
        end  
        else begin
         if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Initialization pulse required as supplies have been turned on after being turned off in SLEEP = 0 mode ",$realtime); 
        end
       
     end
 end
end

always @( gndmreg) begin
 if (init_pulse_done === 0)
    begin
      if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
 end

 else if (gndmreg !== 0  ) begin
   corrupt_all;
   if (SLEEPint === 1) begin
     if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: In sleep/deep sleep mode the memory must get powered up/down in a particular sequence as defined in spec.The power sequencing has been violated at this instant of time.Ground must be maintained at 0 Memory,Output,ScanChains,ScanOuts & Redundancy chain are corrupted.All further operations(R/W,Scan,TBYPASS etc) on memory are blocked. ",$realtime);
     mem_blocked;
   end
 end
end


always @(vddmreg ) begin
 if (init_pulse_done === 0)
    begin
      if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Init pulse not applied yet,No operation allowed before initialisation pulse ",$realtime);
 end

 else if (vddmreg !==1  ) begin
  if (SLEEPint === 1'b1 && core_supply_ok === 1 ) begin
     WriteOutX;
   OutReg_data = WordX; 
   delOutReg_data=WordX;  
   ScanChainX;
   ScanOutX;//immediately; 
   delScanOutX;//immediately;
  end  
  else if (SLEEPint !== 1) begin
     WriteOutX;
   OutReg_data = WordX; 
   delOutReg_data=WordX;
   ScanChainX;
   ScanOutX;//immediately;
   delScanOutX;//immediately;
  end   
 end
end


*/

always @(gndmreg) begin
 if (gndmreg === 0) begin
  if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: gndm or Common ground is being powered up. ",$realtime);
 end
 else if (gndmreg === 1) begin
  if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: gndm or Common ground is being powered down. ",$realtime);
 end
 else begin
  if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Invalid value on power supply pin ",$realtime);
 end
end




always @(vddmreg) begin
 if (vddmreg === 0) begin 
  if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: vddm or Array Power supply is being powered down. ",$realtime);
 end
 else if (vddmreg === 1) begin
  if( (debug_level > 2) && ($realtime > message_control_time) ) $display("%m - %t ST_INFO: vddm or Array Power supply is being powered up. ",$realtime);
 end
 else begin
  if( (debug_level > 0) && ($realtime > message_control_time) ) $display("%m - %t ST_ERROR: Invalid value on power supply pin ",$realtime);
 end 
end



assign supply_ok          =  (vddmreg === 1'b1 && vddmoreg === 1'b1  && gndmreg === 1'b0 && ((SLEEPint & PSWLARGEMAint) === 1'b0) && ((SLEEPint & PSWLARGEMPint) === 1'b0) && ((SLEEPint & PSWSMALLMAint) === 1'b0) && ((SLEEPint & PSWSMALLMPint) === 1'b0)) ? 1'b1 : 1'b0;
assign core_supply_ok     =  (vddmreg === 1'b1 && gndmreg === 1'b0) ? 1'b1 : 1'b0;
assign peri_supply_ok     =  (vddmreg === 1'b1 && gndmreg === 1'b0  ) ? 1'b1 : 1'b0;




always @(vddmoreg) begin 
     if(vddmoreg !==  1'b1 ) begin 
       corrupt_all ;
    end
end 



`ifdef functional
`else


always @(TimingViol_addr)
// tas or tah
begin
#0
  if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: Address pin timing violation Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  end
  if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
      scanreg_ctrl={scanlen_ctrl{1'bx}}; 
      SCTRLOint=X;
      `ifdef functional
      `else
      SCTRLO_data=1'bx;
      `endif
  end
end



always @(TimingViol_CSN )
// tps or tph 
begin
#0
  if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: CSN timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  end
  if (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 ) begin      
   scanreg_ctrl={scanlen_ctrl{1'bx}}; 
   SCTRLOint=X;
   `ifdef functional
   `else
   SCTRLO_data=1'bx;
   `endif
  end
end

always @(TimingViol_tcycle )
//tcycle
begin
#0
   if (MEMEN_dft !== 0 && MEMEN_dft_prev !== 0) begin
    Invalid_next_cycle_dft;
   end
   if (MEMEN !== 0 && MEMEN_prev !== 0) begin
    Invalid_next_cycle_func;
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: CK pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime);
   end
end

always @(TimingViol_tckl )
// tckl 
begin
#0
   if (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 ) begin      
    Invalid_next_cycle_dft;
   end
   if (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && CSNint !== 1 && IGint !== 1 && DEint !== 1 && (ATPint !== 1 ||(ATPint === 1 && SEsys !== 1 && TBYPASSsys !== 1))) begin
    Invalid_next_cycle_func;
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: CK pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
   end
end

always @(TimingViol_tckh) begin
#0
   if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
    Invalid_next_cycle_dft;
   end
   if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && IGreg !== 1 && DEreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1))) begin
    Invalid_next_cycle_func;
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: CK pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
   end
end


always @(TimingViol_tcycle_se )
//tcycle_se
begin
#0
   if (MEMEN_dft !== 0 && MEMEN_dft_prev !== 0) begin
    Invalid_next_cycle_dft;
   end
end

always @(TimingViol_tckl_se  )
begin
#0
   if (INITNint !== 0 && STDBYint !== 1 && SLEEPint !== 1 && ATPint !== 0 ) begin      
    Invalid_next_cycle_dft;
   end
end

always @(TimingViol_tckh_se) begin
#0
  if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
    Invalid_next_cycle_dft;
   end
end

always @(TimingViol_tbist) begin
#0
   if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
    ScanChainX;
    ScanOutX;
    delScanOutX;       
   end
   if (TBYPASSint !== 1'b0) begin 
    WriteOutX;
   end 
   if (INITNreg !==0 && STDBYreg !== 1 && TBYPASS_reg !== 1 && SLEEPreg !== 1 && SE_reg !== 1 && IGreg !== 1 && DEreg !== 1) begin
    Invalid_next_cycle_func;
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: TBIST pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
   end
end

always @(TimingViol_ls) begin
 #0 
   if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && CSNreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IGreg !== 1 && (HSint !== X) && (^RMint === 1'b0) && (^WMint === 0)) begin
    Invalid_next_cycle_func;
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: LS pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
   end
end







always @(TimingViol_stdby)
begin
#0
  if (CSNreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IGreg !== 1 && DEreg !== 1) begin 
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: STDBY pin timing violation Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  end  
  if (ATPreg !== 0) begin 
   Invalid_next_cycle_dft;
  end
end


always @(TimingViol_se) begin
#0
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: SE timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
    ScanChainX;
    ScanOutX;
    delScanOutX;       
  end
end

always @(TimingViol_sctrli) begin
  TimingViol_sctrli_flag = 1'b1;
end


always @(TimingViol_initnl) begin
init_pulse_done=0;
WriteOutX;
OutReg_data = WordX; 
delOutReg_data=WordX;
ScanOutX;
delScanOutX;
ScanChainX;
end

always @(TimingViol_initn) begin
#0
  if (SLEEPreg !== 1 && STDBYreg !== 1 && CSNreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IGreg !== 1 && DEreg !== 1) begin
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: INITN timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  end  
  if (SLEEPreg !== 1 && STDBYreg !== 1 && ATPreg !== 0) begin
   Invalid_next_cycle_dft;
  end
end

always @(TimingViol_ig) begin
#0
  if (SLEEPreg !== 1 && STDBYreg !== 1 && CSNreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && INITNreg !== 0 && DEreg !== 1) begin
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: IG pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  end  
  if (INITNreg !== 0 && STDBYreg !== 1 && SLEEPreg !== 1 && ATPreg !== 0 ) begin      
   ScanChainX;
   ScanOutX;
   delScanOutX;       
  end
end

always @(TimingViol_atp) begin
#0
  if (SLEEPreg !== 1 && STDBYreg !== 1 && TBYPASSsys !== 1 && SEsys !== 1 && INITNreg !== 0 && DEreg !== 1) begin  
   Invalid_next_cycle_func;
   if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: ATP pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime); 
  end  
  if (SLEEPreg !== 1 && STDBYreg !== 1 && INITNreg !== 0) begin
   Invalid_next_cycle_dft;
  end
end


always @(TimingViol_rm) begin
#0
   if (INITNreg !== 0 && SLEEPreg !== 1 && STDBYreg !== 1 && CSNreg !== 1 && (ATPreg !== 1 ||(ATPreg === 1 && SE_reg !== 1 && TBYPASS_reg !== 1)) && IGreg !== 1 && (LSint !== X) && (HSint !== X) && (^WMint === 0)) begin 
    Invalid_next_cycle_func;
    if( (debug_level > 1) && ($realtime > message_control_time) ) $display("%m - %t ST_WARNING: RM pin timing violation  Memory State Machine is corrupted. Output Corrupted.Next Clock cycle will be not functional ",$realtime);  
   end
end



`endif


endmodule




module ST_ROM_LOLEAK_1024x64m16B2_TMl_SCFF(TI,Q);
input Q;
inout TI;
endmodule

module ST_ROM_LOLEAK_1024x64m16B2_TMl_lockup(Q);
input Q;
endmodule


`endcelldefine


 `undef access_time 
 `undef retain_time
 `undef st_msg_cntrl_time 


