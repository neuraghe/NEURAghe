/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           hwce_engine.sv                                             *
 * Description:    Convolutional engine core FSM                              *
 *                                                                            *
 ******************************************************************************/

`include "hwce_types.sv"

module hwce_engine_fsm
#(
   parameter NPX = 1,
   parameter FILTER_SIZE = 5,
   parameter LINEBUFFER_WIDTH = 30,
   parameter N_ROW            = 2,
   parameter N_COL            = 2
)
(
   input  logic           clk, 
   input  logic           rst_n,
   input  logic           clear,
   
   input  logic [15:0]    linebuf_length,                     //its value is stored in the linebuf_length_int register and used to controll the value of line_buffer_almost_ready
   input  logic [15:0]    nfeat,                              //not used
   input  logic           linear_conv,                        //not used
  // input  stream_config_t [N_ROW*2+N_COL-1:0] stream_config,  //not used
   input  stream_flags_t [N_COL-1:0]  x_in_flags,                         //used only in RUN to pass to FSM_TERMINATE_PENDING if feat_update==1 && in_progress==0 or in FSM_CHANGE_FEAT if feat_update==1 && in_progress==1
   input  stream_flags_t [N_ROW-1:0] y_out_flags,                        //used in FSM_TERMINATE_PENDING to pass to IDLE if feat_update==1 and in FSM_CHANGE_FEAT to pass to FSM_RELOAD_WEIGHTS if feat_update==1
   output logic           weight_start,
   input  logic           weight_done,                        //when FSM_RELOAD_WEIGHTS if weight_done==1 -> FSM_PRELOAD
   input  logic           x_in_TVALID_i,
   input  logic           x_in_TREADY_o,
   input  logic           y_in_TVALID_i,                      //not used
   input  logic           y_in_TREADY_o,                      //not used
   input  logic           y_out_TVALID_o,                     //not used
   input  logic           y_out_TREADY_i,                     //not used
   input  logic           lb_valid_out,                       //not used
   input  logic           lb_ready_out,                       //not used
   input  stream_flags_t  lb_flags_out,                       //not used
   input  stream_flags_t  sop_flags_y_out,                    //not used
   output logic [3:0]     fsm_state_o,
   output logic           exception,                          //always 1'b0
   output logic           sop_clear,
   output logic  [7:0]    n_og_o,
   input  logic           engine_start,                   // when IDLE if engine_start==1 -> FSM_RELOAD_WEIGHTS
   input  logic [2:0]     filter_size,
   input  logic [2:0]     zero_padding_i
);

  // stream_config_t x_in_config, y_in_config, y_out_config;

   //localparam XFILTER_SIZE = (FILTER_SIZE / NPX) + (FILTER_SIZE % NPX);

   logic [`log2(LINEBUFFER_WIDTH*(FILTER_SIZE-1)+FILTER_SIZE-2)-1:0] line_buffer_counter;
   logic                                                             line_buffer_almost_ready;
   logic                                                             line_buffer_almost_ready_m2;

   logic [15:0] linebuf_length_int;
   
   logic [7:0] n_og_int;
   
   assign n_og_o = n_og_int;

  // assign x_in_config  = stream_config[ N_ROW*2+N_COL-1: N_ROW*2 ]; // not used
//assign y_in_config  = stream_config[ N_ROW*2-1      : N_ROW   ]; // not used
 //  assign y_out_config = stream_config[ N_ROW-1        : 0       ]; // not used

   fsm_state_t fsm_state;
`ifdef DEBUG_HWCE
   logic [31:0] run_count;
   logic [31:0] setup_count;
   logic [31:0] og_count;
`endif 
  

   always_comb
     begin
        case(fsm_state)
          FSM_IDLE:
            fsm_state_o = 4'b0000;
          FSM_PLWL:
            fsm_state_o = 4'b1001;
          FSM_PRELOAD:
            fsm_state_o = 4'b0001;
          FSM_CHANGE_FEAT:
            fsm_state_o = 4'b0010;
          FSM_TERMINATE_PENDING:
            fsm_state_o = 4'b0110;
          FSM_RELOAD_WEIGHTS:
            fsm_state_o = 4'b0101;
          FSM_RUN:
            fsm_state_o = 4'b0011;
          default:
            fsm_state_o = 4'b0000;
        endcase
     end

   assign exception = 1'b0;

   // internal linebuf length
   always_ff @(posedge clk or negedge rst_n)
   begin
      if (rst_n==1'b0)
         linebuf_length_int <= 0;
      else begin
         linebuf_length_int <= linebuf_length;
      end
   end

   // FSM
   always_ff @(posedge clk or negedge rst_n)
   begin
      if (rst_n==1'b0) begin
         sop_clear    <= 1'b1;
         fsm_state    <= FSM_IDLE;
         weight_start <= 1'b0;
         n_og_int     <= 8'b0;
`ifdef DEBUG_HWCE
         run_count    <= 0;
         setup_count  <= 0;
         og_count     <= 0;
`endif 
      end
      else begin
         case (fsm_state)
            FSM_IDLE:
               if(clear==1'b1)
               begin
                 sop_clear    <= 1'b1;
                 fsm_state    <= FSM_IDLE;
                 weight_start <= 1'b0;
                 n_og_int     <= 8'b0;
               end
               else if(engine_start==1'b1)
               begin
                 sop_clear    <= 1'b1;
                 fsm_state    <= FSM_PLWL;
`ifdef DEBUG_HWCE
                 setup_count  <= setup_count +1;
                 og_count     <= 0;
`endif 
                 weight_start <= 1'b1;
                 n_og_int     <= 8'b0;
               end
               else
               begin
                 n_og_int     <= 8'b0;
                 sop_clear    <= 1'b1;
                 fsm_state    <= FSM_IDLE;
                 weight_start <= 1'b0;
               end         
                  
            FSM_PLWL:
            begin            
            
              if(clear==1'b0)
              begin
                if (line_buffer_almost_ready==1'b1 && weight_done==1'b1)
                begin
                  sop_clear <= 1'b0;
                  fsm_state <= FSM_RUN;
`ifdef DEBUG_HWCE
                  run_count <= run_count + 1;
                  og_count  <= og_count  + 1;
`endif                     
                end
                else
                begin
                  sop_clear <= 1'b1;
                  
                  if(line_buffer_almost_ready_m2==1'b0)
                  begin                  
                    if(weight_done==1'b1)
                      fsm_state <= FSM_PRELOAD;                      
                    else 
                      fsm_state <= FSM_PLWL;
                  end
                  else
                  begin
                    fsm_state <= FSM_RELOAD_WEIGHTS;
                  end                                    
                end //(line_buffer_almost_ready==1'b1 && weight_done==1'b1)
                weight_start <= 1'b0;
              end 
              else
              begin
                sop_clear    <= 1'b1;
                fsm_state    <= FSM_IDLE;
                weight_start <= 1'b0;
              end              
            end
            
            
            FSM_PRELOAD:
               if(clear==1'b0) begin
                  if(line_buffer_almost_ready==1'b0) begin
                     sop_clear <= 1'b0;
                     fsm_state <= FSM_PRELOAD;
                  end
                  else begin
                     sop_clear <= 1'b0;
                     fsm_state <= FSM_RUN;
`ifdef DEBUG_HWCE
                     run_count <= run_count + 1;
                     og_count  <= og_count  + 1;
`endif 
                  end
                  weight_start <= 1'b0;
               end
               else begin
                  sop_clear <= 1'b1;
                  fsm_state <= FSM_IDLE;
                  weight_start <= 1'b0;
               end
            FSM_RUN:
               if(clear==1'b0) begin
                  if(x_in_flags[0].feat_update==1'b0) begin
                     sop_clear <= 1'b0;
                     fsm_state <= FSM_RUN;
                  end
                  else if((x_in_TREADY_o==1'b1) && (x_in_flags[0].in_progress==1'b0)) begin
                     sop_clear <= 1'b0;
                     fsm_state <= FSM_TERMINATE_PENDING;
                  end
                  else if(x_in_TREADY_o==1'b1) begin
                     sop_clear <= 1'b0;
                     fsm_state <= FSM_CHANGE_FEAT;
                  end
                  else begin
                     sop_clear <= 1'b0;
                     fsm_state <= FSM_RUN;
                  end
                  weight_start <= 1'b0;
               end
               else begin
                  sop_clear <= 1'b1;
                  fsm_state <= FSM_IDLE;
                  weight_start <= 1'b0;
               end
            FSM_CHANGE_FEAT:
               if(clear==1'b0) begin
                  if(y_out_flags[0].feat_update==1'b1) begin
                     sop_clear    <= 1'b1;
                     fsm_state    <= FSM_PLWL;
                     weight_start <= 1'b1;
                     n_og_int  <= n_og_int + 1'b1;
                  end
                  else begin
                     sop_clear    <= 1'b0;
                     fsm_state    <= FSM_CHANGE_FEAT;
                     weight_start <= 1'b0;
                  end
               end
               else begin
                  sop_clear    <= 1'b1;
                  fsm_state    <= FSM_IDLE;
                  weight_start <= 1'b0;
               end
            FSM_RELOAD_WEIGHTS:
               if(clear==1'b0) begin
                  if(weight_done==1'b1) begin
                     sop_clear <= 1'b0;
                     fsm_state <= FSM_RUN;
                  end
                  else begin
                     sop_clear <= 1'b1;
                     fsm_state <= FSM_RELOAD_WEIGHTS;
                  end
                  weight_start <= 1'b0;
               end
               else begin
                  sop_clear <= 1'b1;
                  fsm_state <= FSM_IDLE;
                  weight_start <= 1'b0;
               end
            FSM_TERMINATE_PENDING:
               if(clear==1'b0) begin // clear is always 0
                  if(y_out_flags[0].feat_update==1'b1) begin
                     sop_clear <= 1'b1;
                     fsm_state <= FSM_IDLE;
                  end
                  else begin
                     sop_clear <= 1'b0;
                     fsm_state <= FSM_TERMINATE_PENDING;
                  end
                  weight_start <= 1'b0;
               end
               else begin
                  sop_clear <= 1'b1;
                  fsm_state <= FSM_IDLE;
                  weight_start <= 1'b0;
               end
            default:
               begin
                  sop_clear <= 1'b1;
                  fsm_state <= FSM_IDLE;
                  weight_start <= 1'b0;
               end
         endcase
      end
   end
   
   
   logic [`log2(LINEBUFFER_WIDTH*(FILTER_SIZE-1)+FILTER_SIZE-2)-1:0] line_buffer_counter_max; 
    
   
   // Line buffer almost ready
   always_comb
   begin
      if (zero_padding_i[1:0]==2'b01) // top tile or only one tile  {no_bottom, no_top, zp}
        line_buffer_counter_max = (filter_size==3) ? linebuf_length_int*(3-2) + 16'h0002 : linebuf_length_int*(5-3) + 16'h0003 - 16'h0001;
      else if (zero_padding_i[2:0]==3'b111) // mid tile
        line_buffer_counter_max = (filter_size==3) ? linebuf_length_int*(3-1) + 16'h0002 : linebuf_length_int*(5-1) + 16'h0003 - 16'h0001;
      else if (zero_padding_i[2:0]==3'b011) // bot tile
        line_buffer_counter_max = (filter_size==3) ? linebuf_length_int*(3-1) + 16'h0002 : linebuf_length_int*(5-1) + 16'h0003 - 16'h0001;
      else // no zp
        line_buffer_counter_max = (filter_size==3) ? linebuf_length_int*(3-1) + 16'h0002 : linebuf_length_int*(5-1) + 16'h0003;
      
      
      if(line_buffer_counter == line_buffer_counter_max)
         line_buffer_almost_ready = x_in_TVALID_i & x_in_TREADY_o;
      else
         line_buffer_almost_ready = 1'b0;
         
      if(line_buffer_counter == line_buffer_counter_max-2)
         line_buffer_almost_ready_m2 = x_in_TVALID_i & x_in_TREADY_o;
      else
         line_buffer_almost_ready_m2 = 1'b0;
   end

   // Line buffer counter
   always_ff @(posedge clk or negedge rst_n)
   begin : line_buffer_ready_seq
      if(rst_n==1'b0) begin
         line_buffer_counter <= 0;
      end
      else begin
         if ((clear==1'b1) || (fsm_state==FSM_RUN) || (fsm_state==FSM_IDLE) || (fsm_state==FSM_CHANGE_FEAT) || (fsm_state==FSM_TERMINATE_PENDING))
            line_buffer_counter <= 0;
         else if((x_in_TVALID_i==1'b1) && (x_in_TREADY_o==1'b1))
            line_buffer_counter <= line_buffer_counter + 1;
      end
   end

endmodule
