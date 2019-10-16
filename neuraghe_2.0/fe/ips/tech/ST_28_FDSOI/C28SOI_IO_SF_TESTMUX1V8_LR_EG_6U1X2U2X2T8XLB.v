//---------------------------------------------------------------------------
// 
//                  	 STMicroelectronics NOIDA
// 
//                       	  LIBRARY GROUP
// 
//---------------------------------------------------------------------------
// 
//---------------------------------------------------------------------------
// 
// VERILOG_LD for the CMOS032LP library C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB
//              			(release d3.2beta1a)
// 
//
//---------------------------------------------------------------------------
// 
// Date          : Jun 2010
// 
// Copyright     : STMicroelectronics N.V. 1998-2006
//                 All rights reserved. Reproduction
//                 in whole or part is prohibited
//                 without the written consent of the
//                 copyright holder.
// 
// Address      : STMicroelectronics
//
//---------------------------------------------------------------------------
// STMicroelectronics RESERVES THE RIGHTS TO MAKE CHANGES WITHOUT 
// NOTICE AT ANY TIME. STMicroelectronics MAKES NO WARRANTY,
// EXPRESSED, IMPLIED OR STATUTARY, INCLUDING BUT NOT LIMITED TO ANY IMPLIED
// WARRANTY OR MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE,
// OR THAT THE USE WILL NOT INFRINGE ANY THIRD PARTY PATENT,
// COPYRIGHT OR TRADEMARK. STMicroelectronics SHALL NOT BE LIABLE 
// FOR ANY LOSS OR DAMAGE ARISING FROM THE USE OF ITS LIBRARIES OR
// SOFTWARE.
//---------------------------------------------------------------------------
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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD2SCARUDQPCH_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
    	tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    	and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    	not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;

	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end

`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_1,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_0,BD2SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD2SCARUDQPCH_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD2SCARUDQPCH_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_1,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_0,BD2SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD2SCARUDQPCH_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD2SCARUDQPCL_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_1,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_0,BD2SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD2SCARUDQPCL_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD2SCARUDQPCL_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_1,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_0,BD2SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD2SCARUDQPCL_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD2SCARUDQPCZ_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U32 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
	
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_1,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_0,BD2SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD2SCARUDQPCZ_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD2SCARUDQPCZ_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_1,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_0,BD2SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD2SCARUDQPCZ_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD4SCARUDQPCH_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_1,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_0,BD4SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD4SCARUDQPCH_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD4SCARUDQPCH_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_1,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_0,BD4SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD4SCARUDQPCH_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD4SCARUDQPCL_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_1,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_0,BD4SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD4SCARUDQPCL_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD4SCARUDQPCL_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_1,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_0,BD4SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD4SCARUDQPCL_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_A_R_IO_R_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_A_R_IO_R_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TA_R_IO_R_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TA_R_IO_R_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_R_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_R_1,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_R_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_R_IO_R_0,BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD4SCARUDQPCZ_IL_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_A_R_IO_R_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_A_R_IO_R_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TA_R_IO_R_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TA_R_IO_R_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_R_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_R_1,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_R_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_R_IO_R_0,BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD4SCARUDQPCZ_IL_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD4SCARUDQPCZ_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_1,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_0,BD4SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD4SCARUDQPCZ_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD4SCARUDQPCZ_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_1,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_0,BD4SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD4SCARUDQPCZ_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD6SCARUDQPCH_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_1,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_0,BD6SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD6SCARUDQPCH_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD6SCARUDQPCH_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_1,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_0,BD6SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD6SCARUDQPCH_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD6SCARUDQPCL_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_1,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_0,BD6SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD6SCARUDQPCL_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD6SCARUDQPCL_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_1,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_0,BD6SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD6SCARUDQPCL_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD6SCARUDQPCZ_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_1,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_0,BD6SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD6SCARUDQPCZ_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD6SCARUDQPCZ_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_1,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_0,BD6SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD6SCARUDQPCZ_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD8SCARUDQPCH_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_A_R_IO_R_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_TA_R_IO_R_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_1,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_R_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_R_IO_R_0,BD8SCARUDQPCH_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD8SCARUDQPCH_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD8SCARUDQPCH_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_A_R_IO_R_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_TA_R_IO_R_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_1,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_R_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_R_IO_R_0,BD8SCARUDQPCH_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD8SCARUDQPCH_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD8SCARUDQPCL_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_A_R_IO_R_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_TA_R_IO_R_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_1,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_R_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_R_IO_R_0,BD8SCARUDQPCL_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD8SCARUDQPCL_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD8SCARUDQPCL_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_A_R_IO_R_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_TA_R_IO_R_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_1,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_R_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_R_IO_R_0,BD8SCARUDQPCL_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD8SCARUDQPCL_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD8SCARUDQPCZ_SF_1V8_CL_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_A_R_IO_R_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZH_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_R_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_IO_R_ZI_R_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_TA_R_IO_R_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZH_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_R_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_1,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZH_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZH_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_R_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_R_IO_R_0,BD8SCARUDQPCZ_SF_1V8_CL_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD8SCARUDQPCZ_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module BD8SCARUDQPCZ_SF_1V8_FC_LIN (ZI, A, EN, TA, TEN, TM, PUN, PDN, PUN15K, HYST, LOWEMI, IO);

	output ZI;
	input A;
	input EN;
	input TA;
	input TEN;
	input TM;
	input PUN;
	input PDN;
	input PUN15K;
	input HYST;
	input LOWEMI;
	inout IO;


parameter message_control_time = `st_msg_cntrl_time;

reg [1:0] debug_level;

`ifdef ST_ALL_MSG_MODE
	parameter p_debug_level = 2'b11;
`elsif ST_ERROR_ONLY_MODE
	parameter p_debug_level = 2'b01;
`elsif ST_NO_MSG_MODE
	parameter p_debug_level = 2'b00;
`else
	parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
`endif

initial
begin
debug_level= p_debug_level ;
end

initial
begin
$timeformat(-9,6," ns --",10);
end
	reg msg_flag;
initial
begin
msg_flag=1'b0;
# (message_control_time)
if($realtime >= message_control_time)
msg_flag=1'b1;
end

	tri1  INTERNAL1SOURCE;
	tri0  INTERNAL2SOURCE;
	tri1  INTERNAL3SOURCE;	
	
    tri  IOprevious;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U1 (inputa, A, TA, TM) ;
	C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2   U2 (inputen, EN, TEN, TM) ;
		bufif0    U3 (IOprevious, inputa, inputen) ;

	not U21 (PUN_n, PUN);
	not U22 (PDN_n, PDN);
	not U52 (PUN15K_n, PUN15K);

	or  U13 (PU_en, PDN_n, PUN);
	or  U14 (PD_en, PDN, PUN_n);
	or  U94 (PUN15K_en, PDN_n, PUN_n, PUN15K);
	or  U25 (BK_en, PUN, PDN, PUN15K_n);

	not U26 (IO_n, IO);
	not (pull0,pull1) #(`st_delay_seq) U27 (IO_p, IO_n);
	pmos    U4 (IOprevious, IO_p, BK_en) ;
	pmos    U41 (IOprevious, INTERNAL1SOURCE, PU_en) ;
	pmos    U5 (IOprevious, INTERNAL2SOURCE, PD_en) ;
	pmos    U6 (IOprevious, INTERNAL3SOURCE, PUN15K_en) ;
    and U64 (for_forbid, PUN, PDN_n) ;
	or		U11 (no_pull, for_forbid, PUN_n) ;
    not   U91 (no_pull_n, no_pull) ;
	or		U12 (forbid, no_pull_n, PUN15K) ;
	bufif0  U_B (IOprevious, 1'bx, forbid) ;


	// Initial Check for Critical Pins 

	initial
	begin
	# (message_control_time)
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin HYST is not properly connected", $realtime);
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : Pin LOWEMI is not properly connected", $realtime);
	end

	// Always Check for Critical Pins 

	always@(*)
	begin
	  if(((HYST===1'bx) || (HYST===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : HYST is not connected properly", $realtime);

	  if ((HYST===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : Hysteresis is enabled ", $realtime);
	end

	always@(*)
	begin
	  if(((LOWEMI===1'bx) || (LOWEMI===1'bz))&&(debug_level>0) &&  msg_flag)
	    $display ("%m - %t ST_ERROR : LOWEMI is not connected properly", $realtime);

	  if ((LOWEMI===1'b0)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Disabled ", $realtime);
	  else if ((LOWEMI===1'b1)&&(debug_level>2) &&  msg_flag)
	    $display ("%m - %t ST_INFO : LOWEMI Enabled ", $realtime);
	end
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	
	always@(*)
	begin
	if ((PUN===1'b1)&&(PDN===1'b0)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
	
	always@(*)
	begin
	if ((PUN===1'b0)&&(PDN===1'b1)&&(PUN15K===1'b0))
	$display ("%m - %t ST_ERROR : Pull circuit is in forbidden mode & the logic at pad will be corrupted", $realtime);
	end
`ifdef functional
	nmos   #(`st_delay_seq) U7 (IO, IOprevious, 1'b1) ;
	buf   #(`st_delay_seq) U8 (ZI, IO) ;
`else
	nmos    U7_1 (IO, IOprevious, 1'b1) ;
	buf    U8_1 (ZI, IO) ;

	specify
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_1 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_0 = `st_delay_seq;
 		specparam BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_0 = `st_delay_seq;

		if (!EN && LOWEMI && !TM) (A +=> IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_1);
		if (!EN && !LOWEMI && !TM) (A +=> IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_A_R_IO_R_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_A_F_IO_F_0);
		if (LOWEMI && !TM) (EN => IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_1);
		if (!LOWEMI && !TM) (EN => IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZH_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_R_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_EN_F_IO_ZL_0);
		if (HYST) (IO +=> ZI) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_1);
		if (!HYST) (IO +=> ZI) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_IO_R_ZI_R_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_IO_F_ZI_F_0);
		if (LOWEMI && !TEN && TM) (TA +=> IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_1);
		if (!LOWEMI && !TEN && TM) (TA +=> IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_TA_R_IO_R_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TA_F_IO_F_0);
		if (LOWEMI && TM) (TEN => IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_1);
		if (!LOWEMI && TM) (TEN => IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZH_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_R_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TEN_F_IO_ZL_0);
		if (!EN && LOWEMI && TEN) (TM => IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_1);
		if (EN && LOWEMI && !TEN) (TM => IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_1);
		if (A && !EN && LOWEMI && !TA && !TEN) (TM -=> IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_1);
		if (!A && !EN && LOWEMI && TA && !TEN) (TM +=> IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_1,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_1);
		if (!EN && !LOWEMI && TEN) (TM => IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZH_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_ZL_0);
		if (EN && !LOWEMI && !TEN) (TM => IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_LZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZH_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_HZ_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_ZL_0);
		if (A && !EN && !LOWEMI && !TA && !TEN) (TM -=> IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_R_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_F_0);
		if (!A && !EN && !LOWEMI && TA && !TEN) (TM +=> IO) = (BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_R_IO_R_0,BD8SCARUDQPCZ_SF_1V8_FC_LIN_TM_F_IO_F_0);


	endspecify

`endif

endmodule // BD8SCARUDQPCZ_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module WIREPAD_SF_1V8_CL_LIN (ANAZI, ANAIO, ANAIOPAD);
	inout ANAZI;
	inout ANAIO;
	inout ANAIOPAD;

/*****************************************************


NOTE: Default modeling reflects bidirectional behavior of the cell and is compatible in verilog environment
      To run the mixed simulation with VHDL the user needs to use the compiler directive ana_mixvhdl. 
      In this case the cell is modeled unidirectional and the direction can be controlled by switches as per need. .
 	To pass the signal from PAD to CORE -> parameter pad_to_core should be high and other should be low
 	To Pass the Signal from CORE1 to PAD -> parameter core1_to_pad should be high and other should be low
 	To Pass the Signal from CORE2 to PAD -> parameter core2_to_pad should be high and other should be low
 
 User can also select the path by testbnch using internal signals (control1, control2, control3) 
		

******************************************************/

`ifdef ana_mixvhdl

parameter pad_to_core = 1'b1;
parameter core1_to_pad = 1'b0;
parameter core2_to_pad = 1'b0;


reg control1 ; 
reg control2 ;
reg control3 ;

initial
begin 
control1 = pad_to_core;
control2 = core1_to_pad;
control3 = core2_to_pad;
end


nmos U4 (ANAZI, ANAIO, control3);
nmos U5 (ANAIOPAD, ANAIO, control3);
nmos U6 (ANAIO, ANAZI, control2);
nmos U7 (ANAIOPAD, ANAZI, control2);
nmos U8 (ANAZI, ANAIOPAD, control1);
nmos U9 (ANAIO, ANAIOPAD, control1);

`else 
   tran U1 (ANAIOPAD, ANAIO) ;
   tran U2 (ANAIOPAD, ANAZI) ;

`endif  

endmodule // WIREPAD_SF_1V8_CL_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module WIREPAD_SF_1V8_FC_LIN (ANAZI, ANAIO, ANAIOPAD);
	inout ANAZI;
	inout ANAIO;
	inout ANAIOPAD;

/*****************************************************

NOTE: Default modeling reflects bidirectional behavior of the cell and is compatible in verilog environment
      To run the mixed simulation with VHDL the user needs to use the compiler directive ana_mixvhdl. 
      In this case the cell is modeled unidirectional and the direction can be controlled by switches as per need. .
 	To pass the signal from PAD to CORE -> parameter pad_to_core should be high and other should be low
 	To Pass the Signal from CORE1 to PAD -> parameter core1_to_pad should be high and other should be low
 	To Pass the Signal from CORE2 to PAD -> parameter core2_to_pad should be high and other should be low
 
 User can also select the path by testbnch using internal signals (control1, control2, control3) 
		

******************************************************/

`ifdef ana_mixvhdl

parameter pad_to_core = 1'b1;
parameter core1_to_pad = 1'b0;
parameter core2_to_pad = 1'b0;


reg control1 ; 
reg control2 ;
reg control3 ;

initial
begin 
control1 = pad_to_core;
control2 = core1_to_pad;
control3 = core2_to_pad;
end


nmos U4 (ANAZI, ANAIO, control3);
nmos U5 (ANAIOPAD, ANAIO, control3);
nmos U6 (ANAIO, ANAZI, control2);
nmos U7 (ANAIOPAD, ANAZI, control2);
nmos U8 (ANAZI, ANAIOPAD, control1);
nmos U9 (ANAIO, ANAIOPAD, control1);

`else 
   tran U1 (ANAIOPAD, ANAIO) ;
   tran U2 (ANAIOPAD, ANAZI) ;

`endif  

endmodule // WIREPAD_SF_1V8_FC_LIN
`endcelldefine



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
`ifdef ST_MSG_CONTROL_TIME
  `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
	`define st_msg_cntrl_time 0.001
`endif
`ifdef ST_DELAY_SEQ
	`define st_delay_seq `ST_DELAY_SEQ
`else
	`define st_delay_seq 0.001
`endif

module WIREPAD_SF_1V8_FC_LIN_PHY (ANAZI, ANAIO, ANAIOPAD);
	inout ANAZI;
	inout ANAIO;
	inout ANAIOPAD;

/*****************************************************

NOTE: Default modeling reflects bidirectional behavior of the cell and is compatible in verilog environment
      To run the mixed simulation with VHDL the user needs to use the compiler directive ana_mixvhdl. 
      In this case the cell is modeled unidirectional and the direction can be controlled by switches as per need. .
 	To pass the signal from PAD to CORE -> parameter pad_to_core should be high and other should be low
 	To Pass the Signal from CORE1 to PAD -> parameter core1_to_pad should be high and other should be low
 	To Pass the Signal from CORE2 to PAD -> parameter core2_to_pad should be high and other should be low
 
 User can also select the path by testbnch using internal signals (control1, control2, control3) 
		

******************************************************/

`ifdef ana_mixvhdl

parameter pad_to_core = 1'b1;
parameter core1_to_pad = 1'b0;
parameter core2_to_pad = 1'b0;


reg control1 ; 
reg control2 ;
reg control3 ;

initial
begin 
control1 = pad_to_core;
control2 = core1_to_pad;
control3 = core2_to_pad;
end


nmos U4 (ANAZI, ANAIO, control3);
nmos U5 (ANAIOPAD, ANAIO, control3);
nmos U6 (ANAIO, ANAZI, control2);
nmos U7 (ANAIOPAD, ANAZI, control2);
nmos U8 (ANAZI, ANAIOPAD, control1);
nmos U9 (ANAIO, ANAIOPAD, control1);

`else 
   tran U1 (ANAIOPAD, ANAIO) ;
   tran U2 (ANAIOPAD, ANAZI) ;

`endif  

endmodule // WIREPAD_SF_1V8_FC_LIN_PHY
`endcelldefine


primitive C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB_U_MUX2 (Z, A, B, S);
	output Z;
	input  A, B, S;

	table
	//A	B	S	 : Z
	 0	?	0 : 	 0 ;
	 1	?	0 : 	 1 ;
	 ?	0	1 : 	 0 ;
	 ?	1	1 : 	 1 ;
	 0	0	X : 	 0 ;
	 1	1	X : 	 1 ;

	endtable

endprimitive
