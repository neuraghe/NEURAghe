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
// VERILOG_LD for the CMOS028_FDSOI library C28SOI_IO_SF_COMPENSATION1V8_LR_EG_6U1X2U2X2T8XLB
//              			(release d1.0beta1a)
// 
//
//---------------------------------------------------------------------------
// 
// Date          : Nov 2008
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
// Verilog model view for COMPENSATION_1V8
//(c) 1997-2008 STMicroelectronics TRND/CCDS 4.34beta1 (Nov 12 2008 18:23:10) 27-Nov-2008
// Cell COMPENSATION_1V8

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

module COMPENSATION_1V8 (COMPOK, NASRCN, NASRCP, ACCURATE, COMPEN, COMPTQ, FASTFRZ, FREEZE, TQ, RASRCN, RASRCP, ASRCN1V8CORE, ASRCP1V8CORE, ANAREXT);

	output COMPOK;
	output [3:0] NASRCN;
	output [3:0] NASRCP;
	input ACCURATE;
	input COMPEN;
	input COMPTQ;
	input FASTFRZ;
	input FREEZE;
	input TQ;
	input [3:0] RASRCN;
	input [3:0] RASRCP;
	inout ANAREXT;
	inout [3:0] ASRCN1V8CORE;
	inout [3:0] ASRCP1V8CORE;

reg [3:0] int_P ;
reg [3:0] int_N ;
reg [2:0] nx_state;
reg [2:0] pr_state;
reg [2:0] nx_state_latch;
reg compok1,fflag,rasrc;
real timedelay,delay;
real t1,t2;
reg forbid;

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

localparam NORMAL = 3'b000, IDDQ = 3'b001, HZ = 3'b010, READ = 3'b011, FIXEDCODE = 3'b100, FREZE = 3'b110,FASTFZ = 3'b101, INVALID = 3'b111;

parameter normal_to_iddq = 15,
		  normal_to_hz = 15,
		  normal_to_read = 15,
		  normal_to_fixed = 15,
		  normal_to_freeze = 15,
		  normal_to_ffrz = 15,

		  iddq_to_normal = 10000,
		  hz_to_normal = 10000,
		  read_to_normal = 10000,
		  fixed_to_normal = 10000,
		  freeze_to_normal = 10000,
		  ffrz_to_normal = 15,

		  invalid_to_normal = 10000,
		  invalid_to_iddq = 15,
		  invalid_to_hz = 15,
		  invalid_to_read = 15,
		  invalid_to_fixed = 15,
		  invalid_to_freeze = 15,
		  invalid_to_ffrz = 15,
		  default_delay_value = 15;

assign COMPOK = compok1;
assign ASRCN1V8CORE = int_N ;
assign ASRCP1V8CORE = int_P ;
buf U11(NASRCP[3], int_P[3]);
buf U12(NASRCP[2], int_P[2]);
buf U13(NASRCP[1], int_P[1]);
buf U14(NASRCP[0], int_P[0]);

buf U21(NASRCN[3], int_N[3]);
buf U22(NASRCN[2], int_N[2]);
buf U23(NASRCN[1], int_N[1]);
buf U24(NASRCN[0], int_N[0]);

initial begin
 $timeformat(-9,6," ns --",10);
end

initial 
begin
  compok1 = 1'b0;
  pr_state = INVALID;
  fflag = 1;
  t1 = 1'b0;
  t2 = 1'b0;
  forbid = 1'b0;
  rasrc = 1'b0;
end  

always @ (nx_state)
begin
  t2 = ($realtime - t1);
  if(t2 < timedelay)
    begin
     forbid = 1'b1;
	if ((debug_level>1) &&  msg_flag)
	$display("%m - %t ST_WARNING: Inputs of mode selection changed without respecting mode switching delay = %t",$realtime,timedelay);
    end
  else
    begin
	forbid = 1'b0;
    fflag <= 0;
	end
	
  t1 = ($realtime);
 
 everytime(pr_state,nx_state); 
 timedelay = delay;
 nx_state_latch <= nx_state;
end

always @ (nx_state_latch)
begin 
 
  fork : block
  	begin
  	pr_state = # timedelay nx_state;
		disable block;
  	end
	begin
  	@(nx_state)
		disable block;
  	end
  join	
 
 if (forbid)
   begin
	  fork : block1
  		begin
		forbid =  # timedelay 1'b0 ;
  		disable block1 ; 
  		end
	    begin
	    @(nx_state)
	  	disable block1;
	   
	    end
	  join	
	
   
   end
   
end


always @ (FREEZE or FASTFRZ or TQ or COMPEN or COMPTQ )

begin
case (pr_state)
NORMAL : begin
	 if ((TQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state=IDDQ;
	  else if((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ; 
	  else if((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= FIXEDCODE; 
	  else if((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b1)&&(FASTFRZ==1'b0))
           nx_state= FREZE;	 		
          else if((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= NORMAL; 
 	  else if((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&((FREEZE==1'b0)&&(FASTFRZ==1'b1)))
           nx_state= FASTFZ;   
	  else
	   nx_state= INVALID;
	  end 
IDDQ   : begin
	  if((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state=IDDQ;
          else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0)) 
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
    	   nx_state= FIXEDCODE;
          else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= NORMAL;
	  else 
	   nx_state= INVALID;
          end
			 
HZ     : begin
          if ((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= IDDQ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= FIXEDCODE;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;			       
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0)) 
           nx_state= NORMAL;
	  else
	   nx_state = INVALID;
	 end

READ   : begin
          if ((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= IDDQ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= FIXEDCODE;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= NORMAL;
	  else
	   nx_state= INVALID;
         end

FIXEDCODE    : begin
          if ((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= IDDQ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;
          else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= FIXEDCODE;
          else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= NORMAL;
	  else 
	   nx_state= INVALID;
         end
FREZE  : begin
          if ((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= IDDQ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;
          else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= FIXEDCODE;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= NORMAL; 
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b1)&&(FASTFRZ==1'b0))
	   nx_state= FREZE;
	  else
	   nx_state= INVALID;	  
         end
	 
FASTFZ  : begin
          if ((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= IDDQ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;
          else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= FIXEDCODE;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= NORMAL; 
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b1))
	   nx_state= FASTFZ;
	  else
	   nx_state= INVALID;	  
         end	 
	 
INVALID : begin
	  if ((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= IDDQ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= FIXEDCODE;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= NORMAL;
	  else
	   nx_state= INVALID;
	  end   
endcase

end

always @(RASRCN, RASRCP)
begin
if(pr_state==READ)
rasrc = ~rasrc;
end




always @(forbid, pr_state,rasrc)
begin
if(forbid == 1'b1)
   begin    
    compok1=1'bx;
    int_P=4'bxxxx;
    int_N=4'bxxxx;
   end

else 
begin
case(pr_state)
NORMAL: begin
	 compok1=1'b1;
	 int_P=4'b1010;
	 int_N=4'b0101;
	     if ((debug_level>2) && msg_flag)
         $display("%m - %t ST_INFO:   COMPENSATION_1V8 is in NORMAL MODE",$realtime);	 
        end
	
IDDQ  : begin
	 compok1=1'b0;
	 int_P=4'b1010;
	 int_N=4'b0101;
	     if ((debug_level>2) && msg_flag)
         $display("%m - %t ST_INFO: COMPENSATION_1V8 is in IDDQ MODE",$realtime);
        end
	
HZ    : begin
	 compok1=1'b0;
	 int_P=4'bzzzz;
	 int_N=4'bzzzz;
	     if ((debug_level>2) && msg_flag)
         $display("%m - %t ST_INFO: COMPENSATION_1V8 is in HIGH IMPEDANCE STATE",$realtime);
	end

READ  : begin
	 compok1=1'b0;
	 int_P = RASRCP;
	 int_N = RASRCN;
	     if ((debug_level>2) && msg_flag)
		 $display("%m - %t ST_INFO: COMPENSATION_1V8 is in READ MODE",$realtime);
	end
				 
FIXEDCODE : begin
	    compok1=1'b0;
	    int_P=4'b1010;
	    int_N=4'b0101;
	     if ((debug_level>2) && msg_flag)
         $display("%m - %t ST_INFO: COMPENSATION_1V8 is in FIXEDCODE MODE",$realtime);
           end
	   
FREZE : begin
	     compok1=1'b0;
	     if ((debug_level>2) && msg_flag)
         $display("%m - %t ST_INFO: COMPENSATION_1V8 is in FREEZE MODE",$realtime);
	end
	
FASTFZ : begin
	     compok1=1'b0;
	     if ((debug_level>2) && msg_flag)
         $display("%m - %t ST_INFO: COMPENSATION_1V8 is in FASTFREEZE MODE",$realtime);
	end	
	
INVALID: begin
			if(fflag)
				begin
	      		compok1= 1'b0;
          		int_P=4'b0000;
	      		int_N=4'b0000;
				end
			else
				begin
	      		compok1= 1'bx;
         	 	int_P=4'bxxxx;
	      		int_N=4'bxxxx;
	     		if ((debug_level>1) && msg_flag)
         		$display("%m - %t ST_WARNING: COMPENSATION_1V8 is in INVALID mode : inputs are not valid ",$realtime);
         		end		  
		  end
endcase	    	   
end

 end 


task  everytime;
input [2:0] prv_state,nx_State;
  begin
   case({prv_state,nx_State})   
   6'b000001 : delay = normal_to_iddq;		//Timing delay from Normal Mode to IDDQ Mode
   6'b000010 : delay = normal_to_hz;	   //Timing delay from Normal Mode to HZ Mode
   6'b000011 : delay = normal_to_read;	   //Timing delay from Normal Mode to Read Mode
   6'b000100 : delay = normal_to_fixed;	   //Timing delay from Normal Mode to Fixed Mode
   6'b000110 : delay = normal_to_freeze;		//Timing delay from Normal Mode to Freeze Mode
   6'b000101 : delay = normal_to_ffrz;		//Timing delay from Normal Mode to FASTFreeze Mode

   6'b001000 : delay = iddq_to_normal;  //Timing delay from  IDDQ Mode to Normal Mode 
   6'b010000 : delay = hz_to_normal;  //Timing delay from  HZ Mode to Normal Mode 
   6'b011000 : delay = read_to_normal;  //Timing delay from  Read Mode to Normal Mode 
   6'b100000 : delay = fixed_to_normal;  //Timing delay  Fixed Mode to Normal Mode 
   6'b110000 : delay = freeze_to_normal;  //Timing delay  Freeze Mode to Normal Mode 
   6'b101000 : delay = ffrz_to_normal;    //Timing delay  FAST Freeze Mode to Normal Mode 
   
   6'b111000 : delay = invalid_to_normal;//Timing delay from INVALID Mode to Normal Mode
   6'b111001 : delay = invalid_to_iddq;	   //Timing delay from INVALID Mode to IDDQ Mode
   6'b111010 : delay = invalid_to_hz;	   //Timing delay from INVALID Mode to HZ Mode
   6'b111011 : delay = invalid_to_read;	   //Timing delay from INVALID Mode to Read Mode
   6'b111100 : delay = invalid_to_fixed;	   //Timing delay from INVALID Mode to Fixed Mode
   6'b111110 : delay = invalid_to_freeze;	 //Timing delay from INVALID Mode to Freeze Mode
   6'b111101 : delay = invalid_to_ffrz;	 //Timing delay from INVALID Mode to FASTFreeze Mode
   default   : delay = default_delay_value;
   endcase  

   
 end  
endtask 


endmodule // COMPENSATION_1V8

`endcelldefine


// Verilog model view for COMPENSATION_SF_1V8_FC_LIN
//(c) 1997-2008 STMicroelectronics TRND/CCDS 4.34beta1 (Nov 12 2008 18:23:10) 27-Nov-2008
// Cell COMPENSATION_SF_1V8_FC_LIN

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

module COMPENSATION_SF_1V8_FC_LIN (COMPOK, NASRCN, NASRCP, ACCURATE, COMPEN, COMPTQ, FASTFRZ, FREEZE, TQ, RASRCN, RASRCP, ASRCN1V8CORE, ASRCP1V8CORE, ANAREXTPAD);

	output COMPOK;
	output [3:0] NASRCN;
	output [3:0] NASRCP;
	input ACCURATE;
	input COMPEN;
	input COMPTQ;
	input FASTFRZ;
	input FREEZE;
	input TQ;
	input [3:0] RASRCN;
	input [3:0] RASRCP;
	inout ANAREXTPAD;
	inout [3:0] ASRCN1V8CORE;
	inout [3:0] ASRCP1V8CORE;

reg [3:0] int_P ;
reg [3:0] int_N ;
reg [2:0] nx_state;
reg [2:0] pr_state;
reg [2:0] nx_state_latch;
reg compok1,fflag,rasrc;
real timedelay,delay;
real t1,t2;
reg forbid;

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

localparam NORMAL = 3'b000, IDDQ = 3'b001, HZ = 3'b010, READ = 3'b011, FIXEDCODE = 3'b100, FREZE = 3'b110,FASTFZ = 3'b101, INVALID = 3'b111;

parameter normal_to_iddq = 15,
		  normal_to_hz = 15,
		  normal_to_read = 15,
		  normal_to_fixed = 15,
		  normal_to_freeze = 15,
		  normal_to_ffrz = 15,

		  iddq_to_normal = 10000,
		  hz_to_normal = 10000,
		  read_to_normal = 10000,
		  fixed_to_normal = 10000,
		  freeze_to_normal = 10000,
		  ffrz_to_normal = 15,

		  invalid_to_normal = 10000,
		  invalid_to_iddq = 15,
		  invalid_to_hz = 15,
		  invalid_to_read = 15,
		  invalid_to_fixed = 15,
		  invalid_to_freeze = 15,
		  invalid_to_ffrz = 15,
		  default_delay_value = 15;

assign COMPOK = compok1;
assign ASRCN1V8CORE = int_N ;
assign ASRCP1V8CORE = int_P ;
buf U11(NASRCP[3], int_P[3]);
buf U12(NASRCP[2], int_P[2]);
buf U13(NASRCP[1], int_P[1]);
buf U14(NASRCP[0], int_P[0]);

buf U21(NASRCN[3], int_N[3]);
buf U22(NASRCN[2], int_N[2]);
buf U23(NASRCN[1], int_N[1]);
buf U24(NASRCN[0], int_N[0]);

initial begin
 $timeformat(-9,6," ns --",10);
end

initial 
begin
  compok1 = 1'b0;
  pr_state = INVALID;
  fflag = 1;
  t1 = 1'b0;
  t2 = 1'b0;
  forbid = 1'b0;
  rasrc = 1'b0;
end  

always @ (nx_state)
begin
  t2 = ($realtime - t1);
  if(t2 < timedelay)
    begin
     forbid = 1'b1;
	if ((debug_level>1) &&  msg_flag)
	$display("%m - %t ST_WARNING: Inputs of mode selection changed without respecting mode switching delay = %t",$realtime,timedelay);
    end
  else
    begin
	forbid = 1'b0;
    fflag <= 0;
	end
	
  t1 = ($realtime);
 
 everytime(pr_state,nx_state); 
 timedelay = delay;
 nx_state_latch <= nx_state ;
end

always @ (nx_state_latch)
begin 
 
  fork : block
  	begin
  	pr_state = # timedelay nx_state;
		disable block;
  	end
	begin
  	@(nx_state)
		disable block;
  	end
  join	
 
 if (forbid)
   begin
	  fork : block1
  		begin
		forbid =  # timedelay 1'b0 ;
  		disable block1 ; 
  		end
	    begin
	    @(nx_state)
	  	disable block1;
	   
	    end
	  join	
	
   
   end
   
end


always @ (FREEZE or FASTFRZ or TQ or COMPEN or COMPTQ )

begin
case (pr_state)
NORMAL : begin
	 if ((TQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state=IDDQ;
	  else if((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ; 
	  else if((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= FIXEDCODE; 
	  else if((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b1)&&(FASTFRZ==1'b0))
           nx_state= FREZE;	 		
          else if((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= NORMAL; 
 	  else if((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&((FREEZE==1'b0)&&(FASTFRZ==1'b1)))
           nx_state= FASTFZ;   
	  else
	   nx_state= INVALID;
	  end 
IDDQ   : begin
	  if((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state=IDDQ;
          else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0)) 
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
    	   nx_state= FIXEDCODE;
          else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= NORMAL;
	  else 
	   nx_state= INVALID;
          end
			 
HZ     : begin
          if ((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= IDDQ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= FIXEDCODE;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;			       
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0)) 
           nx_state= NORMAL;
	  else
	   nx_state = INVALID;
	 end

READ   : begin
          if ((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= IDDQ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= FIXEDCODE;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= NORMAL;
	  else
	   nx_state= INVALID;
         end

FIXEDCODE    : begin
          if ((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= IDDQ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;
          else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= FIXEDCODE;
          else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= NORMAL;
	  else 
	   nx_state= INVALID;
         end
FREZE  : begin
          if ((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= IDDQ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;
          else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= FIXEDCODE;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= NORMAL; 
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b1)&&(FASTFRZ==1'b0))
	   nx_state= FREZE;
	  else
	   nx_state= INVALID;	  
         end
	 
FASTFZ  : begin
          if ((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= IDDQ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;
          else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= FIXEDCODE;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
           nx_state= NORMAL; 
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b1))
	   nx_state= FASTFZ;
	  else
	   nx_state= INVALID;	  
         end	 
	 
INVALID : begin
	  if ((TQ==1'b1) &&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= IDDQ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= HZ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b1)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= READ;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b1)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= FIXEDCODE;
	  else if ((TQ==1'b0)&&(COMPEN==1'b0)&&(COMPTQ==1'b0)&&(FREEZE==1'b0)&&(FASTFRZ==1'b0))
	   nx_state= NORMAL;
	  else
	   nx_state= INVALID;
	  end   
endcase

end

always @(RASRCN, RASRCP)
begin
if(pr_state==READ)
rasrc = ~rasrc;
end




always @(forbid, pr_state,rasrc)
begin
if(forbid == 1'b1)
   begin    
    compok1=1'bx;
    int_P=4'bxxxx;
    int_N=4'bxxxx;
   end

else 
begin
case(pr_state)
NORMAL: begin
	 compok1=1'b1;
	 int_P=4'b1010;
	 int_N=4'b0101;
	     if ((debug_level>2) && msg_flag)
         $display("%m - %t ST_INFO:   COMPENSATION_SF_1V8_FC_LIN is in NORMAL MODE",$realtime);	 
        end
	
IDDQ  : begin
	 compok1=1'b0;
	 int_P=4'b1010;
	 int_N=4'b0101;
	     if ((debug_level>2) && msg_flag)
         $display("%m - %t ST_INFO: COMPENSATION_SF_1V8_FC_LIN is in IDDQ MODE",$realtime);
        end
	
HZ    : begin
	 compok1=1'b0;
	 int_P=4'bzzzz;
	 int_N=4'bzzzz;
	     if ((debug_level>2) && msg_flag)
         $display("%m - %t ST_INFO: COMPENSATION_SF_1V8_FC_LIN is in HIGH IMPEDANCE STATE",$realtime);
	end

READ  : begin
	 compok1=1'b0;
	 int_P = RASRCP;
	 int_N = RASRCN;
	     if ((debug_level>2) && msg_flag)
		 $display("%m - %t ST_INFO: COMPENSATION_SF_1V8_FC_LIN is in READ MODE",$realtime);
	end
				 
FIXEDCODE : begin
	    compok1=1'b0;
	    int_P=4'b1010;
	    int_N=4'b0101;
	     if ((debug_level>2) && msg_flag)
         $display("%m - %t ST_INFO: COMPENSATION_SF_1V8_FC_LIN is in FIXEDCODE MODE",$realtime);
           end
	   
FREZE : begin
	     compok1=1'b0;
	     if ((debug_level>2) && msg_flag)
         $display("%m - %t ST_INFO: COMPENSATION_SF_1V8_FC_LIN is in FREEZE MODE",$realtime);
	end
	
FASTFZ : begin
	     compok1=1'b0;
	     if ((debug_level>2) && msg_flag)
         $display("%m - %t ST_INFO: COMPENSATION_SF_1V8_FC_LIN is in FASTFREEZE MODE",$realtime);
	end	
	
INVALID: begin
			if(fflag)
				begin
	      		compok1= 1'b0;
          		int_P=4'b0000;
	      		int_N=4'b0000;
				end
			else
				begin
	      		compok1= 1'bx;
         	 	int_P=4'bxxxx;
	      		int_N=4'bxxxx;
	     		if ((debug_level>1) && msg_flag)
         		$display("%m - %t ST_WARNING: COMPENSATION_SF_1V8_FC_LIN is in INVALID mode : inputs are not valid ",$realtime);
         		end		  
		  end
endcase	    	   
end

 end 


task  everytime;
input [2:0] prv_state,nx_State;
  begin
   case({prv_state,nx_State})   
   6'b000001 : delay = normal_to_iddq;		//Timing delay from Normal Mode to IDDQ Mode
   6'b000010 : delay = normal_to_hz;	   //Timing delay from Normal Mode to HZ Mode
   6'b000011 : delay = normal_to_read;	   //Timing delay from Normal Mode to Read Mode
   6'b000100 : delay = normal_to_fixed;	   //Timing delay from Normal Mode to Fixed Mode
   6'b000110 : delay = normal_to_freeze;		//Timing delay from Normal Mode to Freeze Mode
   6'b000101 : delay = normal_to_ffrz;		//Timing delay from Normal Mode to FASTFreeze Mode

   6'b001000 : delay = iddq_to_normal;  //Timing delay from  IDDQ Mode to Normal Mode 
   6'b010000 : delay = hz_to_normal;  //Timing delay from  HZ Mode to Normal Mode 
   6'b011000 : delay = read_to_normal;  //Timing delay from  Read Mode to Normal Mode 
   6'b100000 : delay = fixed_to_normal;  //Timing delay  Fixed Mode to Normal Mode 
   6'b110000 : delay = freeze_to_normal;  //Timing delay  Freeze Mode to Normal Mode 
   6'b101000 : delay = ffrz_to_normal;    //Timing delay  FAST Freeze Mode to Normal Mode 
   
   6'b111000 : delay = invalid_to_normal;//Timing delay from INVALID Mode to Normal Mode
   6'b111001 : delay = invalid_to_iddq;	   //Timing delay from INVALID Mode to IDDQ Mode
   6'b111010 : delay = invalid_to_hz;	   //Timing delay from INVALID Mode to HZ Mode
   6'b111011 : delay = invalid_to_read;	   //Timing delay from INVALID Mode to Read Mode
   6'b111100 : delay = invalid_to_fixed;	   //Timing delay from INVALID Mode to Fixed Mode
   6'b111110 : delay = invalid_to_freeze;	 //Timing delay from INVALID Mode to Freeze Mode
   6'b111101 : delay = invalid_to_ffrz;	 //Timing delay from INVALID Mode to FASTFreeze Mode
   default   : delay = default_delay_value;
   endcase  

   
 end  
endtask 


endmodule // COMPENSATION_SF_1V8_FC_LIN

`endcelldefine

