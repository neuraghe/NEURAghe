// ----====================================================================----
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// ----------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_tdc_stat_reg.v
// Netlist version : 3.1
// Modified by     : AB	
// Date            : 5th May 2009
// ----------------------------------------------------------------------------
// Purpose         : Test Debug Controller
//                   This is the debug control register controlled by tap 
//                   controller this register can be extended as required by 
//                    number of signal required
// ----====================================================================----

module C28SOI_PM_CONTROL_LR_ASYNC_tdc_stat_reg (
   clk, 
   rst_n, 
   serial_in,
   shift,
   capture, 
   //update,
   //write,
   read,
   read_data,
   parallel_in, 
   serial_out);

//----------------------------
// Parameter declaration
//----------------------------
    // UDR length
    parameter DR_LENGTH = 16;
    parameter [DR_LENGTH-1:0] reset_value = {DR_LENGTH{1'b0}};

   input clk;
   input rst_n;
   input serial_in;   
   input shift;
   input capture;
   //input write;
   input read;
   output [DR_LENGTH-1:0] read_data;
   //input update; // output enable signal for APB
   input [DR_LENGTH-1:0] parallel_in;
   output serial_out;

//----------------------------
// Wire and reg declaration
//----------------------------
    reg [DR_LENGTH-1:0] reg_int;
    reg [DR_LENGTH-1:0] read_data;
    wire serial_out;

//----------------------------
// Netlist declaration
//----------------------------
// Parallel interface sensor output
always @(negedge rst_n or posedge clk) begin
   if (rst_n == 1'b0)
      read_data <= reset_value;
   else if (read)   
      read_data <= parallel_in;
end

assign serial_out = reg_int[0];

//-- reg_int process
always @(negedge rst_n or posedge clk)
    begin : p_reg_int //--{{
        if (rst_n == 1'b0)
            reg_int <=  reset_value;
        else 
            begin //--{{
                if (capture == 1'b1)
                    reg_int <=  parallel_in;
               else if (shift == 1'b1)
                   reg_int[DR_LENGTH-1:0] <=  {serial_in,reg_int[DR_LENGTH-1:1]};		      
               //else if (write == 1'b1)     
               //   reg_int[DR_LENGTH-1:0] <=  parallel_in[DR_LENGTH-1:0];
               else
                   reg_int <=  reg_int;
            end //--}}
    end // p_reg_int --}} 
endmodule 
