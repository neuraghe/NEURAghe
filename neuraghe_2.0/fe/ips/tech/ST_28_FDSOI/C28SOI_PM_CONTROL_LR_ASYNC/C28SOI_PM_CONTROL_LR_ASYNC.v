// --=========================================================================--
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// -----------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC.v
// version         : 3.1
// -----------------------------------------------------------------------------
// Purpose         : PROMIP top level
// --=========================================================================--
//`define PM_CONTROL_DEBUG_ENABLE 1
module C28SOI_PM_CONTROL_LR_ASYNC (
 
   pmbw_clk, 
   pmbw_rstn, 
   clk,            // Test clock.
   rst_n,          // Test reset(active low). 
   
   // TAP controller inputs / outputs 
   tdi,            // Test data input. 
   tdo,            // Test data output.
   tms,            // Test mode selection. 
   tdo_en_n,       // tdo enable output (active low)

   // APB interface inputs / outputs
   pclk,           // APB  clock
   presetn,        // APB reset
   penable,        // APB enable
   psel,           // APB select
   pwrite,         // APB write control
   paddr,          // APB address bus
   pwdata,         // APB write data bus 
   prdata,         // APB read data bus
   pready,         // APB dataready signal
   pslverr,        // APB error signal
   
   ref_counter_i,    // Parallel access to PROMIP UDR 
   sensor_ctrl_i,    // Parallel access to PROMIP UDR 
   sensor_stat_o,    // Parallel access to PROMIP UDR 

   mode,           // control pin to select PROMIP mode of operation.
    
   aux,            // External input. 
   dataready,      // ready pin to signal PROMIP is ready
                   // to be run again and counter data can be read
   dbg,            // Direct sensor output
   
   //tst_gated_clk1,   // Test mode : clock gating cell test enable pin
   tcr_muxclk_mode,  // Test mode : clock mux select pin 
   tcr_noinvert_clk, // Test mode : inverted clock bypass pin
   tst_reset_mux0,   // Test mode : reset mux select pin 
   // tst_reset_mux1,   // Test mode : reset mux select pin 
   tst_reset_mux2
   );

   /*----------------------------
     Parameters declaration
     ----------------------------*/

    
// PS : Maximum number of sensors that can be instantiated is 63
 // Number of LOGIC lprvt Sensor
 parameter k_count_logic_lprvt_sensor = 1;


 // Number of LOGIC lprvt P4 Sensor
 parameter k_count_logic_lprvt_p4_sensor = 1;

 // Number of LOGIC lprvt P10 Sensor
 parameter k_count_logic_lprvt_p10_sensor = 1;

 
 // Number of LOGIC GO2 Sensor 
 parameter k_count_logic_lprvt_go2_sensor = 1;  
 
  // Number of LOGIC lprvt P16 Sensor
 parameter k_count_logic_lprvt_p16_sensor = 1; 


  // Number of LOGIC lprvt CPR C28SOI_PM_LOGIC_CPR_LR_GATE_TOP Sensor  -----
 parameter k_count_logic_cpr_lprvt_sensor = 1;

 // Number of LOGIC lprvt CPR C28SOI_PM_LOGIC_CPR_LR_RCM5_GATE_TOP Sensor having RCM5 rings sensor  -----
 parameter k_count_logic_cpr_rcm5_lprvt_sensor = 1;

  // Number of LOGIC lprvt CPR C28SOI_PM_LOGIC_CPR_LR_P16_TOP Sensor  -----
 parameter k_count_logic_cpr_p16_lprvt_sensor = 1;
 

       // size of REF_COUNTER
     // only 16 or 32 bits size supported
     parameter k_REF_COUNTER_SIZE = 32;
     
     // size of counters
     // any integer value b/w 16 and 32
     // MSB of counter is reserved for Overflow bit
     parameter k_COUNTER_SIZE = 32;
     parameter k_sensor_period = 10;

   /*--------------------
     Function declaration
     --------------------*/
     function integer f_calc_sensor_status_length; 
        input [31:0] value; 
        begin 
           if (value > 16)
              f_calc_sensor_status_length = 32; 
           else begin
              f_calc_sensor_status_length = 16; 
           end      
        end 
     endfunction 

   /*----------------------------
     Local Parameters declaration
     ----------------------------*/

     // UDR length
     localparam DR_LENGTH = 16;
     localparam IR_LENGTH = 5;
     localparam REF_COUNTER_LENGTH = k_REF_COUNTER_SIZE;
     localparam SENSOR_CTRL_LENGTH = 16;
     // size of SENSOR STATUS REGISTER
     // only 16 or 32 bits size supported, based on COUNTER SIZE
     localparam SENSOR_STAT_LENGTH = f_calc_sensor_status_length(k_COUNTER_SIZE);

     localparam k_SENS_CTRL_ADDRESS   = 5'b00100;
     localparam k_REF_COUNTER_ADDRESS = 5'b01000;
     localparam k_SENS_STAT_ADDRESS   = 5'b01100;

     // Operating modes
     localparam k_APBIF_MODE  = 2'b00;
     localparam k_JTAGIF_MODE = 2'b01;
     localparam k_DEBUG_MODE  = 2'b10;
     localparam k_PARALLEL_MODE  = 2'b11;

     // JTAG TAP parameters
     localparam IDCODE_LENGTH = 32;
     localparam IDCODE_VALUE  = 32'hBA20A005;

     // APB parameters
     localparam k_APB_ADDRESS_LENGTH = 5;
     localparam k_APB_DATA_LENGTH = 32;
     
     

// total type1 sensors (3 rings) 
 localparam k_count_total_sensor_type1 = k_count_logic_lprvt_sensor + k_count_logic_lprvt_p4_sensor + k_count_logic_lprvt_p10_sensor + k_count_logic_lprvt_go2_sensor + k_count_logic_lprvt_p16_sensor ;  

 // total type2 sensors (cpr,4 rings)
 localparam k_count_total_sensor_type2 =  k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + k_count_logic_cpr_p16_lprvt_sensor ;

 // total number of sensors
 localparam k_count_total_sensor = k_count_total_sensor_type1 + k_count_total_sensor_type2;

 // total number of rings
 localparam SENS_RING_COUNT = 3*k_count_total_sensor_type1 + 4*k_count_total_sensor_type2;


   /*----------------
     PORT declaration
     ----------------*/
      input [k_count_total_sensor-1:0] pmbw_clk; //clks of the wrapper 
      input [k_count_total_sensor-1:0] pmbw_rstn; //reset of the wrapper 
      input  clk;                   // Test clock.
      input  rst_n;                // Test reset(active low).
    
      // Test Access Port for JTAG Controller.
      input  tdi;                   // Test data input.
      input  tms;                   // Test mode selection.
      output tdo;                   // Test data output. 
      output tdo_en_n;              // tdo enable output (active low)
    
      // APB inputs / outputs
      input pclk;
      input presetn;
      input penable;
      input psel;
      input pwrite;
      input  [31:0] paddr;
      input  [31:0]    pwdata;
      output [31:0]    prdata;  
      output pready;
      output pslverr;
      
      input  [REF_COUNTER_LENGTH-1:0] ref_counter_i;
      input  [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_i;
      output [SENSOR_STAT_LENGTH-1:0] sensor_stat_o;
    
      input [1:0] mode;  // to select PROMIP mode of operation
    
      // Auxiliary input and debug output port
      input  [15:0] aux;  // External input.
      output dataready;   // counter data is available and promip is ready 
      output dbg;                   // Direct sensor output.
      
      // Test Mode Control Pins
      input tcr_muxclk_mode;  // Test mode : clock mux select pin 
      input tcr_noinvert_clk; // Test mode : inverted clock bypass pin
      input tst_reset_mux0;   // Test mode : reset mux select pin 
      input tst_reset_mux2;   // Test mode : reset mux select pin 
      

      
//---------------------------------------------------------
// Wire & Reg Declaration
//---------------------------------------------------------
    
      wire [k_count_total_sensor-1:0] pmbw_clk; //clks of the wrapper 
      wire [k_count_total_sensor-1:0] pmbw_rstn; //reset of the wrapper 


    	// Generate variable index
    
 	genvar g_lprvt_core;
 	genvar g_lprvt_p4_core;
 	genvar g_lprvt_p10_core;
 	genvar g_lprvt_go2_core; 
 	genvar g_lprvt_p16_core;

 	genvar g_cpr_lprvt_core;
	genvar g_cpr_rcm5_lprvt_core;
	genvar g_cpr_p16_lprvt_core;

	
    wire serial_in;
    wire [k_count_total_sensor-1:0] serial_out;
    wire [k_count_total_sensor-1:0] shift_en;
    wire [k_count_total_sensor-1:0] select_ctr;

    wire [SENS_RING_COUNT-1:0] sensors_data;

    wire [k_count_total_sensor-1:0] ring_osc_clk;
    //wire rst_n_out;
    
    // handshake signals for sync serial transfer
    wire [k_count_total_sensor-1:0] pmbw_req;
    wire [k_count_total_sensor-1:0] pmbw_ack;

//---------------------------------------------------------
// Netlist Declaration
//---------------------------------------------------------
  `ifdef PM_CONTROL_DEBUG_ENABLE
  `else
     assign sensors_data = {SENS_RING_COUNT{1'b0}};

  `endif

//-------------------------------------k_count_logic_lprvt_sensor--------------------------------------------------------------------
`ifdef PM_CONTROL_DEBUG_ENABLE 
generate for (g_lprvt_core=1; g_lprvt_core<=k_count_logic_lprvt_sensor; g_lprvt_core=g_lprvt_core+1) begin : gen_logic_lprvt_pmb_wrapper
 C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper #(
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_period_speed(k_sensor_period*g_lprvt_core),
      .k_period_leak(k_sensor_period*g_lprvt_core),
      .k_logic_lprvt(1'b1),
      .k_logic_lprvt_p4(1'b0),
      .k_logic_lprvt_p10(1'b0),
      .k_logic_lprvt_go2(1'b0),
      .k_logic_lprvt_p16(1'b0))
   u_C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper (
  
   .pmbw_clk(pmbw_clk[g_lprvt_core-1]),
   .pmbw_rstn(pmbw_rstn[g_lprvt_core-1]),
   .pmbw_req(pmbw_req[g_lprvt_core-1]),
   .pmbw_ack(pmbw_ack[g_lprvt_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[g_lprvt_core-1]),
   .shift_en(shift_en[g_lprvt_core-1]),
   .select_ctr(select_ctr[g_lprvt_core-1]),
   .SPEEDOUT_NMOS(sensors_data[(g_lprvt_core-1)*3]),
   .SPEEDOUT_PMOS(sensors_data[(g_lprvt_core-1)*3+1]),
   .LEAK_OUT(sensors_data[(g_lprvt_core-1)*3+2]),
   .ring_osc_clk(ring_osc_clk[g_lprvt_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
// defparam u_logic_lprvt.PERIOD_SPEEDO = 10*g_lprvt_core;
// defparam u_logic_lprvt.PERIOD_LEAKO = 10*g_lprvt_core;
// synopsys translate_on
end
endgenerate
`else   
generate for (g_lprvt_core=1; g_lprvt_core<=k_count_logic_lprvt_sensor; g_lprvt_core=g_lprvt_core+1) begin : gen_logic_lprvt_pmb_wrapper
  C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper #(
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_period_speed(k_sensor_period*g_lprvt_core),
      .k_period_leak(k_sensor_period*g_lprvt_core),
      .k_logic_lprvt(1'b1),
      .k_logic_lprvt_p4(1'b0),
      .k_logic_lprvt_p10(1'b0),
      .k_logic_lprvt_go2(1'b0),
      .k_logic_lprvt_p16(1'b0))
   u_C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper (
   .pmbw_clk(pmbw_clk[g_lprvt_core-1]),
   .pmbw_rstn(pmbw_rstn[g_lprvt_core-1]),
   .pmbw_req(pmbw_req[g_lprvt_core-1]),
   .pmbw_ack(pmbw_ack[g_lprvt_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[g_lprvt_core-1]),
   .shift_en(shift_en[g_lprvt_core-1]),
   .select_ctr(select_ctr[g_lprvt_core-1]),
   .ring_osc_clk(ring_osc_clk[g_lprvt_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
// defparam u_logic_lprvt.PERIOD_SPEEDO = 10*g_lprvt_core;
// defparam u_logic_lprvt.PERIOD_LEAKO = 10*g_lprvt_core;
// synopsys translate_on
end
endgenerate
`endif   


//-----------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------k_count_logic_lprvt_p4_sensor--------------------------------------------------------------------
`ifdef PM_CONTROL_DEBUG_ENABLE
generate for (g_lprvt_p4_core=1; g_lprvt_p4_core<=k_count_logic_lprvt_p4_sensor; g_lprvt_p4_core=g_lprvt_p4_core+1) begin : gen_logic_lprvt_p4_pmb_wrapper
  C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper #(
      .k_period_speed(k_sensor_period*(k_count_logic_lprvt_sensor +  g_lprvt_p4_core)),
      .k_period_leak(k_sensor_period*(k_count_logic_lprvt_sensor +  g_lprvt_p4_core)),
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_logic_lprvt(1'b0),      
      .k_logic_lprvt_p4(1'b1),
      .k_logic_lprvt_p10(1'b0),
      .k_logic_lprvt_go2(1'b0),
      .k_logic_lprvt_p16(1'b0))
   u_C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper (
   .pmbw_clk(pmbw_clk[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .pmbw_req(pmbw_req[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .pmbw_ack(pmbw_ack[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .shift_en(shift_en[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .select_ctr(select_ctr[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .SPEEDOUT_NMOS(sensors_data[(k_count_logic_lprvt_sensor+g_lprvt_p4_core-1)*3]),
   .SPEEDOUT_PMOS(sensors_data[(k_count_logic_lprvt_sensor+g_lprvt_p4_core-1)*3+1]),
   .LEAK_OUT(sensors_data[(k_count_logic_lprvt_sensor+g_lprvt_p4_core-1)*3+2]),
   .ring_osc_clk(ring_osc_clk[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
//defparam u_logic_lprvt_p4.PERIOD_SPEEDO = 10*(k_count_logic_lprvt_sensor +   g_lprvt_p4_core);
//defparam u_logic_lprvt_p4.PERIOD_LEAKO = 10*(k_count_logic_lprvt_sensor +   g_lprvt_p4_core);
// synopsys translate_on
end
endgenerate
`else   
generate for (g_lprvt_p4_core=1; g_lprvt_p4_core<=k_count_logic_lprvt_p4_sensor; g_lprvt_p4_core=g_lprvt_p4_core+1) begin : gen_logic_lprvt_p4_pmb_wrapper
  C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper #(
      .k_period_speed(k_sensor_period*(k_count_logic_lprvt_sensor +  g_lprvt_p4_core)),
      .k_period_leak(k_sensor_period*(k_count_logic_lprvt_sensor +   g_lprvt_p4_core)),
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_logic_lprvt(1'b0),      
      .k_logic_lprvt_p4(1'b1),
      .k_logic_lprvt_p10(1'b0),
      .k_logic_lprvt_go2(1'b0),
      .k_logic_lprvt_p16(1'b0))
   u_C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper (
   .pmbw_clk(pmbw_clk[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .pmbw_req(pmbw_req[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .pmbw_ack(pmbw_ack[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .shift_en(shift_en[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .select_ctr(select_ctr[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .ring_osc_clk(ring_osc_clk[k_count_logic_lprvt_sensor+g_lprvt_p4_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
//defparam u_logic_lprvt_p4.PERIOD_SPEEDO = 10*(k_count_logic_lprvt_sensor +  g_lprvt_p4_core);
//defparam u_logic_lprvt_p4.PERIOD_LEAKO = 10*(k_count_logic_lprvt_sensor +  g_lprvt_p4_core);
// synopsys translate_on
end
endgenerate
`endif   
//-----------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------k_count_logic_lprvt_p10_sensor--------------------------------------------------------------------
`ifdef PM_CONTROL_DEBUG_ENABLE
generate for (g_lprvt_p10_core=1; g_lprvt_p10_core<=k_count_logic_lprvt_p10_sensor; g_lprvt_p10_core=g_lprvt_p10_core+1) begin : gen_logic_lprvt_p10_pmb_wrapper
  C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper #(
      .k_period_speed(k_sensor_period*(k_count_logic_lprvt_sensor +k_count_logic_lprvt_p4_sensor + g_lprvt_p10_core)),
      .k_period_leak(k_sensor_period*(k_count_logic_lprvt_sensor +k_count_logic_lprvt_p4_sensor + g_lprvt_p10_core)),
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_logic_lprvt(1'b0),      
      .k_logic_lprvt_p4(1'b0),
      .k_logic_lprvt_p10(1'b1),
      .k_logic_lprvt_go2(1'b0),
      .k_logic_lprvt_p16(1'b0))
   u_C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper (
   .pmbw_clk(pmbw_clk[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .pmbw_req(pmbw_req[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .pmbw_ack(pmbw_ack[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .shift_en(shift_en[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .select_ctr(select_ctr[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .SPEEDOUT_NMOS(sensors_data[(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1)*3]),
   .SPEEDOUT_PMOS(sensors_data[(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1)*3+1]),
   .LEAK_OUT(sensors_data[(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1)*3+2]),
   .ring_osc_clk(ring_osc_clk[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
//defparam u_logic_lprvt_p10.PERIOD_SPEEDO = 10*(k_count_logic_lprvt_sensor + k_count_logic_lprvt_p4_sensor + g_lprvt_p10_core);
//defparam u_logic_lprvt_p10.PERIOD_LEAKO = 10*(k_count_logic_lprvt_sensor + k_count_logic_lprvt_p4_sensor + g_lprvt_p10_core);
// synopsys translate_on
end
endgenerate
`else   
generate for (g_lprvt_p10_core=1; g_lprvt_p10_core<=k_count_logic_lprvt_p10_sensor; g_lprvt_p10_core=g_lprvt_p10_core+1) begin : gen_logic_lprvt_p10_pmb_wrapper
  C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper #(
      .k_period_speed(k_sensor_period*(k_count_logic_lprvt_sensor + k_count_logic_lprvt_p4_sensor +g_lprvt_p10_core)),
      .k_period_leak(k_sensor_period*(k_count_logic_lprvt_sensor +  k_count_logic_lprvt_p4_sensor + g_lprvt_p10_core)),
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_logic_lprvt(1'b0),      
      .k_logic_lprvt_p4(1'b0),
      .k_logic_lprvt_p10(1'b1),
      .k_logic_lprvt_go2(1'b0),
      .k_logic_lprvt_p16(1'b0))
   u_C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper (
   .pmbw_clk(pmbw_clk[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .pmbw_req(pmbw_req[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .pmbw_ack(pmbw_ack[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .shift_en(shift_en[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .select_ctr(select_ctr[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .ring_osc_clk(ring_osc_clk[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+g_lprvt_p10_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
//defparam u_logic_lprvt_p10.PERIOD_SPEEDO = 10*(k_count_logic_lprvt_sensor + k_count_logic_lprvt_p4_sensor + g_lprvt_p10_core);
//defparam u_logic_lprvt_p10.PERIOD_LEAKO = 10*(k_count_logic_lprvt_sensor +k_count_logic_lprvt_p4_sensor + g_lprvt_p10_core);
// synopsys translate_on
end
endgenerate
`endif   

//-----------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------k_count_logic_lprvt_go2_sensor--------------------------------------------------------------------
`ifdef PM_CONTROL_DEBUG_ENABLE
generate for (g_lprvt_go2_core=1; g_lprvt_go2_core<=k_count_logic_lprvt_go2_sensor; g_lprvt_go2_core=g_lprvt_go2_core+1) begin : gen_logic_go2_pmb_wrapper
  C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper #(
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_period_speed(k_sensor_period*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core)), 
      .k_period_leak(k_sensor_period*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor +g_lprvt_go2_core)), 
      .k_logic_lprvt(1'b0),      
      .k_logic_lprvt_p4(1'b0),
      .k_logic_lprvt_p10(1'b0),      
      .k_logic_lprvt_go2(1'b1),
      .k_logic_lprvt_p16(1'b0))
   u_C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper (
   .pmbw_clk(pmbw_clk[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .pmbw_req(pmbw_req[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .pmbw_ack(pmbw_ack[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]), 
   .shift_en(shift_en[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .select_ctr(select_ctr[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .SPEEDOUT_NMOS(sensors_data[(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1)*3]),
   .SPEEDOUT_PMOS(sensors_data[(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1)*3+1]),
   .LEAK_OUT(sensors_data[(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1)*3+2]),
   .ring_osc_clk(ring_osc_clk[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
//defparam u_logic_od18.PERIOD_SPEEDO = 10*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor +g_lprvt_go2_core);
//defparam u_logic_od18.PERIOD_LEAKO = 10*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor + g_lprvt_go2_core);
// synopsys translate_on
end
endgenerate
`else   
generate for  (g_lprvt_go2_core=1; g_lprvt_go2_core<=k_count_logic_lprvt_go2_sensor; g_lprvt_go2_core=g_lprvt_go2_core+1) begin : gen_logic_go2_pmb_wrapper 
 C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper #(
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_period_speed(k_sensor_period*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+ g_lprvt_go2_core)), 
      .k_period_leak(k_sensor_period*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor + g_lprvt_go2_core)),
      .k_logic_lprvt(1'b0),      
      .k_logic_lprvt_p4(1'b0),
      .k_logic_lprvt_p10(1'b0),      
      .k_logic_lprvt_go2(1'b1),
      .k_logic_lprvt_p16(1'b0))
   u_C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper (
   .pmbw_clk(pmbw_clk[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .pmbw_req(pmbw_req[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .pmbw_ack(pmbw_ack[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .shift_en(shift_en[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .select_ctr(select_ctr[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .ring_osc_clk(ring_osc_clk[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+g_lprvt_go2_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
//defparam u_logic_od18.PERIOD_SPEEDO = 10*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+ g_lprvt_go2_core);
//defparam u_logic_od18.PERIOD_LEAKO = 10*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor + g_lprvt_go2_core);
// synopsys translate_on
end
endgenerate
`endif


//-----------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------k_count_logic_lprvt_p16_sensor--------------------------------------------------------------------
`ifdef PM_CONTROL_DEBUG_ENABLE
generate for (g_lprvt_p16_core=1; g_lprvt_p16_core<=k_count_logic_lprvt_p16_sensor; g_lprvt_p16_core=g_lprvt_p16_core+1) begin : gen_logic_lprvt_p16_pmb_wrapper
  C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper #(
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_period_speed(k_sensor_period*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core)), 
      .k_period_leak(k_sensor_period*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core)), 
      .k_logic_lprvt(1'b0),      
      .k_logic_lprvt_p4(1'b0),
      .k_logic_lprvt_p10(1'b0),      
      .k_logic_lprvt_go2(1'b0),
      .k_logic_lprvt_p16(1'b1))
   u_C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper (
   .pmbw_clk(pmbw_clk[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .pmbw_req(pmbw_req[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .pmbw_ack(pmbw_ack[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]), 
   .shift_en(shift_en[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .select_ctr(select_ctr[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .SPEEDOUT_NMOS(sensors_data[(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1)*3]),
   .SPEEDOUT_PMOS(sensors_data[(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1)*3+1]),
   .LEAK_OUT(sensors_data[(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1)*3+2]),
   .ring_osc_clk(ring_osc_clk[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
//defparam u_logic_od18.PERIOD_SPEEDO = 10*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor +g_lprvt_p16_core);
//defparam u_logic_od18.PERIOD_LEAKO = 10*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor + g_lprvt_p16_core);
// synopsys translate_on
end
endgenerate
`else   
generate for  (g_lprvt_p16_core=1; g_lprvt_p16_core<=k_count_logic_lprvt_p16_sensor; g_lprvt_p16_core=g_lprvt_p16_core+1) begin : gen_logic_lprvt_p16_pmb_wrapper 
 C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper #(
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_period_speed(k_sensor_period*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core)), 
      .k_period_leak(k_sensor_period*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core)), 
      .k_logic_lprvt(1'b0),      
      .k_logic_lprvt_p4(1'b0),
      .k_logic_lprvt_p10(1'b0),      
      .k_logic_lprvt_go2(1'b0),
      .k_logic_lprvt_p16(1'b1))
   u_C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper (
   .pmbw_clk(pmbw_clk[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .pmbw_req(pmbw_req[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .pmbw_ack(pmbw_ack[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .shift_en(shift_en[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .select_ctr(select_ctr[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .ring_osc_clk(ring_osc_clk[k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+k_count_logic_lprvt_go2_sensor+g_lprvt_p16_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
//defparam u_logic_od18.PERIOD_SPEEDO = 10*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor+ g_lprvt_p16_core);
//defparam u_logic_od18.PERIOD_LEAKO = 10*(k_count_logic_lprvt_sensor+k_count_logic_lprvt_p4_sensor+k_count_logic_lprvt_p10_sensor + g_lprvt_p16_core);
// synopsys translate_on
end
endgenerate
`endif


//-----------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------TYPE 2 SENSORS-----------------------------------------------------------------------------------
//-------------------------------------k_count_logic_cpr_lprvt_sensor--------------------------------------------------------------------
`ifdef PM_CONTROL_DEBUG_ENABLE
generate for (g_cpr_lprvt_core=1; g_cpr_lprvt_core<=k_count_logic_cpr_lprvt_sensor; g_cpr_lprvt_core=g_cpr_lprvt_core+1) begin : gen_logic_cpr_lprvt_pmb_wrapper
   C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper #(
      .k_period_ring_1(k_sensor_period*(k_count_total_sensor_type1 + g_cpr_lprvt_core)),
      .k_period_ring_2(k_sensor_period*(k_count_total_sensor_type1 + g_cpr_lprvt_core)),
      .k_period_ring_3(k_sensor_period*(k_count_total_sensor_type1 + g_cpr_lprvt_core)),
      .k_period_ring_4(k_sensor_period*(k_count_total_sensor_type1 + g_cpr_lprvt_core)),
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_logic_cpr_lr(1'b1),
      .k_logic_cpr_lr_rcm5(1'b0),
      .k_logic_cpr_lr_p16(1'b0))       
   u_C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper(
   .pmbw_clk(pmbw_clk[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .pmbw_req(pmbw_req[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .pmbw_ack(pmbw_ack[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .shift_en(shift_en[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .select_ctr(select_ctr[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .LOGICCPR_1(sensors_data[(k_count_total_sensor_type1*3+(g_cpr_lprvt_core-1)*4)]),
   .LOGICCPR_2(sensors_data[(k_count_total_sensor_type1*3+(g_cpr_lprvt_core-1)*4)+1]),
   .LOGICCPR_3(sensors_data[(k_count_total_sensor_type1*3+(g_cpr_lprvt_core-1)*4)+2]),
   .LOGICCPR_4(sensors_data[(k_count_total_sensor_type1*3+(g_cpr_lprvt_core-1)*4)+3]),
   .ring_osc_clk(ring_osc_clk[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
// synopsys translate_on
end
endgenerate
`else   
generate for (g_cpr_lprvt_core=1; g_cpr_lprvt_core<=k_count_logic_cpr_lprvt_sensor; g_cpr_lprvt_core=g_cpr_lprvt_core+1) begin : gen_logic_cpr_lprvt_pmb_wrapper
   C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper #(
      .k_period_ring_1(k_sensor_period*(k_count_total_sensor_type1 + g_cpr_lprvt_core)),
      .k_period_ring_2(k_sensor_period*(k_count_total_sensor_type1 + g_cpr_lprvt_core)),
      .k_period_ring_3(k_sensor_period*(k_count_total_sensor_type1 + g_cpr_lprvt_core)),
      .k_period_ring_4(k_sensor_period*(k_count_total_sensor_type1 + g_cpr_lprvt_core)),
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_logic_cpr_lr(1'b1),
      .k_logic_cpr_lr_rcm5(1'b0),
      .k_logic_cpr_lr_p16(1'b0)) 
   u_C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper(
   .pmbw_clk(pmbw_clk[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .pmbw_req(pmbw_req[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .pmbw_ack(pmbw_ack[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .shift_en(shift_en[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .select_ctr(select_ctr[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .ring_osc_clk(ring_osc_clk[k_count_total_sensor_type1+g_cpr_lprvt_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
// synopsys translate_on
end
endgenerate
`endif   
//-----------------------------------------------------------------------------------------------------------------------------------


//-------------------------------------k_count_logic_cpr_rcm5_lprvt_sensor--------------------------------------------------------------------
`ifdef PM_CONTROL_DEBUG_ENABLE
generate for (g_cpr_rcm5_lprvt_core=1; g_cpr_rcm5_lprvt_core<=k_count_logic_cpr_rcm5_lprvt_sensor; g_cpr_rcm5_lprvt_core=g_cpr_rcm5_lprvt_core+1) begin : gen_logic_cpr_rcm5_lprvt_pmb_wrapper
   C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper #(
      .k_period_ring_1(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + g_cpr_rcm5_lprvt_core)),
      .k_period_ring_2(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + g_cpr_rcm5_lprvt_core)),
      .k_period_ring_3(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + g_cpr_rcm5_lprvt_core)),
      .k_period_ring_4(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + g_cpr_rcm5_lprvt_core)),
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_logic_cpr_lr(1'b0),
      .k_logic_cpr_lr_rcm5(1'b1),
      .k_logic_cpr_lr_p16(1'b0)) 
   u_C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper(
   .pmbw_clk(pmbw_clk[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .pmbw_req(pmbw_req[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .pmbw_ack(pmbw_ack[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .shift_en(shift_en[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .select_ctr(select_ctr[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .LOGICCPR_1(sensors_data[(k_count_total_sensor_type1*3 +(k_count_logic_cpr_lprvt_sensor+ g_cpr_rcm5_lprvt_core-1)*4)]),
   .LOGICCPR_2(sensors_data[(k_count_total_sensor_type1*3 +(k_count_logic_cpr_lprvt_sensor+ g_cpr_rcm5_lprvt_core-1)*4)+1]),
   .LOGICCPR_3(sensors_data[(k_count_total_sensor_type1*3 +(k_count_logic_cpr_lprvt_sensor+ g_cpr_rcm5_lprvt_core-1)*4)+2]),
   .LOGICCPR_4(sensors_data[(k_count_total_sensor_type1*3 +(k_count_logic_cpr_lprvt_sensor+ g_cpr_rcm5_lprvt_core-1)*4)+3]),
   .ring_osc_clk(ring_osc_clk[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+ g_cpr_rcm5_lprvt_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
// synopsys translate_on
end
endgenerate
`else   
generate for (g_cpr_rcm5_lprvt_core=1; g_cpr_rcm5_lprvt_core<=k_count_logic_cpr_rcm5_lprvt_sensor; g_cpr_rcm5_lprvt_core=g_cpr_rcm5_lprvt_core+1) begin : gen_logic_cpr_rcm5_lprvt_pmb_wrapper
   C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper #(
      .k_period_ring_1(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + g_cpr_rcm5_lprvt_core)),
      .k_period_ring_2(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + g_cpr_rcm5_lprvt_core)),
      .k_period_ring_3(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + g_cpr_rcm5_lprvt_core)),
      .k_period_ring_4(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + g_cpr_rcm5_lprvt_core)),
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_logic_cpr_lr(1'b0),
      .k_logic_cpr_lr_rcm5(1'b1),
      .k_logic_cpr_lr_p16(1'b0)) 
   u_C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper(
   .pmbw_clk(pmbw_clk[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .pmbw_req(pmbw_req[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .pmbw_ack(pmbw_ack[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .shift_en(shift_en[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .select_ctr(select_ctr[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .ring_osc_clk(ring_osc_clk[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor+g_cpr_rcm5_lprvt_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
// synopsys translate_on
end
endgenerate
`endif   

//-----------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------k_count_logic_cpr_p16_lprvt_sensor--------------------------------------------------------------------
`ifdef PM_CONTROL_DEBUG_ENABLE
generate for (g_cpr_p16_lprvt_core=1; g_cpr_p16_lprvt_core<=k_count_logic_cpr_p16_lprvt_sensor; g_cpr_p16_lprvt_core=g_cpr_p16_lprvt_core+1) begin : gen_logic_cpr_p16_lprvt_pmb_wrapper
   C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper #(
      .k_period_ring_1(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core)),
      .k_period_ring_2(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core)),
      .k_period_ring_3(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core)),
      .k_period_ring_4(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core)),
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_logic_cpr_lr(1'b0),
      .k_logic_cpr_lr_rcm5(1'b0),
      .k_logic_cpr_lr_p16(1'b1)) 
   u_C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper(
   .pmbw_clk(pmbw_clk[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .pmbw_req(pmbw_req[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .pmbw_ack(pmbw_ack[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .shift_en(shift_en[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .select_ctr(select_ctr[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .LOGICCPR_1(sensors_data[(k_count_total_sensor_type1*3 +(k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1)*4)]),
   .LOGICCPR_2(sensors_data[(k_count_total_sensor_type1*3 +(k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1)*4)+1]),
   .LOGICCPR_3(sensors_data[(k_count_total_sensor_type1*3 +(k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1)*4)+2]),
   .LOGICCPR_4(sensors_data[(k_count_total_sensor_type1*3 +(k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1)*4)+3]),
   .ring_osc_clk(ring_osc_clk[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
// synopsys translate_on
end
endgenerate
`else   
generate for (g_cpr_p16_lprvt_core=1; g_cpr_p16_lprvt_core<=k_count_logic_cpr_p16_lprvt_sensor; g_cpr_p16_lprvt_core=g_cpr_p16_lprvt_core+1) begin : gen_logic_cpr_p16_lprvt_pmb_wrapper
   C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper #(
      .k_period_ring_1(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core)),
      .k_period_ring_2(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core)),
      .k_period_ring_3(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core)),
      .k_period_ring_4(k_sensor_period*(k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core)),
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .k_logic_cpr_lr(1'b0),
      .k_logic_cpr_lr_rcm5(1'b0),
      .k_logic_cpr_lr_p16(1'b1)) 
   u_C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper(
   .pmbw_clk(pmbw_clk[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .pmbw_rstn(pmbw_rstn[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .serial_in(serial_in),
   .serial_out(serial_out[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .pmbw_req(pmbw_req[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .pmbw_ack(pmbw_ack[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .shift_en(shift_en[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .select_ctr(select_ctr[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .ring_osc_clk(ring_osc_clk[k_count_total_sensor_type1 +k_count_logic_cpr_lprvt_sensor + k_count_logic_cpr_rcm5_lprvt_sensor + g_cpr_p16_lprvt_core-1]),
   .tcr_muxclk_mode(tcr_muxclk_mode),
   .tst_reset_mux2(tst_reset_mux2)
   );
// defparams inside generate block not supported in synthesis tool
// synopsys translate_off
// synopsys translate_on
end
endgenerate
`endif   
//-----------------------------------------------------------------------------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------------------------------------

C28SOI_PM_CONTROL_LR_ASYNC_master_controller #(
      .k_count_total_sensor(k_count_total_sensor),
      .DR_LENGTH(DR_LENGTH),
      .REF_COUNTER_LENGTH(REF_COUNTER_LENGTH),
      .SENSOR_CTRL_LENGTH(SENSOR_CTRL_LENGTH),
      .SENSOR_STAT_LENGTH(SENSOR_STAT_LENGTH),
      .k_COUNTER_SIZE(k_COUNTER_SIZE),
      .IR_LENGTH(IR_LENGTH),
      .k_SENS_CTRL_ADDRESS(k_SENS_CTRL_ADDRESS),
      .k_REF_COUNTER_ADDRESS(k_REF_COUNTER_ADDRESS),
      .k_SENS_STAT_ADDRESS(k_SENS_STAT_ADDRESS),
      .k_APBIF_MODE(k_APBIF_MODE),
      .k_JTAGIF_MODE(k_JTAGIF_MODE),
      .k_DEBUG_MODE(k_DEBUG_MODE),
      .k_PARALLEL_MODE(k_PARALLEL_MODE),
      .IDCODE_LENGTH(IDCODE_LENGTH),
      .IDCODE_VALUE(IDCODE_VALUE),
      .k_APB_ADDRESS_LENGTH(k_APB_ADDRESS_LENGTH),
      .k_APB_DATA_LENGTH(k_APB_DATA_LENGTH),
      .SENS_RING_COUNT(SENS_RING_COUNT)) 

   u_C28SOI_PM_CONTROL_LR_ASYNC_master_controller (
      .clk(clk),            // Test clock.
      .rst_n(rst_n),          // Test reset(active low). 
      
      // TAP controller inputs / outputs 
      .tdi(tdi),            // Test data input. 
      .tdo(tdo),            // Test data output.
      .tms(tms),            // Test mode selection. 
      .tdo_en_n(tdo_en_n),       // tdo enable output (active low)

      // APB interface inputs / outputs
      .pclk(pclk),           // APB  clock
      .presetn(presetn),
      .penable(penable),
      .psel(psel),
      .pwrite(pwrite),
      .paddr(paddr),
      .pwdata(pwdata),
      .prdata(prdata),
      .pready(pready),
      .pslverr(pslverr), 
      
      .ref_counter_i(ref_counter_i),
      .sensor_ctrl_i(sensor_ctrl_i),
      .sensor_stat_o(sensor_stat_o),

      .mode(mode),
       
      .aux(aux),            // External input. 
      .dbg(dbg),            // Direct sensor output

      .dataready(dataready),
      
      // I/O to PMB Logic Wrapper
      .serial_out(serial_out),
      .sensors_data(sensors_data),
      // .sclk(sclk),
      // .rst_n_out(rst_n_out),
      .serial_in(serial_in),
      .shift_en(shift_en),
      .select_ctr(select_ctr),
      .pmbw_req(pmbw_req),
      .pmbw_ack(pmbw_ack),
      
     // .tst_gated_clk1(tst_gated_clk1), // clock gating cell enable for Test mode
      .tcr_muxclk_mode(tcr_muxclk_mode), // Test mode for scan chain.
      .tcr_noinvert_clk(tcr_noinvert_clk), // Test mode for scan chain.
      // .tst_reset_mux1(tst_reset_mux1),   // Test mode
      .tst_reset_mux0(tst_reset_mux0) // Test mode for scan chain.
);

endmodule
