/* verilog_memcomp Version: 4.0.5-EAC2 */
/* common_memcomp Version: 4.0.5-EAC */
/* lang compiler Version: 4.0.0-beta23.4 Jun 21 2011 12:31:24 */
//
//       CONFIDENTIAL AND PROPRIETARY SOFTWARE OF ARM PHYSICAL IP, INC.
//      
//       Copyright (c) 1993 - 2015 ARM Physical IP, Inc.  All Rights Reserved.
//      
//       Use of this Software is subject to the terms and conditions of the
//       applicable license agreement with ARM Physical IP, Inc.
//       In addition, this Software is protected by patents, copyright law 
//       and international treaties.
//      
//       The copyright notice(s) in this Software does not indicate actual or
//       intended publication of this Software.
//
//      Verilog model for Synchronous Single-Port Ram
//
//       Instance Name:              sram_sp_hde_hvt_rvt_2048x32m16
//       Words:                      2048
//       Bits:                       32
//       Mux:                        16
//       Drive:                      6
//       Write Mask:                 On
//       Write Thru:                 Off
//       Extra Margin Adjustment:    On
//       Redundant Columns:          2
//       Test Muxes                  On
//       Power Gating:               Off
//       Retention:                  On
//       Pipeline:                   Off
//       Read Disturb Test:	        Off
//       
//       Creation Date:  Tue Oct 20 15:28:01 2015
//       Version: 	r5p2
//
//      Modeling Assumptions: This model supports full gate level simulation
//          including proper x-handling and timing check behavior.  Unit
//          delay timing is included in the model. Back-annotation of SDF
//          (v3.0 or v2.1) is supported.  SDF can be created utilyzing the delay
//          calculation views provided with this generator and supported
//          delay calculators.  All buses are modeled [MSB:LSB].  All 
//          ports are padded with Verilog primitives.
//
//      Modeling Limitations: None.
//
//      Known Bugs: None.
//
//      Known Work Arounds: N/A
//
`timescale 1 ns/1 ps
`define ARM_MEM_PROP 1.000
`define ARM_MEM_RETAIN 1.000
`define ARM_MEM_PERIOD 3.000
`define ARM_MEM_WIDTH 1.000
`define ARM_MEM_SETUP 1.000
`define ARM_MEM_HOLD 0.500
`define ARM_MEM_COLLISION 3.000
// If ARM_HVM_MODEL is defined at Simulator Command Line, it Selects the Hierarchical Verilog Model
`ifdef ARM_HVM_MODEL


module datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 (CLK,Q_update,D_update,SE,SI,D,DFTRAMBYP,mem_path,XQ,Q);
	input CLK,Q_update,D_update,SE,SI,D,DFTRAMBYP,mem_path,XQ;
	output Q;

	reg    D_int;
	reg    Q;

   //  Model PHI2 portion
   always @(CLK or SE or SI or D) begin
      if (CLK === 1'b0) begin
         if (SE===1'b1)
           D_int=SI;
         else if (SE===1'bx)
           D_int=1'bx;
         else
           D_int=D;
      end
   end

   // model output side of RAM latch
   always @(posedge Q_update or posedge D_update or mem_path or posedge XQ) begin
      if (XQ===1'b0) begin
         if (DFTRAMBYP===1'b1)
           Q=D_int;
         else
           Q=mem_path;
      end
      else
        Q=1'bx;
   end
endmodule // datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16

// If ARM_UD_MODEL is defined at Simulator Command Line, it Selects the Fast Functional Model
`ifdef ARM_UD_MODEL

// Following parameter Values can be overridden at Simulator Command Line.

// ARM_UD_DP Defines the delay through Data Paths, for Memory Models it represents BIST MUX output delays.
`ifdef ARM_UD_DP
`else
`define ARM_UD_DP #0.001
`endif
// ARM_UD_CP Defines the delay through Clock Path Cells, for Memory Models it is not used.
`ifdef ARM_UD_CP
`else
`define ARM_UD_CP
`endif
// ARM_UD_SEQ Defines the delay through the Memory, for Memory Models it is used for CLK->Q delays.
`ifdef ARM_UD_SEQ
`else
`define ARM_UD_SEQ #0.01
`endif

`celldefine
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
module sram_sp_hde_hvt_rvt_2048x32m16 (VDDCE, VDDPE, VSSE, CENY, WENY, AY, GWENY, Q,
    SO, CLK, CEN, WEN, A, D, EMA, EMAW, TEN, TCEN, TWEN, TA, TD, GWEN, TGWEN, RET1N,
    SI, SE, DFTRAMBYP);
`else
module sram_sp_hde_hvt_rvt_2048x32m16 (CENY, WENY, AY, GWENY, Q, SO, CLK, CEN, WEN,
    A, D, EMA, EMAW, TEN, TCEN, TWEN, TA, TD, GWEN, TGWEN, RET1N, SI, SE, DFTRAMBYP);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 32;
  parameter WORDS = 2048;
  parameter MUX = 16;
  parameter MEM_WIDTH = 512; // redun block size 8, 256 on left, 256 on right
  parameter MEM_HEIGHT = 128;
  parameter WP_SIZE = 8 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 0;

  output  CENY;
  output [3:0] WENY;
  output [10:0] AY;
  output  GWENY;
  output [31:0] Q;
  output [1:0] SO;
  input  CLK;
  input  CEN;
  input [3:0] WEN;
  input [10:0] A;
  input [31:0] D;
  input [2:0] EMA;
  input [1:0] EMAW;
  input  TEN;
  input  TCEN;
  input [3:0] TWEN;
  input [10:0] TA;
  input [31:0] TD;
  input  GWEN;
  input  TGWEN;
  input  RET1N;
  input [1:0] SI;
  input  SE;
  input  DFTRAMBYP;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

  reg pre_charge_st;
  integer row_address;
  integer mux_address;
  reg [511:0] mem [0:127];
  reg [511:0] row, row_t;
  reg LAST_CLK;
  reg [511:0] row_mask;
  reg [511:0] new_data;
  reg [511:0] data_out;
  reg [63:0] readLatch0;
  reg [63:0] shifted_readLatch0;
  reg  read_mux_sel0;
  reg  read_mux_sel0_p2;
  wire [31:0] Q_int;
  reg XQ, Q_update;
  reg XD_sh, D_sh_update;
  wire [31:0] D_int_bmux;
  reg [31:0] mem_path;
  reg [31:0] writeEnable;
  reg clk0_int;

  wire  CENY_;
  wire [3:0] WENY_;
  wire [10:0] AY_;
  wire  GWENY_;
  wire [31:0] Q_;
  wire [1:0] SO_;
 wire  CLK_;
  wire  CEN_;
  reg  CEN_int;
  reg  CEN_p2;
  wire [3:0] WEN_;
  reg [3:0] WEN_int;
  wire [10:0] A_;
  reg [10:0] A_int;
  wire [31:0] D_;
  reg [31:0] D_int;
  wire [2:0] EMA_;
  reg [2:0] EMA_int;
  wire [1:0] EMAW_;
  reg [1:0] EMAW_int;
  wire  TEN_;
  reg  TEN_int;
  wire  TCEN_;
  reg  TCEN_int;
  reg  TCEN_p2;
  wire [3:0] TWEN_;
  reg [3:0] TWEN_int;
  wire [10:0] TA_;
  reg [10:0] TA_int;
  wire [31:0] TD_;
  reg [31:0] TD_int;
  wire  GWEN_;
  reg  GWEN_int;
  wire  TGWEN_;
  reg  TGWEN_int;
  wire  RET1N_;
  reg  RET1N_int;
  wire [1:0] SI_;
  wire [1:0] SI_int;
  wire  SE_;
  reg  SE_int;
  wire  DFTRAMBYP_;
  reg  DFTRAMBYP_int;
  reg  DFTRAMBYP_p2;

  assign CENY = CENY_; 
  assign WENY[0] = WENY_[0]; 
  assign WENY[1] = WENY_[1]; 
  assign WENY[2] = WENY_[2]; 
  assign WENY[3] = WENY_[3]; 
  assign AY[0] = AY_[0]; 
  assign AY[1] = AY_[1]; 
  assign AY[2] = AY_[2]; 
  assign AY[3] = AY_[3]; 
  assign AY[4] = AY_[4]; 
  assign AY[5] = AY_[5]; 
  assign AY[6] = AY_[6]; 
  assign AY[7] = AY_[7]; 
  assign AY[8] = AY_[8]; 
  assign AY[9] = AY_[9]; 
  assign AY[10] = AY_[10]; 
  assign GWENY = GWENY_; 
  assign Q[0] = Q_[0]; 
  assign Q[1] = Q_[1]; 
  assign Q[2] = Q_[2]; 
  assign Q[3] = Q_[3]; 
  assign Q[4] = Q_[4]; 
  assign Q[5] = Q_[5]; 
  assign Q[6] = Q_[6]; 
  assign Q[7] = Q_[7]; 
  assign Q[8] = Q_[8]; 
  assign Q[9] = Q_[9]; 
  assign Q[10] = Q_[10]; 
  assign Q[11] = Q_[11]; 
  assign Q[12] = Q_[12]; 
  assign Q[13] = Q_[13]; 
  assign Q[14] = Q_[14]; 
  assign Q[15] = Q_[15]; 
  assign Q[16] = Q_[16]; 
  assign Q[17] = Q_[17]; 
  assign Q[18] = Q_[18]; 
  assign Q[19] = Q_[19]; 
  assign Q[20] = Q_[20]; 
  assign Q[21] = Q_[21]; 
  assign Q[22] = Q_[22]; 
  assign Q[23] = Q_[23]; 
  assign Q[24] = Q_[24]; 
  assign Q[25] = Q_[25]; 
  assign Q[26] = Q_[26]; 
  assign Q[27] = Q_[27]; 
  assign Q[28] = Q_[28]; 
  assign Q[29] = Q_[29]; 
  assign Q[30] = Q_[30]; 
  assign Q[31] = Q_[31]; 
  assign SO[0] = SO_[0]; 
  assign SO[1] = SO_[1]; 
  assign CLK_ = CLK;
  assign CEN_ = CEN;
  assign WEN_[0] = WEN[0];
  assign WEN_[1] = WEN[1];
  assign WEN_[2] = WEN[2];
  assign WEN_[3] = WEN[3];
  assign A_[0] = A[0];
  assign A_[1] = A[1];
  assign A_[2] = A[2];
  assign A_[3] = A[3];
  assign A_[4] = A[4];
  assign A_[5] = A[5];
  assign A_[6] = A[6];
  assign A_[7] = A[7];
  assign A_[8] = A[8];
  assign A_[9] = A[9];
  assign A_[10] = A[10];
  assign D_[0] = D[0];
  assign D_[1] = D[1];
  assign D_[2] = D[2];
  assign D_[3] = D[3];
  assign D_[4] = D[4];
  assign D_[5] = D[5];
  assign D_[6] = D[6];
  assign D_[7] = D[7];
  assign D_[8] = D[8];
  assign D_[9] = D[9];
  assign D_[10] = D[10];
  assign D_[11] = D[11];
  assign D_[12] = D[12];
  assign D_[13] = D[13];
  assign D_[14] = D[14];
  assign D_[15] = D[15];
  assign D_[16] = D[16];
  assign D_[17] = D[17];
  assign D_[18] = D[18];
  assign D_[19] = D[19];
  assign D_[20] = D[20];
  assign D_[21] = D[21];
  assign D_[22] = D[22];
  assign D_[23] = D[23];
  assign D_[24] = D[24];
  assign D_[25] = D[25];
  assign D_[26] = D[26];
  assign D_[27] = D[27];
  assign D_[28] = D[28];
  assign D_[29] = D[29];
  assign D_[30] = D[30];
  assign D_[31] = D[31];
  assign EMA_[0] = EMA[0];
  assign EMA_[1] = EMA[1];
  assign EMA_[2] = EMA[2];
  assign EMAW_[0] = EMAW[0];
  assign EMAW_[1] = EMAW[1];
  assign TEN_ = TEN;
  assign TCEN_ = TCEN;
  assign TWEN_[0] = TWEN[0];
  assign TWEN_[1] = TWEN[1];
  assign TWEN_[2] = TWEN[2];
  assign TWEN_[3] = TWEN[3];
  assign TA_[0] = TA[0];
  assign TA_[1] = TA[1];
  assign TA_[2] = TA[2];
  assign TA_[3] = TA[3];
  assign TA_[4] = TA[4];
  assign TA_[5] = TA[5];
  assign TA_[6] = TA[6];
  assign TA_[7] = TA[7];
  assign TA_[8] = TA[8];
  assign TA_[9] = TA[9];
  assign TA_[10] = TA[10];
  assign TD_[0] = TD[0];
  assign TD_[1] = TD[1];
  assign TD_[2] = TD[2];
  assign TD_[3] = TD[3];
  assign TD_[4] = TD[4];
  assign TD_[5] = TD[5];
  assign TD_[6] = TD[6];
  assign TD_[7] = TD[7];
  assign TD_[8] = TD[8];
  assign TD_[9] = TD[9];
  assign TD_[10] = TD[10];
  assign TD_[11] = TD[11];
  assign TD_[12] = TD[12];
  assign TD_[13] = TD[13];
  assign TD_[14] = TD[14];
  assign TD_[15] = TD[15];
  assign TD_[16] = TD[16];
  assign TD_[17] = TD[17];
  assign TD_[18] = TD[18];
  assign TD_[19] = TD[19];
  assign TD_[20] = TD[20];
  assign TD_[21] = TD[21];
  assign TD_[22] = TD[22];
  assign TD_[23] = TD[23];
  assign TD_[24] = TD[24];
  assign TD_[25] = TD[25];
  assign TD_[26] = TD[26];
  assign TD_[27] = TD[27];
  assign TD_[28] = TD[28];
  assign TD_[29] = TD[29];
  assign TD_[30] = TD[30];
  assign TD_[31] = TD[31];
  assign GWEN_ = GWEN;
  assign TGWEN_ = TGWEN;
  assign RET1N_ = RET1N;
  assign SI_[0] = SI[0];
  assign SI_[1] = SI[1];
  assign SE_ = SE;
  assign DFTRAMBYP_ = DFTRAMBYP;

  assign `ARM_UD_DP CENY_ = (RET1N_ | pre_charge_st) ? (DFTRAMBYP_ & (TEN_ ? CEN_ : TCEN_)) : 1'bx;
  assign `ARM_UD_DP WENY_ = (RET1N_ | pre_charge_st) ? ({4{DFTRAMBYP_}} & (TEN_ ? WEN_ : TWEN_)) : {4{1'bx}};
  assign `ARM_UD_DP AY_ = (RET1N_ | pre_charge_st) ? ({11{DFTRAMBYP_}} & (TEN_ ? A_ : TA_)) : {11{1'bx}};
  assign `ARM_UD_DP GWENY_ = (RET1N_ | pre_charge_st) ? (DFTRAMBYP_ & (TEN_ ? GWEN_ : TGWEN_)) : 1'bx;
  assign `ARM_UD_SEQ Q_ = (RET1N_ | pre_charge_st) ? ((Q_int)) : {32{1'bx}};
  assign `ARM_UD_DP SO_ = (RET1N_ | pre_charge_st) ? ({Q_[16], Q_[15]}) : {2{1'bx}};

// If INITIALIZE_MEMORY is defined at Simulator Command Line, it Initializes the Memory with all ZEROS.
`ifdef INITIALIZE_MEMORY
  integer i;
  initial begin
    #0;
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'b0}};
  end
`endif

  task failedWrite;
  input port_f;
  integer i;
  begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'bx}};
  end
  endtask

  function isBitX;
    input bitval;
    begin
      isBitX = ( bitval===1'bx || bitval==1'bz ) ? 1'b1 : 1'b0;
    end
  endfunction

  function isBit1;
    input bitval;
    begin
      isBit1 = ( bitval===1'b1 ) ? 1'b1 : 1'b0;
    end
  endfunction



  task readWrite;
  begin
    if (GWEN_int !== 1'b1 && DFTRAMBYP_int=== 1'b0 && SE_int === 1'bx) begin
      failedWrite(0);
    end else if (DFTRAMBYP_int=== 1'b0 && SE_int === 1'b1) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_int === 1'b0 && (CEN_int === 1'b0 || DFTRAMBYP_int === 1'b1)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{(EMA_int & isBit1(DFTRAMBYP_int)), (EMAW_int & isBit1(DFTRAMBYP_int))} === 1'bx) begin
        XQ = 1'b1; Q_update = 1'b1;
    end else if (^{(CEN_int & !isBit1(DFTRAMBYP_int)), EMA_int, EMAW_int, RET1N_int} === 1'bx) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if ((A_int >= WORDS) && (CEN_int === 1'b0) && DFTRAMBYP_int === 1'b0) begin
        XQ = GWEN_int !== 1'b1 ? 1'b0 : 1'b1; Q_update = GWEN_int !== 1'b1 ? 1'b0 : 1'b1;
    end else if (CEN_int === 1'b0 && (^A_int) === 1'bx && DFTRAMBYP_int === 1'b0) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (CEN_int === 1'b0 || DFTRAMBYP_int === 1'b1) begin
      if(isBitX(DFTRAMBYP_int) || isBitX(SE_int))
        D_int = {32{1'bx}};

      mux_address = (A_int & 4'b1111);
      row_address = (A_int >> 4);
      if (DFTRAMBYP_int !== 1'b1) begin
      if (row_address > 127)
        row = {512{1'bx}};
      else
        row = mem[row_address];
      end
      if( (isBitX(GWEN_int) && DFTRAMBYP_int!==1) || isBitX(DFTRAMBYP_int) ) begin
        writeEnable = {32{1'bx}};
        D_int = {32{1'bx}};
      end else
          writeEnable = ~ ( {32{GWEN_int}} | {WEN_int[3], WEN_int[3], WEN_int[3], WEN_int[3],
          WEN_int[3], WEN_int[3], WEN_int[3], WEN_int[3], WEN_int[2], WEN_int[2], WEN_int[2],
          WEN_int[2], WEN_int[2], WEN_int[2], WEN_int[2], WEN_int[2], WEN_int[1], WEN_int[1],
          WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[0],
          WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0]});
      if (GWEN_int !== 1'b1 || DFTRAMBYP_int === 1'b1 || DFTRAMBYP_int === 1'bx) begin
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, D_int[31], 15'b000000000000000, D_int[30],
          15'b000000000000000, D_int[29], 15'b000000000000000, D_int[28], 15'b000000000000000, D_int[27],
          15'b000000000000000, D_int[26], 15'b000000000000000, D_int[25], 15'b000000000000000, D_int[24],
          15'b000000000000000, D_int[23], 15'b000000000000000, D_int[22], 15'b000000000000000, D_int[21],
          15'b000000000000000, D_int[20], 15'b000000000000000, D_int[19], 15'b000000000000000, D_int[18],
          15'b000000000000000, D_int[17], 15'b000000000000000, D_int[16], 15'b000000000000000, D_int[15],
          15'b000000000000000, D_int[14], 15'b000000000000000, D_int[13], 15'b000000000000000, D_int[12],
          15'b000000000000000, D_int[11], 15'b000000000000000, D_int[10], 15'b000000000000000, D_int[9],
          15'b000000000000000, D_int[8], 15'b000000000000000, D_int[7], 15'b000000000000000, D_int[6],
          15'b000000000000000, D_int[5], 15'b000000000000000, D_int[4], 15'b000000000000000, D_int[3],
          15'b000000000000000, D_int[2], 15'b000000000000000, D_int[1], 15'b000000000000000, D_int[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        if (DFTRAMBYP_int === 1'b1 && SE_int === 1'b0) begin
        end else if (GWEN_int !== 1'b1 && DFTRAMBYP_int === 1'b1 && SE_int === 1'bx) begin
        	XQ = 1'b1; Q_update = 1'b1;
        end else begin
        mem[row_address] = row;
        end
      end else begin
        data_out = (row >> (mux_address%8));
        readLatch0 = {data_out[504], data_out[496], data_out[488], data_out[480], data_out[472],
          data_out[464], data_out[456], data_out[448], data_out[440], data_out[432],
          data_out[424], data_out[416], data_out[408], data_out[400], data_out[392],
          data_out[384], data_out[376], data_out[368], data_out[360], data_out[352],
          data_out[344], data_out[336], data_out[328], data_out[320], data_out[312],
          data_out[304], data_out[296], data_out[288], data_out[280], data_out[272],
          data_out[264], data_out[256], data_out[248], data_out[240], data_out[232],
          data_out[224], data_out[216], data_out[208], data_out[200], data_out[192],
          data_out[184], data_out[176], data_out[168], data_out[160], data_out[152],
          data_out[144], data_out[136], data_out[128], data_out[120], data_out[112],
          data_out[104], data_out[96], data_out[88], data_out[80], data_out[72], data_out[64],
          data_out[56], data_out[48], data_out[40], data_out[32], data_out[24], data_out[16],
          data_out[8], data_out[0]};
        shifted_readLatch0 = (readLatch0 >> A_int[3]);
        mem_path = {shifted_readLatch0[62], shifted_readLatch0[60], shifted_readLatch0[58],
          shifted_readLatch0[56], shifted_readLatch0[54], shifted_readLatch0[52], shifted_readLatch0[50],
          shifted_readLatch0[48], shifted_readLatch0[46], shifted_readLatch0[44], shifted_readLatch0[42],
          shifted_readLatch0[40], shifted_readLatch0[38], shifted_readLatch0[36], shifted_readLatch0[34],
          shifted_readLatch0[32], shifted_readLatch0[30], shifted_readLatch0[28], shifted_readLatch0[26],
          shifted_readLatch0[24], shifted_readLatch0[22], shifted_readLatch0[20], shifted_readLatch0[18],
          shifted_readLatch0[16], shifted_readLatch0[14], shifted_readLatch0[12], shifted_readLatch0[10],
          shifted_readLatch0[8], shifted_readLatch0[6], shifted_readLatch0[4], shifted_readLatch0[2],
          shifted_readLatch0[0]};
        	XQ = 1'b0; Q_update = 1'b1;
      end
      if (DFTRAMBYP_int === 1'b1) begin
        	XQ = 1'b0; Q_update = 1'b1;
      end
      if( isBitX(GWEN_int) && DFTRAMBYP_int !== 1'b1) begin
        XQ = 1'b1; Q_update = 1'b1;
      end
      if( isBitX(DFTRAMBYP_int) ) begin
        XQ = 1'b1; Q_update = 1'b1;
      end
      if( isBitX(SE_int) && DFTRAMBYP_int === 1'b1 ) begin
        XQ = 1'b1; Q_update = 1'b1;
      end
    end
  end
  endtask
  always @ (CEN_ or TCEN_ or TEN_ or DFTRAMBYP_ or CLK_) begin
  	if(CLK_ == 1'b0) begin
  		CEN_p2 = CEN_;
  		TCEN_p2 = TCEN_;
  		DFTRAMBYP_p2 = DFTRAMBYP_;
  	end
  end

`ifdef POWER_PINS
  always @ (VDDCE) begin
      if (VDDCE != 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDCE should be powered down after VDDPE, Illegal power down sequencing in %m at %0t", $time);
       end
        $display("In PowerDown Mode in %m at %0t", $time);
        failedWrite(0);
      end
      if (VDDCE == 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDPE should be powered up after VDDCE in %m at %0t", $time);
        $display("Illegal power up sequencing in %m at %0t", $time);
       end
        failedWrite(0);
      end
  end
`endif
`ifdef POWER_PINS
  always @ (RET1N_ or VDDPE or VDDCE) begin
`else     
  always @ RET1N_ begin
`endif
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st == 1'b1 && (CEN_ === 1'bx || TCEN_ === 1'bx || DFTRAMBYP_ === 1'bx || CLK_ === 1'bx)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_ === 1'b0 && RET1N_int === 1'b1 && (CEN_p2 === 1'b0 || TCEN_p2 === 1'b0 || DFTRAMBYP_p2 === 1'b1)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_ === 1'b1 && RET1N_int === 1'b0 && (CEN_p2 === 1'b0 || TCEN_p2 === 1'b0 || DFTRAMBYP_p2 === 1'b1)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(0);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
        XQ = 1'b1; Q_update = 1'b1;
      CEN_int = 1'bx;
      WEN_int = {4{1'bx}};
      A_int = {11{1'bx}};
      D_int = {32{1'bx}};
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      TEN_int = 1'bx;
      TCEN_int = 1'bx;
      TWEN_int = {4{1'bx}};
      TA_int = {11{1'bx}};
      TD_int = {32{1'bx}};
      GWEN_int = 1'bx;
      TGWEN_int = 1'bx;
      RET1N_int = 1'bx;
      SE_int = 1'bx;
      DFTRAMBYP_int = 1'bx;
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 &&  pre_charge_st == 1'b1) begin
      pre_charge_st = 0;
    end else begin
      pre_charge_st = 0;
`else     
    end else begin
`endif
        XQ = 1'b1; Q_update = 1'b1;
      CEN_int = 1'bx;
      WEN_int = {4{1'bx}};
      A_int = {11{1'bx}};
      D_int = {32{1'bx}};
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      TEN_int = 1'bx;
      TCEN_int = 1'bx;
      TWEN_int = {4{1'bx}};
      TA_int = {11{1'bx}};
      TD_int = {32{1'bx}};
      GWEN_int = 1'bx;
      TGWEN_int = 1'bx;
      RET1N_int = 1'bx;
      SE_int = 1'bx;
      DFTRAMBYP_int = 1'bx;
    end
    RET1N_int = RET1N_;
    #0;
        Q_update = 1'b0;
  end


  always @ CLK_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
`endif
`ifdef POWER_PINS
  if (RET1N_ == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
  end else begin
    if ((CLK_ === 1'bx || CLK_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if ((CLK_ === 1'b1 || CLK_ === 1'b0) && LAST_CLK === 1'bx) begin
       D_sh_update = 1'b0;  XD_sh = 1'b0;
       XQ = 1'b0; Q_update = 1'b0; 
    end else if (CLK_ === 1'b1 && LAST_CLK === 1'b0) begin
      SE_int = SE_;
      DFTRAMBYP_int = DFTRAMBYP_;
      CEN_int = TEN_ ? CEN_ : TCEN_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      TEN_int = TEN_;
      TWEN_int = TWEN_;
      RET1N_int = RET1N_;
      if (DFTRAMBYP_=== 1'b1 || CEN_int != 1'b1) begin
        WEN_int = TEN_ ? WEN_ : TWEN_;
        A_int = TEN_ ? A_ : TA_;
        D_int = TEN_ ? D_ : TD_;
        TCEN_int = TCEN_;
        TA_int = TA_;
        TD_int = TD_;
        GWEN_int = TEN_ ? GWEN_ : TGWEN_;
        TGWEN_int = TGWEN_;
        DFTRAMBYP_int = DFTRAMBYP_;
        if (GWEN_int === 1'b1 || DFTRAMBYP_ == 1'b1) begin
          read_mux_sel0 = (TEN_ ? A_[3] : TA_[3] );
          read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
        end
      end
      clk0_int = 1'b0;
      if (DFTRAMBYP_=== 1'b1 && SE_ === 1'b1) begin
         read_mux_sel0 = (TEN_ ? A_[3] : TA_[3] );
         read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
        XQ = 1'b0; Q_update = 1'b1;
      end else begin
      CEN_int = TEN_ ? CEN_ : TCEN_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      TEN_int = TEN_;
      TWEN_int = TWEN_;
      RET1N_int = RET1N_;
      if (DFTRAMBYP_=== 1'b1 || CEN_int != 1'b1) begin
        WEN_int = TEN_ ? WEN_ : TWEN_;
        A_int = TEN_ ? A_ : TA_;
        D_int = TEN_ ? D_ : TD_;
        TCEN_int = TCEN_;
        TA_int = TA_;
        TD_int = TD_;
        GWEN_int = TEN_ ? GWEN_ : TGWEN_;
        TGWEN_int = TGWEN_;
        DFTRAMBYP_int = DFTRAMBYP_;
        if (GWEN_int === 1'b1 || DFTRAMBYP_ == 1'b1) begin
          read_mux_sel0 = (TEN_ ? A_[3] : TA_[3] );
          read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
        end
      end
      clk0_int = 1'b0;
    readWrite;
      end
    end else if (CLK_ === 1'b0 && LAST_CLK === 1'b1) begin
      Q_update = 1'b0;
      D_sh_update = 1'b0;
      XQ = 1'b0;
         read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
    end
  end
    LAST_CLK = CLK_;
  end

  assign SI_int = SE_ ? SI_ : {2{1'b0}};
  assign D_int_bmux = TEN_ ? D_ : TD_;

  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ0 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(SI_int[0]), .D(D_int_bmux[0]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[0]), .XQ(XQ), .Q(Q_int[0]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ1 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[0]), .D(D_int_bmux[1]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[1]), .XQ(XQ), .Q(Q_int[1]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ2 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[1]), .D(D_int_bmux[2]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[2]), .XQ(XQ), .Q(Q_int[2]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ3 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[2]), .D(D_int_bmux[3]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[3]), .XQ(XQ), .Q(Q_int[3]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ4 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[3]), .D(D_int_bmux[4]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[4]), .XQ(XQ), .Q(Q_int[4]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ5 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[4]), .D(D_int_bmux[5]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[5]), .XQ(XQ), .Q(Q_int[5]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ6 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[5]), .D(D_int_bmux[6]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[6]), .XQ(XQ), .Q(Q_int[6]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ7 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[6]), .D(D_int_bmux[7]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[7]), .XQ(XQ), .Q(Q_int[7]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ8 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[7]), .D(D_int_bmux[8]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[8]), .XQ(XQ), .Q(Q_int[8]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ9 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[8]), .D(D_int_bmux[9]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[9]), .XQ(XQ), .Q(Q_int[9]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ10 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[9]), .D(D_int_bmux[10]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[10]), .XQ(XQ), .Q(Q_int[10]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ11 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[10]), .D(D_int_bmux[11]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[11]), .XQ(XQ), .Q(Q_int[11]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ12 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[11]), .D(D_int_bmux[12]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[12]), .XQ(XQ), .Q(Q_int[12]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ13 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[12]), .D(D_int_bmux[13]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[13]), .XQ(XQ), .Q(Q_int[13]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ14 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[13]), .D(D_int_bmux[14]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[14]), .XQ(XQ), .Q(Q_int[14]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ15 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[14]), .D(D_int_bmux[15]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[15]), .XQ(XQ), .Q(Q_int[15]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ16 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[17]), .D(D_int_bmux[16]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[16]), .XQ(XQ), .Q(Q_int[16]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ17 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[18]), .D(D_int_bmux[17]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[17]), .XQ(XQ), .Q(Q_int[17]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ18 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[19]), .D(D_int_bmux[18]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[18]), .XQ(XQ), .Q(Q_int[18]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ19 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[20]), .D(D_int_bmux[19]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[19]), .XQ(XQ), .Q(Q_int[19]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ20 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[21]), .D(D_int_bmux[20]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[20]), .XQ(XQ), .Q(Q_int[20]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ21 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[22]), .D(D_int_bmux[21]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[21]), .XQ(XQ), .Q(Q_int[21]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ22 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[23]), .D(D_int_bmux[22]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[22]), .XQ(XQ), .Q(Q_int[22]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ23 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[24]), .D(D_int_bmux[23]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[23]), .XQ(XQ), .Q(Q_int[23]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ24 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[25]), .D(D_int_bmux[24]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[24]), .XQ(XQ), .Q(Q_int[24]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ25 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[26]), .D(D_int_bmux[25]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[25]), .XQ(XQ), .Q(Q_int[25]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ26 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[27]), .D(D_int_bmux[26]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[26]), .XQ(XQ), .Q(Q_int[26]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ27 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[28]), .D(D_int_bmux[27]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[27]), .XQ(XQ), .Q(Q_int[27]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ28 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[29]), .D(D_int_bmux[28]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[28]), .XQ(XQ), .Q(Q_int[28]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ29 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[30]), .D(D_int_bmux[29]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[29]), .XQ(XQ), .Q(Q_int[29]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ30 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[31]), .D(D_int_bmux[30]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[30]), .XQ(XQ), .Q(Q_int[30]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ31 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(SI_int[1]), .D(D_int_bmux[31]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[31]), .XQ(XQ), .Q(Q_int[31]));


// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
 always @ (VDDCE or VDDPE or VSSE) begin
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
 end
`endif

endmodule
`endcelldefine
`else
`celldefine
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
module sram_sp_hde_hvt_rvt_2048x32m16 (VDDCE, VDDPE, VSSE, CENY, WENY, AY, GWENY, Q,
    SO, CLK, CEN, WEN, A, D, EMA, EMAW, TEN, TCEN, TWEN, TA, TD, GWEN, TGWEN, RET1N,
    SI, SE, DFTRAMBYP);
`else
module sram_sp_hde_hvt_rvt_2048x32m16 (CENY, WENY, AY, GWENY, Q, SO, CLK, CEN, WEN,
    A, D, EMA, EMAW, TEN, TCEN, TWEN, TA, TD, GWEN, TGWEN, RET1N, SI, SE, DFTRAMBYP);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 32;
  parameter WORDS = 2048;
  parameter MUX = 16;
  parameter MEM_WIDTH = 512; // redun block size 8, 256 on left, 256 on right
  parameter MEM_HEIGHT = 128;
  parameter WP_SIZE = 8 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 0;

  output  CENY;
  output [3:0] WENY;
  output [10:0] AY;
  output  GWENY;
  output [31:0] Q;
  output [1:0] SO;
  input  CLK;
  input  CEN;
  input [3:0] WEN;
  input [10:0] A;
  input [31:0] D;
  input [2:0] EMA;
  input [1:0] EMAW;
  input  TEN;
  input  TCEN;
  input [3:0] TWEN;
  input [10:0] TA;
  input [31:0] TD;
  input  GWEN;
  input  TGWEN;
  input  RET1N;
  input [1:0] SI;
  input  SE;
  input  DFTRAMBYP;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

  reg pre_charge_st;
  integer row_address;
  integer mux_address;
  reg [511:0] mem [0:127];
  reg [511:0] row, row_t;
  reg LAST_CLK;
  reg [511:0] row_mask;
  reg [511:0] new_data;
  reg [511:0] data_out;
  reg [63:0] readLatch0;
  reg [63:0] shifted_readLatch0;
  reg  read_mux_sel0;
  reg  read_mux_sel0_p2;
  wire [31:0] Q_int;
  reg XQ, Q_update;
  reg XD_sh, D_sh_update;
  wire [31:0] D_int_bmux;
  reg [31:0] mem_path;
  reg [31:0] writeEnable;

  reg NOT_CEN, NOT_WEN3, NOT_WEN2, NOT_WEN1, NOT_WEN0, NOT_A10, NOT_A9, NOT_A8, NOT_A7;
  reg NOT_A6, NOT_A5, NOT_A4, NOT_A3, NOT_A2, NOT_A1, NOT_A0, NOT_D31, NOT_D30, NOT_D29;
  reg NOT_D28, NOT_D27, NOT_D26, NOT_D25, NOT_D24, NOT_D23, NOT_D22, NOT_D21, NOT_D20;
  reg NOT_D19, NOT_D18, NOT_D17, NOT_D16, NOT_D15, NOT_D14, NOT_D13, NOT_D12, NOT_D11;
  reg NOT_D10, NOT_D9, NOT_D8, NOT_D7, NOT_D6, NOT_D5, NOT_D4, NOT_D3, NOT_D2, NOT_D1;
  reg NOT_D0, NOT_EMA2, NOT_EMA1, NOT_EMA0, NOT_EMAW1, NOT_EMAW0, NOT_TEN, NOT_TCEN;
  reg NOT_TWEN3, NOT_TWEN2, NOT_TWEN1, NOT_TWEN0, NOT_TA10, NOT_TA9, NOT_TA8, NOT_TA7;
  reg NOT_TA6, NOT_TA5, NOT_TA4, NOT_TA3, NOT_TA2, NOT_TA1, NOT_TA0, NOT_TD31, NOT_TD30;
  reg NOT_TD29, NOT_TD28, NOT_TD27, NOT_TD26, NOT_TD25, NOT_TD24, NOT_TD23, NOT_TD22;
  reg NOT_TD21, NOT_TD20, NOT_TD19, NOT_TD18, NOT_TD17, NOT_TD16, NOT_TD15, NOT_TD14;
  reg NOT_TD13, NOT_TD12, NOT_TD11, NOT_TD10, NOT_TD9, NOT_TD8, NOT_TD7, NOT_TD6, NOT_TD5;
  reg NOT_TD4, NOT_TD3, NOT_TD2, NOT_TD1, NOT_TD0, NOT_GWEN, NOT_TGWEN, NOT_SI1, NOT_SI0;
  reg NOT_SE, NOT_DFTRAMBYP, NOT_RET1N;
  reg NOT_CLK_PER, NOT_CLK_MINH, NOT_CLK_MINL;
  reg clk0_int;

  wire  CENY_;
  wire [3:0] WENY_;
  wire [10:0] AY_;
  wire  GWENY_;
  wire [31:0] Q_;
  wire [1:0] SO_;
 wire  CLK_;
  wire  CEN_;
  reg  CEN_int;
  reg  CEN_p2;
  wire [3:0] WEN_;
  reg [3:0] WEN_int;
  wire [10:0] A_;
  reg [10:0] A_int;
  wire [31:0] D_;
  reg [31:0] D_int;
  wire [2:0] EMA_;
  reg [2:0] EMA_int;
  wire [1:0] EMAW_;
  reg [1:0] EMAW_int;
  wire  TEN_;
  reg  TEN_int;
  wire  TCEN_;
  reg  TCEN_int;
  reg  TCEN_p2;
  wire [3:0] TWEN_;
  reg [3:0] TWEN_int;
  wire [10:0] TA_;
  reg [10:0] TA_int;
  wire [31:0] TD_;
  reg [31:0] TD_int;
  wire  GWEN_;
  reg  GWEN_int;
  wire  TGWEN_;
  reg  TGWEN_int;
  wire  RET1N_;
  reg  RET1N_int;
  wire [1:0] SI_;
  wire [1:0] SI_int;
  wire  SE_;
  reg  SE_int;
  wire  DFTRAMBYP_;
  reg  DFTRAMBYP_int;
  reg  DFTRAMBYP_p2;

  buf B0(CENY, CENY_);
  buf B1(WENY[0], WENY_[0]);
  buf B2(WENY[1], WENY_[1]);
  buf B3(WENY[2], WENY_[2]);
  buf B4(WENY[3], WENY_[3]);
  buf B5(AY[0], AY_[0]);
  buf B6(AY[1], AY_[1]);
  buf B7(AY[2], AY_[2]);
  buf B8(AY[3], AY_[3]);
  buf B9(AY[4], AY_[4]);
  buf B10(AY[5], AY_[5]);
  buf B11(AY[6], AY_[6]);
  buf B12(AY[7], AY_[7]);
  buf B13(AY[8], AY_[8]);
  buf B14(AY[9], AY_[9]);
  buf B15(AY[10], AY_[10]);
  buf B16(GWENY, GWENY_);
  buf B17(Q[0], Q_[0]);
  buf B18(Q[1], Q_[1]);
  buf B19(Q[2], Q_[2]);
  buf B20(Q[3], Q_[3]);
  buf B21(Q[4], Q_[4]);
  buf B22(Q[5], Q_[5]);
  buf B23(Q[6], Q_[6]);
  buf B24(Q[7], Q_[7]);
  buf B25(Q[8], Q_[8]);
  buf B26(Q[9], Q_[9]);
  buf B27(Q[10], Q_[10]);
  buf B28(Q[11], Q_[11]);
  buf B29(Q[12], Q_[12]);
  buf B30(Q[13], Q_[13]);
  buf B31(Q[14], Q_[14]);
  buf B32(Q[15], Q_[15]);
  buf B33(Q[16], Q_[16]);
  buf B34(Q[17], Q_[17]);
  buf B35(Q[18], Q_[18]);
  buf B36(Q[19], Q_[19]);
  buf B37(Q[20], Q_[20]);
  buf B38(Q[21], Q_[21]);
  buf B39(Q[22], Q_[22]);
  buf B40(Q[23], Q_[23]);
  buf B41(Q[24], Q_[24]);
  buf B42(Q[25], Q_[25]);
  buf B43(Q[26], Q_[26]);
  buf B44(Q[27], Q_[27]);
  buf B45(Q[28], Q_[28]);
  buf B46(Q[29], Q_[29]);
  buf B47(Q[30], Q_[30]);
  buf B48(Q[31], Q_[31]);
  buf B49(SO[0], SO_[0]);
  buf B50(SO[1], SO_[1]);
  buf B51(CLK_, CLK);
  buf B52(CEN_, CEN);
  buf B53(WEN_[0], WEN[0]);
  buf B54(WEN_[1], WEN[1]);
  buf B55(WEN_[2], WEN[2]);
  buf B56(WEN_[3], WEN[3]);
  buf B57(A_[0], A[0]);
  buf B58(A_[1], A[1]);
  buf B59(A_[2], A[2]);
  buf B60(A_[3], A[3]);
  buf B61(A_[4], A[4]);
  buf B62(A_[5], A[5]);
  buf B63(A_[6], A[6]);
  buf B64(A_[7], A[7]);
  buf B65(A_[8], A[8]);
  buf B66(A_[9], A[9]);
  buf B67(A_[10], A[10]);
  buf B68(D_[0], D[0]);
  buf B69(D_[1], D[1]);
  buf B70(D_[2], D[2]);
  buf B71(D_[3], D[3]);
  buf B72(D_[4], D[4]);
  buf B73(D_[5], D[5]);
  buf B74(D_[6], D[6]);
  buf B75(D_[7], D[7]);
  buf B76(D_[8], D[8]);
  buf B77(D_[9], D[9]);
  buf B78(D_[10], D[10]);
  buf B79(D_[11], D[11]);
  buf B80(D_[12], D[12]);
  buf B81(D_[13], D[13]);
  buf B82(D_[14], D[14]);
  buf B83(D_[15], D[15]);
  buf B84(D_[16], D[16]);
  buf B85(D_[17], D[17]);
  buf B86(D_[18], D[18]);
  buf B87(D_[19], D[19]);
  buf B88(D_[20], D[20]);
  buf B89(D_[21], D[21]);
  buf B90(D_[22], D[22]);
  buf B91(D_[23], D[23]);
  buf B92(D_[24], D[24]);
  buf B93(D_[25], D[25]);
  buf B94(D_[26], D[26]);
  buf B95(D_[27], D[27]);
  buf B96(D_[28], D[28]);
  buf B97(D_[29], D[29]);
  buf B98(D_[30], D[30]);
  buf B99(D_[31], D[31]);
  buf B100(EMA_[0], EMA[0]);
  buf B101(EMA_[1], EMA[1]);
  buf B102(EMA_[2], EMA[2]);
  buf B103(EMAW_[0], EMAW[0]);
  buf B104(EMAW_[1], EMAW[1]);
  buf B105(TEN_, TEN);
  buf B106(TCEN_, TCEN);
  buf B107(TWEN_[0], TWEN[0]);
  buf B108(TWEN_[1], TWEN[1]);
  buf B109(TWEN_[2], TWEN[2]);
  buf B110(TWEN_[3], TWEN[3]);
  buf B111(TA_[0], TA[0]);
  buf B112(TA_[1], TA[1]);
  buf B113(TA_[2], TA[2]);
  buf B114(TA_[3], TA[3]);
  buf B115(TA_[4], TA[4]);
  buf B116(TA_[5], TA[5]);
  buf B117(TA_[6], TA[6]);
  buf B118(TA_[7], TA[7]);
  buf B119(TA_[8], TA[8]);
  buf B120(TA_[9], TA[9]);
  buf B121(TA_[10], TA[10]);
  buf B122(TD_[0], TD[0]);
  buf B123(TD_[1], TD[1]);
  buf B124(TD_[2], TD[2]);
  buf B125(TD_[3], TD[3]);
  buf B126(TD_[4], TD[4]);
  buf B127(TD_[5], TD[5]);
  buf B128(TD_[6], TD[6]);
  buf B129(TD_[7], TD[7]);
  buf B130(TD_[8], TD[8]);
  buf B131(TD_[9], TD[9]);
  buf B132(TD_[10], TD[10]);
  buf B133(TD_[11], TD[11]);
  buf B134(TD_[12], TD[12]);
  buf B135(TD_[13], TD[13]);
  buf B136(TD_[14], TD[14]);
  buf B137(TD_[15], TD[15]);
  buf B138(TD_[16], TD[16]);
  buf B139(TD_[17], TD[17]);
  buf B140(TD_[18], TD[18]);
  buf B141(TD_[19], TD[19]);
  buf B142(TD_[20], TD[20]);
  buf B143(TD_[21], TD[21]);
  buf B144(TD_[22], TD[22]);
  buf B145(TD_[23], TD[23]);
  buf B146(TD_[24], TD[24]);
  buf B147(TD_[25], TD[25]);
  buf B148(TD_[26], TD[26]);
  buf B149(TD_[27], TD[27]);
  buf B150(TD_[28], TD[28]);
  buf B151(TD_[29], TD[29]);
  buf B152(TD_[30], TD[30]);
  buf B153(TD_[31], TD[31]);
  buf B154(GWEN_, GWEN);
  buf B155(TGWEN_, TGWEN);
  buf B156(RET1N_, RET1N);
  buf B157(SI_[0], SI[0]);
  buf B158(SI_[1], SI[1]);
  buf B159(SE_, SE);
  buf B160(DFTRAMBYP_, DFTRAMBYP);

  assign CENY_ = (RET1N_ | pre_charge_st) ? (DFTRAMBYP_ & (TEN_ ? CEN_ : TCEN_)) : 1'bx;
  assign WENY_ = (RET1N_ | pre_charge_st) ? ({4{DFTRAMBYP_}} & (TEN_ ? WEN_ : TWEN_)) : {4{1'bx}};
  assign AY_ = (RET1N_ | pre_charge_st) ? ({11{DFTRAMBYP_}} & (TEN_ ? A_ : TA_)) : {11{1'bx}};
  assign GWENY_ = (RET1N_ | pre_charge_st) ? (DFTRAMBYP_ & (TEN_ ? GWEN_ : TGWEN_)) : 1'bx;
  assign Q_ = (RET1N_ | pre_charge_st) ? ((Q_int)) : {32{1'bx}};
  assign SO_ = (RET1N_ | pre_charge_st) ? ({Q_[16], Q_[15]}) : {2{1'bx}};

// If INITIALIZE_MEMORY is defined at Simulator Command Line, it Initializes the Memory with all ZEROS.
`ifdef INITIALIZE_MEMORY
  integer i;
  initial begin
    #0;
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'b0}};
  end
`endif

  task failedWrite;
  input port_f;
  integer i;
  begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'bx}};
  end
  endtask

  function isBitX;
    input bitval;
    begin
      isBitX = ( bitval===1'bx || bitval==1'bz ) ? 1'b1 : 1'b0;
    end
  endfunction

  function isBit1;
    input bitval;
    begin
      isBit1 = ( bitval===1'b1 ) ? 1'b1 : 1'b0;
    end
  endfunction



  task readWrite;
  begin
    if (GWEN_int !== 1'b1 && DFTRAMBYP_int=== 1'b0 && SE_int === 1'bx) begin
      failedWrite(0);
    end else if (DFTRAMBYP_int=== 1'b0 && SE_int === 1'b1) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_int === 1'b0 && (CEN_int === 1'b0 || DFTRAMBYP_int === 1'b1)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{(EMA_int & isBit1(DFTRAMBYP_int)), (EMAW_int & isBit1(DFTRAMBYP_int))} === 1'bx) begin
        XQ = 1'b1; Q_update = 1'b1;
    end else if (^{(CEN_int & !isBit1(DFTRAMBYP_int)), EMA_int, EMAW_int, RET1N_int} === 1'bx) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if ((A_int >= WORDS) && (CEN_int === 1'b0) && DFTRAMBYP_int === 1'b0) begin
        XQ = GWEN_int !== 1'b1 ? 1'b0 : 1'b1; Q_update = GWEN_int !== 1'b1 ? 1'b0 : 1'b1;
    end else if (CEN_int === 1'b0 && (^A_int) === 1'bx && DFTRAMBYP_int === 1'b0) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (CEN_int === 1'b0 || DFTRAMBYP_int === 1'b1) begin
      if(isBitX(DFTRAMBYP_int) || isBitX(SE_int))
        D_int = {32{1'bx}};

      mux_address = (A_int & 4'b1111);
      row_address = (A_int >> 4);
      if (DFTRAMBYP_int !== 1'b1) begin
      if (row_address > 127)
        row = {512{1'bx}};
      else
        row = mem[row_address];
      end
      if( (isBitX(GWEN_int) && DFTRAMBYP_int!==1) || isBitX(DFTRAMBYP_int) ) begin
        writeEnable = {32{1'bx}};
        D_int = {32{1'bx}};
      end else
          writeEnable = ~ ( {32{GWEN_int}} | {WEN_int[3], WEN_int[3], WEN_int[3], WEN_int[3],
          WEN_int[3], WEN_int[3], WEN_int[3], WEN_int[3], WEN_int[2], WEN_int[2], WEN_int[2],
          WEN_int[2], WEN_int[2], WEN_int[2], WEN_int[2], WEN_int[2], WEN_int[1], WEN_int[1],
          WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[0],
          WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0]});
      if (GWEN_int !== 1'b1 || DFTRAMBYP_int === 1'b1 || DFTRAMBYP_int === 1'bx) begin
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, D_int[31], 15'b000000000000000, D_int[30],
          15'b000000000000000, D_int[29], 15'b000000000000000, D_int[28], 15'b000000000000000, D_int[27],
          15'b000000000000000, D_int[26], 15'b000000000000000, D_int[25], 15'b000000000000000, D_int[24],
          15'b000000000000000, D_int[23], 15'b000000000000000, D_int[22], 15'b000000000000000, D_int[21],
          15'b000000000000000, D_int[20], 15'b000000000000000, D_int[19], 15'b000000000000000, D_int[18],
          15'b000000000000000, D_int[17], 15'b000000000000000, D_int[16], 15'b000000000000000, D_int[15],
          15'b000000000000000, D_int[14], 15'b000000000000000, D_int[13], 15'b000000000000000, D_int[12],
          15'b000000000000000, D_int[11], 15'b000000000000000, D_int[10], 15'b000000000000000, D_int[9],
          15'b000000000000000, D_int[8], 15'b000000000000000, D_int[7], 15'b000000000000000, D_int[6],
          15'b000000000000000, D_int[5], 15'b000000000000000, D_int[4], 15'b000000000000000, D_int[3],
          15'b000000000000000, D_int[2], 15'b000000000000000, D_int[1], 15'b000000000000000, D_int[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        if (DFTRAMBYP_int === 1'b1 && SE_int === 1'b0) begin
        end else if (GWEN_int !== 1'b1 && DFTRAMBYP_int === 1'b1 && SE_int === 1'bx) begin
        	XQ = 1'b1; Q_update = 1'b1;
        end else begin
        mem[row_address] = row;
        end
      end else begin
        data_out = (row >> (mux_address%8));
        readLatch0 = {data_out[504], data_out[496], data_out[488], data_out[480], data_out[472],
          data_out[464], data_out[456], data_out[448], data_out[440], data_out[432],
          data_out[424], data_out[416], data_out[408], data_out[400], data_out[392],
          data_out[384], data_out[376], data_out[368], data_out[360], data_out[352],
          data_out[344], data_out[336], data_out[328], data_out[320], data_out[312],
          data_out[304], data_out[296], data_out[288], data_out[280], data_out[272],
          data_out[264], data_out[256], data_out[248], data_out[240], data_out[232],
          data_out[224], data_out[216], data_out[208], data_out[200], data_out[192],
          data_out[184], data_out[176], data_out[168], data_out[160], data_out[152],
          data_out[144], data_out[136], data_out[128], data_out[120], data_out[112],
          data_out[104], data_out[96], data_out[88], data_out[80], data_out[72], data_out[64],
          data_out[56], data_out[48], data_out[40], data_out[32], data_out[24], data_out[16],
          data_out[8], data_out[0]};
        shifted_readLatch0 = (readLatch0 >> A_int[3]);
        mem_path = {shifted_readLatch0[62], shifted_readLatch0[60], shifted_readLatch0[58],
          shifted_readLatch0[56], shifted_readLatch0[54], shifted_readLatch0[52], shifted_readLatch0[50],
          shifted_readLatch0[48], shifted_readLatch0[46], shifted_readLatch0[44], shifted_readLatch0[42],
          shifted_readLatch0[40], shifted_readLatch0[38], shifted_readLatch0[36], shifted_readLatch0[34],
          shifted_readLatch0[32], shifted_readLatch0[30], shifted_readLatch0[28], shifted_readLatch0[26],
          shifted_readLatch0[24], shifted_readLatch0[22], shifted_readLatch0[20], shifted_readLatch0[18],
          shifted_readLatch0[16], shifted_readLatch0[14], shifted_readLatch0[12], shifted_readLatch0[10],
          shifted_readLatch0[8], shifted_readLatch0[6], shifted_readLatch0[4], shifted_readLatch0[2],
          shifted_readLatch0[0]};
        	XQ = 1'b0; Q_update = 1'b1;
      end
      if (DFTRAMBYP_int === 1'b1) begin
        	XQ = 1'b0; Q_update = 1'b1;
      end
      if( isBitX(GWEN_int) && DFTRAMBYP_int !== 1'b1) begin
        XQ = 1'b1; Q_update = 1'b1;
      end
      if( isBitX(DFTRAMBYP_int) ) begin
        XQ = 1'b1; Q_update = 1'b1;
      end
      if( isBitX(SE_int) && DFTRAMBYP_int === 1'b1 ) begin
        XQ = 1'b1; Q_update = 1'b1;
      end
    end
  end
  endtask
  always @ (CEN_ or TCEN_ or TEN_ or DFTRAMBYP_ or CLK_) begin
  	if(CLK_ == 1'b0) begin
  		CEN_p2 = CEN_;
  		TCEN_p2 = TCEN_;
  		DFTRAMBYP_p2 = DFTRAMBYP_;
  	end
  end

`ifdef POWER_PINS
  always @ (VDDCE) begin
      if (VDDCE != 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDCE should be powered down after VDDPE, Illegal power down sequencing in %m at %0t", $time);
       end
        $display("In PowerDown Mode in %m at %0t", $time);
        failedWrite(0);
      end
      if (VDDCE == 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDPE should be powered up after VDDCE in %m at %0t", $time);
        $display("Illegal power up sequencing in %m at %0t", $time);
       end
        failedWrite(0);
      end
  end
`endif
`ifdef POWER_PINS
  always @ (RET1N_ or VDDPE or VDDCE) begin
`else     
  always @ RET1N_ begin
`endif
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st == 1'b1 && (CEN_ === 1'bx || TCEN_ === 1'bx || DFTRAMBYP_ === 1'bx || CLK_ === 1'bx)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_ === 1'b0 && RET1N_int === 1'b1 && (CEN_p2 === 1'b0 || TCEN_p2 === 1'b0 || DFTRAMBYP_p2 === 1'b1)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_ === 1'b1 && RET1N_int === 1'b0 && (CEN_p2 === 1'b0 || TCEN_p2 === 1'b0 || DFTRAMBYP_p2 === 1'b1)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(0);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
        XQ = 1'b1; Q_update = 1'b1;
      CEN_int = 1'bx;
      WEN_int = {4{1'bx}};
      A_int = {11{1'bx}};
      D_int = {32{1'bx}};
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      TEN_int = 1'bx;
      TCEN_int = 1'bx;
      TWEN_int = {4{1'bx}};
      TA_int = {11{1'bx}};
      TD_int = {32{1'bx}};
      GWEN_int = 1'bx;
      TGWEN_int = 1'bx;
      RET1N_int = 1'bx;
      SE_int = 1'bx;
      DFTRAMBYP_int = 1'bx;
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 &&  pre_charge_st == 1'b1) begin
      pre_charge_st = 0;
    end else begin
      pre_charge_st = 0;
`else     
    end else begin
`endif
        XQ = 1'b1; Q_update = 1'b1;
      CEN_int = 1'bx;
      WEN_int = {4{1'bx}};
      A_int = {11{1'bx}};
      D_int = {32{1'bx}};
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      TEN_int = 1'bx;
      TCEN_int = 1'bx;
      TWEN_int = {4{1'bx}};
      TA_int = {11{1'bx}};
      TD_int = {32{1'bx}};
      GWEN_int = 1'bx;
      TGWEN_int = 1'bx;
      RET1N_int = 1'bx;
      SE_int = 1'bx;
      DFTRAMBYP_int = 1'bx;
    end
    RET1N_int = RET1N_;
    #0;
        Q_update = 1'b0;
  end


  always @ CLK_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
`endif
`ifdef POWER_PINS
  if (RET1N_ == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
  end else begin
    if ((CLK_ === 1'bx || CLK_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if ((CLK_ === 1'b1 || CLK_ === 1'b0) && LAST_CLK === 1'bx) begin
       D_sh_update = 1'b0;  XD_sh = 1'b0;
       XQ = 1'b0; Q_update = 1'b0; 
    end else if (CLK_ === 1'b1 && LAST_CLK === 1'b0) begin
      SE_int = SE_;
      DFTRAMBYP_int = DFTRAMBYP_;
      CEN_int = TEN_ ? CEN_ : TCEN_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      TEN_int = TEN_;
      TWEN_int = TWEN_;
      RET1N_int = RET1N_;
      if (DFTRAMBYP_=== 1'b1 || CEN_int != 1'b1) begin
        WEN_int = TEN_ ? WEN_ : TWEN_;
        A_int = TEN_ ? A_ : TA_;
        D_int = TEN_ ? D_ : TD_;
        TCEN_int = TCEN_;
        TA_int = TA_;
        TD_int = TD_;
        GWEN_int = TEN_ ? GWEN_ : TGWEN_;
        TGWEN_int = TGWEN_;
        DFTRAMBYP_int = DFTRAMBYP_;
        if (GWEN_int === 1'b1 || DFTRAMBYP_ == 1'b1) begin
          read_mux_sel0 = (TEN_ ? A_[3] : TA_[3] );
          read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
        end
      end
      clk0_int = 1'b0;
      if (DFTRAMBYP_=== 1'b1 && SE_ === 1'b1) begin
         read_mux_sel0 = (TEN_ ? A_[3] : TA_[3] );
         read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
        XQ = 1'b0; Q_update = 1'b1;
      end else begin
      CEN_int = TEN_ ? CEN_ : TCEN_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      TEN_int = TEN_;
      TWEN_int = TWEN_;
      RET1N_int = RET1N_;
      if (DFTRAMBYP_=== 1'b1 || CEN_int != 1'b1) begin
        WEN_int = TEN_ ? WEN_ : TWEN_;
        A_int = TEN_ ? A_ : TA_;
        D_int = TEN_ ? D_ : TD_;
        TCEN_int = TCEN_;
        TA_int = TA_;
        TD_int = TD_;
        GWEN_int = TEN_ ? GWEN_ : TGWEN_;
        TGWEN_int = TGWEN_;
        DFTRAMBYP_int = DFTRAMBYP_;
        if (GWEN_int === 1'b1 || DFTRAMBYP_ == 1'b1) begin
          read_mux_sel0 = (TEN_ ? A_[3] : TA_[3] );
          read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
        end
      end
      clk0_int = 1'b0;
    readWrite;
      end
    end else if (CLK_ === 1'b0 && LAST_CLK === 1'b1) begin
      Q_update = 1'b0;
      D_sh_update = 1'b0;
      XQ = 1'b0;
         read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
    end
  end
    LAST_CLK = CLK_;
  end

  reg globalNotifier0;
  initial globalNotifier0 = 1'b0;

  always @ globalNotifier0 begin
    if ($realtime == 0) begin
    end else if ((EMAW_int[0] === 1'bx & DFTRAMBYP_int === 1'b1) || (EMAW_int[1] === 1'bx & DFTRAMBYP_int === 1'b1) || 
      (EMA_int[0] === 1'bx & DFTRAMBYP_int === 1'b1) || (EMA_int[1] === 1'bx & DFTRAMBYP_int === 1'b1) || 
      (EMA_int[2] === 1'bx & DFTRAMBYP_int === 1'b1)) begin
        XQ = 1'b1; Q_update = 1'b1;
    end else if ((CEN_int === 1'bx & DFTRAMBYP_int === 1'b0) || EMAW_int[0] === 1'bx || 
      EMAW_int[1] === 1'bx || EMA_int[0] === 1'bx || EMA_int[1] === 1'bx || EMA_int[2] === 1'bx || 
      RET1N_int === 1'bx || clk0_int === 1'bx) begin
        XQ = 1'b1; Q_update = 1'b1;
      failedWrite(0);
    end else if (TEN_int === 1'bx) begin
      if(((CEN_ === 1'b1 & TCEN_ === 1'b1) & DFTRAMBYP_int === 1'b0) | (DFTRAMBYP_int === 1'b1 & SE_int === 1'b1)) begin
      end else begin
        XQ = 1'b1; Q_update = 1'b1;
      if (DFTRAMBYP_int === 1'b0) begin
          failedWrite(0);
      end
      end
    end else begin
      #0;
      readWrite;
   end
      #0;
        XQ = 1'b0; Q_update = 1'b0;
    globalNotifier0 = 1'b0;
  end

  assign SI_int = SE_ ? SI_ : {2{1'b0}};
  assign D_int_bmux = TEN_ ? D_ : TD_;

  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ0 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(SI_int[0]), .D(D_int_bmux[0]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[0]), .XQ(XQ), .Q(Q_int[0]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ1 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[0]), .D(D_int_bmux[1]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[1]), .XQ(XQ), .Q(Q_int[1]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ2 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[1]), .D(D_int_bmux[2]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[2]), .XQ(XQ), .Q(Q_int[2]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ3 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[2]), .D(D_int_bmux[3]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[3]), .XQ(XQ), .Q(Q_int[3]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ4 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[3]), .D(D_int_bmux[4]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[4]), .XQ(XQ), .Q(Q_int[4]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ5 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[4]), .D(D_int_bmux[5]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[5]), .XQ(XQ), .Q(Q_int[5]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ6 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[5]), .D(D_int_bmux[6]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[6]), .XQ(XQ), .Q(Q_int[6]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ7 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[6]), .D(D_int_bmux[7]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[7]), .XQ(XQ), .Q(Q_int[7]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ8 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[7]), .D(D_int_bmux[8]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[8]), .XQ(XQ), .Q(Q_int[8]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ9 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[8]), .D(D_int_bmux[9]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[9]), .XQ(XQ), .Q(Q_int[9]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ10 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[9]), .D(D_int_bmux[10]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[10]), .XQ(XQ), .Q(Q_int[10]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ11 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[10]), .D(D_int_bmux[11]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[11]), .XQ(XQ), .Q(Q_int[11]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ12 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[11]), .D(D_int_bmux[12]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[12]), .XQ(XQ), .Q(Q_int[12]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ13 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[12]), .D(D_int_bmux[13]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[13]), .XQ(XQ), .Q(Q_int[13]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ14 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[13]), .D(D_int_bmux[14]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[14]), .XQ(XQ), .Q(Q_int[14]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ15 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[14]), .D(D_int_bmux[15]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[15]), .XQ(XQ), .Q(Q_int[15]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ16 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[17]), .D(D_int_bmux[16]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[16]), .XQ(XQ), .Q(Q_int[16]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ17 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[18]), .D(D_int_bmux[17]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[17]), .XQ(XQ), .Q(Q_int[17]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ18 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[19]), .D(D_int_bmux[18]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[18]), .XQ(XQ), .Q(Q_int[18]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ19 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[20]), .D(D_int_bmux[19]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[19]), .XQ(XQ), .Q(Q_int[19]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ20 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[21]), .D(D_int_bmux[20]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[20]), .XQ(XQ), .Q(Q_int[20]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ21 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[22]), .D(D_int_bmux[21]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[21]), .XQ(XQ), .Q(Q_int[21]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ22 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[23]), .D(D_int_bmux[22]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[22]), .XQ(XQ), .Q(Q_int[22]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ23 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[24]), .D(D_int_bmux[23]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[23]), .XQ(XQ), .Q(Q_int[23]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ24 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[25]), .D(D_int_bmux[24]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[24]), .XQ(XQ), .Q(Q_int[24]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ25 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[26]), .D(D_int_bmux[25]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[25]), .XQ(XQ), .Q(Q_int[25]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ26 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[27]), .D(D_int_bmux[26]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[26]), .XQ(XQ), .Q(Q_int[26]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ27 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[28]), .D(D_int_bmux[27]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[27]), .XQ(XQ), .Q(Q_int[27]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ28 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[29]), .D(D_int_bmux[28]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[28]), .XQ(XQ), .Q(Q_int[28]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ29 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[30]), .D(D_int_bmux[29]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[29]), .XQ(XQ), .Q(Q_int[29]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ30 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(Q_int[31]), .D(D_int_bmux[30]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[30]), .XQ(XQ), .Q(Q_int[30]));
  datapath_latch_sram_sp_hde_hvt_rvt_2048x32m16 uDQ31 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(SE_), .SI(SI_int[1]), .D(D_int_bmux[31]), .DFTRAMBYP(DFTRAMBYP_), .mem_path(mem_path[31]), .XQ(XQ), .Q(Q_int[31]));


// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
 always @ (VDDCE or VDDPE or VSSE) begin
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
 end
`endif

  always @ NOT_CEN begin
    CEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN3 begin
    WEN_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN2 begin
    WEN_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN1 begin
    WEN_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN0 begin
    WEN_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A10 begin
    A_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A9 begin
    A_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A8 begin
    A_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A7 begin
    A_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A6 begin
    A_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A5 begin
    A_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A4 begin
    A_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A3 begin
    A_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A2 begin
    A_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A1 begin
    A_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A0 begin
    A_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D31 begin
    D_int[31] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D30 begin
    D_int[30] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D29 begin
    D_int[29] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D28 begin
    D_int[28] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D27 begin
    D_int[27] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D26 begin
    D_int[26] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D25 begin
    D_int[25] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D24 begin
    D_int[24] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D23 begin
    D_int[23] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D22 begin
    D_int[22] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D21 begin
    D_int[21] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D20 begin
    D_int[20] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D19 begin
    D_int[19] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D18 begin
    D_int[18] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D17 begin
    D_int[17] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D16 begin
    D_int[16] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D15 begin
    D_int[15] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D14 begin
    D_int[14] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D13 begin
    D_int[13] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D12 begin
    D_int[12] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D11 begin
    D_int[11] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D10 begin
    D_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D9 begin
    D_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D8 begin
    D_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D7 begin
    D_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D6 begin
    D_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D5 begin
    D_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D4 begin
    D_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D3 begin
    D_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D2 begin
    D_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D1 begin
    D_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D0 begin
    D_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA2 begin
    EMA_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA1 begin
    EMA_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA0 begin
    EMA_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAW1 begin
    EMAW_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAW0 begin
    EMAW_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TEN begin
    TEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TCEN begin
    CEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TWEN3 begin
    WEN_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TWEN2 begin
    WEN_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TWEN1 begin
    WEN_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TWEN0 begin
    WEN_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA10 begin
    A_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA9 begin
    A_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA8 begin
    A_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA7 begin
    A_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA6 begin
    A_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA5 begin
    A_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA4 begin
    A_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA3 begin
    A_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA2 begin
    A_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA1 begin
    A_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA0 begin
    A_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD31 begin
    D_int[31] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD30 begin
    D_int[30] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD29 begin
    D_int[29] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD28 begin
    D_int[28] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD27 begin
    D_int[27] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD26 begin
    D_int[26] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD25 begin
    D_int[25] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD24 begin
    D_int[24] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD23 begin
    D_int[23] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD22 begin
    D_int[22] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD21 begin
    D_int[21] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD20 begin
    D_int[20] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD19 begin
    D_int[19] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD18 begin
    D_int[18] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD17 begin
    D_int[17] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD16 begin
    D_int[16] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD15 begin
    D_int[15] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD14 begin
    D_int[14] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD13 begin
    D_int[13] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD12 begin
    D_int[12] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD11 begin
    D_int[11] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD10 begin
    D_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD9 begin
    D_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD8 begin
    D_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD7 begin
    D_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD6 begin
    D_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD5 begin
    D_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD4 begin
    D_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD3 begin
    D_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD2 begin
    D_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD1 begin
    D_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD0 begin
    D_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_GWEN begin
    GWEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TGWEN begin
    GWEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_SI1 begin
        XQ = 1'b1; Q_update = 1'b1;
  end
  always @ NOT_SI0 begin
        XQ = 1'b1; Q_update = 1'b1;
  end
  always @ NOT_SE begin
        XQ = 1'b1; Q_update = 1'b1;
    SE_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_DFTRAMBYP begin
    DFTRAMBYP_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_RET1N begin
    RET1N_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end

  always @ NOT_CLK_PER begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLK_MINH begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLK_MINL begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end


  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0;
  wire RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0;
  wire RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0;
  wire RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0;
  wire RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0;
  wire RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0;
  wire RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0;
  wire RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0;

  wire RET1Neq1aTENeq1, RET1Neq1aTENeq0, RET1Neq1aTENeq1aCENeq0, RET1Neq1aTENeq0aTCENeq0;
  wire RET1Neq1aSEeq1, RET1Neq1;

  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && !EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && !EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && !EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && !EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && !EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && !EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && !EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && !EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && !EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && !EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && !EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && !EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && !EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && !EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && !EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && !EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0 = 
  RET1N && TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !CEN && !WEN[3] && !GWEN));
  assign RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0 = 
  RET1N && TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !CEN && !WEN[2] && !GWEN));
  assign RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0 = 
  RET1N && TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !CEN && !WEN[1] && !GWEN));
  assign RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0 = 
  RET1N && TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !CEN && !WEN[0] && !GWEN));
  assign RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0 = 
  RET1N && !TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !TCEN && !TWEN[3] && !TGWEN));
  assign RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0 = 
  RET1N && !TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !TCEN && !TWEN[2] && !TGWEN));
  assign RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0 = 
  RET1N && !TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !TCEN && !TWEN[1] && !TGWEN));
  assign RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0 = 
  RET1N && !TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !TCEN && !TWEN[0] && !TGWEN));


  assign RET1Neq1aTENeq1aCENeq0 = RET1N && TEN && !CEN;
  assign RET1Neq1aTENeq0aTCENeq0 = RET1N && !TEN && !TCEN;

  assign RET1Neq1aTENeq1 = RET1N && TEN;
  assign RET1Neq1aTENeq0 = RET1N && !TEN;
  assign RET1Neq1aSEeq1 = RET1N && SE;
  assign RET1Neq1 = RET1N;

  specify

    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (CEN +=> CENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TCEN +=> CENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && CEN == 1'b0 && TCEN == 1'b1)
       (TEN -=> CENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && CEN == 1'b1 && TCEN == 1'b0)
       (TEN +=> CENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> CENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[3] == 1'b0 && TWEN[3] == 1'b1)
       (TEN -=> WENY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[3] == 1'b1 && TWEN[3] == 1'b0)
       (TEN +=> WENY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[2] == 1'b0 && TWEN[2] == 1'b1)
       (TEN -=> WENY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[2] == 1'b1 && TWEN[2] == 1'b0)
       (TEN +=> WENY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[1] == 1'b0 && TWEN[1] == 1'b1)
       (TEN -=> WENY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[1] == 1'b1 && TWEN[1] == 1'b0)
       (TEN +=> WENY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[0] == 1'b0 && TWEN[0] == 1'b1)
       (TEN -=> WENY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[0] == 1'b1 && TWEN[0] == 1'b0)
       (TEN +=> WENY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (WEN[3] +=> WENY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (WEN[2] +=> WENY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (WEN[1] +=> WENY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (WEN[0] +=> WENY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TWEN[3] +=> WENY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TWEN[2] +=> WENY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TWEN[1] +=> WENY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TWEN[0] +=> WENY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> WENY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> WENY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> WENY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> WENY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[10] == 1'b0 && TA[10] == 1'b1)
       (TEN -=> AY[10]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[10] == 1'b1 && TA[10] == 1'b0)
       (TEN +=> AY[10]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[9] == 1'b0 && TA[9] == 1'b1)
       (TEN -=> AY[9]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[9] == 1'b1 && TA[9] == 1'b0)
       (TEN +=> AY[9]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[8] == 1'b0 && TA[8] == 1'b1)
       (TEN -=> AY[8]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[8] == 1'b1 && TA[8] == 1'b0)
       (TEN +=> AY[8]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[7] == 1'b0 && TA[7] == 1'b1)
       (TEN -=> AY[7]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[7] == 1'b1 && TA[7] == 1'b0)
       (TEN +=> AY[7]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[6] == 1'b0 && TA[6] == 1'b1)
       (TEN -=> AY[6]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[6] == 1'b1 && TA[6] == 1'b0)
       (TEN +=> AY[6]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[5] == 1'b0 && TA[5] == 1'b1)
       (TEN -=> AY[5]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[5] == 1'b1 && TA[5] == 1'b0)
       (TEN +=> AY[5]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[4] == 1'b0 && TA[4] == 1'b1)
       (TEN -=> AY[4]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[4] == 1'b1 && TA[4] == 1'b0)
       (TEN +=> AY[4]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[3] == 1'b0 && TA[3] == 1'b1)
       (TEN -=> AY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[3] == 1'b1 && TA[3] == 1'b0)
       (TEN +=> AY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[2] == 1'b0 && TA[2] == 1'b1)
       (TEN -=> AY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[2] == 1'b1 && TA[2] == 1'b0)
       (TEN +=> AY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[1] == 1'b0 && TA[1] == 1'b1)
       (TEN -=> AY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[1] == 1'b1 && TA[1] == 1'b0)
       (TEN +=> AY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[0] == 1'b0 && TA[0] == 1'b1)
       (TEN -=> AY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[0] == 1'b1 && TA[0] == 1'b0)
       (TEN +=> AY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[10] +=> AY[10]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[9] +=> AY[9]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[8] +=> AY[8]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[7] +=> AY[7]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[6] +=> AY[6]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[5] +=> AY[5]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[4] +=> AY[4]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[3] +=> AY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[2] +=> AY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[1] +=> AY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[0] +=> AY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[10] +=> AY[10]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[9] +=> AY[9]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[8] +=> AY[8]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[7] +=> AY[7]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[6] +=> AY[6]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[5] +=> AY[5]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[4] +=> AY[4]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[3] +=> AY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[2] +=> AY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[1] +=> AY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[0] +=> AY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[10]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[9]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[8]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[7]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[6]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[5]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[4]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (GWEN +=> GWENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TGWEN +=> GWENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && GWEN == 1'b0 && TGWEN == 1'b1)
       (TEN -=> GWENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && GWEN == 1'b1 && TGWEN == 1'b0)
       (TEN +=> GWENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> GWENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);


   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $period(posedge CLK, `ARM_MEM_PERIOD, NOT_CLK_PER);
   `else
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
   `endif


   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $width(posedge CLK, `ARM_MEM_WIDTH, 0, NOT_CLK_MINH);
       $width(negedge CLK, `ARM_MEM_WIDTH, 0, NOT_CLK_MINL);
   `else
       $width(posedge CLK &&& RET1Neq1, `ARM_MEM_WIDTH, 0, NOT_CLK_MINH);
       $width(negedge CLK &&& RET1Neq1, `ARM_MEM_WIDTH, 0, NOT_CLK_MINL);
   `endif

    $setuphold(posedge CLK &&& RET1Neq1aTENeq1, posedge CEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1, negedge CEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge WEN[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge WEN[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge WEN[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge WEN[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge WEN[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge WEN[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge WEN[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge WEN[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D31);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D31);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D30);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D30);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D29);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D29);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D28);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D28);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D27);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D27);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D26);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D26);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D25);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D25);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D24);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D24);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D23);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D23);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D22);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D22);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D21);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D21);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D20);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D20);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D19);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D19);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D18);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D18);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D17);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D17);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D16);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D16);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D15);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D15);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D14);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D14);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D13);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D13);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D12);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D12);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D11);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D11);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, posedge EMA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, posedge EMA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, posedge EMA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, negedge EMA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, negedge EMA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, negedge EMA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, posedge EMAW[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, posedge EMAW[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, negedge EMAW[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, negedge EMAW[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW0);
    $setuphold(posedge CLK &&& RET1Neq1, posedge TEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TEN);
    $setuphold(posedge CLK &&& RET1Neq1, negedge TEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0, posedge TCEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TCEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0, negedge TCEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TCEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TWEN[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TWEN[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TWEN[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TWEN[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TWEN[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TWEN[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TWEN[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TWEN[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD31);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD31);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD30);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD30);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD29);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD29);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD28);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD28);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD27);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD27);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD26);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD26);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD25);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD25);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD24);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD24);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD23);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD23);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD22);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD22);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD21);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD21);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD20);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD20);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD19);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD19);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD18);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD18);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD17);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD17);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD16);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD16);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD15);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD15);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD14);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD14);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD13);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD13);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD12);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD12);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD11);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD11);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge GWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_GWEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge GWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_GWEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TGWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TGWEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TGWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TGWEN);
    $setuphold(posedge CLK, posedge RET1N, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CLK, negedge RET1N, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CLK &&& RET1Neq1aSEeq1, posedge SI[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_SI1);
    $setuphold(posedge CLK &&& RET1Neq1aSEeq1, posedge SI[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_SI0);
    $setuphold(posedge CLK &&& RET1Neq1aSEeq1, negedge SI[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_SI1);
    $setuphold(posedge CLK &&& RET1Neq1aSEeq1, negedge SI[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_SI0);
    $setuphold(posedge CLK &&& RET1Neq1, posedge SE, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_SE);
    $setuphold(posedge CLK &&& RET1Neq1, negedge SE, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_SE);
    $setuphold(posedge CLK &&& RET1Neq1, posedge DFTRAMBYP, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DFTRAMBYP);
    $setuphold(posedge CLK &&& RET1Neq1, negedge DFTRAMBYP, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DFTRAMBYP);
    $setuphold(negedge RET1N, negedge CEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge RET1N, negedge CEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(negedge RET1N, negedge TCEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge RET1N, negedge TCEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(negedge DFTRAMBYP, posedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(negedge DFTRAMBYP, negedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CEN, negedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CEN, posedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge TCEN, negedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge TCEN, posedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(negedge RET1N, posedge DFTRAMBYP, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge RET1N, posedge DFTRAMBYP, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
  endspecify


endmodule
`endcelldefine
  `endif
  `else
// If ARM_UD_MODEL is defined at Simulator Command Line, it Selects the Fast Functional Model
`ifdef ARM_UD_MODEL

// Following parameter Values can be overridden at Simulator Command Line.

// ARM_UD_DP Defines the delay through Data Paths, for Memory Models it represents BIST MUX output delays.
`ifdef ARM_UD_DP
`else
`define ARM_UD_DP #0.001
`endif
// ARM_UD_CP Defines the delay through Clock Path Cells, for Memory Models it is not used.
`ifdef ARM_UD_CP
`else
`define ARM_UD_CP
`endif
// ARM_UD_SEQ Defines the delay through the Memory, for Memory Models it is used for CLK->Q delays.
`ifdef ARM_UD_SEQ
`else
`define ARM_UD_SEQ #0.01
`endif

`celldefine
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
module sram_sp_hde_hvt_rvt_2048x32m16 (VDDCE, VDDPE, VSSE, CENY, WENY, AY, GWENY, Q,
    SO, CLK, CEN, WEN, A, D, EMA, EMAW, TEN, TCEN, TWEN, TA, TD, GWEN, TGWEN, RET1N,
    SI, SE, DFTRAMBYP);
`else
module sram_sp_hde_hvt_rvt_2048x32m16 (CENY, WENY, AY, GWENY, Q, SO, CLK, CEN, WEN,
    A, D, EMA, EMAW, TEN, TCEN, TWEN, TA, TD, GWEN, TGWEN, RET1N, SI, SE, DFTRAMBYP);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 32;
  parameter WORDS = 2048;
  parameter MUX = 16;
  parameter MEM_WIDTH = 512; // redun block size 8, 256 on left, 256 on right
  parameter MEM_HEIGHT = 128;
  parameter WP_SIZE = 8 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 0;

  output  CENY;
  output [3:0] WENY;
  output [10:0] AY;
  output  GWENY;
  output [31:0] Q;
  output [1:0] SO;
  input  CLK;
  input  CEN;
  input [3:0] WEN;
  input [10:0] A;
  input [31:0] D;
  input [2:0] EMA;
  input [1:0] EMAW;
  input  TEN;
  input  TCEN;
  input [3:0] TWEN;
  input [10:0] TA;
  input [31:0] TD;
  input  GWEN;
  input  TGWEN;
  input  RET1N;
  input [1:0] SI;
  input  SE;
  input  DFTRAMBYP;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

  reg pre_charge_st;
  integer row_address;
  integer mux_address;
  reg [511:0] mem [0:127];
  reg [511:0] row, row_t;
  reg LAST_CLK;
  reg [511:0] row_mask;
  reg [511:0] new_data;
  reg [511:0] data_out;
  reg [63:0] readLatch0;
  reg [63:0] shifted_readLatch0;
  reg  read_mux_sel0;
  reg  read_mux_sel0_p2;
  reg [31:0] Q_int;
  reg [31:0] writeEnable;
  reg clk0_int;

  wire  CENY_;
  wire [3:0] WENY_;
  wire [10:0] AY_;
  wire  GWENY_;
  wire [31:0] Q_;
  wire [1:0] SO_;
  reg [1:0] SO_int;
 wire  CLK_;
  wire  CEN_;
  reg  CEN_int;
  reg  CEN_p2;
  wire [3:0] WEN_;
  reg [3:0] WEN_int;
  wire [10:0] A_;
  reg [10:0] A_int;
  wire [31:0] D_;
  reg [31:0] D_int;
  wire [2:0] EMA_;
  reg [2:0] EMA_int;
  wire [1:0] EMAW_;
  reg [1:0] EMAW_int;
  wire  TEN_;
  reg  TEN_int;
  wire  TCEN_;
  reg  TCEN_int;
  reg  TCEN_p2;
  wire [3:0] TWEN_;
  reg [3:0] TWEN_int;
  wire [10:0] TA_;
  reg [10:0] TA_int;
  wire [31:0] TD_;
  reg [31:0] TD_int;
  wire  GWEN_;
  reg  GWEN_int;
  wire  TGWEN_;
  reg  TGWEN_int;
  wire  RET1N_;
  reg  RET1N_int;
  wire [1:0] SI_;
  reg [1:0] SI_int;
  wire  SE_;
  reg  SE_int;
  wire  DFTRAMBYP_;
  reg  DFTRAMBYP_int;
  reg  DFTRAMBYP_p2;

  assign CENY = CENY_; 
  assign WENY[0] = WENY_[0]; 
  assign WENY[1] = WENY_[1]; 
  assign WENY[2] = WENY_[2]; 
  assign WENY[3] = WENY_[3]; 
  assign AY[0] = AY_[0]; 
  assign AY[1] = AY_[1]; 
  assign AY[2] = AY_[2]; 
  assign AY[3] = AY_[3]; 
  assign AY[4] = AY_[4]; 
  assign AY[5] = AY_[5]; 
  assign AY[6] = AY_[6]; 
  assign AY[7] = AY_[7]; 
  assign AY[8] = AY_[8]; 
  assign AY[9] = AY_[9]; 
  assign AY[10] = AY_[10]; 
  assign GWENY = GWENY_; 
  assign Q[0] = Q_[0]; 
  assign Q[1] = Q_[1]; 
  assign Q[2] = Q_[2]; 
  assign Q[3] = Q_[3]; 
  assign Q[4] = Q_[4]; 
  assign Q[5] = Q_[5]; 
  assign Q[6] = Q_[6]; 
  assign Q[7] = Q_[7]; 
  assign Q[8] = Q_[8]; 
  assign Q[9] = Q_[9]; 
  assign Q[10] = Q_[10]; 
  assign Q[11] = Q_[11]; 
  assign Q[12] = Q_[12]; 
  assign Q[13] = Q_[13]; 
  assign Q[14] = Q_[14]; 
  assign Q[15] = Q_[15]; 
  assign Q[16] = Q_[16]; 
  assign Q[17] = Q_[17]; 
  assign Q[18] = Q_[18]; 
  assign Q[19] = Q_[19]; 
  assign Q[20] = Q_[20]; 
  assign Q[21] = Q_[21]; 
  assign Q[22] = Q_[22]; 
  assign Q[23] = Q_[23]; 
  assign Q[24] = Q_[24]; 
  assign Q[25] = Q_[25]; 
  assign Q[26] = Q_[26]; 
  assign Q[27] = Q_[27]; 
  assign Q[28] = Q_[28]; 
  assign Q[29] = Q_[29]; 
  assign Q[30] = Q_[30]; 
  assign Q[31] = Q_[31]; 
  assign SO[0] = SO_[0]; 
  assign SO[1] = SO_[1]; 
  assign CLK_ = CLK;
  assign CEN_ = CEN;
  assign WEN_[0] = WEN[0];
  assign WEN_[1] = WEN[1];
  assign WEN_[2] = WEN[2];
  assign WEN_[3] = WEN[3];
  assign A_[0] = A[0];
  assign A_[1] = A[1];
  assign A_[2] = A[2];
  assign A_[3] = A[3];
  assign A_[4] = A[4];
  assign A_[5] = A[5];
  assign A_[6] = A[6];
  assign A_[7] = A[7];
  assign A_[8] = A[8];
  assign A_[9] = A[9];
  assign A_[10] = A[10];
  assign D_[0] = D[0];
  assign D_[1] = D[1];
  assign D_[2] = D[2];
  assign D_[3] = D[3];
  assign D_[4] = D[4];
  assign D_[5] = D[5];
  assign D_[6] = D[6];
  assign D_[7] = D[7];
  assign D_[8] = D[8];
  assign D_[9] = D[9];
  assign D_[10] = D[10];
  assign D_[11] = D[11];
  assign D_[12] = D[12];
  assign D_[13] = D[13];
  assign D_[14] = D[14];
  assign D_[15] = D[15];
  assign D_[16] = D[16];
  assign D_[17] = D[17];
  assign D_[18] = D[18];
  assign D_[19] = D[19];
  assign D_[20] = D[20];
  assign D_[21] = D[21];
  assign D_[22] = D[22];
  assign D_[23] = D[23];
  assign D_[24] = D[24];
  assign D_[25] = D[25];
  assign D_[26] = D[26];
  assign D_[27] = D[27];
  assign D_[28] = D[28];
  assign D_[29] = D[29];
  assign D_[30] = D[30];
  assign D_[31] = D[31];
  assign EMA_[0] = EMA[0];
  assign EMA_[1] = EMA[1];
  assign EMA_[2] = EMA[2];
  assign EMAW_[0] = EMAW[0];
  assign EMAW_[1] = EMAW[1];
  assign TEN_ = TEN;
  assign TCEN_ = TCEN;
  assign TWEN_[0] = TWEN[0];
  assign TWEN_[1] = TWEN[1];
  assign TWEN_[2] = TWEN[2];
  assign TWEN_[3] = TWEN[3];
  assign TA_[0] = TA[0];
  assign TA_[1] = TA[1];
  assign TA_[2] = TA[2];
  assign TA_[3] = TA[3];
  assign TA_[4] = TA[4];
  assign TA_[5] = TA[5];
  assign TA_[6] = TA[6];
  assign TA_[7] = TA[7];
  assign TA_[8] = TA[8];
  assign TA_[9] = TA[9];
  assign TA_[10] = TA[10];
  assign TD_[0] = TD[0];
  assign TD_[1] = TD[1];
  assign TD_[2] = TD[2];
  assign TD_[3] = TD[3];
  assign TD_[4] = TD[4];
  assign TD_[5] = TD[5];
  assign TD_[6] = TD[6];
  assign TD_[7] = TD[7];
  assign TD_[8] = TD[8];
  assign TD_[9] = TD[9];
  assign TD_[10] = TD[10];
  assign TD_[11] = TD[11];
  assign TD_[12] = TD[12];
  assign TD_[13] = TD[13];
  assign TD_[14] = TD[14];
  assign TD_[15] = TD[15];
  assign TD_[16] = TD[16];
  assign TD_[17] = TD[17];
  assign TD_[18] = TD[18];
  assign TD_[19] = TD[19];
  assign TD_[20] = TD[20];
  assign TD_[21] = TD[21];
  assign TD_[22] = TD[22];
  assign TD_[23] = TD[23];
  assign TD_[24] = TD[24];
  assign TD_[25] = TD[25];
  assign TD_[26] = TD[26];
  assign TD_[27] = TD[27];
  assign TD_[28] = TD[28];
  assign TD_[29] = TD[29];
  assign TD_[30] = TD[30];
  assign TD_[31] = TD[31];
  assign GWEN_ = GWEN;
  assign TGWEN_ = TGWEN;
  assign RET1N_ = RET1N;
  assign SI_[0] = SI[0];
  assign SI_[1] = SI[1];
  assign SE_ = SE;
  assign DFTRAMBYP_ = DFTRAMBYP;

  assign `ARM_UD_DP CENY_ = (RET1N_ | pre_charge_st) ? (DFTRAMBYP_ & (TEN_ ? CEN_ : TCEN_)) : 1'bx;
  assign `ARM_UD_DP WENY_ = (RET1N_ | pre_charge_st) ? ({4{DFTRAMBYP_}} & (TEN_ ? WEN_ : TWEN_)) : {4{1'bx}};
  assign `ARM_UD_DP AY_ = (RET1N_ | pre_charge_st) ? ({11{DFTRAMBYP_}} & (TEN_ ? A_ : TA_)) : {11{1'bx}};
  assign `ARM_UD_DP GWENY_ = (RET1N_ | pre_charge_st) ? (DFTRAMBYP_ & (TEN_ ? GWEN_ : TGWEN_)) : 1'bx;
  assign `ARM_UD_SEQ Q_ = (RET1N_ | pre_charge_st) ? ((Q_int)) : {32{1'bx}};
  assign `ARM_UD_DP SO_ = (RET1N_ | pre_charge_st) ? ({Q_[16], Q_[15]}) : {2{1'bx}};

// If INITIALIZE_MEMORY is defined at Simulator Command Line, it Initializes the Memory with all ZEROS.
`ifdef INITIALIZE_MEMORY
  integer i;
  initial begin
    #0;
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'b0}};
  end
`endif

  // initialize memory
  parameter    WORDS_PER_ROW = MEM_WIDTH/BITS;

  integer      init_mux_addr;
  integer      init_row_addr;
  integer      init_bit_idx;
  reg [BITS-1:0] InitMem[WORDS-1:0];
  initial
  begin
    #50;
    for(init_row_addr = 0; init_row_addr < MEM_HEIGHT; init_row_addr = init_row_addr + 1)
    begin
      for(init_mux_addr = 0; init_mux_addr < WORDS_PER_ROW; init_mux_addr = init_mux_addr + 1)
      begin
        for(init_bit_idx = 0; init_bit_idx < BITS; init_bit_idx = init_bit_idx + 1)
        begin
          mem[init_row_addr][WORDS_PER_ROW * init_bit_idx + init_mux_addr] = InitMem[init_row_addr * WORDS_PER_ROW + init_mux_addr][init_bit_idx];
        end
      end
    end
  end

  task failedWrite;
  input port_f;
  integer i;
  begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'bx}};
  end
  endtask

  function isBitX;
    input bitval;
    begin
      isBitX = ( bitval===1'bx || bitval==1'bz ) ? 1'b1 : 1'b0;
    end
  endfunction

  function isBit1;
    input bitval;
    begin
      isBit1 = ( bitval===1'b1 ) ? 1'b1 : 1'b0;
    end
  endfunction



  task readWrite;
  begin
    if (GWEN_int !== 1'b1 && DFTRAMBYP_int=== 1'b0 && SE_int === 1'bx) begin
      failedWrite(0);
    end else if (DFTRAMBYP_int=== 1'b0 && SE_int === 1'b1) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (RET1N_int === 1'b0 && (CEN_int === 1'b0 || DFTRAMBYP_int === 1'b1)) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{(EMA_int & isBit1(DFTRAMBYP_int)), (EMAW_int & isBit1(DFTRAMBYP_int))} === 1'bx) begin
        Q_int = {32{1'bx}};
    end else if (^{(CEN_int & !isBit1(DFTRAMBYP_int)), EMA_int, EMAW_int, RET1N_int} === 1'bx) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if ((A_int >= WORDS) && (CEN_int === 1'b0) && DFTRAMBYP_int === 1'b0) begin
      Q_int = GWEN_int !== 1'b1 ? Q_int : {32{1'bx}};
    end else if (CEN_int === 1'b0 && (^A_int) === 1'bx && DFTRAMBYP_int === 1'b0) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (CEN_int === 1'b0 || DFTRAMBYP_int === 1'b1) begin
      if(isBitX(DFTRAMBYP_int) || isBitX(SE_int))
        D_int = {32{1'bx}};

      mux_address = (A_int & 4'b1111);
      row_address = (A_int >> 4);
      if (DFTRAMBYP_int !== 1'b1) begin
      if (row_address > 127)
        row = {512{1'bx}};
      else
        row = mem[row_address];
      end
      if( (isBitX(GWEN_int) && DFTRAMBYP_int!==1) || isBitX(DFTRAMBYP_int) ) begin
        writeEnable = {32{1'bx}};
        D_int = {32{1'bx}};
      end else
          writeEnable = ~ ( {32{GWEN_int}} | {WEN_int[3], WEN_int[3], WEN_int[3], WEN_int[3],
          WEN_int[3], WEN_int[3], WEN_int[3], WEN_int[3], WEN_int[2], WEN_int[2], WEN_int[2],
          WEN_int[2], WEN_int[2], WEN_int[2], WEN_int[2], WEN_int[2], WEN_int[1], WEN_int[1],
          WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[0],
          WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0]});
      if (GWEN_int !== 1'b1 || DFTRAMBYP_int === 1'b1 || DFTRAMBYP_int === 1'bx) begin
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, D_int[31], 15'b000000000000000, D_int[30],
          15'b000000000000000, D_int[29], 15'b000000000000000, D_int[28], 15'b000000000000000, D_int[27],
          15'b000000000000000, D_int[26], 15'b000000000000000, D_int[25], 15'b000000000000000, D_int[24],
          15'b000000000000000, D_int[23], 15'b000000000000000, D_int[22], 15'b000000000000000, D_int[21],
          15'b000000000000000, D_int[20], 15'b000000000000000, D_int[19], 15'b000000000000000, D_int[18],
          15'b000000000000000, D_int[17], 15'b000000000000000, D_int[16], 15'b000000000000000, D_int[15],
          15'b000000000000000, D_int[14], 15'b000000000000000, D_int[13], 15'b000000000000000, D_int[12],
          15'b000000000000000, D_int[11], 15'b000000000000000, D_int[10], 15'b000000000000000, D_int[9],
          15'b000000000000000, D_int[8], 15'b000000000000000, D_int[7], 15'b000000000000000, D_int[6],
          15'b000000000000000, D_int[5], 15'b000000000000000, D_int[4], 15'b000000000000000, D_int[3],
          15'b000000000000000, D_int[2], 15'b000000000000000, D_int[1], 15'b000000000000000, D_int[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        if (DFTRAMBYP_int === 1'b1 && SE_int === 1'b0) begin
        end else if (GWEN_int !== 1'b1 && DFTRAMBYP_int === 1'b1 && SE_int === 1'bx) begin
             Q_int = {32{1'bx}};
        end else begin
        mem[row_address] = row;
        end
      end else begin
        data_out = (row >> (mux_address%8));
        readLatch0 = {data_out[504], data_out[496], data_out[488], data_out[480], data_out[472],
          data_out[464], data_out[456], data_out[448], data_out[440], data_out[432],
          data_out[424], data_out[416], data_out[408], data_out[400], data_out[392],
          data_out[384], data_out[376], data_out[368], data_out[360], data_out[352],
          data_out[344], data_out[336], data_out[328], data_out[320], data_out[312],
          data_out[304], data_out[296], data_out[288], data_out[280], data_out[272],
          data_out[264], data_out[256], data_out[248], data_out[240], data_out[232],
          data_out[224], data_out[216], data_out[208], data_out[200], data_out[192],
          data_out[184], data_out[176], data_out[168], data_out[160], data_out[152],
          data_out[144], data_out[136], data_out[128], data_out[120], data_out[112],
          data_out[104], data_out[96], data_out[88], data_out[80], data_out[72], data_out[64],
          data_out[56], data_out[48], data_out[40], data_out[32], data_out[24], data_out[16],
          data_out[8], data_out[0]};
        shifted_readLatch0 = (readLatch0 >> A_int[3]);
        Q_int = {shifted_readLatch0[62], shifted_readLatch0[60], shifted_readLatch0[58],
          shifted_readLatch0[56], shifted_readLatch0[54], shifted_readLatch0[52], shifted_readLatch0[50],
          shifted_readLatch0[48], shifted_readLatch0[46], shifted_readLatch0[44], shifted_readLatch0[42],
          shifted_readLatch0[40], shifted_readLatch0[38], shifted_readLatch0[36], shifted_readLatch0[34],
          shifted_readLatch0[32], shifted_readLatch0[30], shifted_readLatch0[28], shifted_readLatch0[26],
          shifted_readLatch0[24], shifted_readLatch0[22], shifted_readLatch0[20], shifted_readLatch0[18],
          shifted_readLatch0[16], shifted_readLatch0[14], shifted_readLatch0[12], shifted_readLatch0[10],
          shifted_readLatch0[8], shifted_readLatch0[6], shifted_readLatch0[4], shifted_readLatch0[2],
          shifted_readLatch0[0]};
      end
      if (DFTRAMBYP_int === 1'b1) begin
        Q_int = D_int;
      end
      if( isBitX(GWEN_int) && DFTRAMBYP_int !== 1'b1) begin
        Q_int = {32{1'bx}};
      end
      if( isBitX(DFTRAMBYP_int) )
        Q_int = {32{1'bx}};
    end
  end
  endtask
  always @ (CEN_ or TCEN_ or TEN_ or DFTRAMBYP_ or CLK_) begin
  	if(CLK_ == 1'b0) begin
  		CEN_p2 = CEN_;
  		TCEN_p2 = TCEN_;
  		DFTRAMBYP_p2 = DFTRAMBYP_;
  	end
  end

`ifdef POWER_PINS
  always @ (VDDCE) begin
      if (VDDCE != 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDCE should be powered down after VDDPE, Illegal power down sequencing in %m at %0t", $time);
       end
        $display("In PowerDown Mode in %m at %0t", $time);
        failedWrite(0);
      end
      if (VDDCE == 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDPE should be powered up after VDDCE in %m at %0t", $time);
        $display("Illegal power up sequencing in %m at %0t", $time);
       end
        failedWrite(0);
      end
  end
`endif
`ifdef POWER_PINS
  always @ (RET1N_ or VDDPE or VDDCE) begin
`else     
  always @ RET1N_ begin
`endif
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st == 1'b1 && (CEN_ === 1'bx || TCEN_ === 1'bx || DFTRAMBYP_ === 1'bx || CLK_ === 1'bx)) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (RET1N_ === 1'b0 && RET1N_int === 1'b1 && (CEN_p2 === 1'b0 || TCEN_p2 === 1'b0 || DFTRAMBYP_p2 === 1'b1)) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (RET1N_ === 1'b1 && RET1N_int === 1'b0 && (CEN_p2 === 1'b0 || TCEN_p2 === 1'b0 || DFTRAMBYP_p2 === 1'b1)) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(0);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
      Q_int = {32{1'bx}};
      CEN_int = 1'bx;
      WEN_int = {4{1'bx}};
      A_int = {11{1'bx}};
      D_int = {32{1'bx}};
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      TEN_int = 1'bx;
      TCEN_int = 1'bx;
      TWEN_int = {4{1'bx}};
      TA_int = {11{1'bx}};
      TD_int = {32{1'bx}};
      GWEN_int = 1'bx;
      TGWEN_int = 1'bx;
      RET1N_int = 1'bx;
      SI_int = {2{1'bx}};
      SE_int = 1'bx;
      DFTRAMBYP_int = 1'bx;
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 &&  pre_charge_st == 1'b1) begin
      pre_charge_st = 0;
    end else begin
      pre_charge_st = 0;
`else     
    end else begin
`endif
        Q_int = {32{1'bx}};
      CEN_int = 1'bx;
      WEN_int = {4{1'bx}};
      A_int = {11{1'bx}};
      D_int = {32{1'bx}};
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      TEN_int = 1'bx;
      TCEN_int = 1'bx;
      TWEN_int = {4{1'bx}};
      TA_int = {11{1'bx}};
      TD_int = {32{1'bx}};
      GWEN_int = 1'bx;
      TGWEN_int = 1'bx;
      RET1N_int = 1'bx;
      SI_int = {2{1'bx}};
      SE_int = 1'bx;
      DFTRAMBYP_int = 1'bx;
    end
    RET1N_int = RET1N_;
  end

  always @ (SI_int) begin
  	#0;
      if (DFTRAMBYP_=== 1'b1 && SE_ === 1'b1 && ^SI_int === 1'bx) begin
	Q_int[31] = SI_int[1]; 
	Q_int[0] = SI_int[0]; 
  	end
  end

  always @ CLK_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
`endif
`ifdef POWER_PINS
  if (RET1N_ == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
  end else begin
    if ((CLK_ === 1'bx || CLK_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (CLK_ === 1'b1 && LAST_CLK === 1'b0) begin
      SI_int = SI_;
      SE_int = SE_;
      DFTRAMBYP_int = DFTRAMBYP_;
      CEN_int = TEN_ ? CEN_ : TCEN_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      TEN_int = TEN_;
      TWEN_int = TWEN_;
      RET1N_int = RET1N_;
      SI_int = SI_;
      if (DFTRAMBYP_=== 1'b1 || CEN_int != 1'b1) begin
        WEN_int = TEN_ ? WEN_ : TWEN_;
        A_int = TEN_ ? A_ : TA_;
        D_int = TEN_ ? D_ : TD_;
        TCEN_int = TCEN_;
        TA_int = TA_;
        TD_int = TD_;
        GWEN_int = TEN_ ? GWEN_ : TGWEN_;
        TGWEN_int = TGWEN_;
        DFTRAMBYP_int = DFTRAMBYP_;
        if (GWEN_int === 1'b1 || DFTRAMBYP_ == 1'b1) begin
          read_mux_sel0 = (TEN_ ? A_[3] : TA_[3] );
          read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
        end
      end
      clk0_int = 1'b0;
      if (DFTRAMBYP_=== 1'b1 && SE_ === 1'b1) begin
         read_mux_sel0 = (TEN_ ? A_[3] : TA_[3] );
         read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
	Q_int[31:16] = {SI_[1], Q_int[31:17]}; 
	Q_int[15:0] = {Q_int[14:0], SI_[0]}; 
      end else begin
      CEN_int = TEN_ ? CEN_ : TCEN_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      TEN_int = TEN_;
      TWEN_int = TWEN_;
      RET1N_int = RET1N_;
      SI_int = SI_;
      if (DFTRAMBYP_=== 1'b1 || CEN_int != 1'b1) begin
        WEN_int = TEN_ ? WEN_ : TWEN_;
        A_int = TEN_ ? A_ : TA_;
        D_int = TEN_ ? D_ : TD_;
        TCEN_int = TCEN_;
        TA_int = TA_;
        TD_int = TD_;
        GWEN_int = TEN_ ? GWEN_ : TGWEN_;
        TGWEN_int = TGWEN_;
        DFTRAMBYP_int = DFTRAMBYP_;
        if (GWEN_int === 1'b1 || DFTRAMBYP_ == 1'b1) begin
          read_mux_sel0 = (TEN_ ? A_[3] : TA_[3] );
          read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
        end
      end
      clk0_int = 1'b0;
    readWrite;
      end
    end else if (CLK_ === 1'b0 && LAST_CLK === 1'b1) begin
         read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
    end
  end
    LAST_CLK = CLK_;
  end
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
 always @ (VDDCE or VDDPE or VSSE) begin
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
 end
`endif

endmodule
`endcelldefine
`else
`celldefine
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
module sram_sp_hde_hvt_rvt_2048x32m16 (VDDCE, VDDPE, VSSE, CENY, WENY, AY, GWENY, Q,
    SO, CLK, CEN, WEN, A, D, EMA, EMAW, TEN, TCEN, TWEN, TA, TD, GWEN, TGWEN, RET1N,
    SI, SE, DFTRAMBYP);
`else
module sram_sp_hde_hvt_rvt_2048x32m16 (CENY, WENY, AY, GWENY, Q, SO, CLK, CEN, WEN,
    A, D, EMA, EMAW, TEN, TCEN, TWEN, TA, TD, GWEN, TGWEN, RET1N, SI, SE, DFTRAMBYP);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 32;
  parameter WORDS = 2048;
  parameter MUX = 16;
  parameter MEM_WIDTH = 512; // redun block size 8, 256 on left, 256 on right
  parameter MEM_HEIGHT = 128;
  parameter WP_SIZE = 8 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 0;

  output  CENY;
  output [3:0] WENY;
  output [10:0] AY;
  output  GWENY;
  output [31:0] Q;
  output [1:0] SO;
  input  CLK;
  input  CEN;
  input [3:0] WEN;
  input [10:0] A;
  input [31:0] D;
  input [2:0] EMA;
  input [1:0] EMAW;
  input  TEN;
  input  TCEN;
  input [3:0] TWEN;
  input [10:0] TA;
  input [31:0] TD;
  input  GWEN;
  input  TGWEN;
  input  RET1N;
  input [1:0] SI;
  input  SE;
  input  DFTRAMBYP;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

  reg pre_charge_st;
  integer row_address;
  integer mux_address;
  reg [511:0] mem [0:127];
  reg [511:0] row, row_t;
  reg LAST_CLK;
  reg [511:0] row_mask;
  reg [511:0] new_data;
  reg [511:0] data_out;
  reg [63:0] readLatch0;
  reg [63:0] shifted_readLatch0;
  reg  read_mux_sel0;
  reg  read_mux_sel0_p2;
  reg [31:0] Q_int;
  reg [31:0] writeEnable;

  reg NOT_CEN, NOT_WEN3, NOT_WEN2, NOT_WEN1, NOT_WEN0, NOT_A10, NOT_A9, NOT_A8, NOT_A7;
  reg NOT_A6, NOT_A5, NOT_A4, NOT_A3, NOT_A2, NOT_A1, NOT_A0, NOT_D31, NOT_D30, NOT_D29;
  reg NOT_D28, NOT_D27, NOT_D26, NOT_D25, NOT_D24, NOT_D23, NOT_D22, NOT_D21, NOT_D20;
  reg NOT_D19, NOT_D18, NOT_D17, NOT_D16, NOT_D15, NOT_D14, NOT_D13, NOT_D12, NOT_D11;
  reg NOT_D10, NOT_D9, NOT_D8, NOT_D7, NOT_D6, NOT_D5, NOT_D4, NOT_D3, NOT_D2, NOT_D1;
  reg NOT_D0, NOT_EMA2, NOT_EMA1, NOT_EMA0, NOT_EMAW1, NOT_EMAW0, NOT_TEN, NOT_TCEN;
  reg NOT_TWEN3, NOT_TWEN2, NOT_TWEN1, NOT_TWEN0, NOT_TA10, NOT_TA9, NOT_TA8, NOT_TA7;
  reg NOT_TA6, NOT_TA5, NOT_TA4, NOT_TA3, NOT_TA2, NOT_TA1, NOT_TA0, NOT_TD31, NOT_TD30;
  reg NOT_TD29, NOT_TD28, NOT_TD27, NOT_TD26, NOT_TD25, NOT_TD24, NOT_TD23, NOT_TD22;
  reg NOT_TD21, NOT_TD20, NOT_TD19, NOT_TD18, NOT_TD17, NOT_TD16, NOT_TD15, NOT_TD14;
  reg NOT_TD13, NOT_TD12, NOT_TD11, NOT_TD10, NOT_TD9, NOT_TD8, NOT_TD7, NOT_TD6, NOT_TD5;
  reg NOT_TD4, NOT_TD3, NOT_TD2, NOT_TD1, NOT_TD0, NOT_GWEN, NOT_TGWEN, NOT_SI1, NOT_SI0;
  reg NOT_SE, NOT_DFTRAMBYP, NOT_RET1N;
  reg NOT_CLK_PER, NOT_CLK_MINH, NOT_CLK_MINL;
  reg clk0_int;

  wire  CENY_;
  wire [3:0] WENY_;
  wire [10:0] AY_;
  wire  GWENY_;
  wire [31:0] Q_;
  wire [1:0] SO_;
  reg [1:0] SO_int;
 wire  CLK_;
  wire  CEN_;
  reg  CEN_int;
  reg  CEN_p2;
  wire [3:0] WEN_;
  reg [3:0] WEN_int;
  wire [10:0] A_;
  reg [10:0] A_int;
  wire [31:0] D_;
  reg [31:0] D_int;
  wire [2:0] EMA_;
  reg [2:0] EMA_int;
  wire [1:0] EMAW_;
  reg [1:0] EMAW_int;
  wire  TEN_;
  reg  TEN_int;
  wire  TCEN_;
  reg  TCEN_int;
  reg  TCEN_p2;
  wire [3:0] TWEN_;
  reg [3:0] TWEN_int;
  wire [10:0] TA_;
  reg [10:0] TA_int;
  wire [31:0] TD_;
  reg [31:0] TD_int;
  wire  GWEN_;
  reg  GWEN_int;
  wire  TGWEN_;
  reg  TGWEN_int;
  wire  RET1N_;
  reg  RET1N_int;
  wire [1:0] SI_;
  reg [1:0] SI_int;
  wire  SE_;
  reg  SE_int;
  wire  DFTRAMBYP_;
  reg  DFTRAMBYP_int;
  reg  DFTRAMBYP_p2;

  buf B161(CENY, CENY_);
  buf B162(WENY[0], WENY_[0]);
  buf B163(WENY[1], WENY_[1]);
  buf B164(WENY[2], WENY_[2]);
  buf B165(WENY[3], WENY_[3]);
  buf B166(AY[0], AY_[0]);
  buf B167(AY[1], AY_[1]);
  buf B168(AY[2], AY_[2]);
  buf B169(AY[3], AY_[3]);
  buf B170(AY[4], AY_[4]);
  buf B171(AY[5], AY_[5]);
  buf B172(AY[6], AY_[6]);
  buf B173(AY[7], AY_[7]);
  buf B174(AY[8], AY_[8]);
  buf B175(AY[9], AY_[9]);
  buf B176(AY[10], AY_[10]);
  buf B177(GWENY, GWENY_);
  buf B178(Q[0], Q_[0]);
  buf B179(Q[1], Q_[1]);
  buf B180(Q[2], Q_[2]);
  buf B181(Q[3], Q_[3]);
  buf B182(Q[4], Q_[4]);
  buf B183(Q[5], Q_[5]);
  buf B184(Q[6], Q_[6]);
  buf B185(Q[7], Q_[7]);
  buf B186(Q[8], Q_[8]);
  buf B187(Q[9], Q_[9]);
  buf B188(Q[10], Q_[10]);
  buf B189(Q[11], Q_[11]);
  buf B190(Q[12], Q_[12]);
  buf B191(Q[13], Q_[13]);
  buf B192(Q[14], Q_[14]);
  buf B193(Q[15], Q_[15]);
  buf B194(Q[16], Q_[16]);
  buf B195(Q[17], Q_[17]);
  buf B196(Q[18], Q_[18]);
  buf B197(Q[19], Q_[19]);
  buf B198(Q[20], Q_[20]);
  buf B199(Q[21], Q_[21]);
  buf B200(Q[22], Q_[22]);
  buf B201(Q[23], Q_[23]);
  buf B202(Q[24], Q_[24]);
  buf B203(Q[25], Q_[25]);
  buf B204(Q[26], Q_[26]);
  buf B205(Q[27], Q_[27]);
  buf B206(Q[28], Q_[28]);
  buf B207(Q[29], Q_[29]);
  buf B208(Q[30], Q_[30]);
  buf B209(Q[31], Q_[31]);
  buf B210(SO[0], SO_[0]);
  buf B211(SO[1], SO_[1]);
  buf B212(CLK_, CLK);
  buf B213(CEN_, CEN);
  buf B214(WEN_[0], WEN[0]);
  buf B215(WEN_[1], WEN[1]);
  buf B216(WEN_[2], WEN[2]);
  buf B217(WEN_[3], WEN[3]);
  buf B218(A_[0], A[0]);
  buf B219(A_[1], A[1]);
  buf B220(A_[2], A[2]);
  buf B221(A_[3], A[3]);
  buf B222(A_[4], A[4]);
  buf B223(A_[5], A[5]);
  buf B224(A_[6], A[6]);
  buf B225(A_[7], A[7]);
  buf B226(A_[8], A[8]);
  buf B227(A_[9], A[9]);
  buf B228(A_[10], A[10]);
  buf B229(D_[0], D[0]);
  buf B230(D_[1], D[1]);
  buf B231(D_[2], D[2]);
  buf B232(D_[3], D[3]);
  buf B233(D_[4], D[4]);
  buf B234(D_[5], D[5]);
  buf B235(D_[6], D[6]);
  buf B236(D_[7], D[7]);
  buf B237(D_[8], D[8]);
  buf B238(D_[9], D[9]);
  buf B239(D_[10], D[10]);
  buf B240(D_[11], D[11]);
  buf B241(D_[12], D[12]);
  buf B242(D_[13], D[13]);
  buf B243(D_[14], D[14]);
  buf B244(D_[15], D[15]);
  buf B245(D_[16], D[16]);
  buf B246(D_[17], D[17]);
  buf B247(D_[18], D[18]);
  buf B248(D_[19], D[19]);
  buf B249(D_[20], D[20]);
  buf B250(D_[21], D[21]);
  buf B251(D_[22], D[22]);
  buf B252(D_[23], D[23]);
  buf B253(D_[24], D[24]);
  buf B254(D_[25], D[25]);
  buf B255(D_[26], D[26]);
  buf B256(D_[27], D[27]);
  buf B257(D_[28], D[28]);
  buf B258(D_[29], D[29]);
  buf B259(D_[30], D[30]);
  buf B260(D_[31], D[31]);
  buf B261(EMA_[0], EMA[0]);
  buf B262(EMA_[1], EMA[1]);
  buf B263(EMA_[2], EMA[2]);
  buf B264(EMAW_[0], EMAW[0]);
  buf B265(EMAW_[1], EMAW[1]);
  buf B266(TEN_, TEN);
  buf B267(TCEN_, TCEN);
  buf B268(TWEN_[0], TWEN[0]);
  buf B269(TWEN_[1], TWEN[1]);
  buf B270(TWEN_[2], TWEN[2]);
  buf B271(TWEN_[3], TWEN[3]);
  buf B272(TA_[0], TA[0]);
  buf B273(TA_[1], TA[1]);
  buf B274(TA_[2], TA[2]);
  buf B275(TA_[3], TA[3]);
  buf B276(TA_[4], TA[4]);
  buf B277(TA_[5], TA[5]);
  buf B278(TA_[6], TA[6]);
  buf B279(TA_[7], TA[7]);
  buf B280(TA_[8], TA[8]);
  buf B281(TA_[9], TA[9]);
  buf B282(TA_[10], TA[10]);
  buf B283(TD_[0], TD[0]);
  buf B284(TD_[1], TD[1]);
  buf B285(TD_[2], TD[2]);
  buf B286(TD_[3], TD[3]);
  buf B287(TD_[4], TD[4]);
  buf B288(TD_[5], TD[5]);
  buf B289(TD_[6], TD[6]);
  buf B290(TD_[7], TD[7]);
  buf B291(TD_[8], TD[8]);
  buf B292(TD_[9], TD[9]);
  buf B293(TD_[10], TD[10]);
  buf B294(TD_[11], TD[11]);
  buf B295(TD_[12], TD[12]);
  buf B296(TD_[13], TD[13]);
  buf B297(TD_[14], TD[14]);
  buf B298(TD_[15], TD[15]);
  buf B299(TD_[16], TD[16]);
  buf B300(TD_[17], TD[17]);
  buf B301(TD_[18], TD[18]);
  buf B302(TD_[19], TD[19]);
  buf B303(TD_[20], TD[20]);
  buf B304(TD_[21], TD[21]);
  buf B305(TD_[22], TD[22]);
  buf B306(TD_[23], TD[23]);
  buf B307(TD_[24], TD[24]);
  buf B308(TD_[25], TD[25]);
  buf B309(TD_[26], TD[26]);
  buf B310(TD_[27], TD[27]);
  buf B311(TD_[28], TD[28]);
  buf B312(TD_[29], TD[29]);
  buf B313(TD_[30], TD[30]);
  buf B314(TD_[31], TD[31]);
  buf B315(GWEN_, GWEN);
  buf B316(TGWEN_, TGWEN);
  buf B317(RET1N_, RET1N);
  buf B318(SI_[0], SI[0]);
  buf B319(SI_[1], SI[1]);
  buf B320(SE_, SE);
  buf B321(DFTRAMBYP_, DFTRAMBYP);

  assign CENY_ = (RET1N_ | pre_charge_st) ? (DFTRAMBYP_ & (TEN_ ? CEN_ : TCEN_)) : 1'bx;
  assign WENY_ = (RET1N_ | pre_charge_st) ? ({4{DFTRAMBYP_}} & (TEN_ ? WEN_ : TWEN_)) : {4{1'bx}};
  assign AY_ = (RET1N_ | pre_charge_st) ? ({11{DFTRAMBYP_}} & (TEN_ ? A_ : TA_)) : {11{1'bx}};
  assign GWENY_ = (RET1N_ | pre_charge_st) ? (DFTRAMBYP_ & (TEN_ ? GWEN_ : TGWEN_)) : 1'bx;
   `ifdef ARM_FAULT_MODELING
     sram_sp_hde_hvt_rvt_2048x32m16_error_injection u1(.CLK(CLK_), .Q_out(Q_), .A(A_int), .CEN(CEN_int), .DFTRAMBYP(DFTRAMBYP_int), .SE(SE_int), .GWEN(GWEN_int), .WEN(WEN_int), .Q_in(Q_int));
  `else
  assign Q_ = (RET1N_ | pre_charge_st) ? ((Q_int)) : {32{1'bx}};
  `endif
  assign SO_ = (RET1N_ | pre_charge_st) ? ({Q_[16], Q_[15]}) : {2{1'bx}};

// If INITIALIZE_MEMORY is defined at Simulator Command Line, it Initializes the Memory with all ZEROS.
`ifdef INITIALIZE_MEMORY
  integer i;
  initial begin
    #0;
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'b0}};
  end
`endif

  task failedWrite;
  input port_f;
  integer i;
  begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'bx}};
  end
  endtask

  function isBitX;
    input bitval;
    begin
      isBitX = ( bitval===1'bx || bitval==1'bz ) ? 1'b1 : 1'b0;
    end
  endfunction

  function isBit1;
    input bitval;
    begin
      isBit1 = ( bitval===1'b1 ) ? 1'b1 : 1'b0;
    end
  endfunction



  task readWrite;
  begin
    if (GWEN_int !== 1'b1 && DFTRAMBYP_int=== 1'b0 && SE_int === 1'bx) begin
      failedWrite(0);
    end else if (DFTRAMBYP_int=== 1'b0 && SE_int === 1'b1) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (RET1N_int === 1'b0 && (CEN_int === 1'b0 || DFTRAMBYP_int === 1'b1)) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{(EMA_int & isBit1(DFTRAMBYP_int)), (EMAW_int & isBit1(DFTRAMBYP_int))} === 1'bx) begin
        Q_int = {32{1'bx}};
    end else if (^{(CEN_int & !isBit1(DFTRAMBYP_int)), EMA_int, EMAW_int, RET1N_int} === 1'bx) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if ((A_int >= WORDS) && (CEN_int === 1'b0) && DFTRAMBYP_int === 1'b0) begin
      Q_int = GWEN_int !== 1'b1 ? Q_int : {32{1'bx}};
    end else if (CEN_int === 1'b0 && (^A_int) === 1'bx && DFTRAMBYP_int === 1'b0) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (CEN_int === 1'b0 || DFTRAMBYP_int === 1'b1) begin
      if(isBitX(DFTRAMBYP_int) || isBitX(SE_int))
        D_int = {32{1'bx}};

      mux_address = (A_int & 4'b1111);
      row_address = (A_int >> 4);
      if (DFTRAMBYP_int !== 1'b1) begin
      if (row_address > 127)
        row = {512{1'bx}};
      else
        row = mem[row_address];
      end
      if( (isBitX(GWEN_int) && DFTRAMBYP_int!==1) || isBitX(DFTRAMBYP_int) ) begin
        writeEnable = {32{1'bx}};
        D_int = {32{1'bx}};
      end else
          writeEnable = ~ ( {32{GWEN_int}} | {WEN_int[3], WEN_int[3], WEN_int[3], WEN_int[3],
          WEN_int[3], WEN_int[3], WEN_int[3], WEN_int[3], WEN_int[2], WEN_int[2], WEN_int[2],
          WEN_int[2], WEN_int[2], WEN_int[2], WEN_int[2], WEN_int[2], WEN_int[1], WEN_int[1],
          WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[1], WEN_int[0],
          WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0], WEN_int[0]});
      if (GWEN_int !== 1'b1 || DFTRAMBYP_int === 1'b1 || DFTRAMBYP_int === 1'bx) begin
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, D_int[31], 15'b000000000000000, D_int[30],
          15'b000000000000000, D_int[29], 15'b000000000000000, D_int[28], 15'b000000000000000, D_int[27],
          15'b000000000000000, D_int[26], 15'b000000000000000, D_int[25], 15'b000000000000000, D_int[24],
          15'b000000000000000, D_int[23], 15'b000000000000000, D_int[22], 15'b000000000000000, D_int[21],
          15'b000000000000000, D_int[20], 15'b000000000000000, D_int[19], 15'b000000000000000, D_int[18],
          15'b000000000000000, D_int[17], 15'b000000000000000, D_int[16], 15'b000000000000000, D_int[15],
          15'b000000000000000, D_int[14], 15'b000000000000000, D_int[13], 15'b000000000000000, D_int[12],
          15'b000000000000000, D_int[11], 15'b000000000000000, D_int[10], 15'b000000000000000, D_int[9],
          15'b000000000000000, D_int[8], 15'b000000000000000, D_int[7], 15'b000000000000000, D_int[6],
          15'b000000000000000, D_int[5], 15'b000000000000000, D_int[4], 15'b000000000000000, D_int[3],
          15'b000000000000000, D_int[2], 15'b000000000000000, D_int[1], 15'b000000000000000, D_int[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        if (DFTRAMBYP_int === 1'b1 && SE_int === 1'b0) begin
        end else if (GWEN_int !== 1'b1 && DFTRAMBYP_int === 1'b1 && SE_int === 1'bx) begin
             Q_int = {32{1'bx}};
        end else begin
        mem[row_address] = row;
        end
      end else begin
        data_out = (row >> (mux_address%8));
        readLatch0 = {data_out[504], data_out[496], data_out[488], data_out[480], data_out[472],
          data_out[464], data_out[456], data_out[448], data_out[440], data_out[432],
          data_out[424], data_out[416], data_out[408], data_out[400], data_out[392],
          data_out[384], data_out[376], data_out[368], data_out[360], data_out[352],
          data_out[344], data_out[336], data_out[328], data_out[320], data_out[312],
          data_out[304], data_out[296], data_out[288], data_out[280], data_out[272],
          data_out[264], data_out[256], data_out[248], data_out[240], data_out[232],
          data_out[224], data_out[216], data_out[208], data_out[200], data_out[192],
          data_out[184], data_out[176], data_out[168], data_out[160], data_out[152],
          data_out[144], data_out[136], data_out[128], data_out[120], data_out[112],
          data_out[104], data_out[96], data_out[88], data_out[80], data_out[72], data_out[64],
          data_out[56], data_out[48], data_out[40], data_out[32], data_out[24], data_out[16],
          data_out[8], data_out[0]};
        shifted_readLatch0 = (readLatch0 >> A_int[3]);
        Q_int = {shifted_readLatch0[62], shifted_readLatch0[60], shifted_readLatch0[58],
          shifted_readLatch0[56], shifted_readLatch0[54], shifted_readLatch0[52], shifted_readLatch0[50],
          shifted_readLatch0[48], shifted_readLatch0[46], shifted_readLatch0[44], shifted_readLatch0[42],
          shifted_readLatch0[40], shifted_readLatch0[38], shifted_readLatch0[36], shifted_readLatch0[34],
          shifted_readLatch0[32], shifted_readLatch0[30], shifted_readLatch0[28], shifted_readLatch0[26],
          shifted_readLatch0[24], shifted_readLatch0[22], shifted_readLatch0[20], shifted_readLatch0[18],
          shifted_readLatch0[16], shifted_readLatch0[14], shifted_readLatch0[12], shifted_readLatch0[10],
          shifted_readLatch0[8], shifted_readLatch0[6], shifted_readLatch0[4], shifted_readLatch0[2],
          shifted_readLatch0[0]};
      end
      if (DFTRAMBYP_int === 1'b1) begin
        Q_int = D_int;
      end
      if( isBitX(GWEN_int) && DFTRAMBYP_int !== 1'b1) begin
        Q_int = {32{1'bx}};
      end
      if( isBitX(DFTRAMBYP_int) )
        Q_int = {32{1'bx}};
    end
  end
  endtask
  always @ (CEN_ or TCEN_ or TEN_ or DFTRAMBYP_ or CLK_) begin
  	if(CLK_ == 1'b0) begin
  		CEN_p2 = CEN_;
  		TCEN_p2 = TCEN_;
  		DFTRAMBYP_p2 = DFTRAMBYP_;
  	end
  end

`ifdef POWER_PINS
  always @ (VDDCE) begin
      if (VDDCE != 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDCE should be powered down after VDDPE, Illegal power down sequencing in %m at %0t", $time);
       end
        $display("In PowerDown Mode in %m at %0t", $time);
        failedWrite(0);
      end
      if (VDDCE == 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDPE should be powered up after VDDCE in %m at %0t", $time);
        $display("Illegal power up sequencing in %m at %0t", $time);
       end
        failedWrite(0);
      end
  end
`endif
`ifdef POWER_PINS
  always @ (RET1N_ or VDDPE or VDDCE) begin
`else     
  always @ RET1N_ begin
`endif
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st == 1'b1 && (CEN_ === 1'bx || TCEN_ === 1'bx || DFTRAMBYP_ === 1'bx || CLK_ === 1'bx)) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (RET1N_ === 1'b0 && RET1N_int === 1'b1 && (CEN_p2 === 1'b0 || TCEN_p2 === 1'b0 || DFTRAMBYP_p2 === 1'b1)) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (RET1N_ === 1'b1 && RET1N_int === 1'b0 && (CEN_p2 === 1'b0 || TCEN_p2 === 1'b0 || DFTRAMBYP_p2 === 1'b1)) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(0);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
      Q_int = {32{1'bx}};
      CEN_int = 1'bx;
      WEN_int = {4{1'bx}};
      A_int = {11{1'bx}};
      D_int = {32{1'bx}};
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      TEN_int = 1'bx;
      TCEN_int = 1'bx;
      TWEN_int = {4{1'bx}};
      TA_int = {11{1'bx}};
      TD_int = {32{1'bx}};
      GWEN_int = 1'bx;
      TGWEN_int = 1'bx;
      RET1N_int = 1'bx;
      SI_int = {2{1'bx}};
      SE_int = 1'bx;
      DFTRAMBYP_int = 1'bx;
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 &&  pre_charge_st == 1'b1) begin
      pre_charge_st = 0;
    end else begin
      pre_charge_st = 0;
`else     
    end else begin
`endif
        Q_int = {32{1'bx}};
      CEN_int = 1'bx;
      WEN_int = {4{1'bx}};
      A_int = {11{1'bx}};
      D_int = {32{1'bx}};
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      TEN_int = 1'bx;
      TCEN_int = 1'bx;
      TWEN_int = {4{1'bx}};
      TA_int = {11{1'bx}};
      TD_int = {32{1'bx}};
      GWEN_int = 1'bx;
      TGWEN_int = 1'bx;
      RET1N_int = 1'bx;
      SI_int = {2{1'bx}};
      SE_int = 1'bx;
      DFTRAMBYP_int = 1'bx;
    end
    RET1N_int = RET1N_;
  end

  always @ (SI_int) begin
  	#0;
      if (DFTRAMBYP_=== 1'b1 && SE_ === 1'b1 && ^SI_int === 1'bx) begin
	Q_int[31] = SI_int[1]; 
	Q_int[0] = SI_int[0]; 
  	end
  end

  always @ CLK_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
`endif
`ifdef POWER_PINS
  if (RET1N_ == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
  end else begin
    if ((CLK_ === 1'bx || CLK_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
        Q_int = {32{1'bx}};
    end else if (CLK_ === 1'b1 && LAST_CLK === 1'b0) begin
      SI_int = SI_;
      SE_int = SE_;
      DFTRAMBYP_int = DFTRAMBYP_;
      CEN_int = TEN_ ? CEN_ : TCEN_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      TEN_int = TEN_;
      TWEN_int = TWEN_;
      RET1N_int = RET1N_;
      SI_int = SI_;
      if (DFTRAMBYP_=== 1'b1 || CEN_int != 1'b1) begin
        WEN_int = TEN_ ? WEN_ : TWEN_;
        A_int = TEN_ ? A_ : TA_;
        D_int = TEN_ ? D_ : TD_;
        TCEN_int = TCEN_;
        TA_int = TA_;
        TD_int = TD_;
        GWEN_int = TEN_ ? GWEN_ : TGWEN_;
        TGWEN_int = TGWEN_;
        DFTRAMBYP_int = DFTRAMBYP_;
        if (GWEN_int === 1'b1 || DFTRAMBYP_ == 1'b1) begin
          read_mux_sel0 = (TEN_ ? A_[3] : TA_[3] );
          read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
        end
      end
      clk0_int = 1'b0;
      if (DFTRAMBYP_=== 1'b1 && SE_ === 1'b1) begin
         read_mux_sel0 = (TEN_ ? A_[3] : TA_[3] );
         read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
	Q_int[31:16] = {SI_[1], Q_int[31:17]}; 
	Q_int[15:0] = {Q_int[14:0], SI_[0]}; 
      end else begin
      CEN_int = TEN_ ? CEN_ : TCEN_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      TEN_int = TEN_;
      TWEN_int = TWEN_;
      RET1N_int = RET1N_;
      SI_int = SI_;
      if (DFTRAMBYP_=== 1'b1 || CEN_int != 1'b1) begin
        WEN_int = TEN_ ? WEN_ : TWEN_;
        A_int = TEN_ ? A_ : TA_;
        D_int = TEN_ ? D_ : TD_;
        TCEN_int = TCEN_;
        TA_int = TA_;
        TD_int = TD_;
        GWEN_int = TEN_ ? GWEN_ : TGWEN_;
        TGWEN_int = TGWEN_;
        DFTRAMBYP_int = DFTRAMBYP_;
        if (GWEN_int === 1'b1 || DFTRAMBYP_ == 1'b1) begin
          read_mux_sel0 = (TEN_ ? A_[3] : TA_[3] );
          read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
        end
      end
      clk0_int = 1'b0;
    readWrite;
      end
    end else if (CLK_ === 1'b0 && LAST_CLK === 1'b1) begin
         read_mux_sel0_p2 = ((^read_mux_sel0 === 1'bx) && DFTRAMBYP_p2) ? {1{1'b0}} : read_mux_sel0;
    end
  end
    LAST_CLK = CLK_;
  end

  reg globalNotifier0;
  initial globalNotifier0 = 1'b0;

  always @ globalNotifier0 begin
    if ($realtime == 0) begin
    end else if ((EMAW_int[0] === 1'bx & DFTRAMBYP_int === 1'b1) || (EMAW_int[1] === 1'bx & DFTRAMBYP_int === 1'b1) || 
      (EMA_int[0] === 1'bx & DFTRAMBYP_int === 1'b1) || (EMA_int[1] === 1'bx & DFTRAMBYP_int === 1'b1) || 
      (EMA_int[2] === 1'bx & DFTRAMBYP_int === 1'b1)) begin
        Q_int = {32{1'bx}};
    end else if ((CEN_int === 1'bx & DFTRAMBYP_int === 1'b0) || EMAW_int[0] === 1'bx || 
      EMAW_int[1] === 1'bx || EMA_int[0] === 1'bx || EMA_int[1] === 1'bx || EMA_int[2] === 1'bx || 
      RET1N_int === 1'bx || clk0_int === 1'bx) begin
        Q_int = {32{1'bx}};
      failedWrite(0);
    end else if (TEN_int === 1'bx) begin
      if(((CEN_ === 1'b1 & TCEN_ === 1'b1) & DFTRAMBYP_int === 1'b0) | (DFTRAMBYP_int === 1'b1 & SE_int === 1'b1)) begin
      end else begin
        Q_int = {32{1'bx}};
      if (DFTRAMBYP_int === 1'b0) begin
          failedWrite(0);
      end
      end
    end else if (^SI_int === 1'bx) begin
    end else begin
      #0;
      readWrite;
   end
    globalNotifier0 = 1'b0;
  end
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
 always @ (VDDCE or VDDPE or VSSE) begin
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
 end
`endif

  always @ NOT_CEN begin
    CEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN3 begin
    WEN_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN2 begin
    WEN_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN1 begin
    WEN_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WEN0 begin
    WEN_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A10 begin
    A_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A9 begin
    A_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A8 begin
    A_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A7 begin
    A_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A6 begin
    A_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A5 begin
    A_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A4 begin
    A_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A3 begin
    A_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A2 begin
    A_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A1 begin
    A_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A0 begin
    A_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D31 begin
    D_int[31] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D30 begin
    D_int[30] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D29 begin
    D_int[29] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D28 begin
    D_int[28] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D27 begin
    D_int[27] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D26 begin
    D_int[26] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D25 begin
    D_int[25] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D24 begin
    D_int[24] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D23 begin
    D_int[23] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D22 begin
    D_int[22] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D21 begin
    D_int[21] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D20 begin
    D_int[20] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D19 begin
    D_int[19] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D18 begin
    D_int[18] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D17 begin
    D_int[17] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D16 begin
    D_int[16] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D15 begin
    D_int[15] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D14 begin
    D_int[14] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D13 begin
    D_int[13] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D12 begin
    D_int[12] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D11 begin
    D_int[11] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D10 begin
    D_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D9 begin
    D_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D8 begin
    D_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D7 begin
    D_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D6 begin
    D_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D5 begin
    D_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D4 begin
    D_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D3 begin
    D_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D2 begin
    D_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D1 begin
    D_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D0 begin
    D_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA2 begin
    EMA_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA1 begin
    EMA_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA0 begin
    EMA_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAW1 begin
    EMAW_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAW0 begin
    EMAW_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TEN begin
    TEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TCEN begin
    CEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TWEN3 begin
    WEN_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TWEN2 begin
    WEN_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TWEN1 begin
    WEN_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TWEN0 begin
    WEN_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA10 begin
    A_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA9 begin
    A_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA8 begin
    A_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA7 begin
    A_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA6 begin
    A_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA5 begin
    A_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA4 begin
    A_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA3 begin
    A_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA2 begin
    A_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA1 begin
    A_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TA0 begin
    A_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD31 begin
    D_int[31] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD30 begin
    D_int[30] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD29 begin
    D_int[29] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD28 begin
    D_int[28] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD27 begin
    D_int[27] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD26 begin
    D_int[26] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD25 begin
    D_int[25] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD24 begin
    D_int[24] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD23 begin
    D_int[23] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD22 begin
    D_int[22] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD21 begin
    D_int[21] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD20 begin
    D_int[20] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD19 begin
    D_int[19] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD18 begin
    D_int[18] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD17 begin
    D_int[17] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD16 begin
    D_int[16] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD15 begin
    D_int[15] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD14 begin
    D_int[14] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD13 begin
    D_int[13] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD12 begin
    D_int[12] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD11 begin
    D_int[11] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD10 begin
    D_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD9 begin
    D_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD8 begin
    D_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD7 begin
    D_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD6 begin
    D_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD5 begin
    D_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD4 begin
    D_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD3 begin
    D_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD2 begin
    D_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD1 begin
    D_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TD0 begin
    D_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_GWEN begin
    GWEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TGWEN begin
    GWEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_SI1 begin
    SI_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_SI0 begin
    SI_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_SE begin
    SE_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_DFTRAMBYP begin
    DFTRAMBYP_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_RET1N begin
    RET1N_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end

  always @ NOT_CLK_PER begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLK_MINH begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLK_MINL begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end


  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0;
  wire RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0;
  wire RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0;
  wire RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0;
  wire RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1;
  wire RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0;
  wire RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0;
  wire RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0;
  wire RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0;

  wire RET1Neq1aTENeq1, RET1Neq1aTENeq0, RET1Neq1aTENeq1aCENeq0, RET1Neq1aTENeq0aTCENeq0;
  wire RET1Neq1aSEeq1, RET1Neq1;

  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && !EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && !EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && !EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && !EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && !EMA[1] && EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && !EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && !EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && !EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && !EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && !EMA[2] && EMA[1] && EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && !EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && !EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && !EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && !EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && !EMA[1] && EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && !EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && !EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && !EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && !EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && EMA[0] && !EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && EMA[0] && !EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && EMA[0] && EMAW[1] && !EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && EMA[2] && EMA[1] && EMA[0] && EMAW[1] && EMAW[0] && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0 = 
  RET1N && TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !CEN && !WEN[3] && !GWEN));
  assign RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0 = 
  RET1N && TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !CEN && !WEN[2] && !GWEN));
  assign RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0 = 
  RET1N && TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !CEN && !WEN[1] && !GWEN));
  assign RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0 = 
  RET1N && TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !CEN && !WEN[0] && !GWEN));
  assign RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1 = 
  RET1N && (((TEN && !CEN && !DFTRAMBYP) || (!TEN && !TCEN && !DFTRAMBYP)) || DFTRAMBYP);
  assign RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0 = 
  RET1N && !TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !TCEN && !TWEN[3] && !TGWEN));
  assign RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0 = 
  RET1N && !TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !TCEN && !TWEN[2] && !TGWEN));
  assign RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0 = 
  RET1N && !TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !TCEN && !TWEN[1] && !TGWEN));
  assign RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0 = 
  RET1N && !TEN && ((DFTRAMBYP && !SE) || (!DFTRAMBYP && !TCEN && !TWEN[0] && !TGWEN));


  assign RET1Neq1aTENeq1aCENeq0 = RET1N && TEN && !CEN;
  assign RET1Neq1aTENeq0aTCENeq0 = RET1N && !TEN && !TCEN;

  assign RET1Neq1aTENeq1 = RET1N && TEN;
  assign RET1Neq1aTENeq0 = RET1N && !TEN;
  assign RET1Neq1aSEeq1 = RET1N && SE;
  assign RET1Neq1 = RET1N;

  specify

    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (CEN +=> CENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TCEN +=> CENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && CEN == 1'b0 && TCEN == 1'b1)
       (TEN -=> CENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && CEN == 1'b1 && TCEN == 1'b0)
       (TEN +=> CENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> CENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[3] == 1'b0 && TWEN[3] == 1'b1)
       (TEN -=> WENY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[3] == 1'b1 && TWEN[3] == 1'b0)
       (TEN +=> WENY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[2] == 1'b0 && TWEN[2] == 1'b1)
       (TEN -=> WENY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[2] == 1'b1 && TWEN[2] == 1'b0)
       (TEN +=> WENY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[1] == 1'b0 && TWEN[1] == 1'b1)
       (TEN -=> WENY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[1] == 1'b1 && TWEN[1] == 1'b0)
       (TEN +=> WENY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[0] == 1'b0 && TWEN[0] == 1'b1)
       (TEN -=> WENY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && WEN[0] == 1'b1 && TWEN[0] == 1'b0)
       (TEN +=> WENY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (WEN[3] +=> WENY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (WEN[2] +=> WENY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (WEN[1] +=> WENY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (WEN[0] +=> WENY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TWEN[3] +=> WENY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TWEN[2] +=> WENY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TWEN[1] +=> WENY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TWEN[0] +=> WENY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> WENY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> WENY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> WENY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> WENY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[10] == 1'b0 && TA[10] == 1'b1)
       (TEN -=> AY[10]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[10] == 1'b1 && TA[10] == 1'b0)
       (TEN +=> AY[10]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[9] == 1'b0 && TA[9] == 1'b1)
       (TEN -=> AY[9]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[9] == 1'b1 && TA[9] == 1'b0)
       (TEN +=> AY[9]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[8] == 1'b0 && TA[8] == 1'b1)
       (TEN -=> AY[8]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[8] == 1'b1 && TA[8] == 1'b0)
       (TEN +=> AY[8]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[7] == 1'b0 && TA[7] == 1'b1)
       (TEN -=> AY[7]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[7] == 1'b1 && TA[7] == 1'b0)
       (TEN +=> AY[7]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[6] == 1'b0 && TA[6] == 1'b1)
       (TEN -=> AY[6]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[6] == 1'b1 && TA[6] == 1'b0)
       (TEN +=> AY[6]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[5] == 1'b0 && TA[5] == 1'b1)
       (TEN -=> AY[5]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[5] == 1'b1 && TA[5] == 1'b0)
       (TEN +=> AY[5]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[4] == 1'b0 && TA[4] == 1'b1)
       (TEN -=> AY[4]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[4] == 1'b1 && TA[4] == 1'b0)
       (TEN +=> AY[4]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[3] == 1'b0 && TA[3] == 1'b1)
       (TEN -=> AY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[3] == 1'b1 && TA[3] == 1'b0)
       (TEN +=> AY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[2] == 1'b0 && TA[2] == 1'b1)
       (TEN -=> AY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[2] == 1'b1 && TA[2] == 1'b0)
       (TEN +=> AY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[1] == 1'b0 && TA[1] == 1'b1)
       (TEN -=> AY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[1] == 1'b1 && TA[1] == 1'b0)
       (TEN +=> AY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[0] == 1'b0 && TA[0] == 1'b1)
       (TEN -=> AY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && A[0] == 1'b1 && TA[0] == 1'b0)
       (TEN +=> AY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[10] +=> AY[10]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[9] +=> AY[9]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[8] +=> AY[8]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[7] +=> AY[7]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[6] +=> AY[6]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[5] +=> AY[5]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[4] +=> AY[4]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[3] +=> AY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[2] +=> AY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[1] +=> AY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (A[0] +=> AY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[10] +=> AY[10]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[9] +=> AY[9]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[8] +=> AY[8]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[7] +=> AY[7]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[6] +=> AY[6]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[5] +=> AY[5]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[4] +=> AY[4]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[3] +=> AY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[2] +=> AY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[1] +=> AY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TA[0] +=> AY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[10]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[9]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[8]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[7]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[6]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[5]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[4]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[3]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[2]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[1]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> AY[0]) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b1)
       (GWEN +=> GWENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && TEN == 1'b0)
       (TGWEN +=> GWENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && GWEN == 1'b0 && TGWEN == 1'b1)
       (TEN -=> GWENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (DFTRAMBYP == 1'b1 && GWEN == 1'b1 && TGWEN == 1'b0)
       (TEN +=> GWENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1)
       (DFTRAMBYP +=> GWENY) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1 && DFTRAMBYP == 1'b0 && ((TEN == 1'b1 && GWEN == 1'b1) || (TEN == 1'b0 && TGWEN == 1'b1)))
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (SO[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (RET1N == 1'b1 && DFTRAMBYP == 1'b1)
       (posedge CLK => (SO[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);


   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $period(posedge CLK, `ARM_MEM_PERIOD, NOT_CLK_PER);
   `else
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& RET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
   `endif


   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $width(posedge CLK, `ARM_MEM_WIDTH, 0, NOT_CLK_MINH);
       $width(negedge CLK, `ARM_MEM_WIDTH, 0, NOT_CLK_MINL);
   `else
       $width(posedge CLK &&& RET1Neq1, `ARM_MEM_WIDTH, 0, NOT_CLK_MINH);
       $width(negedge CLK &&& RET1Neq1, `ARM_MEM_WIDTH, 0, NOT_CLK_MINL);
   `endif

    $setuphold(posedge CLK &&& RET1Neq1aTENeq1, posedge CEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1, negedge CEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge WEN[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge WEN[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge WEN[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge WEN[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge WEN[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge WEN[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge WEN[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge WEN[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WEN0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge A[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge A[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D31);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D31);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D30);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D30);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D29);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D29);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D28);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D28);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D27);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D27);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D26);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D26);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D25);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D25);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, posedge D[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D24);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN3eq0aGWENeq0, negedge D[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D24);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D23);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D23);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D22);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D22);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D21);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D21);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D20);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D20);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D19);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D19);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D18);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D18);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D17);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D17);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, posedge D[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D16);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN2eq0aGWENeq0, negedge D[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D16);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D15);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D15);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D14);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D14);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D13);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D13);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D12);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D12);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D11);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D11);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, posedge D[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN1eq0aGWENeq0, negedge D[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, posedge D[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aCENeq0aWEN0eq0aGWENeq0, negedge D[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, posedge EMA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, posedge EMA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, posedge EMA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, negedge EMA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, negedge EMA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, negedge EMA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, posedge EMAW[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, posedge EMAW[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, negedge EMAW[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0aDFTRAMBYPeq0oTENeq0aTCENeq0aDFTRAMBYPeq0oDFTRAMBYPeq1, negedge EMAW[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW0);
    $setuphold(posedge CLK &&& RET1Neq1, posedge TEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TEN);
    $setuphold(posedge CLK &&& RET1Neq1, negedge TEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0, posedge TCEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TCEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0, negedge TCEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TCEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TWEN[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TWEN[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TWEN[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TWEN[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TWEN[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TWEN[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TWEN[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TWEN[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TWEN0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TA0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD31);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD31);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD30);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD30);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD29);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD29);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD28);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD28);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD27);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD27);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD26);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD26);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD25);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD25);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, posedge TD[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD24);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN3eq0aTGWENeq0, negedge TD[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD24);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD23);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD23);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD22);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD22);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD21);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD21);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD20);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD20);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD19);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD19);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD18);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD18);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD17);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD17);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, posedge TD[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD16);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN2eq0aTGWENeq0, negedge TD[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD16);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD15);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD15);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD14);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD14);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD13);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD13);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD12);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD12);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD11);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD11);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD10);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD9);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, posedge TD[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN1eq0aTGWENeq0, negedge TD[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD8);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD7);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD6);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD5);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD4);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD3);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD2);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD1);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, posedge TD[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aDFTRAMBYPeq1aSEeq0oDFTRAMBYPeq0aTCENeq0aTWEN0eq0aTGWENeq0, negedge TD[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TD0);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, posedge GWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_GWEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq1aCENeq0, negedge GWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_GWEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, posedge TGWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TGWEN);
    $setuphold(posedge CLK &&& RET1Neq1aTENeq0aTCENeq0, negedge TGWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_TGWEN);
    $setuphold(posedge CLK, posedge RET1N, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CLK, negedge RET1N, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CLK &&& RET1Neq1aSEeq1, posedge SI[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_SI1);
    $setuphold(posedge CLK &&& RET1Neq1aSEeq1, posedge SI[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_SI0);
    $setuphold(posedge CLK &&& RET1Neq1aSEeq1, negedge SI[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_SI1);
    $setuphold(posedge CLK &&& RET1Neq1aSEeq1, negedge SI[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_SI0);
    $setuphold(posedge CLK &&& RET1Neq1, posedge SE, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_SE);
    $setuphold(posedge CLK &&& RET1Neq1, negedge SE, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_SE);
    $setuphold(posedge CLK &&& RET1Neq1, posedge DFTRAMBYP, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DFTRAMBYP);
    $setuphold(posedge CLK &&& RET1Neq1, negedge DFTRAMBYP, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_DFTRAMBYP);
    $setuphold(negedge RET1N, negedge CEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge RET1N, negedge CEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(negedge RET1N, negedge TCEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge RET1N, negedge TCEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(negedge DFTRAMBYP, posedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(negedge DFTRAMBYP, negedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CEN, negedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CEN, posedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge TCEN, negedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge TCEN, posedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(negedge RET1N, posedge DFTRAMBYP, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge RET1N, posedge DFTRAMBYP, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
  endspecify


endmodule
`endcelldefine
  `endif
`endif
`timescale 1ns/1ps
module sram_sp_hde_hvt_rvt_2048x32m16_error_injection (Q_out, Q_in, CLK, A, CEN, DFTRAMBYP, SE, WEN, GWEN);
   output [31:0] Q_out;
   input [31:0] Q_in;
   input CLK;
   input [10:0] A;
   input CEN;
   input DFTRAMBYP;
   input SE;
   input [3:0] WEN;
   input GWEN;
   parameter LEFT_RED_COLUMN_FAULT = 2'd1;
   parameter RIGHT_RED_COLUMN_FAULT = 2'd2;
   parameter NO_RED_FAULT = 2'd0;
   reg [31:0] Q_out;
   reg entry_found;
   reg list_complete;
   reg [20:0] fault_table [127:0];
   reg [20:0] fault_entry;
initial
begin
   `ifdef DUT
      `define pre_pend_path TB.DUT_inst.CHIP
   `else
       `define pre_pend_path TB.CHIP
   `endif
   `ifdef ARM_NONREPAIRABLE_FAULT
      `pre_pend_path.SMARCHCHKBVCD_LVISION_MBISTPG_ASSEMBLY_UNDER_TEST_INST.MEM0_MEM_INST.u1.add_fault(11'd126,5'd6,2'd1,2'd0);
   `endif
end
   task add_fault;
   //This task injects fault in memory
   //In order to inject fault in redundant column for Bit 0 to 15, column address
   //should have value in range of 8 to 15
   //In order to inject fault in redundant column for Bit 16 to 31, column address
   //should have value in range of 0 to 7
      input [10:0] address;
      input [4:0] bitPlace;
      input [1:0] fault_type;
      input [1:0] red_fault;
 
      integer i;
      reg done;
   begin
      done = 1'b0;
      i = 0;
      while ((!done) && i < 127)
      begin
         fault_entry = fault_table[i];
         if (fault_entry[0] === 1'b0 || fault_entry[0] === 1'bx)
         begin
            fault_entry[0] = 1'b1;
            fault_entry[2:1] = red_fault;
            fault_entry[4:3] = fault_type;
            fault_entry[9:5] = bitPlace;
            fault_entry[20:10] = address;
            fault_table[i] = fault_entry;
            done = 1'b1;
         end
         i = i+1;
      end
   end
   endtask
//This task removes all fault entries injected by user
task remove_all_faults;
   integer i;
begin
   for (i = 0; i < 128; i=i+1)
   begin
      fault_entry = fault_table[i];
      fault_entry[0] = 1'b0;
      fault_table[i] = fault_entry;
   end
end
endtask
task bit_error;
// This task is used to inject error in memory and should be called
// only from current module.
//
// This task injects error depending upon fault type to particular bit
// of the output
   inout [31:0] q_int;
   input [1:0] fault_type;
   input [4:0] bitLoc;
begin
   if (fault_type === 2'd0)
      q_int[bitLoc] = 1'b0;
   else if (fault_type === 2'd1)
      q_int[bitLoc] = 1'b1;
   else
      q_int[bitLoc] = ~q_int[bitLoc];
end
endtask
task error_injection_on_output;
// This function goes through error injection table for every
// read cycle and corrupts Q output if fault for the particular
// address is present in fault table
//
// If fault is redundant column is detected, this task corrupts
// Q output in read cycle
//
// If fault is repaired using repair bus, this task does not
// courrpt Q output in read cycle
//
   output [31:0] Q_output;
   reg list_complete;
   integer i;
   reg [6:0] row_address;
   reg [3:0] column_address;
   reg [4:0] bitPlace;
   reg [1:0] fault_type;
   reg [1:0] red_fault;
   reg valid;
   reg [3:0] msb_bit_calc;
begin
   entry_found = 1'b0;
   list_complete = 1'b0;
   i = 0;
   Q_output = Q_in;
   while(!list_complete)
   begin
      fault_entry = fault_table[i];
      {row_address, column_address, bitPlace, fault_type, red_fault, valid} = fault_entry;
      i = i + 1;
      if (valid == 1'b1)
      begin
         if (red_fault === NO_RED_FAULT)
         begin
            if (row_address == A[10:4] && column_address == A[3:0])
            begin
               if (bitPlace < 16)
                  bit_error(Q_output,fault_type, bitPlace);
               else if (bitPlace >= 16 )
                  bit_error(Q_output,fault_type, bitPlace);
            end
         end
      end
      else
         list_complete = 1'b1;
      end
   end
   endtask
   always @ (Q_in or CLK or A or CEN or WEN or GWEN)
   begin
   if (CEN === 1'b0 && DFTRAMBYP === 1'b0 && SE === 1'b0)
      error_injection_on_output(Q_out);
   else
      Q_out = Q_in;
   end
endmodule
