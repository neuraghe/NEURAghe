// --=========================================================================--
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// -----------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_promip_controller_if.v
// Netlist version : 3.1
// Done by         : AB
// Date            : May 04 2009
// -----------------------------------------------------------------------------
// Purpose         : This block contains a wrapper around all controllers
//                   present inside PROMIP   
// --=========================================================================--

module C28SOI_PM_CONTROL_LR_ASYNC_promip_controller_if (

   clk,             // Test clock 
   rst_n,          // Test reset(active low)
   // JTAG pads
   tdi,             // Test data input
   tdo_en_n,        // Test data output enable
   tdo,             // Test data output
   tms,             // Test mode selection
               
   // APB ports
   pclk,           // APB  clock
   presetn,        // APB reset
   penable,        // APB enable
   psel,           // APB select
   pwrite,         // APB write control
   paddr,          // APB address bus
   pwdata,         // APB write data bus 
   prdata,         // APB read data bus
   pready,         // APB ready signal
   dataready,      // promip ready signal
   dataready_del,      // promip ready signal
   pslverr,        // APB error signal
   mode, // mode selector for PROMIP
   //tst_gated_clk1, // clock gating cell test enable
   tcr_muxclk_mode, // test mode control signal
   tcr_noinvert_clk, // test mode
   tst_reset_mux0, //test mode

   debug_enable,   // debug mode enable pin

   parallel_enable_sens_ctrl, // parallel mode enable pin
   parallel_enable_ref_ctr, // parallel mode enable pin
   parallel_enable_sens_stat, // parallel mode enable pin
   
   // Promip Registers 
   sensor_ctrl,     // Sensor selection.
   sensor_status,   // Contains the output value.
   ref_counter,     // The time window (in number of tck).
   
   // Promip Control Register write data
   sensor_ctrl_write_data,
   ref_counter_write_data,
   
   // Promip Registers serial output
   sensor_ctrl_so,     // Sensor selection.
   sensor_status_so,   // Contains the output value.
   ref_counter_so,     // The time window (in number of tck).

   // Promip Registers select signals
   sensor_ctrl_select,     // Sensor selection.
   sensor_status_select,   // Contains the output value.
   ref_counter_select,     // The time window (in number of tck).

   // Promip register control signals
   capture,
   shift,
   write,
   update,

   sensor_ctrl_select_from_sensor_if, // select sensor control register for write
   write_from_sensor_if,              // update sensor control register
   sensor_ctrl_o_from_sensor_if,     // updated sensor control value
   
   clk_out,
   reset_out
   );               

   /*----------------------
     Parameters declaration
     ----------------------*/
     parameter REF_COUNTER_LENGTH = 32;
     parameter SENSOR_CTRL_LENGTH = 16;
     parameter SENSOR_STAT_LENGTH = 32;
     parameter IR_LENGTH = 5;

     parameter k_SENS_CTRL_ADDRESS   = 5'b00100;
     parameter k_REF_COUNTER_ADDRESS = 5'b01000;
     parameter k_SENS_STAT_ADDRESS   = 5'b01100;

     // Operating modes
     parameter k_APBIF_MODE  = 2'b00;
     parameter k_JTAGIF_MODE = 2'b01;
     parameter k_DEBUG_MODE  = 2'b10;
     parameter k_PARALLEL_MODE  = 2'b11;

     // JTAG TAP parameters
     parameter IDCODE_LENGTH = 32;
     parameter IDCODE_VALUE  = 32'hBA20A005;

     // APB parameters
     parameter k_APB_ADDRESS_LENGTH = 5;
     parameter k_APB_DATA_LENGTH = 32;

   input  clk;
   input  rst_n;
   // JTAG pads
   input  tdi;
   output tdo_en_n;
   output tdo;
   input  tms;
   
   // APB inputs / outputs
   input pclk;
   input presetn;
   input penable;
   input psel;
   input pwrite;
   input  [k_APB_ADDRESS_LENGTH-1:0] paddr;
   input  [k_APB_DATA_LENGTH-1:0]    pwdata;
   output [k_APB_DATA_LENGTH-1:0]    prdata;  
   output pready;
   output pslverr;

   input dataready;
   input dataready_del;

   input [1:0] mode;     // mode selector for PROMIP
   //input tst_gated_clk1; // clock gating cell test/scan enable
   input tcr_muxclk_mode; // test mode control signal
   input tcr_noinvert_clk; // test mode
   input tst_reset_mux0; //test mode

   output debug_enable;       // debug mode enable pin

   // Promip Register serial output
   input [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl;
   input [SENSOR_STAT_LENGTH-1:0] sensor_status;
   input [REF_COUNTER_LENGTH-1:0] ref_counter;

   // Promip Control Register write data
   output [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_write_data;
   output [REF_COUNTER_LENGTH-1:0] ref_counter_write_data;

   // Parallel Mode ACTIVE
   output parallel_enable_sens_ctrl;
   output parallel_enable_ref_ctr;
   output parallel_enable_sens_stat;

   // Promip Register serial output
   input sensor_ctrl_so;
   input  sensor_status_so;
   input ref_counter_so;
   
   // Promip Register select signals
   output sensor_ctrl_select;
   output sensor_status_select;
   output ref_counter_select;

   // Promip Register control signals
   output capture, shift, update;    
   output write;
   
   // sensor control reg write control signals from sensor if
   input sensor_ctrl_select_from_sensor_if;
   input write_from_sensor_if;
   input [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_o_from_sensor_if;

   output clk_out;
   output reset_out;

// --------------------------------
// Wire declarations
// --------------------------------
   
   wire tck_out;
   wire pclk_out;
   wire trst_n_out;
   wire presetn_out;
   
   reg  [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_write_data;
   wire [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_write_data_controller;
   wire [REF_COUNTER_LENGTH-1:0] ref_counter_write_data;

   wire apb_enable;
   wire jtag_enable;
   wire i_parallel_enable;

   reg parallel_enable_sens_ctrl;
   reg parallel_enable_ref_ctr;
   reg parallel_enable_sens_stat;

   reg sensor_ctrl_select;
   reg sensor_status_select;
   reg ref_counter_select;

   reg sensor_ctrl_select_controller;

   wire sensor_ctrl_select_apb;
   wire sensor_ctrl_select_jtag;
   wire sensor_status_select_apb;
   wire sensor_status_select_jtag;
   wire ref_counter_select_apb;
   wire ref_counter_select_jtag;

   wire write_apb;
   wire capture_jtag ;
   wire shift_jtag;
   wire update_jtag;

   reg capture;
   reg shift;
   reg update;
   
   reg write_controller;
   reg write;
   

//-----------------------------------------------------------
// Netlist Declaration
//-----------------------------------------------------------

always @(i_parallel_enable, dataready) begin
   parallel_enable_sens_stat = 1'b0;
   if (dataready) begin
      parallel_enable_sens_stat = i_parallel_enable;
   end   
end

always @(i_parallel_enable, dataready_del) begin
   parallel_enable_sens_ctrl = 1'b0;
   parallel_enable_ref_ctr = 1'b0;
   if (dataready_del) begin
      parallel_enable_sens_ctrl = i_parallel_enable;
      parallel_enable_ref_ctr = i_parallel_enable;
   end   
end

//// changes
/*always @(i_parallel_enable) begin
  // parallel_enable_sens_stat = 1'b0;
  // if (dataready) begin
      parallel_enable_sens_stat = i_parallel_enable;
  // end   
end

always @(i_parallel_enable) begin
  // parallel_enable_sens_ctrl = 1'b0;
  // parallel_enable_ref_ctr = 1'b0;
  // if (dataready_del) begin
      parallel_enable_sens_ctrl = i_parallel_enable;
      parallel_enable_ref_ctr = i_parallel_enable;
  // end   
end*/



C28SOI_PM_CONTROL_LR_ASYNC_promip_jtag_if #(
   .REF_COUNTER_LENGTH(REF_COUNTER_LENGTH),
   .SENSOR_CTRL_LENGTH(SENSOR_CTRL_LENGTH),
   .SENSOR_STAT_LENGTH(SENSOR_STAT_LENGTH), 
   .k_IR_LENGTH(IR_LENGTH),
   .IDCODE_LENGTH(IDCODE_LENGTH),
   .IDCODE_VALUE(IDCODE_VALUE),
   .k_SENS_CTRL_ADDRESS(k_SENS_CTRL_ADDRESS),
   .k_REF_COUNTER_ADDRESS(k_REF_COUNTER_ADDRESS),
   .k_SENS_STAT_ADDRESS(k_SENS_STAT_ADDRESS))
u_C28SOI_PM_CONTROL_LR_ASYNC_promip_jtag_if (
   .tck(tck_out),       // Test clock 
   .trst_n(trst_n_out), // Test reset(active low)

   // JTAG pads
   .tdi(tdi),       // Test data input
   .tdo(tdo),       // Test data output
   .tms(tms),       // Test mode selection
   .tdo_en_n(tdo_en_n),       // Test data output enable

   .tcr_noinvert_clk(tcr_noinvert_clk),
   
   // TAP states
   .shift_dr(shift_jtag),
   .update_dr(update_jtag),
   .capture_dr(capture_jtag),
                
   // Register select signals   
   .sensor_ctrl_select(sensor_ctrl_select_jtag),
   .sensor_status_select(sensor_status_select_jtag),
   .ref_counter_select(ref_counter_select_jtag),
                               
   // TDO signals
   .sensor_ctrl_tdo(sensor_ctrl_so),
   .sensor_status_tdo(sensor_status_so),
   .ref_counter_tdo(ref_counter_so)
   
   );

C28SOI_PM_CONTROL_LR_ASYNC_promip_apb_if #(
   .REF_COUNTER_LENGTH(REF_COUNTER_LENGTH),
   .SENSOR_CTRL_LENGTH(SENSOR_CTRL_LENGTH),
   .SENSOR_STAT_LENGTH(SENSOR_STAT_LENGTH), 
   .k_UDR_ADDR_BITS(IR_LENGTH),
   .k_SENS_CTRL_ADDRESS(k_SENS_CTRL_ADDRESS),
   .k_REF_COUNTER_ADDRESS(k_REF_COUNTER_ADDRESS),
   .k_SENS_STAT_ADDRESS(k_SENS_STAT_ADDRESS),
   .k_APB_ADDRESS_LENGTH(k_APB_ADDRESS_LENGTH),
   .k_APB_DATA_LENGTH(k_APB_DATA_LENGTH)) 
u_C28SOI_PM_CONTROL_LR_ASYNC_promip_apb_if (
   .pclk(pclk_out),
   .presetn(presetn_out),
   .penable(penable),
   .psel(psel),
   .pwrite(pwrite),
   .paddr(paddr),
   .pwdata(pwdata),
   .prdata(prdata),
   .pready(pready),
   .pslverr(pslverr),
   .dataready(dataready),

   .apb_enable(apb_enable),
   
   // Register select signals   
   .sensor_ctrl_select(sensor_ctrl_select_apb),
   .sensor_status_select(sensor_status_select_apb),
   .ref_counter_select(ref_counter_select_apb),
           
   // Promip registers control signals
   .write(write_apb),
   
   // Parallel input/output data to/from promip registers
   .sensor_ctrl(sensor_ctrl),
   .ref_counter(ref_counter),
   .sensor_status(sensor_status),
   .sensor_ctrl_write_data(sensor_ctrl_write_data_controller),
   .ref_counter_write_data(ref_counter_write_data)
   );


C28SOI_PM_CONTROL_LR_ASYNC_promip_ctrl_gen #(
     .k_APBIF_MODE(k_APBIF_MODE),
     .k_JTAGIF_MODE(k_JTAGIF_MODE),
     .k_DEBUG_MODE(k_DEBUG_MODE),
     .k_PARALLEL_MODE(k_PARALLEL_MODE)
  )   
  u_C28SOI_PM_CONTROL_LR_ASYNC_promip_ctrl_gen(
   .tck(clk),
   .pclk(pclk),
   .mode(mode),
   .clk_out(clk_out),
   .tck_out(tck_out),
   .pclk_out(pclk_out),
   .trst_n(rst_n),
   .presetn(presetn),
   .reset_out(reset_out),
   .trst_n_out(trst_n_out),
   .presetn_out(presetn_out),
   .apb_enable(apb_enable),
   //.tst_gated_clk1(tst_gated_clk1),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux0(tst_reset_mux0),
   .debug_enable(debug_enable),
   .parallel_enable(i_parallel_enable),
   .jtag_enable(jtag_enable)
   );

always @(capture_jtag, jtag_enable) begin
   if (jtag_enable == 1'b1)
      capture = capture_jtag;
   else   
      capture = 1'b0;
end

always @(shift_jtag, jtag_enable) begin
   if (jtag_enable == 1'b1)
      shift = shift_jtag;
   else   
      shift = 1'b0;
end


always @(write_apb, apb_enable) begin
   if (apb_enable == 1'b1)
      write_controller = write_apb;
   else   
      write_controller = 1'b0;
end

always @(update_jtag, jtag_enable) begin
   if (jtag_enable == 1'b1)
      update = update_jtag;
   else   
      update = 1'b0;
   end


always @(apb_enable,
         sensor_status_select_apb, sensor_status_select_jtag,
         sensor_ctrl_select_apb, sensor_ctrl_select_jtag,
         ref_counter_select_apb, ref_counter_select_jtag) begin
   if (apb_enable == 1'b1) begin
      sensor_ctrl_select_controller = sensor_ctrl_select_apb;
      ref_counter_select = ref_counter_select_apb;
      sensor_status_select = sensor_status_select_apb;
   end   
   else begin
      sensor_ctrl_select_controller = sensor_ctrl_select_jtag;
      ref_counter_select = ref_counter_select_jtag;
      sensor_status_select = sensor_status_select_jtag;
   end   
end

always @(write_from_sensor_if, sensor_ctrl_select_from_sensor_if,
         sensor_ctrl_o_from_sensor_if, 
         write_controller, sensor_ctrl_write_data_controller,
         sensor_ctrl_select_controller) begin
   if (write_from_sensor_if == 1'b1) begin
      write = write_from_sensor_if;
      sensor_ctrl_select = sensor_ctrl_select_from_sensor_if;
      sensor_ctrl_write_data = sensor_ctrl_o_from_sensor_if;
   end
   else begin
      write = write_controller;
      sensor_ctrl_select = sensor_ctrl_select_controller;
      sensor_ctrl_write_data = sensor_ctrl_write_data_controller;
   end   
end
   
endmodule
