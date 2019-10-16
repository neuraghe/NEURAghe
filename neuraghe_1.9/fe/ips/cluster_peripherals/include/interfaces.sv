// uncomment if FPGA emulator

// uncomment if using Vivado for ulpcluster synthesis
`define VIVADO


// Enables memory mapped register and counters to extract statistic on instruction cache
//`define FEATURE_ICACHE_STAT   

`define FEATURE_ICACHE_STAT



//Choose the technology (ASIC synthesis Only) --> 8T : CMOS28FDSOI_8T    or 12T UWVR : CMOS28FDSOI_12T_UWVR
//`define CMOS28FDSOI_12T_UWVR
`define CMOS28FDSOI_8T




//PARAMETRES
   `define NB_CLUSTERS   1
   `define NB_CORES      4
   `define NB_DMAS       4
   `define NB_MPERIPHS   1
   `define NB_TCDM_BANKS 8
   `define NB_SPERIPHS   8


// DEFINES
`define MPER_EXT_ID   0

`define SPER_EOC_ID      0
`define SPER_TIMER_ID    1
`define SPER_BBMUX_ID    2
`define SPER_RPIPE_ID    3
`define SPER_MMU_ID      4
`define SPER_ICACHE_CTRL 5
`define SPER_DUMMY1_ID   6
`define SPER_EXT_ID      7
// slots 5 & 6 currently not used


`define RVT 0
`define LVT 1

`define LEVEL_SHIFTER

// Comment to use bheavioral memories, uncomment to use stdcell latches. If uncommented, simulations slowdown occuor
`ifdef SYNTHESIS
 `define SCM_IMPLEMENTED
 `define SCM_BASED_ICACHE
`endif
//////////////////////
// MMU DEFINES
//
// switch for including implementation of MMUs
//`define MMU_IMPLEMENTED
// number of logical TCDM banks (regarding interleaving)
`define MMU_TCDM_BANKS 8
// switch to enable local copy registers of
// the control signals in every MMU
//`define MMU_LOCAL_COPY_REGS
//
//////////////////////

// Width of byte enable for a given data width
`define EVAL_BE_WIDTH(DATAWIDTH) (DATAWIDTH/8)

// LOG2()
`define LOG2(VALUE) ((VALUE) < ( 1 ) ? 0 : (VALUE) < ( 2 ) ? 1 : (VALUE) < ( 4 ) ? 2 : (VALUE)< (8) ? 3:(VALUE) < ( 16 )  ? 4 : (VALUE) < ( 32 )  ? 5 : (VALUE) < ( 64 )  ? 6 : (VALUE) < ( 128 ) ? 7 : (VALUE) < ( 256 ) ? 8 : (VALUE) < ( 512 ) ? 9 : 10)

/*

////////////////////////////////////////////////////////////////////////////////
//          Only general functions and definitions are defined here           //
//              These functions are not intended to be modified               //
////////////////////////////////////////////////////////////////////////////////

//********************************************************
//**************** WISHBONE B3 BUS ***********************
//********************************************************

interface WB_B3_BUS;

   // REQUEST CHANNEL
   //***************************************
   logic [31:0] adr;
   logic [63:0] data;
   logic [7:0] 	sel;
   logic 	we;
   logic 	cyc;
   logic 	stb;
   logic [2:0] 	cti;
   logic [1:0] 	bte;

   // RESPONSE CHANNEL
   //***************************************
   logic [63:0] rdata;
   logic 	ack;
   logic 	err;
   logic 	rty;

   // Master Side
   //***************************************
   modport Master
     (
      output adr, output data, output sel, output we,
      output cyc, output stb, output cti, output bte,
      input rdata, input  ack, input  err, input rty
      );

   // Slave Side
   //***************************************
   modport Slave
     (
      input adr, input data, input sel, input we,
      input cyc, input stb, input cti, input bte,
      output rdata, output ack, output err, output rty
      );

endinterface // WB_B3_BUS

//**********************************************************
//**************** XBAR TCDM BUS ***************************
//**********************************************************

interface XBAR_TCDM_BUS;

   // REQUEST CHANNEL
   //***************************************
   logic        req;
   logic [31:0] add;
   logic 	wen;
   logic [31:0] wdata;
   logic [3:0] 	be;
   logic 	gnt;

   // RESPONSE CHANNEL
   logic 	r_opc;
   logic [31:0] r_rdata;
   logic 	r_valid;

   // Master Side
   //***************************************
   modport Master
   (
      output req, output add, output wen, output wdata, output be,
      input gnt, input r_rdata, input r_opc, input r_valid
   );

   // Slave Side
   //***************************************
   modport Slave
   (
      input req, input add, input wen, input wdata, input be,
      output gnt, output r_rdata, output r_opc, output r_valid
   );

endinterface // XBAR_TCDM_BUS

//**********************************************************
//**************** XBAR PERIPHERAL BUS *********************
//**********************************************************
interface XBAR_PERIPH_BUS
#(
    parameter PER_ID_WIDTH = 17
);
   // REQUEST CHANNEL
   logic                     req;
   logic [31:0]              add;
   logic                     wen;
   logic [31:0]              wdata;
   logic [3:0]               be;
   logic                     gnt;
   logic [PER_ID_WIDTH-1:0]  id;

   // RESPONSE CHANNEL
   logic                     r_valid;
   logic                     r_opc;
   logic [PER_ID_WIDTH-1:0]  r_id;
   logic [31:0]              r_rdata;

   // Master Side
   //***************************************
   modport Master
   (
      output req, output add, output wen, output wdata, output be, output id,
      input gnt, input r_rdata, input r_opc, input r_id, input r_valid
   );

   // Slave Side
   //***************************************
   modport Slave
   (
      input req, input add, input wen, input wdata, input be, input id,
      output gnt, output r_rdata, output r_opc, output r_id, output r_valid
   );
endinterface

//**********************************************************
//******************** XBAR DEMUX BUS **********************
//**********************************************************

interface XBAR_DEMUX_BUS;

   // REQUEST CHANNEL
   logic        barrier;
   logic        busy;
   logic        exec_cancel;
   logic        exec_stall;
   logic        req;
   logic [31:0] add;
   logic 	we;
   logic [31:0] wdata;
   logic [3:0] 	be;
   logic 	gnt;

   // RESPONSE CHANNEL
   logic 	r_gnt;
   logic 	r_valid;
   logic [31:0] r_rdata;

   // Master Side
   //***************************************
   modport Master
     (
      output barrier, input busy, output exec_cancel, output exec_stall,
      output req, output add, output we, output wdata, output be, input gnt,
      output r_gnt, input r_rdata, input r_valid
      );

   // Slave Side
   //***************************************
   modport Slave
     (
      input barrier, output busy, input exec_cancel, input exec_stall,
      input req, input add, input we, input wdata, input be, output gnt,
      input r_gnt, output r_rdata, output r_valid
      );

endinterface // XBAR_DEMUX_BUS

//********************************************************
//**************** UNICAD MEMORY BUS *********************
//********************************************************

interface UNICAD_SRAM_MEM_BUS_32;

   logic [31:0] wdata;
   logic [9:0]  add;
   logic 	csn;
   logic 	wen;
   logic [31:0] wmn;
   logic [31:0] rdata;

   modport Master
     (
      output	wdata, output add, output csn,
      output wen, output wmn, input rdata
      );

   modport Slave
     (
      input wdata, input add, input csn,
      input wen, input wmn, output rdata
      );

endinterface


//********************************************************
//**************** UNICAD MEMORY BUS *********************
//********************************************************

interface UNICAD_SCM_MEM_BUS_32;

   logic [31:0] wdata;
   logic [7:0]  add; //FIXED now SCM is 256 word x 32 bit
   logic 	wen;
   logic 	ren;
   logic [3:0] 	ben;
   logic [31:0] rdata;

   modport Master
     (
      output	wdata, output add,
      output wen, output ren, output ben, input rdata
      );

   modport Slave
     (
      input wdata, input add,
      input wen, input ren, input ben, output rdata
      );

endinterface


//********************************************************
//**************** UNICAD MEMORY BUS *********************
//********************************************************

interface UNICAD_MEM_BUS_64;

   logic [63:0] wdata;
   logic [31:0] add;
   logic 	csn;
   logic 	wen;
   logic [7:0] 	ben;
   logic [63:0] rdata;

   modport Master
     (
      output	wdata, output add, output csn,
      output wen, output ben, input rdata
      );

   modport Slave
     (
      input wdata, input add, input csn,
      input wen, input ben, output rdata
      );

endinterface

//********************************************************
//******************** TCDM BUS **************************
//********************************************************

interface TCDM_BUS;


   logic [63:0]        data;
   logic [8:0] 	       addr;
   logic [3:0]	       csn;
   logic [3:0] 	       wen;
   logic [63:0]        wmn;
   logic [3:0][63:0]   qdata;

   modport Master
     (
      output	data, output addr, output csn,
      output wen, output wmn, input qdata
      );

   modport Slave
     (
      input data, input addr, input csn,
      input wen, input wmn, output qdata
      );

endinterface

//********************************************************
//***************** BBMUX CONFIG BUS *********************
//********************************************************

interface BBMUX_CONFIG_BUS;

   // REQUEST CHANNEL
   //***************************************
   logic [1:0]                   bbmux_tcdm;
   logic [`NB_CORES-1:0][1:0]    bbmux_core;
   logic [1:0] 	                 bbmux_scm;
   logic [1:0] 	                 bbmux_int;
   logic                         bbmux_sel;

   // RESPONSE CHANNEL
   //***************************************

   // Master Side
   //***************************************
   modport Master
     (
      output bbmux_tcdm,
      output bbmux_core,
      output bbmux_scm,
      output bbmux_int,
      output bbmux_sel
      );

   // Slave Side
   //***************************************
   modport Slave
     (
      input bbmux_tcdm,
      input bbmux_core,
      input bbmux_scm,
      input bbmux_int,
      input bbmux_sel
      );

endinterface // BBMUX_CONFIG_BUS

interface AXI_BUS
#(
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_ID_WIDTH   = 10,
    parameter AXI_USER_WIDTH = 6
);

   localparam AXI_STRB_WIDTH = `EVAL_BE_WIDTH(AXI_DATA_WIDTH);

   logic [AXI_ADDR_WIDTH-1:0] aw_addr;
   logic [2:0]                aw_prot;
   logic [3:0] 		      aw_region;
   logic [7:0] 		      aw_len;
   logic [2:0] 		      aw_size;
   logic [1:0] 		      aw_burst;
   logic 		      aw_lock;
   logic [3:0] 		      aw_cache;
   logic [3:0] 		      aw_qos;
   logic [AXI_ID_WIDTH-1:0]   aw_id;
   logic [AXI_USER_WIDTH-1:0] aw_user;
   logic 		      aw_ready;
   logic 		      aw_valid;

   logic [AXI_ADDR_WIDTH-1:0] ar_addr;
   logic [2:0] 		      ar_prot;
   logic [3:0] 		      ar_region;
   logic [7:0] 		      ar_len;
   logic [2:0] 		      ar_size;
   logic [1:0] 		      ar_burst;
   logic 		      ar_lock;
   logic [3:0] 		      ar_cache;
   logic [3:0] 		      ar_qos;
   logic [AXI_ID_WIDTH-1:0]   ar_id;
   logic [AXI_USER_WIDTH-1:0] ar_user;
   logic 		      ar_ready;
   logic 		      ar_valid;

   logic 		      w_valid;
   logic [AXI_DATA_WIDTH-1:0] w_data;
   logic [AXI_STRB_WIDTH-1:0] w_strb;
   logic [AXI_USER_WIDTH-1:0] w_user;
   logic 		      w_last;
   logic 		      w_ready;

   logic [AXI_DATA_WIDTH-1:0] r_data;
   logic [1:0] 		      r_resp;
   logic 		      r_last;
   logic [AXI_ID_WIDTH-1:0]   r_id;
   logic [AXI_USER_WIDTH-1:0] r_user;
   logic 		      r_ready;
   logic 		      r_valid;

   logic [1:0] 		      b_resp;
   logic [AXI_ID_WIDTH-1:0]   b_id;
   logic [AXI_USER_WIDTH-1:0] b_user;
   logic 		      b_ready;
   logic 		      b_valid;

   // Master Side
   //***************************************
   modport Master
     (

      output aw_valid, output aw_addr, output aw_prot, output aw_region,
      output aw_len, output aw_size, output aw_burst, output aw_lock,
      output aw_cache, output aw_qos, output aw_id, output aw_user,
      input aw_ready,

      output ar_valid, output ar_addr, output ar_prot, output ar_region,
      output ar_len, output ar_size, output ar_burst, output ar_lock,
      output ar_cache, output ar_qos, output ar_id, output ar_user,
      input ar_ready,

      output w_valid, output w_data, output w_strb,  output w_user, output w_last,
      input w_ready,

      input r_valid, input r_data, input r_resp, input r_last, input r_id, input r_user,
      output r_ready,

      input b_valid, input b_resp, input b_id, input b_user,
      output b_ready

      );

   // Master Side
   //***************************************
   modport Slave
     (

      input aw_valid, input aw_addr, input aw_prot, input aw_region,
      input aw_len, input aw_size, input aw_burst, input aw_lock,
      input aw_cache, input aw_qos, input aw_id, input aw_user,
      output aw_ready,

      input ar_valid, input ar_addr, input ar_prot, input ar_region,
      input ar_len, input ar_size, input ar_burst, input ar_lock,
      input ar_cache, input ar_qos, input ar_id, input ar_user,
      output ar_ready,

      input w_valid, input w_data, input w_strb, input w_user, input w_last,
      output w_ready,

      output r_valid, output r_data, output r_resp, output r_last, output r_id, output r_user,
      input r_ready,

      output b_valid, output b_resp, output b_id, output b_user,
      input b_ready

      );

endinterface

interface AXI_BUS_ASYNC
#(
	parameter AXI_ADDR_WIDTH = 32,
	parameter AXI_DATA_WIDTH = 64,
	parameter AXI_ID_WIDTH   = 10,
	parameter AXI_USER_WIDTH = 6,
	parameter BUFFER_WIDTH = 8
);

	localparam AXI_STRB_WIDTH = `EVAL_BE_WIDTH(AXI_DATA_WIDTH);

	logic [AXI_ADDR_WIDTH-1:0] aw_addr;
	logic [2:0]                aw_prot;
	logic [3:0] 		       aw_region;
	logic [7:0] 		       aw_len;
	logic [2:0] 		       aw_size;
	logic [1:0] 		       aw_burst;
	logic 		               aw_lock;
	logic [3:0] 		       aw_cache;
	logic [3:0] 		       aw_qos;
	logic [AXI_ID_WIDTH-1:0]   aw_id;
	logic [AXI_USER_WIDTH-1:0] aw_user;
    logic [BUFFER_WIDTH-1:0]   aw_writetoken;
    logic [BUFFER_WIDTH-1:0]   aw_readpointer;

	logic [AXI_ADDR_WIDTH-1:0] ar_addr;
	logic [2:0] 		       ar_prot;
	logic [3:0] 		       ar_region;
	logic [7:0] 		       ar_len;
	logic [2:0] 		       ar_size;
	logic [1:0] 		       ar_burst;
	logic                      ar_lock;
	logic [3:0]                ar_cache;
	logic [3:0]                ar_qos;
	logic [AXI_ID_WIDTH-1:0]   ar_id;
	logic [AXI_USER_WIDTH-1:0] ar_user;
	logic [BUFFER_WIDTH-1:0]   ar_writetoken;
	logic [BUFFER_WIDTH-1:0]   ar_readpointer;

	logic [AXI_DATA_WIDTH-1:0] w_data;
	logic [AXI_STRB_WIDTH-1:0] w_strb;
	logic [AXI_USER_WIDTH-1:0] w_user;
	logic 		               w_last;
	logic [BUFFER_WIDTH-1:0]   w_writetoken;
	logic [BUFFER_WIDTH-1:0]   w_readpointer;

	logic [AXI_DATA_WIDTH-1:0] r_data;
	logic [1:0] 		       r_resp;
	logic 		               r_last;
	logic [AXI_ID_WIDTH-1:0]   r_id;
	logic [AXI_USER_WIDTH-1:0] r_user;
	logic [BUFFER_WIDTH-1:0]   r_writetoken;
	logic [BUFFER_WIDTH-1:0]   r_readpointer;

	logic [1:0] 		       b_resp;
	logic [AXI_ID_WIDTH-1:0]   b_id;
	logic [AXI_USER_WIDTH-1:0] b_user;
	logic [BUFFER_WIDTH-1:0]   b_writetoken;
	logic [BUFFER_WIDTH-1:0]   b_readpointer;

	// Master Side
	//***************************************
	modport Master
		(

			output aw_addr, output aw_prot, output aw_region,
			output aw_len, output aw_size, output aw_burst, output aw_lock,
			output aw_cache, output aw_qos, output aw_id, output aw_user,
			output aw_writetoken, input aw_readpointer,

			output ar_addr, output ar_prot, output ar_region,
			output ar_len, output ar_size, output ar_burst, output ar_lock,
			output ar_cache, output ar_qos, output ar_id, output ar_user,
			output ar_writetoken, input ar_readpointer,

			output w_data, output w_strb,  output w_user, output w_last,
			output w_writetoken, input w_readpointer,

			input r_data, input r_resp, input r_last, input r_id, input r_user,
			input r_writetoken, output r_readpointer,

			input b_resp, input b_id, input b_user,
			input b_writetoken, output b_readpointer

			);

	// Master Side
	//***************************************
	modport Slave
		(

			input aw_addr, input aw_prot, input aw_region,
			input aw_len, input aw_size, input aw_burst, input aw_lock,
			input aw_cache, input aw_qos, input aw_id, input aw_user,
			input aw_writetoken, output aw_readpointer,

			input ar_addr, input ar_prot, input ar_region,
			input ar_len, input ar_size, input ar_burst, input ar_lock,
			input ar_cache, input ar_qos, input ar_id, input ar_user,
			input ar_writetoken, output ar_readpointer,

			input w_data, input w_strb, input w_user, input w_last,
			input w_writetoken, output w_readpointer,

			output r_data, output r_resp, output r_last, output r_id, output r_user,
			output r_writetoken, input r_readpointer,

			output b_resp, output b_id, output b_user,
			output b_writetoken, input b_readpointer

			);

endinterface

   //********************************************************
   //***************** CLKGATE CONFIG BUS *******************
   //********************************************************

interface CLKGATE_CONFIG_BUS;

   // REQUEST CHANNEL
   //***************************************
   logic [`NB_CORES-1:0] clkgate_tcdm;
   logic [`NB_CORES-1:0] clkgate_core;
   logic                 clkgate_scm;
   logic                 clkgate_int;
   logic                 clkgate_sel;

   // RESPONSE CHANNEL
   //***************************************
   //

   // Master Side
   //***************************************
   modport Master
     (
      output clkgate_tcdm,
      output clkgate_core,
      output clkgate_scm,
      output clkgate_int,
      output clkgate_sel
      );

   // Slave Side
   //***************************************
   modport Slave
     (
      input clkgate_tcdm,
      input clkgate_core,
      input clkgate_scm,
      input clkgate_int,
      input clkgate_sel
      );

endinterface // CLKGATE_CONFIG_BUS

   //********************************************************
   //***************** MMU CONFIG BUS ***********************
   //********************************************************

interface MMU_CONFIG_BUS;

   // size of section in SRAM that is mapped in sequential
   // (non-interleaved) order for collision free private accesses,
   // always starting at the top of the whole SRAM section
   // n = 0: disable sequential section
   // n > 0: seq. section of size 2^n * 32 Byte
   logic [3:0] mmu_sram_seqsec_size;
   // seperate section can be declared sindie the SCM part
   // sizing works as above, the seq. section always starts
   // at the top of the SCM section
   logic [3:0] mmu_scm_seqsec_size;
   // NOTE: address translation can be fully disabled setting
   //       both mmu_sram_seq_size and mmu_scm_seq_size to 0
   //       (this is the default reset value)

   // Master Side
   //***************************************
   modport Master
     (
      output mmu_sram_seqsec_size,
      output mmu_scm_seqsec_size
      );

   // Slave Side
   //***************************************
   modport Slave
     (
      input mmu_sram_seqsec_size,
      input mmu_scm_seqsec_size
      );

endinterface // MMU_CONFIG_BUS

   //********************************************************
   //***************** BIST IC BUS **************************
   //********************************************************

interface BIST_BUS;

   logic         bist_en;
   logic         bist_done_even;
   logic         bist_done_odd;
   logic         bist_result_even;
   logic         bist_result_odd;
   logic [31:0]  bist_pattern;

   // Master Side
   //***************************************
   modport Master
     (
      output     bist_en,
      input      bist_done_even,
      input      bist_done_odd,
      input      bist_result_even,
      input      bist_result_odd,
      output     bist_pattern
      );

   // Slave Side
   //***************************************
   modport Slave
     (
      input      bist_en,
      output     bist_done_even,
      output     bist_done_odd,
      output     bist_result_even,
      output     bist_result_odd,
      input      bist_pattern
      );

endinterface // BIST_BUS








interface ICACHE_CTRL_UNIT_BUS;

   // ICACHE_CTRL UNIT INTERFACE
   //***************************************
    logic 		ctrl_req_enable;
    logic 		ctrl_ack_enable;
    logic 		ctrl_req_disable;
    logic 		ctrl_ack_disable;
    logic 		ctrl_pending_trans;
`ifdef FEATURE_ICACHE_STAT    
    logic [31:0]	ctrl_hit_count;
    logic [31:0]	ctrl_refill_count;
    logic [31:0]	ctrl_trans_count;
    logic               ctrl_clear_regs;
    logic		ctrl_enable_regs;
`endif    
    
   // Master Side
   //***************************************
   modport Master
   (
      output ctrl_req_enable, 
      output ctrl_req_disable,
      
      
      input  ctrl_ack_enable,
      input  ctrl_ack_disable,
      input  ctrl_pending_trans
   `ifdef FEATURE_ICACHE_STAT 
      ,
      input  ctrl_hit_count,
      input  ctrl_refill_count,
      input  ctrl_trans_count,
      output ctrl_clear_regs,
      output ctrl_enable_regs
    `endif
   );

   // Slave Side
   //***************************************
   modport Slave
   (
      input  ctrl_req_enable, 
      input  ctrl_req_disable,
      
      output ctrl_ack_enable,
      output ctrl_ack_disable,
      output ctrl_pending_trans
   `ifdef FEATURE_ICACHE_STAT 
      ,      
      output ctrl_hit_count,
      output ctrl_refill_count,
      output ctrl_trans_count,
      input  ctrl_clear_regs,
      input  ctrl_enable_regs      
   `endif
   );

endinterface //~ ICACHE_CTRL_UNIT_BUS



    interface L0_CTRL_UNIT_BUS;

      // ICACHE_CTRL UNIT INTERFACE
      //***************************************
	logic 		L0_enable_regs;
	logic 		L0_clear_regs;
	logic [31:0]    L0_hit_cnt;
	logic [31:0]    L0_trans_cnt;
      
	
      // Master Side
      //***************************************
      modport Master
      (
	  output L0_enable_regs, 
	  output L0_clear_regs,
	  input  L0_hit_cnt,
	  input  L0_trans_cnt
      );

      // Slave Side
      //***************************************
      modport Slave
      (
	  input  L0_enable_regs, 
	  input  L0_clear_regs,
	  output L0_hit_cnt,
	  output L0_trans_cnt
      );
    endinterface //~ L0_CTRL_UNIT_BUS


    interface IC_INTC_CTRL_UNIT_BUS;

      // ICACHE_CTRL UNIT INTERFACE
      //***************************************
	logic 		IC_INTC_enable_regs;
	logic 		IC_INTC_clear_regs;
	logic [31:0]    IC_INTC_stall_cnt;
	logic [31:0]	IC_INTC_mcast_hit_cnt;
	logic [31:0]	IC_INTC_trans_cnt;      
	
      // Master Side
      //***************************************
      modport Master
      (
	  output IC_INTC_enable_regs, 
	  output IC_INTC_clear_regs,
	  input  IC_INTC_stall_cnt,
	  input  IC_INTC_mcast_hit_cnt,
	  input  IC_INTC_trans_cnt
      );

      // Slave Side
      //***************************************
      modport Slave
      (
	  input IC_INTC_enable_regs, 
	  input IC_INTC_clear_regs,
	  output  IC_INTC_stall_cnt,
	  output  IC_INTC_mcast_hit_cnt,
	  output  IC_INTC_trans_cnt
      );
    endinterface //~ IC_INTC_CTRL_UNIT_BUS



*/

