// --=========================================================================--
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// -----------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_promip_jtag_if.v
// Netlist version : 3.1
// Done by         : AB
// Date            : May 05 2009
// -----------------------------------------------------------------------------
// Purpose         : This block contains a controller based on jtag protocol.
// --=========================================================================--

module C28SOI_PM_CONTROL_LR_ASYNC_promip_jtag_if (
   // JTAG pads
   tck,             // Test clock 
   trst_n,          // Test reset(active low)
   tdi,             // Test data input
   tdo_en_n,        // Test data output enable
   tdo,             // Test data output
   tms,             // Test mode selection
                
   tcr_noinvert_clk,
   
   // Promip Registers serial output
   sensor_ctrl_tdo,     // Sensor selection.
   sensor_status_tdo,   // Contains the output value.
   ref_counter_tdo,     // The time window (in number of tck).

   // Promip Registers select signals
   sensor_ctrl_select,     // Sensor selection.
   sensor_status_select,   // Contains the output value.
   ref_counter_select,     // The time window (in number of tck).

   // Promip register control signals
   capture_dr,
   shift_dr,
   update_dr
   );               

   /*----------------------
     Parameters declaration
     ----------------------*/
     parameter REF_COUNTER_LENGTH = 32;
     parameter SENSOR_CTRL_LENGTH = 16;
     parameter SENSOR_STAT_LENGTH = 32;
     parameter k_IR_LENGTH = 5;

     parameter IDCODE_LENGTH = 32;
     parameter IDCODE_VALUE  = 32'hBA20A005;

     parameter k_SENS_CTRL_ADDRESS   = 5'b00100;
     parameter k_REF_COUNTER_ADDRESS = 5'b01000;
     parameter k_SENS_STAT_ADDRESS   = 5'b01100;

    // JTAG pads
   input  tck;
   input  trst_n;
   input  tdi;
   output tdo_en_n;
   output tdo;
   input  tms;
   input  tcr_noinvert_clk;
                
   // Promip Register serial output
   input sensor_ctrl_tdo;
   input  sensor_status_tdo;
   input ref_counter_tdo;
   
   // Promip Register serial output
   output sensor_ctrl_select;
   output sensor_status_select;
   output ref_counter_select;

   // TDR control signals
   output capture_dr, shift_dr, update_dr;    
   
//-----------------------------------------------------------
// Wire Declaration
//-----------------------------------------------------------

    // Register Selector
    wire      bypass_select;
    wire      idcode_select;
    wire      sensor_ctrl_select;
    wire      sensor_status_select;
    wire      ref_counter_select;
    
    wire      bypass_tdo;
    wire      idcode_tdo;
    wire      sensor_ctrl_tdo;
    wire      sensor_status_tdo;
    wire      ref_counter_tdo;

    // TAP states
    wire shift_dr, update_dr, capture_dr;

//-----------------------------------------------------------
// Netlist Declaration
//-----------------------------------------------------------
C28SOI_PM_CONTROL_LR_ASYNC_jtag_interface #(
   .k_IR_LENGTH(k_IR_LENGTH),
   .IDCODE_LENGTH(IDCODE_LENGTH),
   .IDCODE_VALUE(IDCODE_VALUE),
   .k_SENS_CTRL_ADDRESS(k_SENS_CTRL_ADDRESS),
   .k_REF_COUNTER_ADDRESS(k_REF_COUNTER_ADDRESS),
   .k_SENS_STAT_ADDRESS(k_SENS_STAT_ADDRESS))
u_C28SOI_PM_CONTROL_LR_ASYNC_jtag_interface (
   // JTAG pads
   .tck(tck),       // Test clock 
   .trst_n(trst_n), // Test reset(active low)
   .tdi(tdi),       // Test data input
   .tdo(tdo),       // Test data output
   .tms(tms),       // Test mode selection

   .tcr_noinvert_clk(tcr_noinvert_clk),
   
   // TAP states
   .shift_dr_o(shift_dr),
   .pause_dr_o(), 
   .update_dr_o(update_dr),
   .capture_dr_o(capture_dr),
                
   // Register select signals   
   .bypass_select_o(bypass_select),
   .idcode_select_o(idcode_select),
   .sensor_ctrl_select_o(sensor_ctrl_select),
   .sensor_status_select_o(sensor_status_select),
   .ref_counter_select_o(ref_counter_select),
                               
   // TDI signals
   .bypass_tdi_i(bypass_tdo),
   .idcode_tdi_i(idcode_tdo),   
   .sensor_ctrl_tdi_i(sensor_ctrl_tdo),
   .sensor_status_tdi_i(sensor_status_tdo),
   .ref_counter_tdi_i(ref_counter_tdo),
   
   // Boundary scan control signals
   .bsr_si(1'b0),
   .bsr_mode(),
   .capture_clk(),
   .update_clk(),
   .tdo_en_n(tdo_en_n)  
   );

// Internal Registers
C28SOI_PM_CONTROL_LR_ASYNC_bypass_reg u_C28SOI_PM_CONTROL_LR_ASYNC_bypass_register(
   .reg_tck(tck), 
   .reg_rst_n(trst_n), 
   .reg_tdi(tdi), 
   .reg_shift_enable(bypass_select & shift_dr), 
   .reg_capture_en(bypass_select & capture_dr),    
   .reg_out(bypass_tdo));

C28SOI_PM_CONTROL_LR_ASYNC_idcode_reg #(
   .IDCODE_LENGTH(IDCODE_LENGTH),
   .IDCODE_VALUE(IDCODE_VALUE)) 
u_C28SOI_PM_CONTROL_LR_ASYNC_idcode_register(
   .reg_tck(tck), 
   .reg_rst_n(trst_n), 
   .reg_tdi(tdi), 
   .reg_shift_enable(idcode_select & shift_dr),
   .reg_capture_en(idcode_select & capture_dr),    
   .reg_out(idcode_tdo));

endmodule
