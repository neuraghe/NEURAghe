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
   parameter PIPE_STAGES_SOP  = 4,
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
   parameter N_ROW            = 2,
   parameter N_COL            = 2,
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
   input  logic [2:0]                                         filter_size,
   input  logic                                               sum_over_constant,
   input  logic                                               rectifier_activ,
   output logic  [7:0]                                        n_og_o,
   input  logic  [2:0]                                        zero_padding_i,
   input  logic                                               precision8,

   // Sink side - TARG
   output logic [N_ROW-1:0]                      y_out_TVALID_o,
   input  logic [N_ROW-1:0]                      y_out_TREADY_i,
   output logic [N_ROW-1:0][AXI_WIDTH  -1:0]     y_out_TDATA_o,
   output logic [N_ROW-1:0][AXI_WIDTH/8-1:0]     y_out_TSTRB_o,
   output logic [N_ROW-1:0][AXI_WIDTH/8-1:0]     y_out_TKEEP_o,
   output logic [N_ROW-1:0]                      y_out_TLAST_o,
   output logic [N_ROW-1:0][TID_SIZE  -1:0]      y_out_TID_o,
   output logic [N_ROW-1:0][TDEST_SIZE-1:0]      y_out_TDEST_o,
   output logic [N_ROW-1:0][TUSER_SIZE-1:0]      y_out_TUSER_o,
   // Source side - TARG
   input  logic [NPF*N_COL-1:0]                  x_in_TVALID_i,
   output logic [NPF*N_COL-1:0]                  x_in_TREADY_o,
   input  logic [NPF*N_COL-1:0][AXI_WIDTH  -1:0] x_in_TDATA_i,
   input  logic [NPF*N_COL-1:0][AXI_WIDTH/8-1:0] x_in_TSTRB_i,
   input  logic [NPF*N_COL-1:0][AXI_WIDTH/8-1:0] x_in_TKEEP_i,
   input  logic [NPF*N_COL-1:0]                  x_in_TLAST_i,
   input  logic [NPF*N_COL-1:0][TID_SIZE  -1:0]  x_in_TID_i,
   input  logic [NPF*N_COL-1:0][TDEST_SIZE-1:0]  x_in_TDEST_i,
   input  logic [NPF*N_COL-1:0][TUSER_SIZE-1:0]  x_in_TUSER_i,
   
   input  logic [N_ROW-1:0]                      y_in_TVALID_i,
   output logic [N_ROW-1:0]                      y_in_TREADY_o,
   input  logic [N_ROW-1:0][AXI_WIDTH  -1:0]     y_in_TDATA_i,
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

   localparam NPX       = AXI_WIDTH/CONV_WIDTH;

   localparam NB_MULS   = FILTER_SIZE*FILTER_SIZE*NPF;
   localparam MUL_WIDHT = 48;//2*CONV_WIDTH+$clog2(NB_MULS); // see DSP48E1 reference manual for bus size

   // Global control signals
   logic                                               sop_clear;
   logic                                               enable;
   logic [3:0]                                         fsm_state;
   logic                                               exception;
   logic signed [N_ROW-1:0][N_COL-1:0][FILTER_SIZE*FILTER_SIZE*NPF-1:0][CONV_WIDTH-1:0] weight_int;

   // Data signals
   logic signed [N_COL-1:0][AXI_WIDTH-1:0]                                                      x_in;
   logic signed [N_COL-1:0][AXI_WIDTH-1:0]                                                      x_in_2;
   logic signed [N_COL-1:0][AXI_WIDTH-1:0]                                                      x_in_3;
   logic signed [N_ROW-1:0][AXI_WIDTH-1:0]                                                      y_in;
   logic signed [N_ROW-1:0][AXI_WIDTH-1:0]                                                      y_out;
   logic signed [N_ROW-1:0][NPX-1:0][CONV_WIDTH-1:0]                                            y_out_int;
   logic signed [N_ROW-1:0][NPX-1:0][CONV_WIDTH-1:0]                                            y_out_short;
   logic signed [N_ROW-1:0][NPX-1:0][CONV_WIDTH-1:0]                                            y_in_int;
   logic signed [N_ROW-1:0][NPX-1:0][CONV_WIDTH-1:0]                                            y_in_post_fifo;
   logic signed [N_ROW-1:0][N_COL-1:0][NPX-1:0][MUL_WIDHT-1:0]                                  y_out_int_sop;
   logic signed [N_COL-1:0][NPX-1:0][NPF-1:0][FILTER_SIZE-1:0][FILTER_SIZE-1:0][CONV_WIDTH-1:0] x_filter; // FIXME [N_COL-1:0][NPX-1:0][27-1:0][CONV_WIDTH-1:0]
   //logic signed [N_COL-1:0][NPX-1:0][NPF-1:0][FILTER_SIZE-1:0][FILTER_SIZE-1:0][CONV_WIDTH-1:0] x_filter_pipe;
   
   logic signed [N_ROW*AXI_WIDTH-1:0]                                                           y_out_reorg; //just a different wiring //FIXME: signed??
   
   // Linebuffer control signals
   logic [N_COL-1:0]            lb_valid_in;
   logic [N_COL-1:0]            lb_ready_in;
   logic [N_COL-1:0]            lb_valid_out;
   logic [N_COL-1:0]            lb_ready_out;

   // Sum-of-Products control signals
   logic [N_ROW-1:0][N_COL-1:0] sop_valid_x_in;
   logic [N_ROW-1:0][N_COL-1:0] sop_ready_x_in;
   
   logic [N_ROW-1:0][N_COL-1:0] sop_valid_y_in;
   logic [N_ROW-1:0][N_COL-1:0] sop_ready_y_in;
   
   logic [N_ROW-1:0][N_COL-1:0] sop_valid_y_out;
   logic [N_ROW-1:0][N_COL-1:0] sop_ready_y_out;   
   
   logic [N_ROW-1:0]            valid_y_out_add;
   
   // Stream flags
   stream_flags_t [N_COL-1:0]   x_in_flags;
   stream_flags_t [N_ROW-1:0]   y_in_flags;
   stream_flags_t [N_ROW-1:0]   y_out_flags;
   
   stream_flags_t [N_COL-1:0]   lb_flags_in;
   stream_flags_t [N_COL-1:0]   lb_flags_out;
   
   stream_flags_t [N_ROW-1:0][N_COL-1:0]sop_flags_x_in;
   stream_flags_t [N_ROW-1:0][N_COL-1:0]sop_flags_y_in;
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
   assign done_preload = ((fsm_state != 4'b0000) && (fsm_state != 4'b0001) & (fsm_state != 4'b0101)& (fsm_state != 4'b1001)) ? 1'b1 : 1'b0; 
   // state != FSM_IDLE && state != FSM_PRELOAD && state != FSM_RELOAD_WEIGHTS && state != FSM_PLWL
   assign engine_state = fsm_state;
   
   
   logic            engine_start_pipe;
   engine_params_t  engine_params_pipe;
   
   always_ff @(posedge clk) begin
      engine_start_pipe   <= engine_start;
      engine_params_pipe  <= engine_params;
   end

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
      .engine_start          (engine_start_pipe                 ),
      .linebuf_length        (engine_params_pipe.linebuf_length ),
      .nfeat                 (engine_params_pipe.nfeat          ),//not used
      .linear_conv           (engine_params_pipe.linear_conv    ),
      .x_in_flags            (x_in_flags[0]                ),
      .y_out_flags           (y_out_flags[0]               ),
      .weight_start          (weight_start                 ),
      .weight_done           (weight_done                  ),
      .x_in_TVALID_i         (x_in_TVALID_i[0]             ),
      .x_in_TREADY_o         (x_in_TREADY_o[0]             ),
      .y_in_TVALID_i         (y_in_TVALID_i[0]             ), // not used
      .y_in_TREADY_o         (y_in_TREADY_o [0]            ), // not used
      .y_out_TVALID_o        (y_out_TVALID_o [0]           ), // not used
      .y_out_TREADY_i        (y_out_TREADY_i[0]            ), // not used
      .lb_valid_out          (lb_valid_out [0]             ), // not used
      .lb_ready_out          (lb_ready_out [0]             ), // not used
      .lb_flags_out          (lb_flags_out [0]             ), // not used
      .sop_flags_y_out       (sop_flags_y_out [0][0]       ), // not used
      .fsm_state_o           (fsm_state                    ),
      .exception             (exception                    ), // always 1'b0
      .sop_clear             (sop_clear                    ),
      .filter_size           (filter_size                  ),
      .n_og_o                (n_og_o                       ),
      .zero_padding_i        ( zero_padding_i              )
   );

     
 //  logic [N_ROW-1:0]                      ready_add_shift;                
   
   logic signed                         [N_COL-1:0][NPX-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0]                   [CONV_WIDTH-1:0] x_filter_rewiring;
   
   (* srl_style = "srl" *) logic signed [N_COL-1:0][NPX-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][MUL_PER_TREL -1:0][CONV_WIDTH-1:0] x_filter_pipe;
   
   logic signed                         [N_COL-1:0][NPX-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0]                   [CONV_WIDTH-1:0] x_filter_sop;
   
   genvar c,r,j, t, i, l; 
   generate
     for (c=0; c < N_COL; c++) begin : LINEBUFFER
       
       /* LINEBUFFER */

       // Linebuffer data and control wiring
       assign lb_valid_in[c] = (ex_fsm_state == 4'b0000) ? 1'b0 :
                               (ex_fsm_state == 4'b0001) ? x_in_TVALID_i[c] :
                               (/*ex_*/fsm_state == 4'b0101) ? 1'b0 :
                               (ex_fsm_state == 4'b0110 || fsm_state == 4'b0110) ? 1'b1 : // everything "valid" when just terminating!
                            ! ((ex_fsm_state == 4'b0011) && (fsm_state == 4'b0100)) ? x_in_TVALID_i[c] :
                          enable;
       
       assign lb_flags_in[c]   = (ex_fsm_state == 4'b0000) ? 0 : x_in_flags[c];
       
//       assign x_in  [c]        = {x_in_TDATA_i[c        ][15:0], x_in_TDATA_i[c        ][31:16]};       
//       assign x_in_2[c]        = {x_in_TDATA_i[c+N_COL  ][15:0], x_in_TDATA_i[c+N_COL  ][31:16]};       
//       assign x_in_3[c]        = {x_in_TDATA_i[c+2*N_COL][15:0], x_in_TDATA_i[c+2*N_COL][31:16]};
       
       for(i=0; i<NPX; i++)begin
           assign x_in  [c][(CONV_WIDTH-1)+i*CONV_WIDTH : i*CONV_WIDTH] = x_in_TDATA_i[c        ][(AXI_WIDTH-1)-i*CONV_WIDTH : AXI_WIDTH-CONV_WIDTH-i*CONV_WIDTH];       
           assign x_in_2[c][(CONV_WIDTH-1)+i*CONV_WIDTH : i*CONV_WIDTH] = x_in_TDATA_i[c+N_COL  ][(AXI_WIDTH-1)-i*CONV_WIDTH : AXI_WIDTH-CONV_WIDTH-i*CONV_WIDTH];       
           assign x_in_3[c][(CONV_WIDTH-1)+i*CONV_WIDTH : i*CONV_WIDTH] = x_in_TDATA_i[c+2*N_COL][(AXI_WIDTH-1)-i*CONV_WIDTH : AXI_WIDTH-CONV_WIDTH-i*CONV_WIDTH];
           end
       
       assign x_in_TREADY_o[c]         = ((fsm_state==4'b0010) || (fsm_state==4'b0110) || (fsm_state==4'b0101)) ? 1'b0 : lb_ready_in[c];
       assign x_in_TREADY_o[c+N_COL]   = ((fsm_state==4'b0010) || (fsm_state==4'b0110) || (fsm_state==4'b0101)) ? 1'b0 : lb_ready_in[c];
       assign x_in_TREADY_o[c+2*N_COL] = ((fsm_state==4'b0010) || (fsm_state==4'b0110) || (fsm_state==4'b0101)) ? 1'b0 : lb_ready_in[c];
     
       // Linebuffer instantiation
       hwce_linebuffer #(
          .NPX              (NPX             ),
          .AXI_WIDTH        (AXI_WIDTH       ),
          .CONV_WIDTH       (CONV_WIDTH      ),
          .FS               (FILTER_SIZE     ),
          .LINEBUFFER_WIDTH (LINEBUFFER_WIDTH),
          .LINEAR_SUPPORTED (LINEAR_SUPPORTED)
       )
       linebuffer_i (
          .clk                 ( clk                               ),
          .rst_n               ( rst_n                             ),
          .enable              ( enable                            ),
          .valid_in            ( lb_valid_in[c]                    ),
          .flags_in            ( lb_flags_in[c]                    ),
          .ready_in            ( lb_ready_in[c]                    ),
          .valid_out           ( lb_valid_out[c]                   ),
          .flags_out           ( lb_flags_out[c]                   ),
          .ready_out           ( lb_ready_out[c]                   ),
          .fsm_state           ( fsm_state                         ),
          .engine_params       ( engine_params_pipe                     ),
      //   .linear_conv         ( engine_params.linear_conv         ),
      //   .bypass              ( engine_params.linebuf_length[$clog2(LINEBUFFER_WIDTH) - 1 :0] ),
          .x_in                ( {x_in_3 [c], x_in_2 [c], x_in [c]}            ),
          .x_filter            ( x_filter  [c]                     ),
          .filter_size         ( filter_size                       ),
          .zero_padding_i      ( zero_padding_i                    ),
          .precision8          ( precision8                        )
       );      
       
     end
   endgenerate 

   
   generate

   /*   if (LINEAR_SUPPORTED == 1) begin : linear_supported_gen
*/
         assign weight_int = weight;
         
         assign y_out=y_out_reorg;
         for (r=0; r < N_ROW; r++)
           for(j=0; j<NPX; j++) begin: y_split_combine_gen // da rivedere per il supporto alle convlin
              
              assign y_in_int[r][j] = (engine_params.linear_conv==1'b0) ? y_in[r][CONV_WIDTH*(j+1)-1:CONV_WIDTH*(j)] : y_in[r][CONV_WIDTH*(j+1)-1:CONV_WIDTH*j];
              
              // y_out combining
              always_comb
              begin
                 if(engine_params.linear_conv == 1'b0) begin
                    y_out_reorg[r*AXI_WIDTH+(j+1)*CONV_WIDTH-1:r*AXI_WIDTH+j*CONV_WIDTH] = y_out_int[r][j];
                 end
                 else begin
                    
                    y_out_reorg[r*AXI_WIDTH+(j+1)*CONV_WIDTH-1:r*AXI_WIDTH+j*CONV_WIDTH] = y_out_int[r][j];
                 end
              end

           end // y_split_combine_gen

    /*  end
      
      else begin : linear_unsupported_gen
      
         
         assign weight_int  = weight;
           
         assign y_out=y_out_reorg;
         
         for (r=0; r < N_ROW; r++)
           for(j=0; j<NPX; j++) begin: y_split_combine_gen
              
              assign y_in_int[r][j] =  y_in[r][CONV_WIDTH*(j+1)-1:CONV_WIDTH*j];
              
              assign y_out_reorg[r*AXI_WIDTH+(j+1)*CONV_WIDTH-1:r*AXI_WIDTH+j*CONV_WIDTH] = y_out_int[r][j];
           end // y_split_combine_gen
      end

*/


      /* SUM-OF-PRODUCT UNITS */
         
      // SoP instantiation
      
      for (c=0; c < N_COL; c++) begin : SoP_col              
                 
       
           //pixel delay pipe. 
           
           for(j=0; j<NPX; j++) begin : NPX_gen
             assign x_filter_rewiring[c][j] = x_filter[c][j];
             for(t=0; t<NB_TRELLIS; t++) begin : TRELLIS
               for(i=0; i<MUL_PER_TREL; i++) begin : MUL
                 assign x_filter_pipe[c][j][t][i][i] = x_filter_rewiring[c][j][t][i];
               
                 for (l=i; l>0;l--)
                   always_ff @(posedge clk)
                     if (&sop_ready_x_in == 1'b1 && enable==1'b1) 
                        x_filter_pipe[c][j][t][l-1][i] <= x_filter_pipe[c][j][t][l][i];
                     
                 assign x_filter_sop[c][j][t][i]  = x_filter_pipe[c][j][t][0][i];
               end
             end
           end
        for (r=0; r < N_ROW; r++) begin :SoP  
                 
                  
          hwce_sop #(
             .CONV_WIDTH      (CONV_WIDTH      ),
             .ACC_CONFIG      (ACC_CONFIG      ),
             .NPX             (NPX             ),
             .NB_MULS         (NB_MULS         ),
             .NB_TRELLIS      (NB_TRELLIS      ),
             .MUL_PER_TREL    (MUL_PER_TREL    )
          ) sop_i (     
             .clk               (clk                      ),
             .rst_n             (rst_n                    ),
             .enable            (enable                   ), // sempre uguale 1
             
             .valid_x_in        (sop_valid_x_in[r][c]     ),
             .flags_x_in        (sop_flags_x_in[r][c]     ), //input. to y_out_flags
             .ready_x_in        (sop_ready_x_in[r][c]     ),
             
             .valid_y_out       (sop_valid_y_out[r][c]    ),
             .flags_y_out       (sop_flags_y_out[r][c]    ),//output. from x_in flags delayed into a pipe
             .ready_y_out       (sop_ready_y_out[r][c]    ),
             
             .clear             (sop_clear                ),
             .signed_mul        (engine_params_pipe.signed_mul ),
             .x_filter          (x_filter_sop[c]          ),
             .weight            (weight_int [r][c]        ),
             .fsm_state         (fsm_state                ),
             .precision8        (precision8               ),
             
             .y_out             (y_out_int_sop[r][c]      )
          );
        end
      end
        
      for (c=0; c < N_COL; c++)              
        assign lb_ready_out [c]   = sop_ready_x_in[0][c] ;
          
        
      for (r=0; r < N_ROW; r++) begin: SoP_wiring
        
        assign y_in[r]          = y_in_TDATA_i[r];
        
        for (c=0; c < N_COL; c++) begin
          assign sop_valid_x_in  [r][c] = lb_valid_out[c]; //TODO: a tutti i sop lo stesso valid?
          assign sop_flags_x_in  [r][c] = lb_flags_out[c];         
          assign sop_flags_y_in  [r][c] = y_in_flags[r]; //unused
          
          assign sop_ready_y_out [r][c] = &y_out_TREADY_i;// & y_in_TVALID_i[r];
          
        
          if (N_COL == 1) begin // only one column of SoP. Each module gets y_in from the axi bus and drops y_out 
          
                assign y_out_TDATA_o[r] = y_out[r];
                assign y_out_TKEEP_o[r] = (y_out_TVALID_o[r] == 1'b1) ? '1 : '0;
                assign y_out_TSTRB_o[r] = (y_out_TVALID_o[r] == 1'b1) ? '1 : '0;
                assign sop_valid_y_in[r][0] = &y_in_TVALID_i;
          end
          
          if (N_COL > 1) begin
          
                if (c == 0) begin// many columns, first column. Each SoP of the column gets the y_in
                                  
                  assign sop_valid_y_in  [r][c] = &y_in_TVALID_i;
                end
                
                if (c == N_COL-1) begin// many columns, last column. Each SoP of the column drops y_out
                           
                  assign sop_valid_y_in [r][c] = sop_valid_y_out [r][c-1];           
                  assign y_out_TDATA_o[r]      = y_out[r];
                  assign y_out_TKEEP_o[r]      = (y_out_TVALID_o[r] == 1'b1) ? '1 : '0;
                  assign y_out_TSTRB_o[r]      = (y_out_TVALID_o[r] == 1'b1) ? '1 : '0;  
                end            
                
                if (c > 0 && c < N_COL-1) begin // many columns, other columns. Each SoP of the column gets the y_in from the previous SoP
              
                  assign sop_valid_y_in [r][c]  = sop_valid_y_out [r][c-1];
                end
          
          end
        end
      end
        

   endgenerate

  
  logic signed [N_ROW-1:0][N_COL-1:0][NPX-1:0][MUL_WIDHT-1:0] y_out_int_sop_concat;
  

  generate          
    for (r=0;r<N_ROW;r++) 
    begin : SHIFT_ADDERS
    
//    assign y_out_int_sop_concat [r] = {y_out_int_sop   [r][3], y_out_int_sop[r][2], y_out_int_sop[r][1], y_out_int_sop[r][0]};

    always_comb
    begin  
      y_out_int_sop_concat[r] = y_out_int_sop[r][N_COL-1];
      
      for (int c = 1; c<N_COL;c++) 
        begin
        y_out_int_sop_concat [r] = {y_out_int_sop_concat [r], y_out_int_sop   [r][N_COL-1-c]};
        end
    end
    
      assign y_in_TREADY_o [r] = y_out_TREADY_i[r] & sop_valid_y_out[r];
      assign y_in_post_fifo[r] = y_in_int [r];
      
      hwce_shift_adder #(
        .CONV_WIDTH        ( CONV_WIDTH               ),
        .ACC_CONFIG        ( ACC_CONFIG               ),
        .NPX               ( NPX                      ),
        .NB_MULS           ( NB_MULS                  ),
        .N_COL             ( N_COL                    ),
        .QF                ( QF                       )
      
      
       ) shift_adder_i ( 
        .clk               ( clk                      ),
        .rst_n             ( rst_n                    ),
     //   .ready_in          ( ready_add_shift      [r] ),
     //   .ready_out         ( y_out_TREADY_i       [r] ),
        .y_in              ( y_in_post_fifo       [r] ),
        .valid_y_in        ( y_in_TVALID_i        [r] ),
        .y_in_sop          ( y_out_int_sop_concat [r] ),
        .valid_y_in_sop    ( sop_valid_y_out      [r] ),
        .y_out             ( y_out_short          [r] ),
        .valid_y_out       ( valid_y_out_add      [r] ),
        .constant_to_sum   ( bias                 [r] ),
        .sum_over_constant ( sum_over_constant        ),
        .rectifier_activ   ( rectifier_activ          ),
        .qf_i              ( engine_params_pipe.qf    ),
        .precision8        ( precision8               )
      );
            
      assign y_out_TVALID_o [r] = valid_y_out_add[r] & done_preload;
      assign y_out_int      [r] = y_out_short[r];
      
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
