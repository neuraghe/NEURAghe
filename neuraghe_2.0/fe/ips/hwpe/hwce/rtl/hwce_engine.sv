/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 *          EOLAB @ DIEE - Università degli studi di Cagliari                 *
 *                      Via marengo 2 - 09123                                 *
 *                              Cagliari                                      *
 *                                                                            *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                 Gianfranco Deriu - gian.deriu@gmail.com                    *
 *
 * Project:        HW convolutional engine                                    *
 * File:           hwce_engine.sv                                             *
 * Description:    Convolutional engine core                                  *
 *                                                                            *
 ******************************************************************************/

`include "hwce_types.sv"

module hwce_engine
#(
   parameter AXI_WIDTH        = 32,
   parameter CONV_WIDTH       = 16,
//   parameter PIPE_STAGES_SOP  = 4,
   parameter FILTER_SIZE      = 5,
   parameter QF               = 13,
   parameter LINEBUFFER_WIDTH = 32,
   parameter TID_SIZE         = 1,
   parameter TDEST_SIZE       = 1,
   parameter TUSER_SIZE       = 1,
   parameter TID              = 0,
   parameter TDEST            = 0,
   parameter TUSER            = 0,
   parameter LINEAR_SUPPORTED = 1,//FIXME: linear support doesn't work
   parameter ACC_CONFIG       = 5,
   parameter NPX              = 4,
   parameter N_ROW            = 2,
   parameter N_COL            = 2,
   parameter WL_PORTS         = 48,
   parameter NPF              = 3, // number of parallel filters
   parameter NB_TRELLIS      = 7,
   parameter MUL_PER_TREL    = 4 // $ceil(27/NB_TRELLIS). VIVADO doesn't allow the use of $ceil
)
(
   input  logic                                               clk,
   input  logic                                               rst_n,
   input  logic [N_ROW-1:0][N_COL-1:0][FILTER_SIZE*FILTER_SIZE*NPF-1:0][CONV_WIDTH-1:0] weight,
   input  logic [N_ROW-1:0][CONV_WIDTH - 1:0]                                   bias,
   input  logic                                               clear,
   output logic                                               done_preload,
   input  engine_params_t                                     engine_params,
   output logic                                               weight_start,
   input  logic                                               weight_done,
   output logic [3:0]                                         engine_state,
   input  logic                                               engine_start,
   input  logic [3:0]                                         filter_size,
   input  logic                                               sum_over_constant,
   input  logic                                               rectifier_activ,
   output logic  [7:0]                                        n_og_o,
   input  logic  [2:0]                                        zero_padding_i,
   input  logic                                               precision8,

   // Sink side - TARG
   output logic [N_ROW-1:0]                      y_out_TVALID_o,
   input  logic [N_ROW-1:0]                      y_out_TREADY_i,
   output logic [N_ROW-1:0][NPX-1:0][AXI_WIDTH  -1:0]     y_out_TDATA_o,
   output logic [N_ROW-1:0][AXI_WIDTH/8-1:0]     y_out_TSTRB_o,
   output logic [N_ROW-1:0][AXI_WIDTH/8-1:0]     y_out_TKEEP_o,
   output logic [N_ROW-1:0]                      y_out_TLAST_o,
   output logic [N_ROW-1:0][TID_SIZE  -1:0]      y_out_TID_o,
   output logic [N_ROW-1:0][TDEST_SIZE-1:0]      y_out_TDEST_o,
   output logic [N_ROW-1:0][TUSER_SIZE-1:0]      y_out_TUSER_o,
   // Source side - TARG
   input  logic [NPF*N_COL-1:0]                  x_in_TVALID_i,
   output logic [NPF*N_COL-1:0]                  x_in_TREADY_o,
   input  logic [NPF*N_COL-1:0][NPX-1:0][AXI_WIDTH  -1:0] x_in_TDATA_i,
   input  logic [NPF*N_COL-1:0][AXI_WIDTH/8-1:0] x_in_TSTRB_i,
   input  logic [NPF*N_COL-1:0][AXI_WIDTH/8-1:0] x_in_TKEEP_i,
   input  logic [NPF*N_COL-1:0]                  x_in_TLAST_i,
   input  logic [NPF*N_COL-1:0][TID_SIZE  -1:0]  x_in_TID_i,
   input  logic [NPF*N_COL-1:0][TDEST_SIZE-1:0]  x_in_TDEST_i,
   input  logic [NPF*N_COL-1:0][TUSER_SIZE-1:0]  x_in_TUSER_i,
   
   input logic  [WL_PORTS-1:0][CONV_WIDTH-1:0]    w_in_WDATA_i,
   
   input  logic [N_ROW-1:0]                      y_in_TVALID_i,
   output logic [N_ROW-1:0]                      y_in_TREADY_o,
   input  logic [N_ROW-1:0][NPX-1:0][AXI_WIDTH  -1:0]     y_in_TDATA_i,
   input  logic [N_ROW-1:0][AXI_WIDTH/8-1:0]     y_in_TSTRB_i,
   input  logic [N_ROW-1:0][AXI_WIDTH/8-1:0]     y_in_TKEEP_i,
   input  logic [N_ROW-1:0]                      y_in_TLAST_i,
   input  logic [N_ROW-1:0][TID_SIZE  -1:0]      y_in_TID_i,
   input  logic [N_ROW-1:0][TDEST_SIZE-1:0]      y_in_TDEST_i,
   input  logic [N_ROW-1:0][TUSER_SIZE-1:0]      y_in_TUSER_i

`ifdef HWCE_PERF_COUNTER
   ,
   output logic [15:0]              perf_preload,
   output logic [15:0]              perf_run,
   output logic [15:0]              perf_feat,
   output logic [15:0]              perf_tot
`endif

);

   //localparam NPX       = AXI_WIDTH/CONV_WIDTH;
   
   localparam SUM_WIDHT = 48;  // see DSP48E1 reference manual for bus size

   // Global control signals
   logic                                               sop_clear;
   logic                                               enable;
   logic [3:0]                                         fsm_state;
   logic                                               exception;
   //logic signed [N_ROW-1:0][N_COL-1:0][FILTER_SIZE*FILTER_SIZE*NPF-1:0][CONV_WIDTH-1:0] weight_int;
   logic signed [N_ROW-1:0][N_COL-1:0][CONV_WIDTH-1:0]                weight_int;

   // Data signals
   logic signed [N_COL-1:0][NPX-1:0][AXI_WIDTH-1:0]                                                      x_in_sop;
   logic signed [N_ROW-1:0][NPX-1:0][AXI_WIDTH-1:0]                                                      y_in;
   logic signed [N_ROW-1:0][NPX-1:0][AXI_WIDTH-1:0]                                                      y_out;
   logic signed [N_ROW-1:0][NPX-1:0][CONV_WIDTH-1:0]                                            y_out_int;
   logic signed [N_ROW-1:0][NPX-1:0][CONV_WIDTH-1:0]                                            y_out_short;
   logic signed [N_ROW-1:0][NPX-1:0][CONV_WIDTH-1:0]                                            y_in_int;
   logic signed [N_ROW-1:0][NPX-1:0][CONV_WIDTH-1:0]                                            y_in_post_fifo;
   logic signed [N_ROW-1:0][N_COL-1:0][NPX-1:0][SUM_WIDHT-1:0]                                  y_out_sop;
   
   logic signed [N_ROW*AXI_WIDTH-1:0]                                                           y_out_reorg; //just a different wiring //FIXME: signed??
   
   // Linebuffer control signals
   logic [N_COL-1:0]            lb_valid_in;
   logic [N_COL-1:0]            lb_ready_in;
   logic [N_COL-1:0]            lb_valid_out;
   logic [N_COL-1:0]            lb_ready_out;

   // Sum-of-Products control signals
   logic [N_ROW-1:0][N_COL-1:0] sop_valid_x_in;
   logic [N_ROW-1:0][N_COL-1:0] sop_ready_x_in;
   logic [N_ROW-1:0][N_COL-1:0] sop_valid_x_in_out;
   
   logic [N_ROW-1:0][N_COL-1:0] sop_valid_y_in;
   logic [N_ROW-1:0][N_COL-1:0] sop_ready_y_in;
   
   logic /*[N_ROW-1:0][N_COL-1:0]*/ sop_valid_y_out;
   logic /*[N_ROW-1:0][N_COL-1:0]*/ sop_ready_y_out;   
   
   logic [N_ROW-1:0]            valid_y_out_add;
   
   
   /*for SoP Logic*/
   
   localparam DSP_REGS        = 2;  // number of Xilinx DSP input regs
   localparam PIPE_STAGES_SOP = DSP_REGS + 1 + 1;
   
   logic [PIPE_STAGES_SOP-1:0] valid_y_out_pipe;
   logic [PIPE_STAGES_SOP-1:0] valid_x_in_pipe;
 
   logic                 [7:0]  cnt_fs_w;
   logic                 [7:0]  cnt_fs_h;
   
   logic                 [7:0]  fs_w;
   logic                 [7:0]  fs_h;
   
   // Stream flags
   stream_flags_t [N_COL-1:0]   x_in_flags;
   stream_flags_t [N_ROW-1:0]   y_in_flags;
   stream_flags_t [N_ROW-1:0]   y_out_flags;
   
   stream_flags_t [N_COL-1:0]   lb_flags_in;
   stream_flags_t [N_COL-1:0]   lb_flags_out;
   
   stream_flags_t [N_ROW-1:0][N_COL-1:0]sop_flags_x_in;
   stream_flags_t [N_ROW-1:0][N_COL-1:0]sop_flags_y_out;

   /* GLOBAL SIGNALS */

   //assign x_in_flags  = engine_params.stream_flags [N_COL+2*N_ROW-1:2*N_ROW];
   //assign y_in_flags  = engine_params.stream_flags [2*N_ROW-1:N_ROW];
   //assign y_out_flags = engine_params.stream_flags [N_ROW-1:0];
        
   assign y_out_TLAST_o = '0;
   assign y_out_TID_o   = '0;
   assign y_out_TDEST_o = '0;
   assign y_out_TUSER_o = '0;
   
   assign x_in_flags  = x_in_TUSER_i;
   assign y_in_flags  = x_in_TUSER_i; // not used
   assign y_out_flags = y_in_TUSER_i;
   
   assign enable = 1'b1;
   assign done_preload = ((fsm_state != 4'b0000) /*&& (fsm_state != 4'b0001)*/ && (fsm_state != 4'b0101) && (fsm_state != 4'b1001)) ? 1'b1 : 1'b0; 
   // state != FSM_IDLE && state != FSM_PRELOAD && state != FSM_RELOAD_WEIGHTS && state != FSM_PLWL
   assign engine_state = fsm_state;
   

   /* CONTROL FSM */
   

   logic [3:0] ex_fsm_state;
      
   always_ff @(posedge clk or negedge rst_n)
   begin
      if(rst_n == 1'b0) begin
         ex_fsm_state <= 4'b0;
      end
      else begin
         ex_fsm_state <= fsm_state;
      end
   end

   hwce_engine_fsm #(
      .NPX              (NPX             ),
      .FILTER_SIZE      (FILTER_SIZE     ),
      .LINEBUFFER_WIDTH (LINEBUFFER_WIDTH),
      .N_ROW            (N_ROW           ),
      .N_COL            (N_COL           )
   )
   fsm_i (
      .clk                   (clk                          ),
      .rst_n                 (rst_n                        ),
      .clear                 (clear                        ),
      .engine_start          (engine_start                 ),
      .linebuf_length        (engine_params.linebuf_length ),
      .x_in_flags            (x_in_flags[0]                ),
      .y_out_flags           (y_out_flags[0]               ),
      .weight_start          (weight_start                 ),
      .weight_done           (weight_done                  ),
      .x_in_TVALID_i         (x_in_TVALID_i[0]             ),
      .x_in_TREADY_o         (x_in_TREADY_o[0]             ),
      .fsm_state_o           (fsm_state                    ),
      .exception             (exception                    ), // always 1'b0
      .sop_clear             (sop_clear                    ),
      .n_og_o                (n_og_o                       ),
      .zero_padding_i        ( zero_padding_i              )
   );

   
   genvar c,r,j, t, i, l; 

   for(c=0; c<NPF*N_COL; c++) begin
    assign x_in_TREADY_o[c] = ((fsm_state==4'b0010) || (fsm_state==4'b0110) || (fsm_state==4'b0101)) ? 1'b0 : ( (fsm_state==4'b1001) ? 1'b1 : &y_out_TREADY_i /*|| x_in_TUSER_i[c][13]*/ );
                              // CHANGE_FEAT        ||  TERMINATE_PENDING   ||  RELOAD_WEIGHTS                    PL_WL                                          feat_update
   end
   
   generate
   
      assign weight_int = w_in_WDATA_i; //weight;
         
      assign y_out=y_out_int;
        
      assign fs_w = engine_params.stream_config[2*N_ROW].weight_sizes[15:8];
      assign fs_h = engine_params.stream_config[2*N_ROW].weight_sizes[7:0];
      
      always_ff @(posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0) begin
          cnt_fs_w <= {(8){1'b0}};
          cnt_fs_h <= {(8){1'b0}};
        end
        else if(clear || sop_ready_y_out == 1'b0 || (cnt_fs_w == fs_w - 1 && cnt_fs_h == fs_h - 1)) begin
          cnt_fs_w <= {(8){1'b0}};
          cnt_fs_h <= {(8){1'b0}};
        end
        else begin
          if(cnt_fs_w < fs_w - 1) begin
            cnt_fs_w <= cnt_fs_w + valid_x_in_pipe[0];
            cnt_fs_h <= cnt_fs_h;
          end
          else if(cnt_fs_h < fs_h - 1) begin
            cnt_fs_w <= {(8){1'b0}};
            cnt_fs_h <= cnt_fs_h + valid_x_in_pipe[0];
          end
          else begin
            cnt_fs_w <= cnt_fs_w;
            cnt_fs_h <= cnt_fs_h;
          end
        end
      end
    
    assign sop_valid_y_out = (cnt_fs_w == fs_w - 1 && cnt_fs_h == fs_h - 1 && valid_x_in_pipe[0]) ? 1'b1 : 1'b0;
    
    assign valid_x_in_out = valid_x_in_pipe[0];
    

     
    //input signals pipe
    
    integer k;      
    always_ff @(posedge clk) begin
      if(rst_n == 1'b0) begin
        valid_x_in_pipe <= 0;                
      end
      else if (clear || sop_ready_y_out == 1'b0) begin
          valid_x_in_pipe <= 0;
      end
      else begin
          
          valid_x_in_pipe[PIPE_STAGES_SOP -1] <= x_in_TVALID_i[0];//valid_x_in;
          
          for (k=PIPE_STAGES_SOP-1; k>0; k--) begin
          
            valid_x_in_pipe [k-1] <= valid_x_in_pipe[k];
            
          end
      end
    end     
       

      /* SUM-OF-PRODUCT UNITS */
         
      // SoP instantiation
      for (c=0; c < N_COL; c++) begin : SoP_col 

      assign x_in_sop[c] = x_in_TDATA_i[c];
       
        for (r=0; r < N_ROW; r++) begin : SoP
          hwce_sop
              #(
                .CONV_WIDTH(CONV_WIDTH),
                .NPX       (NPX),
                .SUM_WIDHT (SUM_WIDHT)
              )
              hwce_sop_i
              (
                .clk            (clk),
                .rst_n          (rst_n),
                .enable         (enable),   
                
                .x_in_flags     (x_in_flags[0]             ),
                .valid_x_in     (x_in_TVALID_i[0]/*sop_valid_x_in     [r][c] */),
//                .y_out_TREADY_i (y_out_TREADY_i     [r]    ),
//                .valid_x_in_out (sop_valid_x_in_out [r][c] ),  
                .valid_y_out    (sop_valid_y_out    /*[r][c]*/ ),
                .ready_y_out    (sop_ready_y_out    /*[r][c]*/ ), 
                .clear          (sop_clear),
//                .fs_w           (engine_params.stream_config[2*N_ROW].weight_sizes[15:8]),
//                .fs_h           (engine_params.stream_config[2*N_ROW].weight_sizes[7:0]),     // INVIATO DAL MW -> WRAPPER_SLAVE
                .x_in           (x_in_sop[c]               ),
                .w_in           (weight_int [r][c]         ),
                .precision8     (precision8                ),
                .y_out          (y_out_sop[r][c]           )
              );
          end
        end
      
      assign sop_ready_y_out  = &y_out_TREADY_i;
        
      for (c=0; c < N_COL; c++) begin             
        assign lb_ready_out [c]   = sop_ready_x_in[0][c] ;
      end    
        
      for (r=0; r < N_ROW; r++) begin
        for (c=0; c < N_COL; c++) begin
          assign sop_valid_x_in  [r][c] = x_in_TVALID_i[0]; //TODO: a tutti i sop lo stesso valid?
        end
      end
          
      for (r=0; r < N_ROW; r++) begin          
          assign y_out_TDATA_o[r]      = y_out[r];
          assign y_out_TKEEP_o[r]      = (y_out_TVALID_o[r] == 1'b1) ? '1 : '0;
          assign y_out_TSTRB_o[r]      = (y_out_TVALID_o[r] == 1'b1) ? '1 : '0;  
      end  
        

   endgenerate

  

  generate          
    for (r=0;r<N_ROW;r++) 
    begin : SHIFT_ADDERS


    hwce_shift_adder #(
        .CONV_WIDTH        ( CONV_WIDTH               ),
        .NPX               ( NPX                      ),
        .N_COL             ( N_COL                    )
      
      
       ) shift_adder_i ( 
        .clk               ( clk                      ),
        .rst_n             ( rst_n                    ),
        .fsm_state         ( fsm_state                ),
        .y_in              ( y_in_TDATA_i         [r] ),
        .valid_y_in        ( y_in_TVALID_i        [r] ),
        .valid_x_in_sop    ( valid_x_in_out/*&sop_valid_x_in_out  [r] */),
        .y_in_sop          ( y_out_sop [r]            ),
        .valid_y_in_sop    ( sop_valid_y_out /*&sop_valid_y_out     [r] */),
        .y_out             ( y_out_short          [r] ),
        .valid_y_out       ( valid_y_out_add      [r] ),
        .constant_to_sum   ( bias                 [r] ),
        .sum_over_constant ( sum_over_constant        ),
        .rectifier_activ   ( rectifier_activ          ),
        .qf_i              ( engine_params.qf         ),
        .precision8        ( precision8               )
      );
      
      assign y_out_TVALID_o [r] = &valid_y_out_add[r] & done_preload;
      assign y_out_int      [r] = y_out_short[r];

//    
      assign y_in_TREADY_o [r] = y_out_TREADY_i[r] & sop_valid_y_out /*&sop_valid_y_out[r]*/ ; //&valid_y_out_add[r];

//      
     end
   endgenerate
   

   /* PERFORMANCE COUNTER */
   /* synopsys translate_off */

`ifdef HWCE_PERF_COUNTER
   always_ff @(posedge clk or negedge rst_n)
   begin : performance_counters_proc
      if(rst_n==1'b0) begin
         perf_feat    <= 0;
         perf_run     <= 0;
         perf_preload <= 0;
         perf_tot     <= 0;
      end
      else if (fsm_state == 3'b000) begin
         perf_feat    <= 0;
         perf_run     <= 0;
         perf_preload <= 0;
         perf_tot     <= 0;
      end
      else begin
         perf_tot <= perf_tot + 1;
         if(fsm_state == 3'b01)
            perf_preload <= perf_preload + 1;
         else if (fsm_state == 3'b11)
            perf_run <= perf_run + 1;
         else if (fsm_state[1:0] == 2'b10)
            perf_feat <= perf_feat + 1;
         else if (fsm_state == 3'b101)
            perf_feat <= perf_feat + 1;
      end
   end
`endif

   /* synopsys translate_on */

endmodule
