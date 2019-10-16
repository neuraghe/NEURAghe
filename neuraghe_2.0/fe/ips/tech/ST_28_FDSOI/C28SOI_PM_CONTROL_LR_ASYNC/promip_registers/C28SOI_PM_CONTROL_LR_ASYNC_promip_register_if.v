// --=========================================================================--
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// -----------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_promip_register_if.v
// Netlist version : 3.1
// Done by         : AB
// Date            : 05 May 2009
// -----------------------------------------------------------------------------
// Purpose         : wrapper around promip registers
// --=========================================================================--

module C28SOI_PM_CONTROL_LR_ASYNC_promip_register_if (
   
   clk,             // Test clock 
   rst_n,           // Test reset(active low)
                
   serial_in,       // serial input data
   sensor_ctrl_parallel_in,     // parallel input data - SENSOR CTRL
   ref_counter_parallel_in,     // parallel input data - REF COUNTER

   // Sensor Controller Registers
   sensor_ctrl,     // Sensor control register parallel input
   sensor_status,   // Sensor status register parallel output
   ref_counter,     // Ref counter parallel input data
   
   sensor_ctrl_so,     // Sensor control register serial output
   sensor_status_so,   // Sensor status register serial output
   ref_counter_so,     // Ref counter serial output
   
   sensor_ctrl_select,   // sensor control register select signal
   sensor_status_select, // sensor status register select signal
   ref_counter_select,   // ref counter register select signal

   // register control signals
   capture,
   shift,
   write,
   update,
   
   parallel_enable_sens_ctrl, // parallel mode enable pin
   parallel_enable_ref_ctr, // parallel mode enable pin
   parallel_enable_sens_stat, // parallel mode enable pin

   ref_counter_i,
   sensor_ctrl_i,
   sensor_stat_o

   );

  /*-----------------------------
     Parameters declaration
    ----------------------------*/
    // UDR length
    parameter REF_COUNTER_LENGTH = 32;
    parameter SENSOR_CTRL_LENGTH = 16;
    parameter SENSOR_STAT_LENGTH = 32;

   // register i/o ports
   input  clk;
   input  rst_n;
   input  serial_in;

   // Applicable only for SENSOR CONTROL REGISTER
   // write instruction from sensor interface register
   input  [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_parallel_in; 
   input  [REF_COUNTER_LENGTH-1:0] ref_counter_parallel_in; 

   // Sensor Controller Register
   output [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl;
   input  [SENSOR_STAT_LENGTH-1:0] sensor_status;
   output [REF_COUNTER_LENGTH-1:0] ref_counter;
   
   output sensor_ctrl_so;
   output sensor_status_so;
   output ref_counter_so;
                
   input sensor_ctrl_select;
   input sensor_status_select;
   input ref_counter_select;

   // register control signals
   input capture, shift, update;    
   input write;

   // PARALLEL INTERFACE
   input [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_i;
   input [REF_COUNTER_LENGTH-1:0] ref_counter_i;
   output [SENSOR_STAT_LENGTH-1:0] sensor_stat_o;

   input parallel_enable_sens_ctrl;
   input parallel_enable_ref_ctr;
   input parallel_enable_sens_stat;
   
//-----------------------------------------------------------
// Wire Declaration
//-----------------------------------------------------------

    wire      sensor_ctrl_so;
    wire      sensor_status_so;
    wire      ref_counter_so;
    
//------ internal registers
	reg interrupt_bit_i;
	reg interrupt_load;
//-----------------------------------------------------------
// Netlist Declaration
//-----------------------------------------------------------

/*always@(negedge parallel_enable_sens_ctrl) begin
//if (parallel_enable_sens_ctrl == 1'b0) begin
interrupt_bit_i <= sensor_ctrl_i[10];
//interrupt_load = 1'b0;
end
else begin
if(interrupt_bit_i != sensor_ctrl_i[10]) begin
interrupt_load = 1'b1;
end
else interrupt_load = 1'b0;
end
end*/


C28SOI_PM_CONTROL_LR_ASYNC_tdc_ctrl_sens_reg #(SENSOR_CTRL_LENGTH) u_C28SOI_PM_CONTROL_LR_ASYNC_tdc_ctrl_sensor_ctrl(
   .clk(clk), 
   .rst_n(rst_n), 
   .serial_in(serial_in), 
   .shift(sensor_ctrl_select  & shift),
   .update(sensor_ctrl_select & update), 
   .capture(sensor_ctrl_select & capture), 
   .write(sensor_ctrl_select & write),
   .load(parallel_enable_sens_ctrl),
   .load_data(sensor_ctrl_i),
   //.load_interrupt(interrupt_load),
   .parallel_in(sensor_ctrl_parallel_in),
   .parallel_out(sensor_ctrl), 
   .serial_out(sensor_ctrl_so));


/*C28SOI_PM_CONTROL_LR_ASYNC_tdc_ctrl_reg #(SENSOR_CTRL_LENGTH) u_C28SOI_PM_CONTROL_LR_ASYNC_tdc_ctrl_sensor_ctrl(
   .clk(clk), 
   .rst_n(rst_n), 
   .serial_in(serial_in), 
   .shift(sensor_ctrl_select  & shift),
   .update(sensor_ctrl_select & update), 
   .capture(sensor_ctrl_select & capture), 
   .write(sensor_ctrl_select & write),
   .load(parallel_enable_sens_ctrl),
   .load_data(sensor_ctrl_i),
   .parallel_in(sensor_ctrl_parallel_in),
   .parallel_out(sensor_ctrl), 
   .serial_out(sensor_ctrl_so));*/

C28SOI_PM_CONTROL_LR_ASYNC_tdc_ctrl_reg #(REF_COUNTER_LENGTH, {REF_COUNTER_LENGTH{1'b1}}) u_C28SOI_PM_CONTROL_LR_ASYNC_tdc_ctrl_ref_counter(
   .clk(clk), 
   .rst_n(rst_n), 
   .serial_in(serial_in), 
   .shift(ref_counter_select & shift),
   .update(ref_counter_select & update), 
   .capture(ref_counter_select & capture), 
   .write(ref_counter_select & write),
   .load(parallel_enable_ref_ctr),
   .load_data(ref_counter_i),
   .parallel_in(ref_counter_parallel_in),
   .parallel_out(ref_counter), 
   .serial_out(ref_counter_so));

C28SOI_PM_CONTROL_LR_ASYNC_tdc_stat_reg #(SENSOR_STAT_LENGTH) u_C28SOI_PM_CONTROL_LR_ASYNC_tdc_stat_sensor_status (
   .clk(clk), 
   .rst_n(rst_n),
   .serial_in(serial_in), // check this out shifting zeroes 
   .shift(sensor_status_select & shift),
   .capture(sensor_status_select & capture), 
   //.write(sensor_status_select & write),
   .read(parallel_enable_sens_stat),
   .read_data(sensor_stat_o),
   //.update(update),
   .parallel_in(sensor_status), 
   .serial_out(sensor_status_so));

endmodule
