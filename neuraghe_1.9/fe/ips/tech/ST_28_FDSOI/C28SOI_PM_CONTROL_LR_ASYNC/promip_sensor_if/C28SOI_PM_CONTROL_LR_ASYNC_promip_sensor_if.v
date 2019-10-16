// --=========================================================================--
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// -----------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_promip_sensor_if.v
// Netlist version : 4.0
// Done by         : AB
// Modified        : Asyncrhonous data transfer b/w top controller and logic wrapper
// -----------------------------------------------------------------------------
// Purpose         : wrapper around micro sensors
// --=========================================================================--

`ifdef PMC_PMB_SYNC_TX
// Synchronous link between PMC Top controller and logic wrapper
// please paste v3.2.a code with register change modifs
// here to support both architectures in same version

`else 
// Asynchronous link between PMC Top controller and logic wrapper
module C28SOI_PM_CONTROL_LR_ASYNC_promip_sensor_if (
   
   clk,            // Test clock.
   rst_n,          // Test reset(active low). 
   // rst_n_out,      // Test reset(active low), with Lock Up Latch. 
   
   sensor_ctrl,    // sensor control register input
   sensor_status,  // sensor status register output
   ref_counter,    // reference counter input

   sensor_ctrl_select, // select sensor control register for write
   write,          // update sensor control register
   sensor_ctrl_o,  // updated sensor control value
   
   dataready,      // counter data is ready
   dataready_parallel_port,      // counter data is ready to be loaded onto parallel port
   
   aux,            // External input. 
   dbg,            // Direct sensor output
   
   // input(ouput) for(from) pmb logic wrapper
   sensors_data, // direct sensor output from all sensors
   serial_out, // serial ouput from all pmb logic wrapper
   serial_in,  // serial input for all pmb logic wrapper
   shift_en,   // shift enable signal for all pmb logic wrappers
   select_ctr, // select counter serial chain for all pmb logic wrapper
   pmbw_req, // Request signal to PMB all Logic Wrapper
   pmbw_ack, // Acknowledge signal from all PMB Logic Wrapper
   
   tcr_muxclk_mode, // Test mode
   // tst_reset_mux1,  // Test mode

   debug_enable    // Debug mode
   
   );
   
   // ------ GLOBAL PARAMETER DECLARATION ------
      parameter DR_LENGTH = 16;
      parameter REF_COUNTER_LENGTH = 32;
      parameter SENSOR_CTRL_LENGTH = 16;
      parameter SENSOR_STAT_LENGTH = 32;
      parameter k_COUNTER_SIZE = 32;
      
      // number of sensors 
      parameter SENS_COUNT =  1;
   
      // number of bits required for counting macro sensors
      // log2(SENS_COUNT-1)
      localparam SENS_COUNT_BITS = 6;
      
      // number of rings 
      parameter SENS_RING_COUNT = 3;
   
      // number of bits required for counting rings 
      // log2(SENS_RING_COUNT-1)
      parameter SENS_RING_COUNT_BITS = 2;
      

   // ------ LOCAL PARAMETER DECLARATION ------
      // sensors ON status bit in SENS_CTRL reg
      localparam SENS_ON_BIT = 15;
      
      // sensors run in PARALLEL mode bit in SENS_CTRL reg 
      localparam SENS_PARALLEL_BIT = 14;
      
      // auxillary input or sensor data selected status bit in SENS_CTRL reg
      localparam SENS_AUX_SEL_BIT = 13;
      
      // sensor run status bit
      // If user wants to run sensors he has to set this bit to 1
      // After the sensors have run for reference time,
      // the device turns this bit to 0, which user can poll
      // to check if data is available for reading or not
      localparam SENS_RUN_STATUS_BIT = 10;

      // sensor divider bits
      localparam SENS_DIV1_LEAK_BIT  = 9;
      localparam SENS_DIV0_LEAK_BIT  = 8;
      localparam SENS_DIV1_SPEED_BIT = 7;
      localparam SENS_DIV0_SPEED_BIT = 6;
      
      // PMB Controller state machine
      localparam k_idle                = 3'b000; 

      // states for reading counter data
      localparam k_shift_counters      = 3'b100;
      localparam k_gen_sens_stat       = 3'b110;

      // states for running sensor
      localparam k_shift_control       = 3'b010;
      localparam k_stop_sensor         = 3'b011;  localparam k_complete_handshake = 3'b001;
      localparam k_end_of_count        = 3'b111;
      localparam k_write_sensor_ctrl   = 3'b101;

      // shifted data length : control & data
      localparam k_len_control_data = 7'b001000; // = 7
      localparam k_len_counter_data = k_COUNTER_SIZE + 1;
      
   // -----------------------------------------
   // Test Access Port for JTAG Controller.
      input  clk;                   // Test clock.
      input  rst_n;                // Test reset(active low).

      // output  rst_n_out;           // Test reset(active low) with Lock Up Latch.
   
   // data inputs and outputs for sensor controller interface
      input  [SENSOR_CTRL_LENGTH-1:0]  sensor_ctrl;
      output [SENSOR_STAT_LENGTH-1:0]  sensor_status;
      input  [REF_COUNTER_LENGTH-1:0]  ref_counter;
      
   // control and data signals for writing new value in sensor control register
      output sensor_ctrl_select;
      output write;
      output [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_o;

      output dataready;
      output dataready_parallel_port;
      
   // Auxiliary input and debug output port
      input  [DR_LENGTH-1:0] aux;  // External input.
      output dbg;                   // Direct sensor output.
   
   // Input and Output for PMB logic wrapper
      input [SENS_RING_COUNT-1:0] sensors_data;
      input [SENS_COUNT-1:0] serial_out;
      output serial_in;
      output [SENS_COUNT-1:0] shift_en;
      output [SENS_COUNT-1:0] select_ctr;
      output [SENS_COUNT-1:0] pmbw_req;
      input  [SENS_COUNT-1:0] pmbw_ack;


   // Test Control mode Ports
      input  tcr_muxclk_mode;             // Test mode for scan chain.                    
   // input  tst_reset_mux1;             // Test mode for scan chain.                    

      input debug_enable;                // debug mode enable pin

   //---------------------------------------------------------
   // Wire & Reg Declaration
   //---------------------------------------------------------

   // For controller
      wire  [SENSOR_CTRL_LENGTH-1:0]  sensor_ctrl;
      wire  [REF_COUNTER_LENGTH-1:0]  ref_counter;
      reg   [SENSOR_STAT_LENGTH-1:0]  sensor_status;
    
   // For PMB logic wrapper
      reg r_serial_in_q;
      reg [SENS_COUNT-1:0] r_shift_en_q;
      reg [SENS_COUNT-1:0] r_select_ctr_q;
      reg [SENS_COUNT-1:0] r_pmbw_req;

      // wire  w_rst_n_out; // Test reset(active low) with Lock Up Latch.
      // wire  rst_n_out;   // Test reset(active low) with Lock Up Latch.
      
   // ring/counter select signal for reading counter data  
      reg [3:0] w_ring_sel;
      reg [3:0] r_ring_sel_q;
      reg [SENS_COUNT :0] r_sensor_sel_q;
      reg [SENS_COUNT : 0] w_sensor_sel;
      reg [SENS_COUNT-1:0]  decoder_out;    
      // control data to be shifted to pmb logic wrapper
      reg [k_len_control_data-1:0] r_wrapper_ctrl_data_q; 
      
      // for counting shifted control and data bits
      // maximum 32 bit counters, so 108 counter data bits + few additional shifts
      reg [6:0] r_count_shift_data_len_q; 


      reg [SENS_COUNT_BITS-1:0]r_read_sens_q;
      reg [SENS_COUNT_BITS-1:0]w_read_sens_q;
      //integer r_read_sens_q;
      
      // for storing shifted out counter data;
      reg [k_COUNTER_SIZE-1:0] r_counter_data_q;

   // For sensors

   // For counters & Mux    
      reg  [k_COUNTER_SIZE-1:0] data_out_i;
   
      reg [2:0] r_state;
      reg r_stop_sensor_q;

   // for counting reference cycles
      reg [REF_COUNTER_LENGTH-1:0] r_counter_ref_cycles;

   // control and data signals for writing new value in sensor control register
      reg sensor_ctrl_select;
      reg write;
      reg [SENSOR_CTRL_LENGTH-1:0] sensor_ctrl_o;

      reg dataready;
      reg r_dataready_q;
      
   // For the divider by 2
      reg debug;

   // wire declaration
      wire w_sensor_sens_on_bit;
      wire w_sensor_parallel_bit;
      reg w_sensor_aux_sel_bit;
      wire w_sensor_run_status_bit;
      wire [SENS_COUNT_BITS-1:0] w_sensor_selector_bits;
      wire [2:0] w_ring_selector_bits;
      wire [1:0] w_sensor_div_leak_bits ;
      wire [1:0] w_sensor_div_bits ;

   // handshake signal coming from PMB Logic wrapper 
      //reg [SENS_COUNT-1:0] w_end_of_count;
      reg [SENS_COUNT-1:0] r_serial_out_q;
      //reg [SENS_COUNT-1:0] pmbw_ack_sync1;
     // reg [SENS_COUNT-1:0] pmbw_ack_sync2;
      //reg [SENS_COUNT-1:0] pmbw_ack_sync;
      wire [SENS_COUNT-1:0] pmbw_ack_sync;
      
   // integer declaration
      integer i, j;

   // Generate variable index
      genvar g_i, g_j,g_k;



//  synchronise  ack signals and mux synchro serial out 
generate 
for (g_j=0;g_j<SENS_COUNT ;g_j=g_j+1) begin : gen_synchronised_ack_serial_out

C28SOI_PM_CONTROL_LR_ASYNC_synchroniser  #(.SYNC_DEPTH(3)) u_sync_pmbw_ack ( .Q(pmbw_ack_sync[g_j]),.D(pmbw_ack[g_j]),.CLK(clk),.RST_N(rst_n) );

    //always @(negedge rst_n or posedge clk) begin
    //     if (rst_n == 1'b0) begin
     //      pmbw_ack_sync1[g_j] <=  {SENS_COUNT{1'b0}};
      //     pmbw_ack_sync2[g_j] <=  {SENS_COUNT{1'b0}};
       //    pmbw_ack_sync[g_j]  <=  {SENS_COUNT{1'b0}};
        // end
    //else begin
     //      pmbw_ack_sync1[g_j] <= pmbw_ack[g_j];
      //     pmbw_ack_sync2[g_j] <= pmbw_ack_sync1[g_j];
       //    pmbw_ack_sync[g_j]  <= pmbw_ack_sync2[g_j];
        // end
   // end

end
endgenerate

generate
for (g_k=0;g_k<SENS_COUNT ;g_k=g_k+1) begin : gen_mux_synchronisation

         always @(negedge rst_n or posedge clk ) begin
                if (rst_n == 1'b0) begin
                r_serial_out_q[g_k] <=  1'b0; 
                end
                else begin
                    if (pmbw_ack_sync[g_k] == 1'b1)
                    r_serial_out_q[g_k] <= serial_out[g_k];
                end
        end
end
endgenerate




    
   //--------------------------------------------------------------------
   // SENSOR POWERDOWN GENERATION 
   //--------------------------------------------------------------------
   
   // SEQUENTIAL BLOCK
   // State machine 
   //                IDLE                //
   //                  |                 //
   //   SEL CONTROL    |   SEL COUNTER   //
   //                  |                 //
   //   SHIFT CONTROL  |   SHIFT COUNTER //
   //                  |                 //
   //   START SENSOR   |                 //
   //                  |                 //
   //   STOP SENSOR    |                 //
   //                  |                 //
   //   END Of COUNT   |                 //
   //                  |                 //
   // WRITE SENSOR CTRL|                 //
   //                  |                 //
   //                IDLE                //


   
   
   always @(negedge rst_n or posedge clk) begin
      if (rst_n == 1'b0) begin
         // state machine is parked in IDLE state
         r_state <= k_idle;
         r_pmbw_req <= {SENS_COUNT{1'b0}};
         // signals for pmb logic wrapper
         r_serial_in_q  <= 1'b0;
         r_shift_en_q   <= {SENS_COUNT{1'b0}};
         r_select_ctr_q <= {SENS_COUNT{1'b0}};
         // wrapper control data information
         // {PD_L,PD_P,PD_N,DIV_LEAK,DIV}
         r_wrapper_ctrl_data_q <= 8'b11110000;
         r_ring_sel_q <= 4'b0000;
         r_counter_data_q <= {k_COUNTER_SIZE{1'b0}};
         
         r_sensor_sel_q <= {(SENS_COUNT+1){1'b0}};
         
         r_count_shift_data_len_q <= 7'b0000000;
         data_out_i <= {k_COUNTER_SIZE{1'b0}};
         r_read_sens_q <= {SENS_COUNT_BITS{1'b0}};

         // counter is initialised to maximum count possible
         r_counter_ref_cycles <= {REF_COUNTER_LENGTH{1'b1}};
         r_stop_sensor_q <= 1'b0;
         r_dataready_q <= 1'b1;
         dataready <= 1'b1;
      end   
      else begin
         dataready <= r_dataready_q;

         case (r_state)
            k_idle : begin
                     r_stop_sensor_q <= 1'b0;
                     r_ring_sel_q <= w_ring_sel;
                     r_sensor_sel_q <= w_sensor_sel;
                     r_read_sens_q <= w_read_sens_q;
                     // check the operation
          if (w_sensor_run_status_bit == 1'b1 && w_sensor_sens_on_bit == 1'b1 && w_sensor_sel != {(SENS_COUNT+1){1'b0}} && w_sensor_aux_sel_bit != 1'b1 && w_ring_sel != 4'b0000 ) begin 
                      // SENSOR RUN
 
                if ( ((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b0) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b0) ) begin  
                        r_state <= k_shift_control;
                        r_counter_ref_cycles <= ref_counter ;  
                       // generate control data to be shifted 
                        r_wrapper_ctrl_data_q <= {w_sensor_div_leak_bits, w_sensor_div_bits,~w_ring_sel[3],~w_ring_sel[2],~w_ring_sel[1],~w_ring_sel[0]
                                                  };
                        r_count_shift_data_len_q <= k_len_control_data + 7'b000001;
                        r_dataready_q <= 1'b0;
                end
          end

      else if (w_sensor_run_status_bit == 1'b0 && ((r_ring_sel_q != w_ring_sel) || (w_sensor_sel != r_sensor_sel_q) ) && (w_sensor_sel != {(SENS_COUNT+1){1'b0}}) && (w_sensor_parallel_bit != 1'b1)  && w_ring_sel != 4'b1111
      && w_ring_sel != 4'b0000) begin

                        // READ COUNTER DATA
                    if ( ((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b0) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b0) ) begin  
                        r_state <= k_shift_control;
                       
                       // generate control data to be shifted 
                        r_wrapper_ctrl_data_q <= {w_sensor_div_leak_bits, w_sensor_div_bits,~w_ring_sel[3],~w_ring_sel[2],~w_ring_sel[1],~w_ring_sel[0]
                                                  };
                        r_count_shift_data_len_q <= k_len_control_data + 7'b0000001;
			//$display("checkoriginal %d \n",r_count_shift_data_len_q);
                        r_dataready_q <= 1'b0;
                end
      end
      else begin
                        // IDLE
                        r_state <= k_idle;
                        r_shift_en_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}};
                        r_select_ctr_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}};
                        r_dataready_q <= 1'b1;
          end   
 end


       k_shift_counters : begin

     if  (((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b0) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b0)) begin  // new pmbw_req   

              r_count_shift_data_len_q <= r_count_shift_data_len_q - 7'b0000001;
//$display("check %d \n",r_count_shift_data_len_q);
              if (r_count_shift_data_len_q == 7'b0000001) begin // 48-47 = 1   // stop shifting
	//$display("check under \n");
                             r_shift_en_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}};
                             r_select_ctr_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}};
                             data_out_i <=  r_counter_data_q;
                             r_state <= k_idle;
              end

              else  begin
                            // $display("counter shift \n");
			     // generate request to  read
                             r_pmbw_req[SENS_COUNT-1:0] <= {SENS_COUNT{1'b1}} & r_sensor_sel_q[SENS_COUNT-1:0];
                             // generate shift_en & select_ctr for selected PMB logic wrapper
                             r_shift_en_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b1}} & r_sensor_sel_q[SENS_COUNT-1:0];
                             r_select_ctr_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b1}} & r_sensor_sel_q[SENS_COUNT-1:0];
              end
     end


     else if (((r_pmbw_req[r_read_sens_q]) == 1'b1) && ((pmbw_ack_sync[r_read_sens_q]) == 1'b1)) begin  
                              
                   //  case (1'b1)
                      //  r_ring_sel_q[0] : begin

                           // nmos ring selected - store last 16 bits
                           if ((r_count_shift_data_len_q < k_COUNTER_SIZE +1) && (r_count_shift_data_len_q > 0 ))  begin // 16 to 1 , for 16 bit counter 
                            r_state <= k_gen_sens_stat;

                           end   
                           else begin

                           r_pmbw_req[r_read_sens_q] <= 1'b0; 
end
                        //end
                        //r_ring_sel_q[1] : begin
                           // pmos ring selected - store middle 16 bits
                        //   if ((r_count_shift_data_len_q < 2*k_COUNTER_SIZE +1) && (r_count_shift_data_len_q > k_COUNTER_SIZE )) begin // 32 to 17, for 16 bit counters 
                        //   r_state <= k_gen_sens_stat;
                        //   end   
                        //     else
                         //  r_pmbw_req[r_read_sens_q] <= 1'b0; 

                        //end
                       // r_ring_sel_q[2] : begin
                           // leak ring selected - store first 16 bits
                        //   if ((r_count_shift_data_len_q < 3*k_COUNTER_SIZE +1 ) && (r_count_shift_data_len_q > 2*k_COUNTER_SIZE )) begin // 48 to 33  , for 16 bit counters
                         //  r_state <= k_gen_sens_stat;
                         //  end   
                         //   else
                         //  r_pmbw_req[r_read_sens_q] <= 1'b0; 
                       // end
                    // endcase   
       end
     //  end
   end


    k_gen_sens_stat : begin
                         // store counter data
                         r_counter_data_q <= {r_counter_data_q[k_COUNTER_SIZE-2:0], r_serial_out_q[r_read_sens_q]};
                         r_pmbw_req[r_read_sens_q] <= 1'b0;
                         r_state <= k_shift_counters;
                   end


  k_shift_control : begin


     if (((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b1) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b1)) begin 
                      for (i=0;i<SENS_COUNT;i=i+1) begin
                        if ((pmbw_ack_sync[i]) == 1'b1)
                              r_pmbw_req [i] <= 1'b0;
                      end   
     end


   //  if (w_sensor_run_status_bit == 1'b1) begin

        if (((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b0) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b0)) begin  
               r_count_shift_data_len_q <= r_count_shift_data_len_q - 7'b000001; 
               r_pmbw_req[SENS_COUNT-1:0] <= {SENS_COUNT{1'b1}} & r_sensor_sel_q[SENS_COUNT-1:0];
               if (r_count_shift_data_len_q == 7'b0000001) begin

                      
		        //generated request for starting the sensors
                      if (w_sensor_run_status_bit == 1'b1) begin
		           r_shift_en_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}} & r_sensor_sel_q[SENS_COUNT-1:0];
                           r_select_ctr_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b1}} & r_sensor_sel_q[SENS_COUNT-1:0];
                           r_state <= k_stop_sensor;
			end
			else begin
			r_state <= k_shift_counters;
			r_count_shift_data_len_q <= k_len_counter_data + 7'b0000001;
			r_shift_en_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}} & r_sensor_sel_q[SENS_COUNT-1:0];
                        r_select_ctr_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}} & r_sensor_sel_q[SENS_COUNT-1:0];
			end
                end
 
                else  begin 
                        // generated request for shifting contrl data
                        // generate shift_en & select_ctr for selected PMB logic wrapper
                        r_shift_en_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b1}} & r_sensor_sel_q[SENS_COUNT-1:0];
                        r_select_ctr_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}} & r_sensor_sel_q[SENS_COUNT-1:0];
                        r_serial_in_q <= r_wrapper_ctrl_data_q[k_len_control_data-1];
                        r_wrapper_ctrl_data_q [k_len_control_data-1:0] <= {r_wrapper_ctrl_data_q[k_len_control_data-2:0], r_wrapper_ctrl_data_q[k_len_control_data-1]};
                 end
        end 
  // end   

   /* else  begin                                              // RUN INTERRUPT
        if (((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b0) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b0))begin    
                        // disable shifting data
                        r_pmbw_req[SENS_COUNT-1:0] <= {SENS_COUNT{1'b1}} & r_sensor_sel_q[SENS_COUNT-1:0];
                        r_shift_en_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}} & r_sensor_sel_q[SENS_COUNT-1:0];
                        r_select_ctr_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}} & r_sensor_sel_q[SENS_COUNT-1:0];
                        r_state <= k_complete_handshake;
        end
     end */  
 end

   k_stop_sensor : begin

     
     if (((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b1) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b1)) begin 
                      for (i=0;i<SENS_COUNT;i=i+1) begin
                        if ((pmbw_ack_sync[i]) == 1'b1)
                              r_pmbw_req [i] <= 1'b0;
                      end   
     end


     if (w_sensor_run_status_bit == 1'b1) begin
                   if (r_counter_ref_cycles == {{REF_COUNTER_LENGTH-1{1'b0}}, 1'b1}) begin // = 1 ?************
                          if (((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b0) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b0)) begin //MIN LENGTH OF REF COUNTER SHUD BE ADHERED COZ this will always run for atleast that many cycles  
                           r_pmbw_req[SENS_COUNT-1:0] <= {SENS_COUNT{1'b1}} & r_sensor_sel_q[SENS_COUNT-1:0];
                           r_shift_en_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}} & r_sensor_sel_q[SENS_COUNT-1:0];
                           r_select_ctr_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}} & r_sensor_sel_q[SENS_COUNT-1:0];
                           r_state <= k_end_of_count;
                          end   
                   end   
                   else begin
                   r_counter_ref_cycles <= r_counter_ref_cycles - {{REF_COUNTER_LENGTH-1{1'b0}}, 1'b1};
                   end

                   
     end
    else  begin  // RUN INTERRUPT
         if (((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b0) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b0)) begin
                        // generate request to stop sensor in betwwen
                        r_pmbw_req[SENS_COUNT-1:0] <= {SENS_COUNT{1'b1}} & r_sensor_sel_q[SENS_COUNT-1:0];
                        r_shift_en_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}} & r_sensor_sel_q[SENS_COUNT-1:0];
                        r_select_ctr_q[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}} & r_sensor_sel_q[SENS_COUNT-1:0];
                        r_state <= k_complete_handshake;
        end   
    end
 end

    k_end_of_count : begin

           if (((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b1) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b1)) begin 
                      for (i=0;i<SENS_COUNT;i=i+1) begin
                        if ((pmbw_ack_sync[i]) == 1'b1) begin
                              r_pmbw_req [i] <= 1'b0;
                        end
                      end   
            end


           if (w_sensor_run_status_bit == 1'b1) begin
                       // check  all sensors stopped
                       if (((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b0) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b0)) begin // handshake signal 
                          // to reset run sensor control bit
                          r_stop_sensor_q <= 1'b1;
                          r_state <= k_write_sensor_ctrl;
                       end
           end   
          else begin   // RUN INTERRUPT
                    if (((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b0) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b0)) 
                        r_state <= k_idle;
          end   
   end

   k_write_sensor_ctrl : begin
                     r_state <= k_idle;
   end


  k_complete_handshake : begin   // state : if run sensor operation is interuppted then to see all sensors stopped and request low
     if (((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b0) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b0)) 
       r_state <= k_idle;
     else if (((|r_pmbw_req[SENS_COUNT-1:0]) == 1'b1) && ((|pmbw_ack_sync[SENS_COUNT-1:0]) == 1'b1)) begin
         for (i=0;i<SENS_COUNT;i=i+1) begin
                        if ((pmbw_ack_sync[i]) == 1'b1)
                              r_pmbw_req [i] <= 1'b0;
         end
     end
   end

   default : begin
                      r_state <= k_idle;
		      r_pmbw_req[SENS_COUNT-1:0] <= {SENS_COUNT{1'b0}} & r_sensor_sel_q[SENS_COUNT-1:0];
 
     end
  endcase   
      end   
   end
   
   // COMBINATIONAL BLOCK

   assign w_sensor_sens_on_bit = sensor_ctrl[SENS_ON_BIT];
   //assign w_sensor_aux_sel_bit = sensor_ctrl[SENS_AUX_SEL_BIT];
   assign w_sensor_run_status_bit = sensor_ctrl[SENS_RUN_STATUS_BIT];
   
   // sensor divider bits speed and leak
   assign w_sensor_div_bits = {sensor_ctrl[SENS_DIV1_SPEED_BIT],
                               sensor_ctrl[SENS_DIV0_SPEED_BIT]}; 
   assign w_sensor_div_leak_bits = {sensor_ctrl[SENS_DIV1_LEAK_BIT],
                                    sensor_ctrl[SENS_DIV0_LEAK_BIT]}; 

   // For PMB logic wrapper
   // Lock Up Latch on signals going to PMB wrapper
   // to avoid hold fixing issues
   
   // lock up latch on reset going to PMB logic wrapper
   // C28SOI_PM_CONTROL_LR_ASYNC_lockup_latch rst_n_lul (.EN(clk), .D(rst_n), .Q(w_rst_n_out)); 
   
   // DFT mux to bypass lock up latch on reset going to PMB logic wrapper
   // C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock rst_n_out_mux ( 
   //   .D0(w_rst_n_out),
   //   .D1(rst_n),
   //   .sel(tst_reset_mux1),
   //   .z(rst_n_out));

   // Signals going to PMB Logic Wrapper
   // clock synchroniser needs to be added on serial_out coming from PMB Logic wrapper
   

    assign pmbw_req = r_pmbw_req; 
    assign shift_en = r_shift_en_q;
    assign select_ctr = r_select_ctr_q;
    assign serial_in = r_serial_in_q;
   assign dataready_parallel_port = r_dataready_q;
   
   // PMB selection logic, decoding sensor selection bits
   assign w_sensor_selector_bits = sensor_ctrl[SENS_COUNT_BITS-1:0];
   always @(w_sensor_selector_bits) begin
      decoder_out = {SENS_COUNT{1'b0}};
      for (i=1; i<SENS_COUNT+1; i=i+1) begin
         if (w_sensor_selector_bits == i)
            decoder_out[i-1] = 1'b1;
      end   
      if (decoder_out ==  {SENS_COUNT{1'b0}}) begin
       w_read_sens_q = {SENS_COUNT_BITS{1'b0}}; 
      end
      else begin
       w_read_sens_q = w_sensor_selector_bits - {{(SENS_COUNT_BITS-1){1'b0}},1'b1};
      end
   end

   assign w_sensor_parallel_bit = sensor_ctrl[SENS_PARALLEL_BIT];
   always @(w_sensor_parallel_bit, decoder_out) begin
      w_sensor_sel = {SENS_COUNT+1{1'b0}};
      if (w_sensor_parallel_bit == 1'b1) begin
         w_sensor_sel = {(SENS_COUNT+1){1'b1}};
      end
      else begin
         w_sensor_sel = {1'b0,decoder_out};
      end   
   end
   
   // PMB ring selection logic, decoding ring selection bits
   assign w_ring_selector_bits = {sensor_ctrl[SENSOR_CTRL_LENGTH-3],sensor_ctrl[SENSOR_CTRL_LENGTH-4], sensor_ctrl[SENSOR_CTRL_LENGTH-5]};
   always @ (w_ring_selector_bits) begin
      	w_ring_sel[3:0] = {4{1'b0}};
	 w_sensor_aux_sel_bit = 1'b0;
         case (w_ring_selector_bits)
            	3'b000 : w_ring_sel = 4'b1111; 
  		3'b001 : w_ring_sel = 4'b0001;
   		3'b010 : w_ring_sel = 4'b0010;
   		3'b011 : w_ring_sel = 4'b0100;
   		3'b100 : w_ring_sel = 4'b1000;
   		3'b101 : w_ring_sel = 4'b0000;
   		3'b110 : w_ring_sel = 4'b0000;
   		3'b111 : begin
             			w_ring_sel = 4'b0000;
             			w_sensor_aux_sel_bit = 1'b1;
            		end
         endcase
      end   

    // update sensor control register 
    always @(r_stop_sensor_q, sensor_ctrl, w_sensor_run_status_bit) begin
       if (r_stop_sensor_q == 1'b1) begin
          sensor_ctrl_select = 1'b1;
          sensor_ctrl_o = sensor_ctrl;
          sensor_ctrl_o[SENS_RUN_STATUS_BIT] = 1'b0;
          write = 1'b1;
       end   
       else begin
          sensor_ctrl_select = 1'b0;
          sensor_ctrl_o = sensor_ctrl;
          write = 1'b0;
	  if(w_sensor_run_status_bit == 1'b1)
             sensor_ctrl_o[SENS_RUN_STATUS_BIT] = 1'b1;
	  else
             sensor_ctrl_o[SENS_RUN_STATUS_BIT] = 1'b0;	  
       end   
    end
    
    // handshake signal, end of count generation
    //always @(r_serial_out_q, r_sensor_sel_q, r_state) begin
     //  w_end_of_count = {SENS_COUNT{1'b1}};
     //  if(r_state == k_end_of_count) begin
     //     w_end_of_count = (~r_sensor_sel_q | r_serial_out_q);
     //  end   
    //end
    

//---------------------------------------------------------
// Multiplexing counters data
//--------------------------------------------------------- 

// Select external input(aux) or sensors data
always @(w_sensor_aux_sel_bit or data_out_i or aux) begin
        sensor_status = {SENSOR_STAT_LENGTH{1'b0}};
        if (w_sensor_aux_sel_bit == 1'b1) 
            sensor_status[DR_LENGTH-1:0] = aux[DR_LENGTH-1:0];
        else    
            sensor_status[k_COUNTER_SIZE-1:0] = data_out_i[k_COUNTER_SIZE-1:0];
end


//---------------------------------------------------------
// Mux for selecting directly ring osc o/p on dbg pin
//---------------------------------------------------------  
always @(debug_enable, w_sensor_sel, w_ring_sel, sensors_data) begin
   debug = 1'b0;
   if (debug_enable == 1'b1) begin
      for (i=0; i<SENS_COUNT; i=i+'d1) begin
         if (w_sensor_sel[i] == 1'b1) begin
            for (j=0; j<3; j=j+'d1) begin
               if (w_ring_sel[j] == 1'b1) begin
                  debug = sensors_data[i*3+j];
               end
            end   
         end   
      end            
   end
end
   
C28SOI_PM_CONTROL_LR_ASYNC_promip_divider2 div2(
   .clk(clk),
   .rst_n(rst_n),
   .tm(tcr_muxclk_mode),
   .counten(1'b1),
   .divider2_in(debug),
   .divider2_out(dbg));
   
endmodule

`endif
