// --=========================================================================--
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// -----------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_master_controller.v
// version         : 3.0
// -----------------------------------------------------------------------------
// Purpose         : PROMIP master controller
// --=========================================================================--

module C28SOI_PM_CONTROL_LR_ASYNC_master_controller (
   
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
   
   // I/O to PMB Logic Wrapper
   serial_out,
   sensors_data,
   // sclk,
   // rst_n_out,
   serial_in,
   shift_en,
   select_ctr,
   pmbw_req,
   pmbw_ack,
   
   //tst_gated_clk1,   // Test mode : clock gating cell test enable pin
   tcr_muxclk_mode,  // Test mode : clock mux select pin 
   tcr_noinvert_clk, // Test mode : inverted clock bypass pin
   // tst_reset_mux1,   // Test mode : reset mux select pin 
   tst_reset_mux0   // Test mode : reset mux select pin 
   );

   /*----------------------------
     Parameters declaration
     ----------------------------*/

     // PS : Maximum number of sensors that can be instantiated is 63

     // total number of sensors
     parameter k_count_total_sensor = 4;

     // UDR length
     parameter DR_LENGTH = 16;
     parameter REF_COUNTER_LENGTH = 32;
     parameter SENSOR_CTRL_LENGTH = 16;
     parameter SENSOR_STAT_LENGTH = 32;
     parameter k_COUNTER_SIZE = 32;
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

     // number of rings 
     parameter SENS_RING_COUNT = 12;
   
   /*-----------------
     Ports declaration
     -----------------*/

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
    // input tst_gated_clk1;   // Test mode : clock gating cell test enable pin
     input tcr_muxclk_mode;  // Test mode : clock mux select pin 
     input tcr_noinvert_clk; // Test mode : inverted clock bypass pin
     input tst_reset_mux0;   // Test mode : reset mux select pin 
     // input tst_reset_mux1;   // Test mode : reset mux select pin 
     
     // I/O to PMB Logic Wrapper
     input [k_count_total_sensor-1:0] serial_out;
     input [SENS_RING_COUNT-1:0] sensors_data;
     // output sclk;
     // output rst_n_out;
     output serial_in;
     output [k_count_total_sensor-1:0] shift_en;
     output [k_count_total_sensor-1:0] select_ctr;
     output [k_count_total_sensor-1:0] pmbw_req;
     input  [k_count_total_sensor-1:0] pmbw_ack;


   /*--------------------
     Function declaration
     --------------------*/
     function integer f_calc_log2; 
        input [31:0] value; 
        integer value_int;
        begin 
           value_int = value-1;
           if (value == 1)
              f_calc_log2 = 1; 
           else begin
              for (f_calc_log2 = 0; value_int > 0; f_calc_log2 = f_calc_log2 + 1) begin
                 value_int = value_int >> 1; 
              end   
           end      
        end 
     endfunction 

      function integer f_calc_sensor_count_bits; 
        input [31:0] value; 
        integer value_int;
        begin 
           value_int = value;
           if (value == 1)
              f_calc_sensor_count_bits = 1; 
           else begin
              for (f_calc_sensor_count_bits = 0; value_int> 0; f_calc_sensor_count_bits = f_calc_sensor_count_bits + 1) begin
                 value_int = value_int>> 1; 
              end   
           end      
       end 
     endfunction 
    
   /*----------------------
     localparam declaration
     ----------------------*/

     // number of bits required for counting sensors 
     // log2(k_count_total_sensor)
     //localparam SENS_COUNT_BITS = f_calc_sensor_count_bits(k_count_total_sensor);

     // number of bits required for counting rings 
     // log2(SENS_RING_COUNT-1)
     localparam SENS_RING_COUNT_BITS = f_calc_log2(SENS_RING_COUNT);
      
//---------------------------------------------------------
// Wire & Reg Declaration
//---------------------------------------------------------

    wire sclk;
    wire i_resetn;
    
    wire [SENSOR_CTRL_LENGTH-1:0]  sensor_ctrl;
    wire [SENSOR_STAT_LENGTH-1:0]  sensor_status;
    wire [REF_COUNTER_LENGTH-1:0]  ref_counter;

    wire [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_parallel_in;
    wire [REF_COUNTER_LENGTH-1:0] ref_counter_parallel_in;
    
    wire sensor_ctrl_so;
    wire sensor_status_so;
    wire ref_counter_so;
 
    wire sensor_ctrl_select;
    wire sensor_status_select;
    wire ref_counter_select;

    wire capture;
    wire shift;
    wire write;
    wire update;
    
    wire debug_enable;
    wire parallel_enable_sens_ctrl;
    wire parallel_enable_ref_ctr;
    wire parallel_enable_sens_stat;
    wire dataready_parallel_port;
    
    // control and data signals for writing 
    // new value in sensor control register
    // from sensor interface after sensors have stopped running
    wire sensor_ctrl_select_from_sensor_if;
    wire write_from_sensor_if;
    wire [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_o_from_sensor_if;
      
    // Generate variable index
    genvar g_lpsvt_core;
    genvar g_lplvt_core;
    genvar g_go2_core;
    genvar g_lpsvt_sram;
    
    wire serial_in;
    wire [k_count_total_sensor-1:0] serial_out;
    wire [k_count_total_sensor-1:0] shift_en;
    wire [k_count_total_sensor-1:0] select_ctr;
    wire [k_count_total_sensor-1:0] pmbw_req;
    wire [k_count_total_sensor-1:0] pmbw_ack;

    wire [SENS_RING_COUNT-1:0] sensors_data;

    // wire rst_n_out;
    
    // wire  [k_APB_ADDRESS_LENGTH-1:0] w_paddr;
    reg  [k_APB_ADDRESS_LENGTH-1:0] w_paddr;

//---------------------------------------------------------
// Netlist Declaration
//---------------------------------------------------------
// assign w_paddr[k_APB_ADDRESS_LENGTH-1:0] = paddr[k_APB_ADDRESS_LENGTH-1:0];
   always @(paddr) begin
      w_paddr[k_APB_ADDRESS_LENGTH-1:0] = paddr[k_APB_ADDRESS_LENGTH-1:0];
   end

   C28SOI_PM_CONTROL_LR_ASYNC_promip_sensor_if #(
    .DR_LENGTH(DR_LENGTH),
    .REF_COUNTER_LENGTH(REF_COUNTER_LENGTH),
    .SENSOR_CTRL_LENGTH(SENSOR_CTRL_LENGTH),
    .SENSOR_STAT_LENGTH(SENSOR_STAT_LENGTH),
    .k_COUNTER_SIZE(k_COUNTER_SIZE),
    .SENS_COUNT(k_count_total_sensor),
  //  .SENS_COUNT_BITS(SENS_COUNT_BITS),
    .SENS_RING_COUNT(SENS_RING_COUNT),
    .SENS_RING_COUNT_BITS(SENS_RING_COUNT_BITS)
    )
    u_C28SOI_PM_CONTROL_LR_ASYNC_promip_sensor_if(
   
   .clk(sclk),            // Test clock.
   .rst_n(i_resetn),        // Test reset(active low). 
   // .rst_n_out(rst_n_out), // reset output with Lock Up Latch
   
   .sensor_ctrl(sensor_ctrl),       // sensor control register input
   .sensor_status(sensor_status),           // sensor status register output
   .ref_counter(ref_counter),       // reference counter input
   
   .sensor_ctrl_select(sensor_ctrl_select_from_sensor_if),
   .write(write_from_sensor_if),
   .sensor_ctrl_o(sensor_ctrl_o_from_sensor_if),

   .dataready(dataready),
   .dataready_parallel_port(dataready_parallel_port),
   
   .aux(aux),            // External input. 
   .dbg(dbg),            // Direct sensor output

   // input(ouput) for(from) pmb logic wrapper
   .sensors_data(sensors_data), // direct sensor output from all sensors
   .serial_out(serial_out), // serial ouput from all pmb logic wrapper
   .serial_in(serial_in), // serial input for all pmb logic wrapper
   .shift_en(shift_en),  // shift enable signal for all pmb logic wrappers
   .select_ctr(select_ctr), // select counter serial chain for all pmb logic wrapper
   .pmbw_req(pmbw_req), // Request signal to PMB all Logic Wrapper
   .pmbw_ack(pmbw_ack), // Acknowledge signal from all PMB Logic Wrapper

   
   .tcr_muxclk_mode(tcr_muxclk_mode), // Test mode 
   // .tst_reset_mux1(tst_reset_mux1),   // Test mode
   .debug_enable(debug_enable)      // debug mode enable pin
   
   );

C28SOI_PM_CONTROL_LR_ASYNC_promip_register_if #(
   .REF_COUNTER_LENGTH(REF_COUNTER_LENGTH),
   .SENSOR_CTRL_LENGTH(SENSOR_CTRL_LENGTH),
   .SENSOR_STAT_LENGTH(SENSOR_STAT_LENGTH)) 

   u_C28SOI_PM_CONTROL_LR_ASYNC_promip_register_if (
   
   .clk(sclk),         // Test clock 
   .rst_n(i_resetn),     // Test reset(active low)
   .serial_in(tdi),   // serial input data
   .sensor_ctrl_parallel_in(sensor_ctrl_parallel_in),  
   .ref_counter_parallel_in(ref_counter_parallel_in), 

   // Sensor Controller Registers
   .sensor_ctrl(sensor_ctrl),     // Sensor control register parallel input
   .sensor_status(sensor_status),     // Sensor status register parallel output
   .ref_counter(ref_counter),     // Ref counter parallel input data
   
   .sensor_ctrl_so(sensor_ctrl_so),      // Sensor control register serial output
   .sensor_status_so(sensor_status_so),   // Sensor status register serial output
   .ref_counter_so(ref_counter_so),      // Ref counter serial output
   
   .sensor_ctrl_select(sensor_ctrl_select),     // sensor control register select signal
   .sensor_status_select(sensor_status_select), // sensor status register select signal
   .ref_counter_select(ref_counter_select),     // ref counter register select signal

   // register control signals
   .capture(capture),
   .shift(shift),
   .write(write),
   .update(update),
   
   .parallel_enable_sens_ctrl(parallel_enable_sens_ctrl),     // debug mode enable pin
   .parallel_enable_ref_ctr(parallel_enable_ref_ctr),     // debug mode enable pin
   .parallel_enable_sens_stat(parallel_enable_sens_stat),     // debug mode enable pin
   .ref_counter_i(ref_counter_i),
   .sensor_ctrl_i(sensor_ctrl_i),
   .sensor_stat_o(sensor_stat_o)

  );

C28SOI_PM_CONTROL_LR_ASYNC_promip_controller_if #(
     .REF_COUNTER_LENGTH(REF_COUNTER_LENGTH),
     .SENSOR_CTRL_LENGTH(SENSOR_CTRL_LENGTH),
     .SENSOR_STAT_LENGTH(SENSOR_STAT_LENGTH), 
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
     .k_APB_DATA_LENGTH(k_APB_DATA_LENGTH))
   u_C28SOI_PM_CONTROL_LR_ASYNC_promip_controller_if (

   .clk(clk),             // Test clock 
   .rst_n(rst_n),        // Test reset(active low)

   // JTAG pads
   .tdi(tdi),             // Test data input
   .tdo(tdo),             // Test data output
   .tms(tms),             // Test mode selection
   .tdo_en_n(tdo_en_n),   //active low  
            
   // APB ports
   .pclk(pclk),
   .presetn(presetn),
   .penable(penable),
   .psel(psel),
   .pwrite(pwrite),
   .paddr(w_paddr),
   .pwdata(pwdata),
   .prdata(prdata),
   .pready(pready),
   .pslverr(pslverr), 
   .dataready(dataready_parallel_port),
   .dataready_del(dataready),
   .mode(mode),

   //.tst_gated_clk1(tst_gated_clk1), // clock gating cell enable for Test mode
   .tcr_muxclk_mode(tcr_muxclk_mode), // Test mode for scan chain.
   .tcr_noinvert_clk(tcr_noinvert_clk), // Test mode for scan chain.
   .tst_reset_mux0(tst_reset_mux0), // Test mode for scan chain.

   .debug_enable(debug_enable),     // debug mode enable pin
   .parallel_enable_sens_ctrl(parallel_enable_sens_ctrl),     // debug mode enable pin
   .parallel_enable_ref_ctr(parallel_enable_ref_ctr),     // debug mode enable pin
   .parallel_enable_sens_stat(parallel_enable_sens_stat),     // debug mode enable pin
   
   // Promip Registers
   .sensor_ctrl(sensor_ctrl),     // Sensor selection.
   .sensor_status(sensor_status),   // Contains the output value.
   .ref_counter(ref_counter),     // The time window (in number of tck).
   
   // Promip control Register write data
   .sensor_ctrl_write_data(sensor_ctrl_parallel_in),
   .ref_counter_write_data(ref_counter_parallel_in),
   
   // Promip Registers serial output
   .sensor_ctrl_so(sensor_ctrl_so),     // Sensor selection.
   .sensor_status_so(sensor_status_so),   // Contains the output value.
   .ref_counter_so(ref_counter_so),     // The time window (in number of tck).

   // Promip Registers select signals
   .sensor_ctrl_select(sensor_ctrl_select),     // Sensor selection.
   .sensor_status_select(sensor_status_select),   // Contains the output value.
   .ref_counter_select(ref_counter_select),     // The time window (in number of tck).

   // Promip register control signals
   .capture(capture),
   .shift(shift),
   .write(write),
   .update(update),

   // write control signals from sensor if (only for SENSOR CONTROL reg)
   .sensor_ctrl_select_from_sensor_if(sensor_ctrl_select_from_sensor_if),
   .write_from_sensor_if(write_from_sensor_if),
   .sensor_ctrl_o_from_sensor_if(sensor_ctrl_o_from_sensor_if),

   .clk_out(sclk),
   .reset_out(i_resetn)
   );               

endmodule
