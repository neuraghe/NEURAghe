// -------=============================================================-------
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// ---------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_tdc_ctrl_reg.v
// Netlist version : 3.1
// Modified by     : AB
// Date            : 5th May 2009
// ---------------------------------------------------------------------------
// Purpose         : Test Debug Controller
//                   This is the debug control register controlled by tap 
//                   controller this register can be extended as required by 
//                   number of signal required
// -------=============================================================-------

module C28SOI_PM_CONTROL_LR_ASYNC_tdc_ctrl_sens_reg (
   clk, 
   rst_n, 
   serial_in, 
   shift,
   update, 
   capture, 
   write,
   load,
   load_data,
   //load_interrupt,
   parallel_in, 
   parallel_out, 
   serial_out);

   //----------------------------
   // Parameter Declarations
   //----------------------------
   // UDR length
   parameter DR_LENGTH = 16;
   parameter [DR_LENGTH-1:0] reset_value = {DR_LENGTH{1'b0}};

   input clk;
   input rst_n;
   input serial_in;
   input shift;
   input update;
   input capture;
   input write;
   input load;
   input [DR_LENGTH-1:0] load_data;
   //input load_interrupt;
   output serial_out;
   input [DR_LENGTH-1:0] parallel_in;
   output [DR_LENGTH-1:0] parallel_out;

//----------------------------
// Wire and reg declaration
//----------------------------
    reg [DR_LENGTH-1:0] reg_int;
    reg [DR_LENGTH-1:0] parallel_out;
    wire serial_out;
	reg [DR_LENGTH-1:0] parallel_out_internal;
//----------------------------
// Netlist Declaration
//----------------------------
assign serial_out = reg_int[0];

//-- reg_int process
always @(negedge rst_n or posedge clk)
    begin : p_reg_int //--{{
        if (rst_n == 1'b0)
           reg_int <=  reset_value;
        else 
            begin //--{{
              if (capture == 1'b1)
                  reg_int <=  parallel_out;
              else if (shift == 1)
                  reg_int[DR_LENGTH-1:0] <=  {serial_in,reg_int[DR_LENGTH-1:1]};		      
              else
                  reg_int <=  reg_int;
            end //--}}
    end // p_reg_int --}} 

//-- parallel_out process
always @(negedge rst_n or posedge clk)
    begin : p_parallel_out //--{{
        if (rst_n == 1'b0) begin
            parallel_out <=  reset_value;
	    parallel_out_internal <=  reset_value;
	    end
        else if (update == 1) parallel_out <=  reg_int;
        else if (write == 1)  parallel_out <=  parallel_in;
        else if (load == 1) begin 
	parallel_out <=  load_data; 
	parallel_out_internal <= load_data;  
	end
	else if(load == 0) begin
	if(parallel_out_internal[10] != load_data[10]) parallel_out[10] <= load_data[10];
	end
    end //p_parallel_out --}} 


endmodule 
