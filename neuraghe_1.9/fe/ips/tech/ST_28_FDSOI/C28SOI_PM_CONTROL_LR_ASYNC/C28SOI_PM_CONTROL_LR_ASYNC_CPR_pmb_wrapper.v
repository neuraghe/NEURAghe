// Synchronous link between PMC Top controller and logic wrapper
//`define PM_CONTROL_DEBUG_ENABLE 1

`ifdef PM_CONTROL_DEBUG_ENABLE
module C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper (pmbw_clk, pmbw_rstn ,pmbw_req , pmbw_ack, serial_in, serial_out, shift_en, select_ctr, ring_osc_clk, tcr_muxclk_mode, tst_reset_mux2, LOGICCPR_1, LOGICCPR_2, LOGICCPR_3,LOGICCPR_4);
`else
module C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper (pmbw_clk, pmbw_rstn ,pmbw_req , pmbw_ack, serial_in, serial_out, shift_en, select_ctr, ring_osc_clk, tcr_muxclk_mode, tst_reset_mux2);
`endif

// --------------------- //
// parameter declaration
// --------------------- //
            
parameter k_logic_cpr_lr = 1'b1;
parameter k_logic_cpr_lr_rcm5 = 1'b0;
parameter k_logic_cpr_lr_p16 = 1'b0;
	    
parameter k_period_ring_1 = 10;   // period of hard rings
parameter k_period_ring_2 = 10;   // period of hard rings
parameter k_period_ring_3 = 10;   // period of hard rings
parameter k_period_ring_4 = 10;   // period of rc ring


// size of counters: any integer value b/w 16 and 32
// MSB of counter is reserved for Overflow bit

parameter k_period_speed = 10;
parameter k_period_leak  = 10;

// size of counters  any integer value b/w 16 and 32  MSB of counter is reserved for Overflow bit
parameter k_COUNTER_SIZE = 32;

// ------------------------------ //
// input/output,wire declaration
// ------------------------------ //

input pmbw_clk, pmbw_rstn;
input pmbw_req;
input serial_in;
input shift_en;
input select_ctr;

input tcr_muxclk_mode;
input tst_reset_mux2;

output serial_out;
output ring_osc_clk;
output pmbw_ack;

`ifdef PM_CONTROL_DEBUG_ENABLE
 output LOGICCPR_1;
 output LOGICCPR_2;
 output LOGICCPR_3;
 output LOGICCPR_4;
 wire LOGICCPR_1;
 wire LOGICCPR_2;
 wire LOGICCPR_3;
 wire LOGICCPR_4;
`endif

genvar g_i;

reg r_pmbw_ack;
reg r_pmbw_ack_w;
// counter reset 
wire counter_reset;
reg counter_reset_q;
// observation FF on counter synchronous reset
reg counter_reset_q_dft;


// sensor clock
wire [3:0] sensors_data;
reg [3:0] w_sensors_data;
// observation FF on sensors data -since it will go to clock input of counters and hence NO 
reg  [2:0] r_sensors_data_dft;

// serial output
reg w_serial_out;


// counters counting sensor clocks
reg [k_COUNTER_SIZE-1:0] counter_n;  //LOGICCPR_1
reg [k_COUNTER_SIZE-1:0] counter_p;  //LOGICCPR_2
reg [k_COUNTER_SIZE-1:0] counter_l;  //LOGICCPR_3
reg [k_COUNTER_SIZE-1:0] counter_rc; // LOGICCPR_4

// save counters data into registers before shifting to sensor interface
reg [k_COUNTER_SIZE-1:0] r_counter_data_P0_q;
reg [k_COUNTER_SIZE-1:0] r_counter_data_P4_q;
reg [k_COUNTER_SIZE-1:0] r_counter_data_P10_q;
reg [k_COUNTER_SIZE-1:0] r_counter_data_rc_q;

// counter count enable signals
reg [3:0] r_count_enable_q;

// sensor powerdown signals
reg  [3:0] sensor_powerdown;
reg  [3:0] r_powerdown_q;
reg  [3:0] r_powerdown_q_dft;
wire  [3:0] powerdown_q;  
// sensor divider configuration bits
// speed : same for  all 3 hard rings
reg [1:0] sensor_div;
reg [1:0] sensor_div_q;
// rc ring
reg [1:0] sensor_div_rc;
reg [1:0] sensor_div_rc_q;

reg [1:0] wrapper_state_q;

// mux syncronised signals
reg r_serial_in_q;
reg r_shift_en_q;
reg r_select_ctr_q;

reg r_serial_in_q_dft;
reg r_shift_en_q_dft;
reg r_select_ctr_q_dft;

// synchronize count enable signal going to counter
// signal travelling from pmbw_clk domain to sensor clock domain
wire [3:0] r_count_enable_q_sync;

// resync end of count signal going to counter
// from sensor clock domain back to pmbw_clk domain, 
// to enable FSM to move to save counter data state. 
wire [3:0] r_count_enable_q_resync;
wire r_count_enable_OR_q_resync;

// count enable sync ff clock
wire [3:0] w_count_en_sync_ff_clk;

wire select_run_sensor;
wire w_ring_osc_clk;
wire ring_osc_clk_out_1;
wire ring_osc_clk_out_2;
wire ring_osc_clk_out_3;
wire ring_osc_clk_out_4;

//wire w_ring_osc_clk_div2;

reg r_ring_osc_clk_div4;

//pmbw_req syncronisation flops
wire pmbw_req_sync;
reg [3:0] r_ctrl_data_shift_count;

reg [1:0] cnt_n;
// ----------------------- //
// local param declaration
// ----------------------- //

localparam k_idle           = 2'b00; //also 100
localparam k_start_stop_sensors_counters = 2'b01; 
// save counter data into register
localparam k_save_counters  = 2'b11;
// stop sensors
localparam k_stop_sensors  = 2'b10;


// PMB logic wrapper control data
// {shift_en, select_ctr}
localparam k_shift_control = 2'b10;
localparam k_shift_counter = 2'b11;
localparam k_select_ctr    = 2'b01;
localparam k_deselect_ctr  = 2'b00;

localparam len_ctrl_data  = 4'b1000;

`ifdef PM_CONTROL_DEBUG_ENABLE
 assign LOGICCPR_1       = sensors_data[0];
 assign LOGICCPR_2     	 = sensors_data[1];
 assign LOGICCPR_3    	 = sensors_data[2];
 assign LOGICCPR_4	 = sensors_data[3];
`endif   


generate 
if (k_logic_cpr_lr ==1'b1) begin : gen_pmb_logic_cpr_lr
C28SOI_PM_LOGIC_CPR_LR_GATE_TOP #(
            .PERIOD_LR_1(k_period_ring_1), 
            .PERIOD_LR_2(k_period_ring_2),
            .PERIOD_LR_3(k_period_ring_3), 
            .PERIOD_LR_4(k_period_ring_4)) 
            u_cpr_lr (
                .RN(counter_reset),
                .DIVSPEED0(sensor_div_q[0]),
                .DIVSPEED1(sensor_div_q[1]),
                .DIVRC0(sensor_div_rc_q[0]),
                .DIVRC1(sensor_div_rc_q[1]),
                .PD_1(powerdown_q[0]),
                .PD_2(powerdown_q[1]),
                .PD_3(powerdown_q[2]),
                .PD_4(powerdown_q[3]),
                .LOGICCPR_1(sensors_data[0]),
                .LOGICCPR_2 (sensors_data[1]),
                .LOGICCPR_3 (sensors_data[2]),
                .LOGICCPR_4(sensors_data[3]),
                .trans_clk(pmbw_clk),
                .tcr_muxclk_mode(tcr_muxclk_mode)
               );
end

else if (k_logic_cpr_lr_rcm5 ==1'b1) begin : gen_pmb_logic_cpr_lr_rcm5
C28SOI_PM_LOGIC_CPR_LR_RCM5_GATE_TOP #(
            .PERIOD_LR_1(k_period_ring_1), 
            .PERIOD_LR_2(k_period_ring_2),
            .PERIOD_LR_3(k_period_ring_3), 
            .PERIOD_LR_4(k_period_ring_4)) 
            u_cpr_lr_rcm5 (
                .RN(counter_reset),
                .DIVSPEED0(sensor_div_q[0]),
                .DIVSPEED1(sensor_div_q[1]),
                .DIVRC0(sensor_div_rc_q[0]),
		.DIVRC1(sensor_div_rc_q[1]),
                .PD_1(powerdown_q[0]),
                .PD_2(powerdown_q[1]),
                .PD_3(powerdown_q[2]),
                .PD_4(powerdown_q[3]),
                .LOGICCPR_1(sensors_data[0]),
                .LOGICCPR_2 (sensors_data[1]),
                .LOGICCPR_3 (sensors_data[2]),
                .LOGICCPR_4(sensors_data[3]),
                .trans_clk(pmbw_clk),
                .tcr_muxclk_mode(tcr_muxclk_mode)
               );
end
	   
	   
else if (k_logic_cpr_lr_p16 ==1'b1) begin : gen_pmb_logic_cpr_lr_p16
C28SOI_PM_LOGIC_CPR_LR_P16_TOP #(
            .PERIOD_LR_1(k_period_ring_1), 
            .PERIOD_LR_2(k_period_ring_2),
            .PERIOD_LR_3(k_period_ring_3), 
            .PERIOD_LR_4(k_period_ring_4)) 
            u_cpr_lr_p16 (
                .RN(counter_reset),
                .DIVSPEED0(sensor_div_q[0]),
                .DIVSPEED1(sensor_div_q[1]),
                .DIVRC0(sensor_div_rc_q[0]),
		.DIVRC1(sensor_div_rc_q[1]),
                .PD_1(powerdown_q[0]),
                .PD_2(powerdown_q[1]),
                .PD_3(powerdown_q[2]),
                .PD_4(powerdown_q[3]),
                .LOGICCPR_1(sensors_data[0]),
                .LOGICCPR_2 (sensors_data[1]),
                .LOGICCPR_3 (sensors_data[2]),
                .LOGICCPR_4(sensors_data[3]),
                .trans_clk(pmbw_clk),
                .tcr_muxclk_mode(tcr_muxclk_mode)
               );
end
    
endgenerate

//----------------------------------------------
// synchronise pmbw_req signal
//----------------------------------------------

C28SOI_PM_CONTROL_LR_ASYNC_synchroniser  #(.SYNC_DEPTH(3)) u_sync_pmbw_req ( .Q(pmbw_req_sync),.D(pmbw_req),.CLK(pmbw_clk),.RST_N(pmbw_rstn) );

// ------------------------------------------------------------- //
// mux synchronise data signals coming from PM CONTROl sensor interface
// ------------------------------------------------------------- //

always @( negedge pmbw_rstn or posedge pmbw_clk ) begin
     if (pmbw_rstn == 1'b0) begin
       r_serial_in_q <= 1'b0;
       r_shift_en_q <= 1'b0;
       r_select_ctr_q <= 1'b0;
       end
     else begin
       if (pmbw_req_sync == 1'b1) begin
       r_serial_in_q <= serial_in;
       r_shift_en_q <=  shift_en;
       r_select_ctr_q <= select_ctr;
       end 
     end
end

//// ---- for fir dft purpose
always@( negedge pmbw_rstn or posedge pmbw_clk) begin
if(pmbw_rstn == 1'b0) begin
r_serial_in_q_dft <= 1'b0;
r_shift_en_q_dft  <= 1'b0;
r_select_ctr_q_dft <= 1'b0;
end
else begin
r_serial_in_q_dft <= r_serial_in_q;
r_shift_en_q_dft  <= r_shift_en_q ;
r_select_ctr_q_dft <= r_select_ctr_q;
end
end


always @(negedge pmbw_rstn or posedge pmbw_clk) begin
 if (pmbw_rstn == 1'b0) begin
  sensor_div_rc <= 2'b00;
  sensor_div <= 2'b00; 
  sensor_powerdown <= 4'b1111;
  r_pmbw_ack_w <= 1'b0;
 end
 else if ((pmbw_req_sync == 1'b1  &&  r_pmbw_ack_w == 1'b0) && ({r_shift_en_q, r_select_ctr_q} == k_shift_control)) begin
  sensor_div_rc[1:0] <= {sensor_div_rc[0],sensor_div[1]};

  sensor_div[1:0] <= {sensor_div[0],sensor_powerdown[3]};
 
  sensor_powerdown[3:0] <= {sensor_powerdown[2:0],r_serial_in_q};
 r_pmbw_ack_w <= 1'b1;
 end
else if (pmbw_req_sync == 1'b0) // TRUE for all states
   r_pmbw_ack_w <= 1'b0;

end


// ----------------------------------------- //
// generate clock for synchronization FFs
// clock = sensor clock in functional mode
// clock = serial clock in test mode
// ----------------------------------------- //


generate 

//else begin
  for (g_i=0;g_i<4;g_i=g_i+1) begin : gen_count_en_sync_ff_clk
   C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock 
      u_count_en_sync_ff_clk_mux (
        .D0(sensors_data[g_i]),
        .D1(pmbw_clk),
        .sel(tcr_muxclk_mode),
        .z(w_count_en_sync_ff_clk[g_i]));
   end
//end
endgenerate


// ------------------------------------------------- //
// synchronize count enable signal going to counters
// ------------------------------------------------- //

C28SOI_PM_CONTROL_LR_ASYNC_synchroniser  #(.SYNC_DEPTH(3)) u_sync_counter_0 ( .Q(r_count_enable_q_sync[0]),.D(r_count_enable_q[0]),.CLK(w_count_en_sync_ff_clk[0]),.RST_N(counter_reset));
C28SOI_PM_CONTROL_LR_ASYNC_synchroniser  #(.SYNC_DEPTH(3)) u_sync_counter_1 ( .Q(r_count_enable_q_sync[1]),.D(r_count_enable_q[1]),.CLK(w_count_en_sync_ff_clk[1]),.RST_N(counter_reset));
C28SOI_PM_CONTROL_LR_ASYNC_synchroniser  #(.SYNC_DEPTH(3)) u_sync_counter_2 ( .Q(r_count_enable_q_sync[2]),.D(r_count_enable_q[2]),.CLK(w_count_en_sync_ff_clk[2]),.RST_N(counter_reset));
C28SOI_PM_CONTROL_LR_ASYNC_synchroniser  #(.SYNC_DEPTH(3)) u_sync_counter_3 ( .Q(r_count_enable_q_sync[3]),.D(r_count_enable_q[3]),.CLK(w_count_en_sync_ff_clk[3]),.RST_N(counter_reset));


// --------------------------------------------------- //
// Resynchronize count enable signal going to counters
// generate handshake for end of count
// --------------------------------------------------- //
generate for (g_i=0;g_i<4;g_i=g_i+1) begin : gen_count_en_resync_ff

C28SOI_PM_CONTROL_LR_ASYNC_synchroniser  #(.SYNC_DEPTH(2))
 u_resync_count_en (
 .Q(r_count_enable_q_resync[g_i]),
 .D(r_count_enable_q_sync[g_i]),
 .CLK(pmbw_clk),
 .RST_N(pmbw_rstn));

end
endgenerate
   
// end of count signals synchronised in pmbw_clk domain
assign r_count_enable_OR_q_resync = |(r_count_enable_q_resync);
assign powerdown_q[3:0] = (tcr_muxclk_mode == 1'b1) ? 4'b1111 : r_powerdown_q[3:0];


// For dft the output of sensor - In functional mode , dont capture sensors data to the obs flop 
always @(tcr_muxclk_mode,sensors_data) begin
 if (tcr_muxclk_mode == 1'b1) begin
  w_sensors_data = sensors_data;
 end
 else begin
  w_sensors_data = 4'b0000;
 end
end


//-------------------------------------
//---------- FSM ----------------------
//-------------------------------------

always @(negedge pmbw_rstn or posedge pmbw_clk) begin
 if (pmbw_rstn == 1'b0) begin
  wrapper_state_q <= k_idle;

  counter_reset_q <= 1'b0;
  counter_reset_q_dft <= 1'b0;

  r_count_enable_q <= 4'b0000;


  sensor_div_q <= 2'b00;
  sensor_div_rc_q <= 2'b00;
  //sensor_div   <= 2'b00;
  //sensor_div_rc <= 2'b00;

  //sensor_powerdown <= 4'b1111;
  r_powerdown_q <= 4'b1111;
  r_powerdown_q_dft <= 4'b1111;
  r_ctrl_data_shift_count <=  4'b0000;
  r_counter_data_P0_q <= {k_COUNTER_SIZE{1'b0}};
  r_counter_data_P4_q <= {k_COUNTER_SIZE{1'b0}};
  r_counter_data_P10_q <= {k_COUNTER_SIZE{1'b0}};
  r_counter_data_rc_q <= {k_COUNTER_SIZE{1'b0}};
  r_pmbw_ack <= 1'b0;
  w_serial_out <= 1'b0;
  r_sensors_data_dft <= 4'b0000;
 end
 else begin
  // observation ff on sensor powerdown
  r_powerdown_q_dft <= r_powerdown_q; 
  // observation ff on counter reset
  counter_reset_q_dft <= counter_reset_q;
  // observation ff on sensors data (clk outputs from sensor)
  r_sensors_data_dft <= w_sensors_data;

  if (pmbw_req_sync == 1'b0) // TRUE for all states
   r_pmbw_ack <= 1'b0;
   
   
   case(wrapper_state_q)
   k_idle: begin
   if (pmbw_req_sync == 1'b1  &&  r_pmbw_ack == 1'b0) begin
   	if ( ({r_shift_en_q, r_select_ctr_q} == k_select_ctr)) begin // 01
    				counter_reset_q <= 1'b0;
              	                sensor_div_q <= sensor_div[1:0];
          	                sensor_div_rc_q <= sensor_div_rc[1:0];
                           	wrapper_state_q<= k_start_stop_sensors_counters;
				r_pmbw_ack <= 1'b1;
   	end   
   	else if ( ({r_shift_en_q, r_select_ctr_q} == k_deselect_ctr)) begin // 00
    				r_powerdown_q <= 4'b1111;
    				counter_reset_q <= 1'b1;
    				wrapper_state_q <= k_idle;
    				r_pmbw_ack <= 1'b1;
   	end
   	else if (({r_shift_en_q, r_select_ctr_q} == k_shift_counter)) begin // 11  SHIFT_OUT 
                           // shift counter data from register
                           	if (sensor_powerdown[0] == 1'b0) begin
                            		r_counter_data_P0_q[k_COUNTER_SIZE-1:0] <= {r_counter_data_P0_q[k_COUNTER_SIZE-2:0],r_counter_data_P0_q[k_COUNTER_SIZE-1]};
                            		w_serial_out <= r_counter_data_P0_q[k_COUNTER_SIZE-1];
                           	end
                           	else if  (sensor_powerdown[1] ==1'b0) begin
                            		r_counter_data_P4_q[k_COUNTER_SIZE-1:0] <= {r_counter_data_P4_q[k_COUNTER_SIZE-2:0],r_counter_data_P4_q[k_COUNTER_SIZE-1]};
                            		w_serial_out <= r_counter_data_P4_q[k_COUNTER_SIZE-1];
                           	end
                           	else if  (sensor_powerdown[2] ==1'b0) begin
                            		r_counter_data_P10_q[k_COUNTER_SIZE-1:0] <= {r_counter_data_P10_q[k_COUNTER_SIZE-2:0],r_counter_data_P10_q[k_COUNTER_SIZE-1]};
                            		w_serial_out <= r_counter_data_P10_q[k_COUNTER_SIZE-1];
                           	end
				else if  (sensor_powerdown[3] ==1'b0) begin
                            		r_counter_data_rc_q[k_COUNTER_SIZE-1:0] <= {r_counter_data_rc_q[k_COUNTER_SIZE-2:0],r_counter_data_rc_q[k_COUNTER_SIZE-1]};
                            		w_serial_out <= r_counter_data_rc_q[k_COUNTER_SIZE-1];
                           	end
                           	else begin
                            		w_serial_out <= 1'b0;
                           	end
                           		wrapper_state_q <= k_idle;
			   		r_pmbw_ack <= 1'b1;
                          	end     
   
   			end
   				else begin
   			   
				wrapper_state_q <= k_idle;
				end
   end // end of idle state 
   
   k_start_stop_sensors_counters: begin
   		counter_reset_q <= 1'b1;
   		r_powerdown_q <= sensor_powerdown[3:0];
   		r_count_enable_q <= ~sensor_powerdown[3:0];
   		if ( (pmbw_req_sync == 1'b1  &&  r_pmbw_ack == 1'b0) && ({r_shift_en_q, r_select_ctr_q} == k_deselect_ctr)) begin
     			wrapper_state_q <= k_save_counters;
  		end   
  	end  // end of k_start_stop_sensors_counters
  
   k_save_counters : begin
  
   // load counter data into registers (selectively)
   		r_count_enable_q <= 4'b0000;
    		if (r_count_enable_OR_q_resync == 1'b0) begin // wait for all count to finish
     			// check ORed resync count enable signals 
    
   			if(sensor_powerdown[0] ==1'b0) begin
    				r_counter_data_P0_q <= counter_n;
   			end
   			if(sensor_powerdown[1] ==1'b0) begin
    				r_counter_data_P4_q <= counter_p;
   			end
   			if(sensor_powerdown[2] ==1'b0) begin
    				r_counter_data_P10_q <= counter_l;
   			end
			if(sensor_powerdown[3] ==1'b0) begin
                          r_counter_data_rc_q <= counter_rc;
                        end
   
   			wrapper_state_q <= k_stop_sensors;
   		end
  end // --- end of k_save_counters
  
  k_stop_sensors : begin
  
   		r_powerdown_q <= 4'b1111;
   		wrapper_state_q <= k_idle;
    		r_pmbw_ack <= 1'b1;
  end /// --- end of k_stop_sensors 
  
  default : begin
                  wrapper_state_q <= k_idle;
                 end
   
  endcase
  

 end
end


C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_reset counter_reset_mux ( .D0(counter_reset_q), .D1(pmbw_rstn), .sel(tst_reset_mux2), .z(counter_reset));


// ----------------------------------------------------- //
// counter logic 
// ----------------------------------------------------- //

always @(negedge counter_reset or posedge w_count_en_sync_ff_clk[0] ) begin : counterN_count_block
 if (!counter_reset) begin
  counter_n <= {k_COUNTER_SIZE{1'b0}};
 end
 else if ( r_count_enable_q_sync[0] == 1'b1 ) begin
  if ( (&counter_n[k_COUNTER_SIZE-2:0]) == 1'b0 ) begin
   counter_n[k_COUNTER_SIZE-2:0] <=  counter_n[k_COUNTER_SIZE-2:0] + {{(k_COUNTER_SIZE-2){1'b0}},1'b1};
  end   
  else begin
   counter_n[k_COUNTER_SIZE-1] <=  1'b1;
  end   
 end
end
      
always @(negedge counter_reset or posedge w_count_en_sync_ff_clk[1]) begin : counterP_count_block
 if (!counter_reset) begin
  counter_p <= {k_COUNTER_SIZE{1'b0}};
 end
 else if ( r_count_enable_q_sync[1] == 1'b1 ) begin
  if ( (&counter_p[k_COUNTER_SIZE-2:0]) == 1'b0 ) begin
   counter_p[k_COUNTER_SIZE-2:0] <=  counter_p[k_COUNTER_SIZE-2:0] + {{(k_COUNTER_SIZE-2){1'b0}},1'b1};
  end
  else begin
   counter_p[k_COUNTER_SIZE-1] <=  1'b1;
  end   
 end
end
      
always @(negedge counter_reset or posedge w_count_en_sync_ff_clk[2]) begin : counterL_count_block
 if (!counter_reset) begin
  counter_l <= {k_COUNTER_SIZE{1'b0}};
 end
 else if ( r_count_enable_q_sync[2] == 1'b1 ) begin
  if ( (&counter_l[k_COUNTER_SIZE-2:0]) == 1'b0 ) begin
   counter_l[k_COUNTER_SIZE-2:0] <=  counter_l[k_COUNTER_SIZE-2:0] + {{(k_COUNTER_SIZE-2){1'b0}},1'b1};
  end
  else begin
   counter_l[k_COUNTER_SIZE-1] <=  1'b1;
  end   
 end
end

always @(negedge counter_reset or posedge w_count_en_sync_ff_clk[3]) begin : counterRC_count_block
 if (!counter_reset) begin
  counter_rc <= {k_COUNTER_SIZE{1'b0}};
 end
 else if ( r_count_enable_q_sync[3] == 1'b1 ) begin
  if ( (&counter_rc[k_COUNTER_SIZE-2:0]) == 1'b0 ) begin
   counter_rc[k_COUNTER_SIZE-2:0] <=  counter_rc[k_COUNTER_SIZE-2:0] + {{(k_COUNTER_SIZE-2){1'b0}},1'b1};
  end
  else begin
   counter_rc[k_COUNTER_SIZE-1] <=  1'b1;
  end   
 end
end

//---outputs----

assign serial_out = w_serial_out;
assign pmbw_ack = r_pmbw_ack|r_pmbw_ack_w;


// Ring Oscillator direct frequency output on PMB logic wrapper interface

assign select_run_sensor = ((~r_shift_en_q)& r_select_ctr_q);


C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock osc_clk_0 (.D0(1'b0), .D1(ring_osc_clk_out_1), .sel(select_run_sensor), .z(w_ring_osc_clk));
C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock osc_clk_1 (.D0(sensors_data[0]), .D1(ring_osc_clk_out_2), .sel(sensor_powerdown[0]), .z(ring_osc_clk_out_1));
C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock osc_clk_2 (.D0(sensors_data[1]), .D1(ring_osc_clk_out_3), .sel(sensor_powerdown[1]), .z(ring_osc_clk_out_2));
C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock osc_clk_3 (.D0(sensors_data[2]), .D1(ring_osc_clk_out_4), .sel(sensor_powerdown[2]), .z(ring_osc_clk_out_3));
C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock osc_clk_4 (.D0(sensors_data[3]), .D1(1'b0), .sel(sensor_powerdown[3]), .z(ring_osc_clk_out_4));


//C28SOI_PM_CONTROL_LR_ASYNC_promip_divider2 u_ring_osc_clk_div2 ( .clk(pmbw_clk), .rst_n(pmbw_rstn), .tm(tcr_muxclk_mode), .counten(1'b1), .divider2_in(w_ring_osc_clk), .divider2_out(w_ring_osc_clk_div2));

//C28SOI_PM_CONTROL_LR_ASYNC_promip_divider2 u_ring_osc_clk_div4 ( .clk(pmbw_clk), .rst_n(pmbw_rstn), .tm(tcr_muxclk_mode), .counten(w_ring_osc_clk_div2), .divider2_in(w_ring_osc_clk), .divider2_out(w_ring_osc_clk_div4));

C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock 
      osc_clk_dft_mux (
        .D0(w_ring_osc_clk),
        .D1(pmbw_clk),
        .sel(tcr_muxclk_mode),
        .z(rc_osc_i_after_mux));

always @(posedge rc_osc_i_after_mux or negedge pmbw_rstn) begin
 if (pmbw_rstn == 1'b0)  begin
                        r_ring_osc_clk_div4  <= 1'b0;
                        cnt_n <= 2'b00;
                  end   
 else     begin
                 if (cnt_n == 2'b01) begin
                      r_ring_osc_clk_div4 <= ~r_ring_osc_clk_div4;
                      cnt_n <= 2'b00;
                      end
                 else
                      cnt_n <= cnt_n + 2'b01;
          end      
end


assign ring_osc_clk = r_ring_osc_clk_div4;
endmodule
