/////////////////////////////////////////////////////////////////////////////
//
//                    Copyright (C) 2007
//              by STMicroelectronics, France
//  FTM / Central CAD and Design Solutions / Design For Qualification Team
//
//                        All Rights Reserved
//
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
//
/////////////////////////////////////////////////////////////////////////////
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_jtag_interface.v
// Netlist version : 1.0
// Created by      : Igor Mohor (igorm@opencores.org)
//                   http://www.opencores.org/projects/jtag/
// Modified by     : N.MOUBDI
// Date            : April 17th 2007
/////////////////////////////////////////////////////////////////////////////
// Purpose         : - This file is part of the JTAG Test Access Port (TAP).
//                   - The state machine was re-written to be in accordance
//                     with the STM Design Conventions.
/////////////////////////////////////////////////////////////////////////////

// Top module
module C28SOI_PM_CONTROL_LR_ASYNC_jtag_interface (
   // JTAG pads
   tck,                // Test clock 
   trst_n,             // Test reset(active low)
   tdi,                // Test data input
   tdo,                // Test data output
   tms,                // Test mode selection

   tcr_noinvert_clk,
   
   // TAP states
   shift_dr_o,
   pause_dr_o, 
   update_dr_o,
   capture_dr_o,
                
   // Select signals for correct register
   bypass_select_o,
   idcode_select_o,
   sensor_ctrl_select_o,
   sensor_status_select_o,
   ref_counter_select_o,
                
                
   // TDI signals
   bypass_tdi_i,
   idcode_tdi_i,
   sensor_ctrl_tdi_i,
   sensor_status_tdi_i,
   ref_counter_tdi_i,
   
   // Boundary scan control ports
   bsr_si,
   bsr_mode,
   capture_clk,
   update_clk,
   tdo_en_n //active low
      
   );

   /*----------------------
     Parameters declaration
     ----------------------*/
     parameter k_IR_LENGTH = 5;

     parameter IDCODE_LENGTH = 32;
     parameter IDCODE_VALUE  = 32'hBA20A005;

     parameter k_SENS_CTRL_ADDRESS   = 5'b00100;
     parameter k_REF_COUNTER_ADDRESS = 5'b01000;
     parameter k_SENS_STAT_ADDRESS   = 5'b01100;

   // JTAG pads
   input tck;                // Test clock 
   input trst_n;             // Test reset(active low)
   input tdi;                // Test data input
   output tdo;               // Test data output
   input tms;                // Test mode selection
   
   input tcr_noinvert_clk;
   
   // TAP states
   output shift_dr_o;
   output pause_dr_o; 
   output update_dr_o;
   output capture_dr_o;
                
   // Select signals for correct register
   output bypass_select_o;   
   output idcode_select_o;
   output sensor_ctrl_select_o;
   output sensor_status_select_o;
   output ref_counter_select_o;
                            
   // TDI signals   
   input bypass_tdi_i;
   input idcode_tdi_i;   
   input sensor_ctrl_tdi_i;
   input sensor_status_tdi_i;
   input ref_counter_tdi_i;
   
   // Boundary scan control ports
   input  bsr_si;
   output bsr_mode; 
   output capture_clk, update_clk;
   output tdo_en_n; //active low
   
   /*----------------------------
     Local Parameters declaration
     ----------------------------*/

   // JTAG Instruction codes
   localparam EXTEST = 5'b00000;
   localparam SAMPLE_PRELOAD = 5'b00001;
   localparam IDCODE = 5'b00010;
   localparam BYPASS = 5'b11111;

    // FSM states
    localparam test_logic_reset = 4'd0,
               run_test_idle    = 4'd1,
               select_ir_scan   = 4'd2,
               capture_ir       = 4'd3,
               shift_ir         = 4'd4,
               exit1_ir         = 4'd5,
               pause_ir         = 4'd6,
               exit2_ir         = 4'd7,
               update_ir        = 4'd8,
               select_dr_scan   = 4'd9,
               capture_dr       = 4'd10,
               shift_dr         = 4'd11,
               exit1_dr         = 4'd12,
               pause_dr         = 4'd13,
               exit2_dr         = 4'd14,
               update_dr        = 4'd15;

    // reg & wire declaration
    reg [3:0] STATE;
    reg [3:0] NEXT_STATE;

    reg tdo_pad;
    reg idcode_select;
    reg bypass_select;
    reg sensor_ctrl_select;
    reg sensor_status_select;
    reg ref_counter_select;
    reg extest_select;
    reg SamplePreload_select;

    reg tms_reset;
    reg shift_dr_q;
    reg pause_dr_q; 
    reg update_dr_q;
    reg capture_dr_q;
    reg capture_ir_q;
    reg shift_ir_q;
    reg update_ir_q;

    wire tck_n ; // inverted tck
    
assign bypass_select_o        = bypass_select;
assign idcode_select_o        = idcode_select;
assign sensor_ctrl_select_o   = sensor_ctrl_select;
assign sensor_status_select_o = sensor_status_select;
assign ref_counter_select_o   = ref_counter_select;
assign tdo                    = tdo_pad;

assign shift_dr_o  = shift_dr_q;
assign pause_dr_o  = pause_dr_q;
assign update_dr_o = update_dr_q;
assign capture_dr_o= capture_dr_q;

C28SOI_PM_CONTROL_LR_ASYNC_xor u_tck_xor (.Z(tck_n),.A(tck),.S(~tcr_noinvert_clk));

always @ (STATE)
    begin
      tms_reset    = (STATE == test_logic_reset);
      shift_dr_q   = (STATE == shift_dr);
      pause_dr_q   = (STATE == pause_dr);
      update_dr_q  = (STATE == update_dr);
      capture_dr_q = (STATE == capture_dr);
      capture_ir_q = (STATE == capture_ir);  
      shift_ir_q   = (STATE == shift_ir);
      update_ir_q  = (STATE == update_ir);  
    end   

//*------------------------------------------------
//*   BSR Control  output                     
//*------------------------------------------------
assign bsr_mode = extest_select; 
assign tdo_en_n = ~(shift_ir_q | shift_dr_q); 

// Capture/Update Control  output                    
assign capture_clk = tck   & (SamplePreload_select | extest_select);
assign update_clk  = tck_n & (SamplePreload_select | extest_select);

/*****************************************************************************
*                                                                            *
*   TAP State Machine: Fully JTAG compliant                                  *
*                                                                            *
*****************************************************************************/
// Sequential process
always @ (posedge tck or negedge trst_n)
    begin
      if(!trst_n)           // trst_n is active low
        STATE <=  test_logic_reset;
      else
        STATE <=  NEXT_STATE;   
    end

// Combinatorial process
always @ (STATE or tms)
    begin
      case (STATE)
        test_logic_reset : 
                         begin
                           if(tms)
                             NEXT_STATE = test_logic_reset;
                           else
                             NEXT_STATE = run_test_idle;
                         end
      
        run_test_idle    :
                         begin
                           if(tms)
                             NEXT_STATE = select_dr_scan;
                           else
                             NEXT_STATE = run_test_idle;
                         end
       
        select_dr_scan   :
                         begin
                           if(tms)
                             NEXT_STATE = select_ir_scan;
                           else
                             NEXT_STATE = capture_dr;
                         end
          
        capture_dr       :
                         begin
                           if(tms)
                             NEXT_STATE = exit1_dr;
                           else
                             NEXT_STATE = shift_dr;
                         end
          
        shift_dr         :
                         begin
                           if(tms)
                             NEXT_STATE = exit1_dr;
                           else
                             NEXT_STATE = shift_dr;
                         end
          
        exit1_dr         :
                         begin
                           if(tms)
                             NEXT_STATE = update_dr;
                           else
                             NEXT_STATE = pause_dr;
                         end
          
        pause_dr         :
                         begin
                           if(tms)
                             NEXT_STATE = exit2_dr;
                           else
                             NEXT_STATE = pause_dr;
                         end
          
        exit2_dr         :
                         begin
                           if(tms)
                             NEXT_STATE = update_dr;
                           else
                             NEXT_STATE = shift_dr;
                         end
          
        update_dr        :
                         begin
                           if(tms)
                             NEXT_STATE = select_dr_scan;
                           else
                             NEXT_STATE = run_test_idle;
                         end
          
        select_ir_scan   :
                         begin
                           if(tms)
                             NEXT_STATE = test_logic_reset;
                           else
                             NEXT_STATE = capture_ir;
                         end
          
        capture_ir       :
                         begin
                           if(tms)
                             NEXT_STATE = exit1_ir;
                           else
                             NEXT_STATE = shift_ir;
                         end
          
        shift_ir             :
                         begin
                           if(tms)
                             NEXT_STATE = exit1_ir;
                           else
                             NEXT_STATE = shift_ir;
                         end
          
        exit1_ir         :
                         begin
                           if(tms)
                             NEXT_STATE = update_ir;
                           else
                             NEXT_STATE = pause_ir;
                         end
          
        pause_ir         :
                         begin
                           if(tms)
                             NEXT_STATE = exit2_ir;
                           else
                             NEXT_STATE = pause_ir;
                         end

        exit2_ir         :
                         begin
                           if(tms)
                             NEXT_STATE = update_ir;
                           else
                             NEXT_STATE = shift_ir;
                         end 

        update_ir        :    
                         begin
                           if(tms)
                             NEXT_STATE = select_dr_scan;
                           else
                             NEXT_STATE = run_test_idle;
                         end

        default          :  NEXT_STATE = test_logic_reset;  
     
      endcase  
    end
/*****************************************************************************
*                                                                            *
*   End: TAP State Machine                                                   *
*                                                                            *
*****************************************************************************/


/*****************************************************************************
*                                                                            *
*   jtag_ir:  JTAG Instruction Register                                      *
*                                                                            *
*****************************************************************************/
    reg [k_IR_LENGTH-1:0]  jtag_ir;          // Instruction register
    wire w_jtag_ir0;
    reg [k_IR_LENGTH-1:0]  latched_jtag_ir_neg;

always @ (posedge tck or negedge trst_n)
    begin
      if(!trst_n)
        jtag_ir[k_IR_LENGTH-1:0] <=  {k_IR_LENGTH{1'b0}};
      else if(capture_ir_q)
        jtag_ir <=  5'b00001; //This value is fixed for easier fault detection
      else if(shift_ir_q)
        jtag_ir[k_IR_LENGTH-1:0] <=  {tdi, jtag_ir[k_IR_LENGTH-1:1]};
    end

assign w_jtag_ir0 = jtag_ir[0];
/*****************************************************************************
*                                                                            *
*   End: jtag_ir                                                             *
*                                                                            *
*****************************************************************************/


/*****************************************************************************
*                                                                            *
*   Activating Instructions                                                  *
*                                                                            *
*****************************************************************************/
// Updating jtag_ir (Instruction Register)
always @ (posedge tck_n or negedge trst_n)
    begin
      if(!trst_n)
        latched_jtag_ir_neg <=  IDCODE;   // IDCODE selected after reset
      else if (tms_reset)
        latched_jtag_ir_neg <=  IDCODE;   // IDCODE selected after reset
      else if(update_ir_q)
        latched_jtag_ir_neg <=  jtag_ir;
    end

/*****************************************************************************
*                                                                            *
*   End: Activating Instructions                                             *
*                                                                            *
*****************************************************************************/


// Updating jtag_ir (Instruction Register)
always @ (latched_jtag_ir_neg)
    begin
      idcode_select        = 1'b0;  
      sensor_ctrl_select   = 1'b0;
      sensor_status_select = 1'b0;
      ref_counter_select   = 1'b0;
      bypass_select        = 1'b0;
      extest_select        = 1'b0;
      SamplePreload_select = 1'b0;
   
      case(latched_jtag_ir_neg)   
        IDCODE                : idcode_select        = 1'b1;    // ID Code
        k_SENS_CTRL_ADDRESS   : sensor_ctrl_select   = 1'b1;
        k_SENS_STAT_ADDRESS   : sensor_status_select = 1'b1;
        k_REF_COUNTER_ADDRESS : ref_counter_select   = 1'b1;
        BYPASS                : bypass_select        = 1'b1;    // BYPASS
        EXTEST                : extest_select        = 1'b1;    // EXTEST    	    
        SAMPLE_PRELOAD        : SamplePreload_select = 1'b1;    // SAMPLE_PRELOAD    	
        default               : bypass_select        = 1'b1;    // BYPASS
      endcase
    end



/*****************************************************************************
*                                                                            *
*   Multiplexing TDO data                                                    *
*                                                                            *
*****************************************************************************/
    reg data_tdo;

always @ (shift_ir_q or w_jtag_ir0 or latched_jtag_ir_neg 
          or idcode_tdi_i or sensor_ctrl_tdi_i or sensor_status_tdi_i 
          or ref_counter_tdi_i  or bypass_tdi_i or bsr_si)
    begin
      if(shift_ir_q)
        data_tdo = w_jtag_ir0; 
      else
        begin
          case(latched_jtag_ir_neg)
            IDCODE                 : data_tdo = idcode_tdi_i;        // Reading ID code
            k_SENS_CTRL_ADDRESS    : data_tdo = sensor_ctrl_tdi_i;
            k_SENS_STAT_ADDRESS    : data_tdo = sensor_status_tdi_i;
            k_REF_COUNTER_ADDRESS  : data_tdo = ref_counter_tdi_i;
            BYPASS                 : data_tdo = bypass_tdi_i;       // BYPASS instruction
            EXTEST                 : data_tdo = bsr_si;             // EXTEST instruction
            SAMPLE_PRELOAD         : data_tdo = bsr_si;             // SAMPLE_PRELOAD instruction	    
            default                : data_tdo = bypass_tdi_i;       // BYPASS instruction
          endcase
        end
    end

always @ (posedge tck_n or negedge trst_n)
    begin
      if(!trst_n)
        tdo_pad <=  1'b0;  
      else 
        tdo_pad <=  data_tdo;
    end

/*****************************************************************************
*                                                                            *
*   End: Multiplexing TDO data                                               *
*                                                                            *
*****************************************************************************/

endmodule
