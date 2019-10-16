/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti  - f.conti@unibo.it                        *
 *                 Gianfranco Deriu - gian.deriu@gmail.com                    *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           hwce_wrapper.sv                                            *
 * Description:    HWCE wrapper module                                        *
 *                                                                            *
 ******************************************************************************/

`include "hwce_types.sv"
`include "hwpe_sm_params.sv"

module hwce_wrapper
#(
  // General params
  parameter N_MASTER_PORT       = 3,
  parameter N_CONTEXT           = 4,
  parameter FILTER_SIZE         = 5,
  // Cluster interface params
  parameter CLUS_ADDR_WIDTH      = 32,
  parameter CLUS_DATA_WIDTH      = 32,
  parameter CLUS_BE_WIDTH        = CLUS_DATA_WIDTH/8,
  parameter BANK_SIZE            = 4096,
  // Config interface params
  parameter CFG_ADDR_WIDTH      = 11,
  parameter CFG_DATA_WIDTH      = 32,
  parameter CFG_BE_WIDTH        = CFG_DATA_WIDTH/8,
  parameter CFG_ID_WIDTH        = 16,
  // AXI-Stream interface params
  parameter STREAM_DATA_SIZE    = `STREAM_DATA_SIZE,
  parameter STREAM_BE_SIZE      = `STREAM_BE_SIZE,
  parameter STREAM_TID_SIZE     = `STREAM_TID_SIZE,
  parameter STREAM_TDEST_SIZE   = `STREAM_TDEST_SIZE,
  parameter STREAM_TUSER_SIZE   = `STREAM_TUSER_SIZE,
  // Controller for weight loader interface params
  parameter N_ACCELERATOR_PORT  = 2,
  parameter WL_ADDR_WIDTH     = 32,
  parameter WL_BE_WIDTH       = 4,
  parameter WL_DATA_WIDTH     = 32,
  // Linear convolution mode support
  parameter LINEAR_SUPPORTED    = 1,
  // Register file params
  parameter N_SOURCE_STREAMS    = 2,
  parameter N_SINK_STREAMS      = 1,
  parameter N_GENERIC_REGS      = 0,
  // FIFO params
  parameter SINK_FIFO_DEPTH     = 8,
  parameter SOURCE_FIFO_DEPTH   = 8,
  // Latch-based implementation
  parameter LATCH_REGFILE       = 0,
  parameter LATCH_FIFO          = 0,
  parameter N_STREAMS           = N_SOURCE_STREAMS + N_SINK_STREAMS,
  parameter N_ROW               = 2,
  parameter N_COL               = 2,
  parameter NPF                 = 2 // Number of Parallel Filters, number of 3x3 filter implemented into a SoP
)
(
  input  logic                                                clk,
  input  logic                                                clk_gated,
  input  logic                                                rst_n,

  // Cluster side - TCDM LINT protocol
  // Request side - INIT
  output logic [N_MASTER_PORT-1:0]                            tcdm_req_o,
  input  logic [N_MASTER_PORT-1:0]                            tcdm_gnt_i,
  output logic [N_MASTER_PORT-1:0] [CLUS_ADDR_WIDTH-1:0]      tcdm_add_o,
  output logic [N_MASTER_PORT-1:0]                            tcdm_type_o,
  output logic [N_MASTER_PORT-1:0] [CLUS_BE_WIDTH  -1:0]      tcdm_be_o,
  output logic [N_MASTER_PORT-1:0] [CLUS_DATA_WIDTH-1:0]      tcdm_data_o,
  // Response side  - INIT
  input  logic [N_MASTER_PORT-1:0] [CLUS_DATA_WIDTH-1:0]      tcdm_r_data_i,
  input  logic [N_MASTER_PORT-1:0]                            tcdm_r_valid_i,

  // Configuration Port - PERIPH INTC Protocol
  // Request side - TARGET
  input  logic                                                cfg_req_i,
  output logic                                                cfg_gnt_o,
  input  logic [CLUS_ADDR_WIDTH-1:0]                          cfg_add_i,
  input  logic                                                cfg_type_i,
  input  logic [CFG_BE_WIDTH   -1:0]                          cfg_be_i,
  input  logic [CFG_DATA_WIDTH -1:0]                          cfg_data_i,
  input  logic [CFG_ID_WIDTH   -1:0]                          cfg_ID_i,
  // Response side - TARGET
  output logic                                                cfg_r_valid_o,
  output logic [CFG_DATA_WIDTH -1:0]                          cfg_r_data_o,
  output logic [CFG_ID_WIDTH   -1:0]                          cfg_r_ID_o,

  // Event (low-priority interrupt) line
  output logic                                                evt_interrupt_o,

  // HWCE engine side
  // Sink side - INIT
  input  logic [N_SINK_STREAMS-1:0]                           axi_sink_TVALID_i,
  output logic [N_SINK_STREAMS-1:0]                           axi_sink_TREADY_o,
  input  logic [N_SINK_STREAMS-1:0]   [STREAM_DATA_SIZE -1:0] axi_sink_TDATA_i,
  input  logic [N_SINK_STREAMS-1:0]   [STREAM_BE_SIZE   -1:0] axi_sink_TSTRB_i,
  input  logic [N_SINK_STREAMS-1:0]   [STREAM_BE_SIZE   -1:0] axi_sink_TKEEP_i,
  input  logic [N_SINK_STREAMS-1:0]                           axi_sink_TLAST_i,
  input  logic [N_SINK_STREAMS-1:0]   [STREAM_TID_SIZE  -1:0] axi_sink_TID_i,
  input  logic [N_SINK_STREAMS-1:0]   [STREAM_TDEST_SIZE-1:0] axi_sink_TDEST_i,
  input  logic [N_SINK_STREAMS-1:0]   [STREAM_TUSER_SIZE-1:0] axi_sink_TUSER_i,
  // Source side - INIT
  output logic [N_SOURCE_STREAMS-1:0]                         axi_source_TVALID_o,
  input  logic [N_SOURCE_STREAMS-1:0]                         axi_source_TREADY_i,
  output logic [N_SOURCE_STREAMS-1:0] [STREAM_DATA_SIZE -1:0] axi_source_TDATA_o,
  output logic [N_SOURCE_STREAMS-1:0] [STREAM_BE_SIZE   -1:0] axi_source_TSTRB_o,
  output logic [N_SOURCE_STREAMS-1:0] [STREAM_BE_SIZE   -1:0] axi_source_TKEEP_o,
  output logic [N_SOURCE_STREAMS-1:0]                         axi_source_TLAST_o,
  output logic [N_SOURCE_STREAMS-1:0] [STREAM_TID_SIZE  -1:0] axi_source_TID_o,
  output logic [N_SOURCE_STREAMS-1:0] [STREAM_TDEST_SIZE-1:0] axi_source_TDEST_o,
  output logic [N_SOURCE_STREAMS-1:0] [STREAM_TUSER_SIZE-1:0] axi_source_TUSER_o,
  // Control
  output logic                                                axi_clear_o, //unused
  input  logic                                                axi_done_preload_i,
  output logic [15:0]                                         linebuf_length_o,
  output stream_config_t [N_STREAMS-1:0]                      stream_config_o,
  output stream_flags_t  [N_STREAMS-1:0]                      stream_flags_o,
  output logic [ 5:0]                                         qf_o,//unused
  output logic                                                signed_mul_o,
  output logic [15:0]                                         nfeat_o,//not used
  output logic                                                linear_conv_o,
  input  logic [ 2:0]                                         engine_state_i,
  output logic                                                engine_start_o,
  
  //////////////////POOLING///////////////////////////////////////////////////////
  output logic[1:0]                                           pooling_HW,
  output logic                                                method_pooling,
  output logic[15:0]                                          half_image_width_o, 
  
  //////////////////////////////////////////////////////////////////////////////


  // Weight loader side
  input  logic                                                wl_done_i,
  output logic                                                wl_en_o,
  input  logic [N_ACCELERATOR_PORT-1:0]                       wl_tcdm_req_i,
  output logic [N_ACCELERATOR_PORT-1:0]                       wl_tcdm_wait_n_o,
  input  logic [N_ACCELERATOR_PORT-1:0]                       wl_type_i,
  input  logic [N_ACCELERATOR_PORT-1:0] [WL_ADDR_WIDTH-1:0] wl_tcdm_addr_i,
  input  logic [N_ACCELERATOR_PORT-1:0] [WL_BE_WIDTH-1:0]   wl_tcdm_be_i,
  input  logic [N_ACCELERATOR_PORT-1:0] [WL_DATA_WIDTH-1:0] wl_tcdm_wdata_i,
  output logic [N_ACCELERATOR_PORT-1:0] [WL_DATA_WIDTH-1:0] wl_tcdm_rdata_o,
  output logic [15:0]                                         weight_size_o,
  output logic [15:0]                                         weight_mask_o,

  // Global working signal (for clock gating)
  output logic                                                hwce_working_o,
  output logic                                                sum_over_constant,
  output logic                                                rectifier_activ,
  input  logic  [7:0]                                         n_og_i,
  output  logic [2:0]                                         zero_padding_o

);
  
  logic [N_SOURCE_STREAMS-1:0] [7:0]                          n_og_int_sink;
  logic [N_SOURCE_STREAMS-1:0] [7:0]                          n_og_int_source;

  /* HWCE ports organization 

   00 01 02 03  04 05 06 07  08 09 10 11 12 13 14 15 16 17 18 19
  |<--------->||<--------->||<--------------------------------->|
      y_out        y_in                       x
   00 01 02 03||00 01 02 03  04 05 06 07 08 09 10 11 12 13 14 15
    sinks                     sources    
  
  all_something buses:
   00 01 02 03  04 05 06 07  08 09 10 11 12 13 14 15 16 17 18 19  20 21 22 23 24 25 26 27
  |<--------->||<--------->||<--------------------------------->||<--------------------->|
      y_out        y_in                       x                           weights
      
  weights and y (in and out) ports are muxed.
  During WEIGHTS_LOADING buses from 20 to 27 are connected to tcdm ports, during the other phase buses fro 0 to 7 are connected.
  */
  

  logic [N_STREAMS+N_ACCELERATOR_PORT-1:0]                       all_req_o;
  logic [N_STREAMS+N_ACCELERATOR_PORT-1:0]                       all_gnt_i;
  logic [N_STREAMS+N_ACCELERATOR_PORT-1:0] [CLUS_ADDR_WIDTH-1:0] all_add_o;
  logic [N_STREAMS+N_ACCELERATOR_PORT-1:0]                       all_type_o;
  logic [N_STREAMS+N_ACCELERATOR_PORT-1:0] [CLUS_BE_WIDTH  -1:0] all_be_o;
  logic [N_STREAMS+N_ACCELERATOR_PORT-1:0] [CLUS_DATA_WIDTH-1:0] all_data_o;
  logic [N_STREAMS+N_ACCELERATOR_PORT-1:0] [CLUS_DATA_WIDTH-1:0] all_r_data_i;
  logic [N_STREAMS+N_ACCELERATOR_PORT-1:0]                       all_r_valid_i;

  logic [N_SOURCE_STREAMS-1:0]                                   axi_source_TVALID_int;
  logic [N_SOURCE_STREAMS-1:0] [STREAM_DATA_SIZE -1:0]           axi_source_TDATA_int;

  logic [N_SOURCE_STREAMS-1:0]                                   fifo_gnt_source;

  regfile_t                                                      reg_file;
  regfile_t                                                      reg_file_contr;
  logic                                                          is_working;
  logic                                                          is_working_delayed;
  logic                                                          enable;
  logic                                                          done_ctrl;
  logic [N_STREAMS-1:0]                                          req_start;
  logic [N_STREAMS-1:0]                                          ready_start ;
  logic [N_STREAMS-1:0]                                          done_stream ;

  logic [1:0]                                                    hwce_state;

  logic [STREAM_TID_SIZE  -1:0]                                  cfg_TID;
  logic [STREAM_TDEST_SIZE-1:0]                                  cfg_TDEST;
  logic [STREAM_TUSER_SIZE-1:0]                                  cfg_TUSER;

  logic                                                          done_weightload;

  stream_config_t [N_STREAMS-1:0]                                stream_config;
  stream_flags_t  [N_STREAMS-1:0]                                stream_flags;

 // logic [15:0] constant_to_sum;

  logic [N_ROW+NPF*N_COL-1:0]                                    req_start_int;
  logic [N_ROW+NPF*N_COL-1:0]                                    ready_start_int;
  logic [N_ROW+NPF*N_COL-1:0]                                    done_stream_int;
  logic [N_ROW+NPF*N_COL-1:0]                                    fifo_gnt_source_int;

  logic wake_up_int;
  

  /* glue logic */

`ifndef AXI_OPTIONAL
   assign cfg_TID   = 0;
   assign cfg_TDEST = 0;
   assign cfg_TUSER = 0;
`endif
  assign cfg_gnt_o = 1'b1;

  assign stream_config_o = stream_config;
  assign stream_flags_o  = stream_flags;

  always_ff @(posedge clk_gated or negedge rst_n)
  begin
    if (rst_n == 0) begin
      cfg_r_ID_o    <= 0;
      cfg_r_valid_o <= 0;
    end
    else begin
      if (cfg_req_i == 1) begin
        cfg_r_ID_o    <= cfg_ID_i;
        cfg_r_valid_o <= 1;
      end
      else begin
        cfg_r_valid_o <= 0;
      end
    end
  end

  logic [N_STREAMS-1:0] done_stream_r;

  always_ff @(posedge clk_gated or negedge rst_n)
  begin
    if (rst_n == 1'b0)
      done_stream_r <= 0;
    else begin
      for (int j=0; j<N_STREAMS; j++) begin
        if (is_working == 1'b0)
          done_stream_r[j] <= 1'b0;
        else if(req_start == 1'b1)
          done_stream_r[j] <= 1'b0;
        else if(done_stream[j] == 1'b1) begin
          done_stream_r[j] <= 1'b1;
        end
      end
    end
  end
  
  
  /* hwce_working signal generation for clock gating */
  always_ff @(posedge clk_gated or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      is_working_delayed <= 1'b0;
    else
      is_working_delayed <= is_working;
  end
  assign hwce_working_o = is_working | is_working_delayed;

  /* Wrapper Finite-state machine */

  hwce_wrapper_fsm #    (
    .N_STREAMS          ( N_STREAMS          ),
    .N_ROW              ( N_ROW              ),
    .N_COL              ( N_COL              ),
    .NPF                ( NPF                )
  ) wrapper_fsm_i       (
    .clk                ( clk_gated          ),
    .rst_n              ( rst_n              ),
    .is_working         ( is_working         ),
    .done_weightload    ( done_weightload    ),
    .done_ctrl          ( done_ctrl          ),
    .ready_start        ( ready_start        ),
    .axi_done_preload_i ( axi_done_preload_i ),
    .req_start          ( req_start          ),
    .hwce_state_o       ( hwce_state         ),
    .engine_start_o     ( engine_start_o     )
  );

  assign done_ctrl   = (is_working & done_stream_r[0]);
  assign axi_clear_o = done_ctrl;                        //unused

  /* Wrapper Slave module */

//  localparam N_IO_REGS = (N_STREAMS-8)*4 + 4;
  hwce_wrapper_slave #(
    .N_CONTEXT        ( N_CONTEXT                       ),
    .CFG_ADDR_WIDTH   ( CFG_ADDR_WIDTH                  ),
    .CFG_DATA_WIDTH   ( CFG_DATA_WIDTH                  ),
    .CFG_BE_WIDTH     ( CFG_BE_WIDTH                    ),
    .CFG_ID_WIDTH     ( CFG_ID_WIDTH                    ),
    .N_GENERIC_REGS   ( N_GENERIC_REGS                  ),
    .LATCH_REGFILE    ( LATCH_REGFILE                   ),
    .N_STREAMS        ( N_STREAMS                       ),
    .BANK_SIZE        ( BANK_SIZE                       )
  ) wrapper_slave_i   (
    .clk              ( clk                             ),
    .clk_gated        ( clk_gated                       ),
    .rst_n            ( rst_n                           ),
    .data_req_i       ( cfg_req_i                       ),
    .data_add_i       ( cfg_add_i[CFG_ADDR_WIDTH+2-1:2] ),
    .data_type_i      ( cfg_type_i                      ),
    .data_wdata_i     ( cfg_data_i                      ),
    .data_ID_i        ( cfg_ID_i                        ),
    .data_r_rdata_o   ( cfg_r_data_o                    ),
    .done             ( done_ctrl                       ),
    .reg_file         ( reg_file                        ),
    .reg_file_contr    ( reg_file_contr                   ),
    .stream_config    ( stream_config                   ),
    .weight_size_o    ( weight_size_o                   ),
    .weight_mask_o    ( weight_mask_o                   ),
    .qf_o             ( qf_o                            ),//unused
    .signed_mul_o     ( signed_mul_o                    ),
    .nfeat_o          ( nfeat_o                         ),//not used
    .linear_conv_o    ( linear_conv_o                   ),
    .linebuf_length_o ( linebuf_length_o                ),
    .evt_interrupt_o  ( evt_interrupt_o                 ),
    .is_working       ( is_working                      ),
    .enable           ( enable                          ),    
    .sum_over_constant( sum_over_constant               ),
    .pooling_HW       (pooling_HW                       ),
    .method_pooling   (method_pooling                   ),
    .half_image_width_o (half_image_width_o               ),
    .rectifier_activ  ( rectifier_activ                 ),
    .n_og_i           ({n_og_int_source[0], n_og_int_sink[0]}                     ),
    .zero_padding_o   ( zero_padding_o                  )
  );

  /* Source & Sink modules */

  always_ff @(posedge clk)
  begin
    if (rst_n==1'b0)
    begin
      wake_up_int <=0;
    end
    else
    begin
      if (engine_state_i == 3'b001)
        wake_up_int <=1'b1;          
      else
        wake_up_int <=1'b0;   
        
    end
  end



  genvar i;
  generate

    for(i=0; i<N_SINK_STREAMS; i++) begin : sink_gen
      hwpe_axi_sink #(
        .CLUS_ADDR_WIDTH   (CLUS_ADDR_WIDTH  ),
        .CLUS_DATA_WIDTH   (CLUS_DATA_WIDTH  ),
        .CLUS_BE_WIDTH     (CLUS_BE_WIDTH    ),
        .STREAM_DATA_SIZE  (STREAM_DATA_SIZE ),
        .STREAM_BE_SIZE    (STREAM_BE_SIZE   ),
        .STREAM_TID_SIZE   (STREAM_TID_SIZE  ),
        .STREAM_TDEST_SIZE (STREAM_TDEST_SIZE),
        .STREAM_TUSER_SIZE (STREAM_TUSER_SIZE),
        .FIFO_DEPTH        (SINK_FIFO_DEPTH  ),
        .LATCH_FIFO        (LATCH_FIFO       )
      ) sink_i (
        .clk                (clk_gated            ),
        .rst_n              (rst_n                ),
        .tcdm_req_o         (all_req_o         [i]),
        .tcdm_gnt_i         (all_gnt_i         [i]),
        .tcdm_add_o         (all_add_o         [i]),
        .tcdm_type_o        (all_type_o        [i]),
        .tcdm_be_o          (all_be_o          [i]),
        .tcdm_data_o        (all_data_o        [i]),
        .tcdm_r_data_i      (all_r_data_i      [i]),
        .tcdm_r_valid_i     (all_r_valid_i     [i]),
        .TVALID_i           (axi_sink_TVALID_i [i]),
        .TREADY_o           (axi_sink_TREADY_o [i]),
        .TDATA_i            (axi_sink_TDATA_i  [i]),
        .TSTRB_i            (axi_sink_TSTRB_i  [i]),
        .TKEEP_i            (axi_sink_TKEEP_i  [i]),
        .TLAST_i            (axi_sink_TLAST_i  [i]),
        .TID_i              (axi_sink_TID_i    [i]),
        .TDEST_i            (axi_sink_TDEST_i  [i]),
        .TUSER_i            (axi_sink_TUSER_i  [i]),
        .stream_config_i    (stream_config     [i]),
        .stream_flags_o     (stream_flags      [i]),
        .req_start_sink_i   (req_start         [i]),
        .ready_start_sink_o (ready_start       [i]),
        .done_sink_o        (done_stream       [i]),
        .n_og_o             (n_og_int_sink     [i]                       )
      );
    end
    for(i=0; i<N_SOURCE_STREAMS; i++) begin : source_gen
      localparam k = i + N_SINK_STREAMS;
   //   localparam PAUSE_ENABLE = (i<4)?1:0;
      hwpe_axi_source #(
        .CLUS_ADDR_WIDTH      ( CLUS_ADDR_WIDTH          ),
        .CLUS_DATA_WIDTH      ( CLUS_DATA_WIDTH          ),
        .CLUS_BE_WIDTH        ( CLUS_BE_WIDTH            ),
        .STREAM_DATA_SIZE     ( STREAM_DATA_SIZE         ),
        .STREAM_BE_SIZE       ( STREAM_BE_SIZE           ),
        .STREAM_TID_SIZE      ( STREAM_TID_SIZE          ),
        .STREAM_TDEST_SIZE    ( STREAM_TDEST_SIZE        ),
        .STREAM_TUSER_SIZE    ( STREAM_TUSER_SIZE        ),
        .FIFO_DEPTH           ( SOURCE_FIFO_DEPTH        ),
        .LATCH_FIFO           ( LATCH_FIFO               )//,
      //  .PAUSE_ENABLE           ( PAUSE_ENABLE               )
      ) source_i (
        .clk                  ( clk_gated                ),
        .rst_n                ( rst_n                    ),
        .tcdm_req_o           ( all_req_o            [k] ),
        .tcdm_gnt_i           ( all_gnt_i            [k] ),
        .tcdm_add_o           ( all_add_o            [k] ),
        .tcdm_type_o          ( all_type_o           [k] ),
        .tcdm_be_o            ( all_be_o             [k] ),
        .tcdm_data_o          ( all_data_o           [k] ),
        .tcdm_r_data_i        ( all_r_data_i         [k] ),
        .tcdm_r_valid_i       ( all_r_valid_i        [k] ),
        .TVALID_o             ( axi_source_TVALID_int[i] ),
        .TREADY_i             ( axi_source_TREADY_i  [i] ),
        .TDATA_o              ( axi_source_TDATA_int [i] ),
        .TSTRB_o              ( axi_source_TSTRB_o   [i] ),
        .TKEEP_o              ( axi_source_TKEEP_o   [i] ),
        .TLAST_o              ( axi_source_TLAST_o   [i] ),
        .TID_o                ( axi_source_TID_o     [i] ),
        .TDEST_o              ( axi_source_TDEST_o   [i] ),
        .TUSER_o              ( axi_source_TUSER_o   [i] ),
        .stream_config_i      ( stream_config        [k] ),
        .stream_flags_o       ( stream_flags         [k] ),
        .cfg_TID_i            ( cfg_TID                  ),
        .cfg_TDEST_i          ( cfg_TDEST                ),
        .cfg_TUSER_i          ( cfg_TUSER                ),
        .req_start_source_i   ( req_start_int        [i] ),
        .ready_start_source_o ( ready_start_int      [i] ),
        .done_source_o        ( done_stream_int      [i] ),
        .fifo_gnt_o           ( fifo_gnt_source_int  [i] ),
        .n_og_o               (n_og_int_source       [i]                       )
      );

    end
  endgenerate

  /* Weight-loader controller */

  localparam [N_ACCELERATOR_PORT-1:0]     [7:0] NS_INTERLEAVED     = {8'h01,8'h01}; // {8'h02,8'h02};  attenzione a questo valore quando si cambia il numero di porte
  localparam [N_ACCELERATOR_PORT-1:0]     [7:0] IDS_INTERLEAVED    = {8'h07,8'h06,8'h05,8'h04,8'h03,8'h02,8'h01,8'h00};
  localparam                              [7:0] PORT_SHARING_RATIO = 1;
  localparam [N_ACCELERATOR_PORT-1:0][0:0][7:0] IDS_PORTSHARED     = {8'h01,8'h00};
  
 // localparam BIT_ALIGNMENT  =  $clog2(N_ROW*N_COL*FILTER_SIZE * FILTER_SIZE / (N_ACCELERATOR_PORT*2) + (N_ROW*N_COL*FILTER_SIZE * FILTER_SIZE) % 2) + 1; // ricontrollare
  localparam BIT_ALIGNMENT  =  $clog2(N_ROW*N_COL*5 * 5 / (N_ACCELERATOR_PORT*2) + (N_ROW*N_COL*5 * 5) % 2) + 1; // ricontrollare
  
  logic [N_ACCELERATOR_PORT-1:0]                      tcdm_req_o_contr;
  logic [N_ACCELERATOR_PORT-1:0]                      tcdm_gnt_i_contr;
  logic [N_ACCELERATOR_PORT-1:0][CLUS_ADDR_WIDTH-1:0] tcdm_add_o_contr;
  logic [N_ACCELERATOR_PORT-1:0]                      tcdm_type_o_contr;
  logic [N_ACCELERATOR_PORT-1:0][CLUS_BE_WIDTH-1:0]   tcdm_be_o_contr;
  logic [N_ACCELERATOR_PORT-1:0][CLUS_DATA_WIDTH-1:0] tcdm_data_o_contr;
  logic [N_ACCELERATOR_PORT-1:0][CLUS_DATA_WIDTH-1:0] tcdm_r_data_i_contr;
  logic [N_ACCELERATOR_PORT-1:0]                      tcdm_r_valid_i_contr;
  
  generate
    for (i=0; i< N_ACCELERATOR_PORT; i++) begin
      assign all_req_o  [N_STREAMS+i] = tcdm_req_o_contr[i];
      assign tcdm_gnt_i_contr[i]         = all_gnt_i    [N_STREAMS+i];
      assign all_add_o  [N_STREAMS+i] = tcdm_add_o_contr[i];
      assign all_type_o [N_STREAMS+i] = tcdm_type_o_contr[i];
      assign all_be_o   [N_STREAMS+i] = tcdm_be_o_contr[i];
      assign all_data_o [N_STREAMS+i] = tcdm_data_o_contr[i];
      assign tcdm_r_data_i_contr[i]      = all_r_data_i [N_STREAMS+i];
      assign tcdm_r_valid_i_contr[i]     = all_r_valid_i[N_STREAMS+i];
    end
    
  endgenerate
  
  hwpe_sm_controller #  (
    .BASE_ALIGNMENT_BIT ( BIT_ALIGNMENT        ),
    .N_MASTER_PORT      ( N_ACCELERATOR_PORT   ),
    .N_ACCELERATOR_PORT ( N_ACCELERATOR_PORT   ),
    .N_CONTEXT          ( N_CONTEXT            ),
    .CLUS_ADDR_WIDTH    ( CLUS_ADDR_WIDTH      ),
    .CLUS_DATA_WIDTH    ( CLUS_DATA_WIDTH      ),
    .CLUS_BE_WIDTH      ( CLUS_BE_WIDTH        ),
    .CFG_ADDR_WIDTH     ( CFG_ADDR_WIDTH       ),
    .CFG_DATA_WIDTH     ( CFG_DATA_WIDTH       ),
    .CFG_BE_WIDTH       ( CFG_BE_WIDTH         ),
    .CFG_ID_WIDTH       ( CFG_ID_WIDTH         ),
    .CATC_ADDR_WIDTH    ( WL_ADDR_WIDTH      ),
    .CATC_DATA_WIDTH    ( WL_DATA_WIDTH      ),
    .CATC_BE_WIDTH      ( WL_BE_WIDTH        ),
    .N_IO_REGS          ( 2                    ),
    .N_GENERIC_REGS     ( N_GENERIC_REGS       ),
    .NS_INTERLEAVED     ( NS_INTERLEAVED       ),
    .IDS_INTERLEAVED    ( IDS_INTERLEAVED      ),
    .PORT_SHARING_RATIO ( PORT_SHARING_RATIO   ),
    .IDS_PORTSHARED     ( IDS_PORTSHARED       ),
    .BANK_SIZE          ( BANK_SIZE            )
  ) controller_i        (
    .clk                ( clk_gated            ),
    .rst_n              ( rst_n                ),
    .tcdm_req_o         ( tcdm_req_o_contr     ),
    .tcdm_gnt_i         ( tcdm_gnt_i_contr     ),
    .tcdm_add_o         ( tcdm_add_o_contr     ),
    .tcdm_type_o        ( tcdm_type_o_contr    ),
    .tcdm_be_o          ( tcdm_be_o_contr      ),
    .tcdm_data_o        ( tcdm_data_o_contr    ),
    .tcdm_r_data_i      ( tcdm_r_data_i_contr  ),
    .tcdm_r_valid_i     ( tcdm_r_valid_i_contr ),
    .catc_en_o          ( wl_en_o              ),
    .catc_done_i        ( wl_done_i            ),
    .catc_cs_n_i        ( wl_tcdm_req_i        ),
    .catc_wait_n_o      ( wl_tcdm_wait_n_o     ),
    .catc_type_i        ( wl_type_i            ),
    .catc_addr_i        ( wl_tcdm_addr_i       ),
    .catc_be_i          ( wl_tcdm_be_i         ),
    .catc_wdata_i       ( wl_tcdm_wdata_i      ),
    .catc_rdata_o       ( wl_tcdm_rdata_o      ),
    .reg_file           ( reg_file_contr       ),
    .is_working         ( is_working           ),
    .done_ctrl          ( done_weightload      )
  );

  /* In-out mux-demux */
  logic [N_STREAMS+N_ACCELERATOR_PORT-1:0] ex_all_req;

  // Bypass y_in source if no_y_in is active
  genvar l,ll;
  generate
  
    for (l=0;l<NPF*N_COL;l++) begin // x_in
      
        assign axi_source_TVALID_o[N_ROW + l] = axi_source_TVALID_int[N_ROW + l];
        assign axi_source_TDATA_o [N_ROW + l] = axi_source_TDATA_int [N_ROW + l];
        
        assign fifo_gnt_source [N_ROW + l] = fifo_gnt_source_int [N_ROW + l];
        
        assign req_start_int   [N_ROW+l]   = req_start           [2*N_ROW+l];
        assign ready_start     [2*N_ROW+l] = ready_start_int     [N_ROW+l];
        assign done_stream     [2*N_ROW+l] = done_stream_int     [N_ROW+l];
      end
    
    
    
    for (ll=0;ll<N_ROW;ll++) begin // y_in

        assign axi_source_TVALID_o[ll]    = (sum_over_constant ) ? 1'b1                              : axi_source_TVALID_int[ll];
        assign axi_source_TDATA_o [ll]    = axi_source_TDATA_int [ll]; 
              
        assign fifo_gnt_source [ll]       = (sum_over_constant ) ? 1'b1                              : fifo_gnt_source_int  [ll];
        
        assign req_start_int   [ll]       = (sum_over_constant ) ? 1'b0                              : req_start            [N_ROW+ll];
        assign ready_start     [N_ROW+ll] = (sum_over_constant ) ? 1'b1                              : ready_start_int      [ll];
        assign done_stream     [N_ROW+ll] = (sum_over_constant ) ? 1'b1                              : done_stream_int      [ll];
      end
  endgenerate
  
  
 // assign axi_source_TVALID_o[N_ROW+N_COL-1:N_ROW] = axi_source_TVALID_int[N_ROW+N_COL-1:N_ROW];
 // assign axi_source_TDATA_o [N_ROW+N_COL-1:N_ROW] = axi_source_TDATA_int [N_ROW+N_COL-1:N_ROW];
 // assign axi_source_TVALID_o[N_ROW-1:0] = (no_y_in_reg == 1'b1) ? {N_ROW{1'b1}} : axi_source_TVALID_int[N_ROW-1:0];
 // assign axi_source_TDATA_o [N_ROW-1:0] = (no_y_in_reg == 1'b1) ? {N_ROW{{constant_to_sum,constant_to_sum}}} : axi_source_TDATA_int[N_ROW-1:0]; 
  
 // assign req_start_int   [N_SOURCE_STREAMS-1:N_ROW] = req_start           [N_STREAMS-1:2*N_ROW];
 // assign ready_start     [N_STREAMS-1:2*N_ROW] = ready_start_int     [N_SOURCE_STREAMS-1:N_ROW];
 // assign done_stream     [N_STREAMS-1:2*N_ROW] = done_stream_int     [N_SOURCE_STREAMS-1:N_ROW];
 // assign fifo_gnt_source [N_ROW+N_COL-1:N_ROW] = fifo_gnt_source_int [N_ROW+N_COL-1:N_ROW];
 // assign req_start_int   [N_ROW-1:0]       = (no_y_in_reg == 1'b0) ? req_start           [2*N_ROW-1:N_ROW] : {N_ROW{1'b0}};
//  assign ready_start     [2*N_ROW-1:N_ROW] = (no_y_in_reg == 1'b0) ? ready_start_int     [N_ROW-1:0] : {N_ROW{1'b1}};
//  assign done_stream     [2*N_ROW-1:N_ROW] = (no_y_in_reg == 1'b0) ? done_stream_int     [N_ROW-1:0] : {N_ROW{1'b1}};
 
//  assign fifo_gnt_source [N_ROW-1:0] = (no_y_in_reg == 1'b0) ? fifo_gnt_source_int [N_ROW-1:0] : {N_ROW{1'b1}};


  always_ff @(posedge clk_gated or negedge rst_n)
  begin : tcdm_arbitration_seq
    if(rst_n==1'b0)
      ex_all_req <= 0;
    else
      ex_all_req <= all_req_o;
  end

  enum { CONNECT_ENGINE, CONNECT_WEIGHTLOADER, WAITING_ENGINE } port_muxdemux_state;
  always_ff @(posedge clk_gated or negedge rst_n)
  begin
    if(rst_n == 1'b0) begin
      port_muxdemux_state <= CONNECT_ENGINE;
    end
    else begin
      if(port_muxdemux_state == CONNECT_ENGINE) begin
        if((engine_state_i == 3'b101) && (hwce_state == `HWCE_WRAPPER_FSM_START1))
          port_muxdemux_state <= CONNECT_WEIGHTLOADER;
        else if(engine_state_i == 3'b101)
          port_muxdemux_state <= WAITING_ENGINE;
        else
          port_muxdemux_state <= CONNECT_ENGINE;
      end
      else if(port_muxdemux_state == WAITING_ENGINE) begin
        if((fifo_gnt_source[0] == 1'b0  || sum_over_constant == 1'b1) && (fifo_gnt_source[4] == 1'b0))
          port_muxdemux_state <= CONNECT_WEIGHTLOADER;
        else
          port_muxdemux_state <= WAITING_ENGINE;
      end
      else begin
        if(done_weightload == 1'b1)
          port_muxdemux_state <= CONNECT_ENGINE;
        else
          port_muxdemux_state <= CONNECT_WEIGHTLOADER;
      end
    end
  end

  integer m, n;
  always_comb
    begin : x_in_tcdm_arbitration_comb
      for (m=0; m<N_STREAMS-N_ACCELERATOR_PORT; m++) begin : static_connections
        tcdm_req_o    [N_ACCELERATOR_PORT+m] = all_req_o      [N_ACCELERATOR_PORT+m];
        tcdm_add_o    [N_ACCELERATOR_PORT+m] = all_add_o      [N_ACCELERATOR_PORT+m];
        tcdm_type_o   [N_ACCELERATOR_PORT+m] = all_type_o     [N_ACCELERATOR_PORT+m];
        tcdm_be_o     [N_ACCELERATOR_PORT+m] = all_be_o       [N_ACCELERATOR_PORT+m];
        tcdm_data_o   [N_ACCELERATOR_PORT+m] = all_data_o     [N_ACCELERATOR_PORT+m];
        all_gnt_i     [N_ACCELERATOR_PORT+m] = tcdm_gnt_i     [N_ACCELERATOR_PORT+m] & all_req_o[N_ACCELERATOR_PORT+m];
        all_r_data_i  [N_ACCELERATOR_PORT+m] = tcdm_r_data_i  [N_ACCELERATOR_PORT+m];
        all_r_valid_i [N_ACCELERATOR_PORT+m] = tcdm_r_valid_i [N_ACCELERATOR_PORT+m] & ex_all_req[N_ACCELERATOR_PORT+m];
      end
      
    if(port_muxdemux_state == CONNECT_WEIGHTLOADER) begin
      for (n=0; n<N_ACCELERATOR_PORT; n++) begin
        tcdm_req_o    [n] = all_req_o      [N_STREAMS+n]; 
        tcdm_add_o    [n] = all_add_o      [N_STREAMS+n];
        tcdm_type_o   [n] = all_type_o     [N_STREAMS+n];
        tcdm_be_o     [n] = all_be_o       [N_STREAMS+n];
        tcdm_data_o   [n] = all_data_o     [N_STREAMS+n];
      end 
//      tcdm_req_o    [N_ACCELERATOR_PORT-1:0] = all_req_o      [N_STREAMS+N_ACCELERATOR_PORT-1:N_STREAMS]; 
//      tcdm_add_o    [N_ACCELERATOR_PORT-1:0] = all_add_o      [N_STREAMS+N_ACCELERATOR_PORT-1:N_STREAMS];
//      tcdm_type_o   [N_ACCELERATOR_PORT-1:0] = all_type_o     [N_STREAMS+N_ACCELERATOR_PORT-1:N_STREAMS];
//      tcdm_be_o     [N_ACCELERATOR_PORT-1:0] = all_be_o       [N_STREAMS+N_ACCELERATOR_PORT-1:N_STREAMS];
//      tcdm_data_o   [N_ACCELERATOR_PORT-1:0] = all_data_o     [N_STREAMS+N_ACCELERATOR_PORT-1:N_STREAMS];
      
    end
    else begin
      for (n=0; n<N_ACCELERATOR_PORT; n++) begin
        tcdm_req_o    [n] = all_req_o  [n];
        tcdm_add_o    [n] = all_add_o  [n];
        tcdm_type_o   [n] = all_type_o [n];
        tcdm_be_o     [n] = all_be_o   [n];
        tcdm_data_o   [n] = all_data_o [n];
      end
//      tcdm_req_o    [N_ACCELERATOR_PORT-1:0] = all_req_o  [N_ACCELERATOR_PORT-1:0];
//      tcdm_add_o    [N_ACCELERATOR_PORT-1:0] = all_add_o  [N_ACCELERATOR_PORT-1:0];
//      tcdm_type_o   [N_ACCELERATOR_PORT-1:0] = all_type_o [N_ACCELERATOR_PORT-1:0];
//      tcdm_be_o     [N_ACCELERATOR_PORT-1:0] = all_be_o   [N_ACCELERATOR_PORT-1:0];
//      tcdm_data_o   [N_ACCELERATOR_PORT-1:0] = all_data_o [N_ACCELERATOR_PORT-1:0];
    end
    for (n=0; n<N_ACCELERATOR_PORT; n++) begin
      all_gnt_i     [N_STREAMS+n] = tcdm_gnt_i     [n] & all_req_o[N_STREAMS+n];
      all_gnt_i     [n]           = tcdm_gnt_i     [n];
      
      all_r_data_i  [N_STREAMS+n] = tcdm_r_data_i  [n];
      all_r_data_i  [n]           = tcdm_r_data_i  [n];
      
      all_r_valid_i [N_STREAMS+n] = tcdm_r_valid_i [n] & ex_all_req[N_STREAMS+n];
      all_r_valid_i [n]           = tcdm_r_valid_i [n] & ex_all_req[n];
    end
//    all_gnt_i     [N_STREAMS+N_ACCELERATOR_PORT-1:N_STREAMS] = tcdm_gnt_i     [N_ACCELERATOR_PORT-1:0] & all_req_o[N_STREAMS+N_ACCELERATOR_PORT-1:N_STREAMS];
//      all_gnt_i     [N_ACCELERATOR_PORT-1:0]                   = tcdm_gnt_i     [N_ACCELERATOR_PORT-1:0];
//      
//      all_r_data_i  [N_STREAMS+N_ACCELERATOR_PORT-1:N_STREAMS] = tcdm_r_data_i  [N_ACCELERATOR_PORT-1:0];
//      all_r_data_i  [N_ACCELERATOR_PORT-1          :0]         = tcdm_r_data_i  [N_ACCELERATOR_PORT-1:0];
//      
//      all_r_valid_i [N_STREAMS+N_ACCELERATOR_PORT-1:N_STREAMS] = tcdm_r_valid_i [N_ACCELERATOR_PORT-1:0] & ex_all_req[N_STREAMS+N_ACCELERATOR_PORT-1:N_STREAMS];
//      all_r_valid_i [N_ACCELERATOR_PORT-1:0]                   = tcdm_r_valid_i [N_ACCELERATOR_PORT-1:0] & ex_all_req[N_ACCELERATOR_PORT-1:0];
    
  end

endmodule
