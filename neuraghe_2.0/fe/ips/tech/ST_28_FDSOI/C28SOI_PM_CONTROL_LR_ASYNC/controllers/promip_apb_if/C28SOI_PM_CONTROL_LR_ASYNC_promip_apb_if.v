// --=========================================================================--
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// -----------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_promip_apb_if.v
// Netlist version : 2.0
// Done by         : AB
// Date            : Oct 9 2007
// -----------------------------------------------------------------------------
// Purpose         : This block contains a controller based on apb protocol.
// --=========================================================================--

module C28SOI_PM_CONTROL_LR_ASYNC_promip_apb_if (
   // APB ports
   pclk,
   presetn,
   penable,
   psel,
   pwrite,
   paddr,
   pwdata,
   prdata,
   pready,
   pslverr,
   dataready,
   
   apb_enable,

   // Promip Registers select signals
   sensor_ctrl_select,     // Sensor selection.
   sensor_status_select,   // Contains the output value.
   ref_counter_select,     // The time window (in number of tck).
   
   // Promip registers control signals
   write,
   
   // Parallel input/output data to/from promip registers
   sensor_ctrl,     // Sensor selection.
   sensor_status,   // Contains the output value.
   ref_counter,     // The time window (in number of tck).
   
   sensor_ctrl_write_data,
   ref_counter_write_data
   );

   /*----------------------
     Parameters declaration
     ----------------------*/
     // UDR data length
     parameter REF_COUNTER_LENGTH = 32;
     parameter SENSOR_CTRL_LENGTH = 16;
     parameter SENSOR_STAT_LENGTH = 32;

     parameter k_UDR_ADDR_BITS    = 5;
     parameter k_SENS_CTRL_ADDRESS   = 5'b00100;
     parameter k_REF_COUNTER_ADDRESS = 5'b01000;
     parameter k_SENS_STAT_ADDRESS   = 5'b01100;

     // APB parameters
     parameter k_APB_ADDRESS_LENGTH = 5;
     parameter k_APB_DATA_LENGTH = 32;

    // APB ports
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
                
   output sensor_ctrl_select;
   output sensor_status_select;
   output ref_counter_select;
   
   input apb_enable;
 
   input  [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl; 
   input  [REF_COUNTER_LENGTH-1:0] ref_counter; 
   input  [SENSOR_STAT_LENGTH-1:0] sensor_status; 

   output [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_write_data; 
   output [REF_COUNTER_LENGTH-1:0] ref_counter_write_data; 

   output write;

//-----------------------------------------------------------
// Wire & Reg Declaration
//-----------------------------------------------------------
  reg [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_write_data; 
  reg [REF_COUNTER_LENGTH-1:0] ref_counter_write_data; 

  reg write;
  reg sensor_ctrl_select;
  reg sensor_status_select;
  reg ref_counter_select;
  reg [k_APB_DATA_LENGTH-1:0]    prdata;
  reg pslverr; 
  reg pslverr_q; 
  wire w_sensor_run_status_bit; 


//-------------------------------------------------------------
//Parameters
//--------------------------------------------------------------
  localparam SENS_RUN_STATUS_BIT = 10;
//--------------------------------------------------------------

  
  assign pready = 1'b1;
  assign w_sensor_run_status_bit = sensor_ctrl[SENS_RUN_STATUS_BIT];


  always @(posedge pclk or negedge presetn) begin
      if (presetn == 1'b0) begin
         pslverr <= 1'b0;
      end
      else begin
         if (psel == 1'b1) 
            pslverr <= pslverr_q;
         else
            pslverr <= 1'b0;
      end
  end

  always @(*) 
  begin
         if (apb_enable == 1'b1 && psel == 1'b1 && penable == 1'b1 && pwrite == 1'b0) begin
            if (paddr == k_SENS_CTRL_ADDRESS) begin
               // read sensor control data 
               prdata[k_APB_DATA_LENGTH-1:0] <= {k_APB_DATA_LENGTH{1'b0}};
               prdata[SENSOR_CTRL_LENGTH-1:0] <= sensor_ctrl[SENSOR_CTRL_LENGTH-1:0];
            end
            else if (paddr == k_REF_COUNTER_ADDRESS) begin
               // read ref counter data
               prdata[k_APB_DATA_LENGTH-1:0] <= {k_APB_DATA_LENGTH{1'b0}};
               prdata[REF_COUNTER_LENGTH-1:0] <= ref_counter[REF_COUNTER_LENGTH-1:0];
            end   
            else if (paddr == k_SENS_STAT_ADDRESS) begin
               // read sensor status data
               prdata[k_APB_DATA_LENGTH-1:0] <= {k_APB_DATA_LENGTH{1'b0}};
               prdata[SENSOR_STAT_LENGTH-1:0] <= sensor_status[SENSOR_STAT_LENGTH-1:0];
            end   
         end   
  end

  always @(paddr, pwrite, dataready, w_sensor_run_status_bit) begin
     pslverr_q = 1'b0;
     if (pwrite == 1'b1) begin
        if (paddr != k_REF_COUNTER_ADDRESS && 
            paddr != k_SENS_CTRL_ADDRESS)
           pslverr_q = 1'b1;
        if (paddr == k_SENS_CTRL_ADDRESS && dataready == 1'b0 && w_sensor_run_status_bit == 1'b0)
           pslverr_q = 1'b1;
     end
     else begin 
        if ((paddr != k_REF_COUNTER_ADDRESS && 
            paddr != k_SENS_CTRL_ADDRESS &&
            paddr != k_SENS_STAT_ADDRESS) || 
            (dataready == 1'b0 && paddr == k_SENS_STAT_ADDRESS))
           pslverr_q = 1'b1;
     end 
  end
  
  always @(apb_enable, penable, psel, pwrite, paddr, pwdata, dataready, w_sensor_run_status_bit ) begin
     sensor_ctrl_select     = 1'b0;
     sensor_status_select   = 1'b0;
     ref_counter_select     = 1'b0;
     write                  = 1'b0;
     sensor_ctrl_write_data = {SENSOR_CTRL_LENGTH{1'b0}};
     ref_counter_write_data = {REF_COUNTER_LENGTH{1'b0}};
     if (apb_enable == 1'b1 && psel == 1'b1 && penable == 1'b1 && pwrite == 1'b1) begin
        if (paddr == k_SENS_CTRL_ADDRESS) begin
          if (!(dataready == 1'b0 && w_sensor_run_status_bit == 1'b0)) begin //no write when READ operation going on
           sensor_ctrl_select = 1'b1; // write sensor control
           write = 1'b1;    
           sensor_ctrl_write_data[SENSOR_CTRL_LENGTH-1:0] = pwdata[SENSOR_CTRL_LENGTH-1:0];
          end
        end
        else if (paddr == k_REF_COUNTER_ADDRESS) begin
           ref_counter_select = 1'b1; // write ref counter
           write = 1'b1;    
           ref_counter_write_data[REF_COUNTER_LENGTH-1:0] = pwdata[REF_COUNTER_LENGTH-1:0];
        end
     end
  end


endmodule
