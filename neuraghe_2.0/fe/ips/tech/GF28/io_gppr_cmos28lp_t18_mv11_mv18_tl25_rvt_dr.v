//
//
//
//      CONFIDENTIAL  AND  PROPRIETARY SOFTWARE OF ARM INC.
//      
//      Copyright (c) 1993-2010  ARM Inc.  All  Rights Reserved.
//      
//      Use of this Software is subject to the terms and conditions  of the
//      applicable license agreement with ARM Inc.  In addition,
//      this Software is protected by patents, copyright law and international
//      treaties.
//      
//      The copyright notice(s) in this Software does not indicate actual or
//      intended publication of this Software.
//      
//
//      Modeling Assumptions: This model supports full gate level simulation
//          including proper x-handling and timing check behavior.  Unit
//          delay timing is included in the model. Back-annotation of SDF
//          (v3.0) is supported.  SDF can be created utilyzing the delay
//          calculation views provided with this generator and supported
//          delay calculators.  All ports are padded with Verilog   
//          primitives.
//
//      Modeling Limitations: None.
//
//      Known Bugs: None.
//
//      Known Work Arounds: N/A
//

`timescale 1ns/1ps
`define ARM_PROP_IODELAY 	 1.000		//Delay definitions; Default is 1ns
`define PULL				 200.000	//Pull delay; Default is 200ns
`define ARM_IO_INVALID_DELAY 100.000

`celldefine 
`ifdef POWER_PINS 
module PBIDIR_18_18_NT_DR (
		PO,
		Y,
		DVDD,
		DVSS,
		PAD,
		VDD,
		VSS,
		A,
		DS0,
		DS1,
		IE,
		IS,
		OE,
		PE,
		POE,
		PS,
		RTO,
		SNS,
		SR
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PBIDIR_18_18_NT_DR (
		PO,
		Y,
		PAD,
		A,
		DS0,
		DS1,
		IE,
		IS,
		OE,
		PE,
		POE,
		PS,
		RTO,
		SNS,
		SR
 );

`endif

   inout PAD;
   output Y;
   output PO;
   input A;
   input OE;
   input DS0;
   input DS1;
   input SR;
   input PS;
   input PE;
   input IE;
   input IS;
   input POE;
   input RTO;
   input SNS;

   tri PAD;
   tri P_i;
   wire PU;
   wire PD;
   wire A_LAT;
   wire PS_LAT;
   wire PE_LAT;
   wire OE_LAT;
   wire IE_LAT;
   wire PAD_reg;
   wire PO_reg;
   wire Y_reg;
   wire DVDD_wire;
   wire PAD_out;
   wire PO_out;
   wire EN_pwr;
   wire Y_out;
   reg NOTIFIER;
   reg PU_EN;
   reg PD_EN;
   
   supply0 su0;
   supply1 su1;

   `ifdef POWER_PINS
      assign DVDD_wire = DVDD;
   `else
      assign DVDD_wire = 1'b1;
   `endif
   //latches for A, DS0, DS1,SR, OE & IE
   udp_lat_rto ua(A_LAT, DVDD_wire, A, RTO, NOTIFIER);
   udp_lat_rto up(PS_LAT, DVDD_wire, PS, RTO, NOTIFIER);
   udp_lat_rto ue(PE_LAT, DVDD_wire, PE, RTO, NOTIFIER);
   udp_lat_rto uo(OE_LAT, DVDD_wire, OE, RTO, NOTIFIER);
   udp_lat_rto ui(IE_LAT, DVDD_wire, IE, RTO, NOTIFIER);
   //Pull UP/DOWN logic
   and u0 (DRV_EN, OE_LAT, SNS);
   not u1 (OEN_LAT, OE_LAT);
   not u2 (PSN_LAT, PS_LAT);
   and I2 (PU, PE_LAT, PS_LAT,  OEN_LAT, SNS);
   and I3 (PD, PE_LAT, PSN_LAT, OEN_LAT, SNS);
   rnmos  u4(P_i, su1, PU_EN);
   rnmos  u5(P_i, su0, PD_EN);
   bufif1 u6(P_i, A_LAT, DRV_EN);

   //logic for driver & receiver
   nmos    u7(PAD_reg, P_i, 1'b1);
   and     u8(Y_reg, PAD, IE_LAT, SNS);
   nand    u9(PO_reg, POE, Y, RTO);
   assign EN_pwr  = DVDD_wire && !(RTO === 1'bx || RTO === 1'bz)
                         && !(SNS === 1'bx || SNS === 1'bz);
   //assign PAD_out = (EN_pwr) ? PAD_reg : 1'bx;
   nmos u11(PAD_out, PAD_reg, EN_pwr);
   nmos u12(PAD_out, 1'bx, !EN_pwr);
   assign PO_out  = (EN_pwr && SNS) ? PO_reg : 1'bx;
   assign Y_out   = (EN_pwr) ? Y_reg : 1'bx;
   nmos ux(PAD, PAD_out, 1'b1);
   nmos uy(PO, PO_out, 1'b1);
   nmos uz(Y, Y_out, 1'b1);

   always @(PU)
   begin
	   if (PU===1 && PAD!==1 && SNS===1 && RTO===1) 
		   PU_EN <= #(`PULL) PU;
	   else if (PU===0 && DRV_EN===0 && SNS===1 && RTO===1) 
		   PU_EN <= #(`PULL) PU;
	   else 
		   PU_EN <= PU;
   end	

   always @(PD)
   begin
	   if (PD===1 && PAD!==0 && SNS===1 && RTO===1) 
		   PD_EN <= #(`PULL) PD;
	   else if (PD===0 && DRV_EN===0 && SNS===1 && RTO===1) 
		   PD_EN <= #(`PULL) PD;
	   else 
		   PD_EN <= PD;
   end	
	


specify
if (DS0==1'b0 && DS1==1'b0 && SR==1'b0)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b0 && SR==1'b1)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b1 && SR==1'b0)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b1 && SR==1'b1)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b0 && SR==1'b0)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b0 && SR==1'b1)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b1 && SR==1'b0)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b1 && SR==1'b1)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(IE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(IE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(PAD => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(PAD => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(POE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(POE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(IE => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(IE => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(PAD => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(PAD => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b0 && SR==1'b0)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b0 && SR==1'b1)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b1 && SR==1'b0)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b1 && SR==1'b1)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b0 && SR==1'b0)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b0 && SR==1'b1)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b1 && SR==1'b0)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b1 && SR==1'b1)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);

endspecify
endmodule // PBIDIR_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PBIDIR_18_25_T_DR (
		PO,
		Y,
		DVDD,
		DVSS,
		PAD,
		VDD,
		VSS,
		A,
		DS0,
		DS1,
		IE,
		IS,
		OE,
		PE,
		POE,
		PS,
		RTO,
		SNS,
		SR
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PBIDIR_18_25_T_DR (
		PO,
		Y,
		PAD,
		A,
		DS0,
		DS1,
		IE,
		IS,
		OE,
		PE,
		POE,
		PS,
		RTO,
		SNS,
		SR
 );

`endif

   inout PAD;
   output Y;
   output PO;
   input A;
   input OE;
   input DS0;
   input DS1;
   input SR;
   input PS;
   input PE;
   input IE;
   input IS;
   input POE;
   input RTO;
   input SNS;

   tri PAD;
   tri P_i;
   wire PU;
   wire PD;
   wire A_LAT;
   wire PS_LAT;
   wire PE_LAT;
   wire OE_LAT;
   wire IE_LAT;
   wire PAD_reg;
   wire PO_reg;
   wire Y_reg;
   wire DVDD_wire;
   wire PAD_out;
   wire PO_out;
   wire EN_pwr;
   wire Y_out;
   reg NOTIFIER;
   reg PU_EN;
   reg PD_EN;
   
   supply0 su0;
   supply1 su1;

   `ifdef POWER_PINS
      assign DVDD_wire = DVDD;
   `else
      assign DVDD_wire = 1'b1;
   `endif
   //latches for A, DS0, DS1,SR, OE & IE
   udp_lat_rto ua(A_LAT, DVDD_wire, A, RTO, NOTIFIER);
   udp_lat_rto up(PS_LAT, DVDD_wire, PS, RTO, NOTIFIER);
   udp_lat_rto ue(PE_LAT, DVDD_wire, PE, RTO, NOTIFIER);
   udp_lat_rto uo(OE_LAT, DVDD_wire, OE, RTO, NOTIFIER);
   udp_lat_rto ui(IE_LAT, DVDD_wire, IE, RTO, NOTIFIER);
   //Pull UP/DOWN logic
   and u0 (DRV_EN, OE_LAT, SNS);
   not u1 (OEN_LAT, OE_LAT);
   not u2 (PSN_LAT, PS_LAT);
   and I2 (PU, PE_LAT, PS_LAT,  OEN_LAT, SNS);
   and I3 (PD, PE_LAT, PSN_LAT, OEN_LAT, SNS);
   rnmos  u4(P_i, su1, PU_EN);
   rnmos  u5(P_i, su0, PD_EN);
   bufif1 u6(P_i, A_LAT, DRV_EN);

   //logic for driver & receiver
   nmos    u7(PAD_reg, P_i, 1'b1);
   and     u8(Y_reg, PAD, IE_LAT, SNS);
   nand    u9(PO_reg, POE, Y, RTO);
   assign EN_pwr  = DVDD_wire && !(RTO === 1'bx || RTO === 1'bz)
                         && !(SNS === 1'bx || SNS === 1'bz);
   //assign PAD_out = (EN_pwr) ? PAD_reg : 1'bx;
   nmos u11(PAD_out, PAD_reg, EN_pwr);
   nmos u12(PAD_out, 1'bx, !EN_pwr);
   assign PO_out  = (EN_pwr && SNS) ? PO_reg : 1'bx;
   assign Y_out   = (EN_pwr) ? Y_reg : 1'bx;
   nmos ux(PAD, PAD_out, 1'b1);
   nmos uy(PO, PO_out, 1'b1);
   nmos uz(Y, Y_out, 1'b1);

   always @(PU)
   begin
	   if (PU===1 && PAD!==1 && SNS===1 && RTO===1) 
		   PU_EN <= #(`PULL) PU;
	   else if (PU===0 && DRV_EN===0 && SNS===1 && RTO===1) 
		   PU_EN <= #(`PULL) PU;
	   else 
		   PU_EN <= PU;
   end	

   always @(PD)
   begin
	   if (PD===1 && PAD!==0 && SNS===1 && RTO===1) 
		   PD_EN <= #(`PULL) PD;
	   else if (PD===0 && DRV_EN===0 && SNS===1 && RTO===1) 
		   PD_EN <= #(`PULL) PD;
	   else 
		   PD_EN <= PD;
   end	
	


specify
if (DS0==1'b0 && DS1==1'b0 && SR==1'b0)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b0 && SR==1'b1)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b1 && SR==1'b0)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b1 && SR==1'b1)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b0 && SR==1'b0)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b0 && SR==1'b1)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b1 && SR==1'b0)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b1 && SR==1'b1)
(A => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(IE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(IE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(PAD => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(PAD => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(POE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(POE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(IE => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(IE => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(PAD => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(PAD => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b0 && SR==1'b0)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b0 && SR==1'b1)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b1 && SR==1'b0)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b0 && DS1==1'b1 && SR==1'b1)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b0 && SR==1'b0)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b0 && SR==1'b1)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b1 && SR==1'b0)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (DS0==1'b1 && DS1==1'b1 && SR==1'b1)
( OE => PAD ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);

endspecify
endmodule // PBIDIR_18_25_T_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PINC_18_25_T_DR (
		PO,
		Y,
		DVDD,
		DVSS,
		PAD,
		VDD,
		VSS,
		IE,
		IS,
		PE,
		POE,
		PS,
		RTO,
		SNS
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PINC_18_25_T_DR (
		PO,
		Y,
		PAD,
		IE,
		IS,
		PE,
		POE,
		PS,
		RTO,
		SNS
 );

`endif

   inout PAD;
   output Y;
   output PO;
   input PS;
   input PE;
   input IE;
   input IS;
   input POE;
   input RTO;
   input SNS;

   tri PAD;
   tri P_i;
   wire PU;
   wire PD;
   wire PO_reg;
   wire Y_reg;
   wire DVDD_wire;
   wire PO_out;
   wire PAD_out;
   wire EN_pwr;
   wire Y_out;
   reg PU_EN;
   reg PD_EN;

   supply0 su0;
   supply1 su1;
   supply0 DRV_EN;
   
   //primitive for output enable
   `ifdef POWER_PINS
      assign DVDD_wire = DVDD;
   `else
      assign DVDD_wire = 1'b1;
   `endif
   //Pull UP/DOWN logic
   not    u1(PSN, PS);
   and    u2(PU, PE, PS);
   and    u3(PD, PE, PSN);
   bufif1 u6(P_i, 1'b1, DRV_EN);
   rnmos  u4(P_i, su1, PU_EN);
   rnmos  u5(P_i, su0, PD_EN);

   //logic for  receiver
   and     u8(Y_reg, PAD, IE);
   nand    u9(PO_reg, POE, Y);
   assign EN_pwr  = DVDD_wire;
   nmos u11(PAD_out, P_i ,EN_pwr);
   nmos u12(PAD_out, 1'bx, !EN_pwr);
   assign PO_out  = (EN_pwr) ? PO_reg : 1'bx;
   assign Y_out   = (EN_pwr) ? Y_reg : 1'bx;
   nmos ux(PAD, PAD_out, 1'b1);
   nmos uy(PO, PO_out, 1'b1);
   nmos uz(Y, Y_out, 1'b1);

   always @(PU)
   begin
	   if (PU===1 && PAD!==1) 
		   PU_EN <= #(`PULL) PU;
	   else if (PU===0 && DRV_EN===0) 
		   PU_EN <= #(`PULL) PU;
	   else 
		   PU_EN <= PU;
   end	

   always @(PD)
   begin
	   if (PD===1 && PAD!==0) 
		   PD_EN <= #(`PULL) PD;
	   else if (PD===0 && DRV_EN===0) 
		   PD_EN <= #(`PULL) PD;
	   else 
		   PD_EN <= PD;
   end	



specify
if (IS==1'b0)
(IE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(IE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(PAD => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(PAD => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(POE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(POE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(IE => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(IE => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b0)
(PAD => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (IS==1'b1)
(PAD => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);

endspecify
endmodule // PINC_18_25_T_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module POSC1_18_18_NT_DR (
		CK,
		CK3,
		PADO,
		PO,
		DVDD,
		DVSS,
		VDD,
		VSS,
		E0,
		E1,
		PADI,
		POE,
		RTO,
		SNS,
		SP0,
		SP1
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module POSC1_18_18_NT_DR (
		CK,
		CK3,
		PADO,
		PO,
		E0,
		E1,
		PADI,
		POE,
		RTO,
		SNS,
		SP0,
		SP1
 );

`endif

   output CK;
   output CK3;
   output PO;
   output PADO;
   input PADI;
   input E0;
   input E1;
   input SP0;
   input SP1;
   input SNS;
   input RTO;
   input POE;

   wire E0_LAT;
   wire E1_LAT;
   //wire SP0_LAT;
   //wire SP1_LAT;
   wire E0_EN;
   wire PADO_reg;
   wire PO_reg;
   wire DVDD_wire;
   reg NOTIFIER;

   `ifdef POWER_PINS
      assign DVDD_wire = DVDD;
   `else
      assign DVDD_wire = 1'b1;
   `endif
   udp_lat_rto u1(E0_LAT, DVDD_wire, E0, RTO, NOTIFIER);
   udp_lat_rto u2(E1_LAT, DVDD_wire, E1, RTO, NOTIFIER);
   //udp_lat_rto u3(SP0_LAT, DVDD_wire, SP0, RTO, NOTIFIER);
   //udp_lat_rto u4(SP1_LAT, DVDD_wire, SP1, RTO, NOTIFIER);
   and     u5(CK_reg, PADI, E1_LAT);
   nand    u6(PO_reg, POE, CK, RTO);
   notif1  u7(PADO_reg, PADI, E0_EN);
   and     u8(E0_EN, SNS, E0_LAT);
   wire PADO_out;
   wire PO_out;
   wire CK_out;
   wire CK3_out;
   wire EN_pwr;
   assign EN_pwr  = DVDD_wire && !(RTO === 1'bx || RTO === 1'bz)
                             && !(SNS === 1'bx || SNS === 1'bz);
   assign PADO_out = (EN_pwr) ? PADO_reg : 1'bx;
   assign CK_out = (EN_pwr && SNS) ? CK_reg : 1'bx;
   assign CK3_out = (EN_pwr) ? (SNS & CK_reg) : 1'bx;
   assign PO_out = (EN_pwr && SNS) ? PO_reg : 1'bx;
   nmos    ux(PADO, PADO_out, 1'b1);
   nmos    uy(PO, PO_out, 1'b1);
   nmos    uz(CK3, CK3_out, 1'b1);
   nmos   uz1(CK, CK_out, 1'b1);



specify
     	 specparam
     	 PATHPULSE$PADI$CK = (0,0),
     	 PATHPULSE$PADI$CK3 = (0,0);
(E1 => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0)
(PADI => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1)
(PADI => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(E1 => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0)
(PADI => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1)
(PADI => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PADI => PADO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(E1 => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0)
(PADI => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1)
(PADI => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(POE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
( E0 => PADO ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);

endspecify
endmodule // POSC1_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module POSCP_18_18_NT_DR (
		CK,
		CK3,
		PADO,
		PO,
		DVDD,
		DVSS,
		VDD,
		VSS,
		E0,
		E1,
		PADI,
		POE,
		RTO,
		SF0,
		SF1,
		SNS,
		SP0,
		SP1
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module POSCP_18_18_NT_DR (
		CK,
		CK3,
		PADO,
		PO,
		E0,
		E1,
		PADI,
		POE,
		RTO,
		SF0,
		SF1,
		SNS,
		SP0,
		SP1
 );

`endif

   output CK3;
   output CK;
   output PO;
   output PADO;
   input PADI;
   input E0;
   input E1;
   input SF0;
   input SF1;
   input SP0;
   input SP1;
   input SNS;
   input RTO;
   input POE;

   wire E0_LAT;
   wire E1_LAT;
   //wire SF0_LAT;
   //wire SF1_LAT;
   //wire SP0_LAT;
   //wire SP1_LAT;
   wire E0_EN;
   wire PADO_reg;
   wire PO_reg;
   wire DVDD_wire;
   reg NOTIFIER;

   `ifdef POWER_PINS
      assign DVDD_wire = DVDD;
   `else
      assign DVDD_wire = 1'b1;
   `endif
   udp_lat_rto u1(E0_LAT, DVDD_wire, E0, RTO, NOTIFIER);
   udp_lat_rto u2(E1_LAT, DVDD_wire, E1, RTO, NOTIFIER);
   //udp_lat_rto u5(SP0_LAT, DVDD_wire, SP0, RTO, NOTIFIER);
   //udp_lat_rto u6(SP1_LAT, DVDD_wire, SP1, RTO, NOTIFIER);
   //udp_lat_rto u3(SF0_LAT, DVDD_wire, SF0, RTO, NOTIFIER);
   //udp_lat_rto u4(SF1_LAT, DVDD_wire, SF1, RTO, NOTIFIER);
   and     u7(CK_reg, PADI, E1_LAT);
   nand    u8(PO_reg, POE, CK, RTO);
   notif1  u9(PADO_reg, PADI, E0_EN);
   and     u10(E0_EN, SNS, E0_LAT);
   
   wire PADO_out;
   wire PO_out;
   wire CK_out;
   wire CK3_out;
   wire EN_pwr;
   assign EN_pwr  = DVDD_wire && !(RTO === 1'bx || RTO === 1'bz)
                             && !(SNS === 1'bx || SNS === 1'bz);
   assign PADO_out = (EN_pwr) ? PADO_reg : 1'bx;
   assign CK_out = (EN_pwr && SNS) ? CK_reg : 1'bx;
   assign CK3_out = (EN_pwr) ? (SNS & CK_reg) : 1'bx;
   assign PO_out = (EN_pwr && SNS) ? PO_reg : 1'bx;
   nmos    ux(PADO, PADO_out, 1'b1);
   nmos    uy(PO, PO_out, 1'b1);
   nmos    uz(CK3, CK3_out, 1'b1);
   nmos   uz1(CK, CK_out, 1'b1);



specify
     	 specparam
     	 PATHPULSE$PADI$CK = (0,0),
     	 PATHPULSE$PADI$CK3 = (0,0);
if (SF0==1'b0 && SF1==1'b0)
(E1 => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b0 && SF1==1'b1)
(E1 => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b1 && SF1==1'b0)
(E1 => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b1 && SF1==1'b1)
(E1 => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0 && SF0==1'b0 && SF1==1'b0)
(PADI => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0 && SF0==1'b0 && SF1==1'b1)
(PADI => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0 && SF0==1'b1 && SF1==1'b0)
(PADI => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0 && SF0==1'b1 && SF1==1'b1)
(PADI => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1 && SF0==1'b0 && SF1==1'b0)
(PADI => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1 && SF0==1'b0 && SF1==1'b1)
(PADI => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1 && SF0==1'b1 && SF1==1'b0)
(PADI => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1 && SF0==1'b1 && SF1==1'b1)
(PADI => CK) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b0 && SF1==1'b0)
(E1 => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b0 && SF1==1'b1)
(E1 => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b1 && SF1==1'b0)
(E1 => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b1 && SF1==1'b1)
(E1 => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0 && SF0==1'b0 && SF1==1'b0)
(PADI => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0 && SF0==1'b0 && SF1==1'b1)
(PADI => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0 && SF0==1'b1 && SF1==1'b0)
(PADI => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0 && SF0==1'b1 && SF1==1'b1)
(PADI => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1 && SF0==1'b0 && SF1==1'b0)
(PADI => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1 && SF0==1'b0 && SF1==1'b1)
(PADI => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1 && SF0==1'b1 && SF1==1'b0)
(PADI => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1 && SF0==1'b1 && SF1==1'b1)
(PADI => CK3) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b0 && SF1==1'b0)
(PADI => PADO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b0 && SF1==1'b1)
(PADI => PADO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b1 && SF1==1'b0)
(PADI => PADO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b1 && SF1==1'b1)
(PADI => PADO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b0 && SF1==1'b0)
(E1 => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b0 && SF1==1'b1)
(E1 => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b1 && SF1==1'b0)
(E1 => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b1 && SF1==1'b1)
(E1 => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0 && SF0==1'b0 && SF1==1'b0)
(PADI => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0 && SF0==1'b0 && SF1==1'b1)
(PADI => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0 && SF0==1'b1 && SF1==1'b0)
(PADI => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b0 && SF0==1'b1 && SF1==1'b1)
(PADI => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1 && SF0==1'b0 && SF1==1'b0)
(PADI => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1 && SF0==1'b0 && SF1==1'b1)
(PADI => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1 && SF0==1'b1 && SF1==1'b0)
(PADI => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (E0==1'b1 && SF0==1'b1 && SF1==1'b1)
(PADI => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(POE => PO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b0 && SF1==1'b0)
( E0 => PADO ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b0 && SF1==1'b1)
( E0 => PADO ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b1 && SF1==1'b0)
( E0 => PADO ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
if (SF0==1'b1 && SF1==1'b1)
( E0 => PADO ) = (`ARM_IO_INVALID_DELAY, `ARM_IO_INVALID_DELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);

endspecify
endmodule // POSCP_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PANALOG_18_18_NT_DR (
		AVDD,
		AVSS,
		PAD,
		PADC,
		PADR1,
		PADR2,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout AVDD, VDD;
inout AVSS, VSS;
`else
module PANALOG_18_18_NT_DR (
		PAD,
		PADC,
		PADR1,
		PADR2,
		RTO,
		SNS
 );

`endif

   inout PAD;
   inout PADC;
   inout PADR1;
   inout PADR2;
   input SNS;
   input RTO;

	//This is a tolerent library and AVDD affects o/p
	rnmos u11(PADR1,PAD,1'b1);
	rnmos u12(PAD,PADR1,1'b1);
	rnmos u21(PADR2,PAD,1'b1);
	rnmos u22(PAD,PADR2,1'b1);
	rnmos u31(PADC,PAD,1'b1);
	rnmos u32(PAD,PADC,1'b1);
	//power modeling
`ifdef POWER_PINS
	nmos  u13(PADR1,1'bx,!AVDD);
	nmos  u23(PADR2,1'bx,!AVDD);
	nmos  u33(PADC,1'bx,!AVDD);
	nmos  u34(PAD,1'bx,!AVDD);
`endif



specify
(PADC => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PADR1 => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PADR2 => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PAD => PADC) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PAD => PADR1) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PAD => PADR2) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);

endspecify
endmodule // PANALOG_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PAVDD_18_18_NT_DR (
		AVDD,
		AVSS,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout AVSS, VSS;
inout VDD, AVDD;
`else
module PAVDD_18_18_NT_DR (
		RTO,
		SNS
 );

`endif

   input SNS;
   input RTO;

specify

endspecify
endmodule // PAVDD_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PAVSS_18_18_NT_DR (
		AVDD,
		AVSS,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout AVDD, VDD;
inout VSS, AVSS;
`else
module PAVSS_18_18_NT_DR (
		RTO,
		SNS
 );

`endif

   input SNS;
   input RTO;

specify

endspecify
endmodule // PAVSS_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PANALOG_11_11_NT_DR (
		AVDD1V,
		AVSS1V,
		PAD,
		PADC,
		PADR1,
		PADR2,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout AVDD1V, VDD;
inout AVSS1V, VSS;
`else
module PANALOG_11_11_NT_DR (
		PAD,
		PADC,
		PADR1,
		PADR2,
		RTO,
		SNS
 );

`endif

   inout PAD;
   inout PADC;
   inout PADR1;
   inout PADR2;
   input SNS;
   input RTO;

	//This is a tolerent library and AVDD affects o/p
	rnmos u11(PADR1,PAD,1'b1);
	rnmos u12(PAD,PADR1,1'b1);
	rnmos u21(PADR2,PAD,1'b1);
	rnmos u22(PAD,PADR2,1'b1);
	rnmos u31(PADC,PAD,1'b1);
	rnmos u32(PAD,PADC,1'b1);
	//power modeling
`ifdef POWER_PINS
	nmos  u13(PADR1,1'bx,!AVDD1V);
	nmos  u23(PADR2,1'bx,!AVDD1V);
	nmos  u33(PADC,1'bx,!AVDD1V);
	nmos  u34(PAD,1'bx,!AVDD1V);
`endif



specify
(PADC => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PADR1 => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PADR2 => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PAD => PADC) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PAD => PADR1) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PAD => PADR2) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);

endspecify
endmodule // PANALOG_11_11_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PAVDD_11_11_NT_DR (
		AVDD1V,
		AVSS1V,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout AVSS1V, VSS;
inout VDD, AVDD1V;
`else
module PAVDD_11_11_NT_DR (
		RTO,
		SNS
 );

`endif

   input SNS;
   input RTO;

specify

endspecify
endmodule // PAVDD_11_11_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PAVSS_11_11_NT_DR (
		AVDD1V,
		AVSS1V,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout AVDD1V, VDD;
inout VSS, AVSS1V;
`else
module PAVSS_11_11_NT_DR (
		RTO,
		SNS
 );

`endif

   input SNS;
   input RTO;

specify

endspecify
endmodule // PAVSS_11_11_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PVSENSE_18_18_NT_DR (
		RTO,
		SNS,
		DVDD,
		DVSS,
		VDD,
		VSS,
		RETOFF,
		RETON
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PVSENSE_18_18_NT_DR (
		RTO,
		SNS,
		RETOFF,
		RETON
 );

`endif

    output RTO;
    output SNS;
    input RETON;
    input RETOFF;
	
	 reg RTO_reg;
	 reg SNS_reg;
	 
    reg DVDD_prev;
	 wire DVDD_wire;
	 wire VDD_wire;
	 
	 assign RTO = RTO_reg;
	 assign SNS = SNS_reg;
`ifdef POWER_PINS
   assign DVDD_wire = DVDD;
   assign VDD_wire = VDD;
	initial begin
		DVDD_prev = 1'b0;
		RTO_reg = 1'b0;
	end
`else
   assign DVDD_wire = 1'b1;
   assign VDD_wire = 1'b1;
	initial begin
		DVDD_prev = 1'b1;
		RTO_reg = 1'b1;
	end
`endif    
	always @(DVDD_wire or VDD_wire or RETON or RETOFF) 
	begin
		DVDD_prev <= DVDD_wire;
		if(DVDD_wire == 1'b0) begin
			RTO_reg <= 1'b0;
			SNS_reg <= 1'b0;
		end
		else if(DVDD_prev == 1'b0) begin
			if (RTO_reg == 1'b1) begin
				RTO_reg <= 1'bX;
				SNS_reg <= 1'bX;
			end
			else begin
				if(VDD_wire == 1'b0) begin
					RTO_reg <= 1'b1;
					SNS_reg <= 1'b0;
				end
				else if(RETON == 1'b0) begin
					RTO_reg <= 1'b1;
					SNS_reg <= 1'b1;
				end
				else begin
					RTO_reg <= 1'bX;
					SNS_reg <= 1'bX;
				end
			end
		end
		else if(VDD_wire == 1) begin
			if( RETON == 1'b0 && RETOFF == 1'b1) begin
				RTO_reg <= 1'b1;
				SNS_reg <= 1'b1;
			end 
			else if((RTO_reg === 1'b0 ||  RETON == 1'b1) && RETOFF == 1'b0) begin
				RTO_reg <= 1'b0;
				SNS_reg <= 1'b1;
			end
			else begin
				RTO_reg <= 1'bX;
				SNS_reg <= 1'bX;
			end
		end
		else begin
			if(RTO_reg === 1'b0) begin
				RTO_reg <= 1'b0;
				SNS_reg <= 1'b1;
			end
			else if(RTO_reg === 1'b1) begin
				RTO_reg <= 1'b1;
				SNS_reg <= 1'b0;
			end
		end
	end




specify
(RETOFF => RTO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(RETON => RTO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);

endspecify
endmodule // PVSENSE_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PEXTRET_18_25_T_DR (
		RTO,
		SNS,
		Y,
		DVDD,
		DVSS,
		VDD,
		VSS,
		PAD
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PEXTRET_18_25_T_DR (
		RTO,
		SNS,
		Y,
		PAD
 );

`endif

    output RTO;
    output SNS;
    output Y;
    input PAD;

`ifdef POWER_PINS
    assign RTO = (DVDD == 1'b1 ) ? PAD : 1'b0;
    assign SNS = (DVDD == 1'b1) ? 1'b1: 1'b0;
    assign Y   = (DVDD == 1'b1) ? ((VDD == 1'b1) ? PAD : 1'b0) :
	                          ((VDD == 1'b0) ? 1'b0 : 1'bx);
`else
    buf u0(RTO, PAD);
    buf u1(Y, PAD);
    buf u2(SNS, 1'b1);
`endif


specify
(PAD => RTO) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PAD => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);

endspecify
endmodule // PEXTRET_18_25_T_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PEXTFS_18_25_T_DR (
		RTO,
		SNS,
		Y,
		DVDD,
		DVSS,
		VDD,
		VSS,
		PAD
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PEXTFS_18_25_T_DR (
		RTO,
		SNS,
		Y,
		PAD
 );

`endif

    output RTO;
    output SNS;
    output Y;
    input PAD;
    
`ifdef POWER_PINS
    assign SNS = (DVDD == 1'b1) ? PAD : 1'b0;
    assign RTO = (DVDD == 1'b1) ? 1'b1: 1'b0;
    assign Y   = (DVDD == 1'b1) ? ((VDD == 1'b1) ? PAD : 1'b0) : 
	                          ((VDD == 1'b0) ? 1'b0 : 1'bx);
`else
    buf u0(SNS, PAD);
    buf u1(Y, PAD);
    buf u2(RTO, 1'b1);
`endif


specify
(PAD => SNS) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PAD => Y) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);

endspecify
endmodule // PEXTFS_18_25_T_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PDVDDTIE_18_18_NT_DR (
		RTO,
		SNS,
		DVDD,
		DVSS,
		VDD,
		VSS
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PDVDDTIE_18_18_NT_DR (
		RTO,
		SNS
 );

`endif

    output RTO;
    output SNS;
`ifdef POWER_PINS
    assign SNS = (DVDD == 1'b1) ? 1'b1 : 1'b0;
    assign RTO = (DVDD == 1'b1) ? 1'b1: 1'b0;
`else
    // Both sns and rto are tied high 
    buf (SNS, 1'b1);
    buf (RTO, 1'b1);
`endif


specify

endspecify
endmodule // PDVDDTIE_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PCORNER_18_18_NT_DR (
		DVDD,
		DVSS,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PCORNER_18_18_NT_DR (
		RTO,
		SNS
 );

`endif
   input SNS;
   input RTO;

specify

endspecify
endmodule // PCORNER_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PBRK_18_18_NT_DR (
		DVDD,
		DVDDBRK,
		DVSS,
		DVSSBRK,
		VDD,
		VDDBRK,
		VSS,
		RTO,
		RTOBRK,
		SNS,
		SNSBRK
 );

inout DVDD, VDD;
inout DVSS, VSS;
inout DVDDBRK, VDDBRK;
inout DVSSBRK;
`else
module PBRK_18_18_NT_DR (
		RTO,
		RTOBRK,
		SNS,
		SNSBRK
 );

`endif
   input SNS;
   input RTO;
   input SNSBRK;
   input RTOBRK;

specify

endspecify
endmodule // PBRK_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PBRKANALOG_18_18_NT_DR (
		AVDD,
		AVSS,
		DVDD,
		DVSS,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout AVDD, VDD, DVDD;
inout AVSS, VSS, DVSS;
`else
module PBRKANALOG_18_18_NT_DR (
		RTO,
		SNS
 );

`endif
   input SNS;
   input RTO;

specify

endspecify
endmodule // PBRKANALOG_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PBRKLS_18_18_NT_DR (
		RTOLS,
		SNSLS,
		DVDD,
		DVDD1,
		DVSS,
		DVSS1,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout DVDD, VDD, DVDD1;
inout DVSS, VSS, DVSS1;
`else
module PBRKLS_18_18_NT_DR (
		RTOLS,
		SNSLS,
		RTO,
		SNS
 );

`endif
   input SNS;
   input RTO;
   output SNSLS;
   output RTOLS;

`ifdef POWER_PINS
   wire  EN_pwr;
   wire  SNSLS_INT;
   wire  RTOLS_INT;
   assign EN_pwr = DVDD && DVDD1;
   assign SNSLS  = (EN_pwr) ? SNSLS_INT : 1'bx;
   assign RTOLS  = (EN_pwr) ? RTOLS_INT : 1'bx;
   buf u0(SNSLS_INT, SNS);
   buf u1(RTOLS_INT, RTO);
`else
   buf u0(SNSLS, SNS);
   buf u1(RTOLS, RTO);
`endif


specify
(RTO => RTOLS) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(SNS => SNSLS) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);

endspecify
endmodule // PBRKLS_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PVDD_18_18_NT_DR (
		DVDD,
		DVSS,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PVDD_18_18_NT_DR (
		RTO,
		SNS
 );

`endif

   input SNS;
   input RTO;

specify

endspecify
endmodule // PVDD_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PVDDI_18_18_NT_DR (
		DVDD,
		DVSS,
		VDD,
		VDDI,
		VSS,
		RTO,
		SNS
 );

inout DVDD, VDD;
inout DVSS, VSS;
inout VDDI;
`else
module PVDDI_18_18_NT_DR (
		RTO,
		SNS
 );

`endif

   input SNS;
   input RTO;

specify

endspecify
endmodule // PVDDI_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PBAREWIRE_18_25_T_DR (
		DVDD,
		DVSS,
		PAD,
		PADC,
		PADR1,
		PADR2,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PBAREWIRE_18_25_T_DR (
		PAD,
		PADC,
		PADR1,
		PADR2,
		RTO,
		SNS
 );

`endif

   inout PAD;
   inout PADC;
   inout PADR1;
   inout PADR2;
   input SNS;
   input RTO;

	//This is a tolerent library and DVDD affects o/p
	rnmos u11(PADR1,PAD,1'b1);
	rnmos u12(PAD,PADR1,1'b1);
	rnmos u21(PADR2,PAD,1'b1);
	rnmos u22(PAD,PADR2,1'b1);
	rnmos u31(PADC,PAD,1'b1);
	rnmos u32(PAD,PADC,1'b1);
	//power modeling
`ifdef POWER_PINS
	rnmos u13(PADR1,1'bx,!DVDD);
	rnmos u23(PADR2,1'bx,!DVDD);
	nmos  u33(PADC,1'bx,!DVDD);
	nmos  u34(PAD,1'bx,!DVDD);
`endif



specify
(PADC => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PADR1 => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PADR2 => PAD) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PAD => PADC) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PAD => PADR1) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);
(PAD => PADR2) = (`ARM_PROP_IODELAY,`ARM_PROP_IODELAY);

endspecify
endmodule // PBAREWIRE_18_25_T_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PFILL1NC_18_18_NT_DR (
		DVDD,
		DVSS,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PFILL1NC_18_18_NT_DR (
		RTO,
		SNS
 );

`endif
   input SNS;
   input RTO;

specify

endspecify
endmodule // PFILL1NC_18_18_NT_DR
`endcelldefine 
`celldefine 
module PBP2_18_18_NT_DR (
		PAD
 );

   inout PAD;

specify

endspecify
endmodule // PBP2_18_18_NT_DR
`endcelldefine 
`celldefine 
module PBP3_18_18_NT_DR (
		PAD
 );

   inout PAD;

specify

endspecify
endmodule // PBP3_18_18_NT_DR
`endcelldefine 
`celldefine 
module PBP45_18_18_NT_DR (
		PAD
 );

   inout PAD;

specify

endspecify
endmodule // PBP45_18_18_NT_DR
`endcelldefine 
`celldefine 
module PBP55_18_18_NT_DR (
		PAD
 );

   inout PAD;

specify

endspecify
endmodule // PBP55_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PVSS_18_18_NT_DR (
		DVDD,
		DVSS,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PVSS_18_18_NT_DR (
		RTO,
		SNS
 );

`endif

   input SNS;
   input RTO;

specify

endspecify
endmodule // PVSS_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PDVDD_18_18_NT_DR (
		DVDD,
		DVSS,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PDVDD_18_18_NT_DR (
		RTO,
		SNS
 );

`endif

   input SNS;
   input RTO;

specify

endspecify
endmodule // PDVDD_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PDVSS_18_18_NT_DR (
		DVDD,
		DVSS,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PDVSS_18_18_NT_DR (
		RTO,
		SNS
 );

`endif

   input SNS;
   input RTO;

specify

endspecify
endmodule // PDVSS_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PFILL10_18_18_NT_DR (
		DVDD,
		DVSS,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PFILL10_18_18_NT_DR (
		RTO,
		SNS
 );

`endif
   input SNS;
   input RTO;

specify

endspecify
endmodule // PFILL10_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PFILL2_18_18_NT_DR (
		DVDD,
		DVSS,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PFILL2_18_18_NT_DR (
		RTO,
		SNS
 );

`endif
   input SNS;
   input RTO;

specify

endspecify
endmodule // PFILL2_18_18_NT_DR
`endcelldefine 
`celldefine 
`ifdef POWER_PINS 
module PFILL5_18_18_NT_DR (
		DVDD,
		DVSS,
		VDD,
		VSS,
		RTO,
		SNS
 );

inout DVDD, VDD;
inout DVSS, VSS;
`else
module PFILL5_18_18_NT_DR (
		RTO,
		SNS
 );

`endif
   input SNS;
   input RTO;

specify

endspecify
endmodule // PFILL5_18_18_NT_DR
`endcelldefine 
