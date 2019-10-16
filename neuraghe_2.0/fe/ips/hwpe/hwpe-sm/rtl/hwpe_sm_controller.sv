/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           hwpe_sm_wrapper.sv                                         *
 * Description:    Controller module of the HWPE wrapper for HLS HWPEs        *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"

module hwpe_sm_controller
#(
  // General params
  parameter BASE_ALIGNMENT_BIT  = 6,
  parameter N_MASTER_PORT       = 1,
  parameter N_ACCELERATOR_PORT  = 1,
  parameter N_CONTEXT           = 2,
  parameter CLK_DIVISION        = 0,
  // Cluster interface params
  parameter CLUS_ADDR_WIDTH     = 32,
  parameter CLUS_DATA_WIDTH     = 32,
  parameter CLUS_BE_WIDTH       = CLUS_DATA_WIDTH/8,
  parameter BANK_SIZE           = 4096,
  // Config interface params
  parameter CFG_ADDR_WIDTH      = 11,
  parameter CFG_DATA_WIDTH      = 32,
  parameter CFG_BE_WIDTH        = CFG_DATA_WIDTH/8,
  parameter CFG_ID_WIDTH        = 16,
  // CatC interface params
  parameter CATC_ADDR_WIDTH     = 32,
  parameter CATC_DATA_WIDTH     = 32,
  parameter CATC_BE_WIDTH       = CATC_DATA_WIDTH/8,
  // Register file params
  parameter N_IO_REGS           = 2,
  parameter N_GENERIC_REGS      = 0,
  // Interleaving & port-sharing parameters
  parameter [N_ACCELERATOR_PORT-1:0]                   [7:0] NS_INTERLEAVED      = 32'h0000_0001,
  parameter [N_ACCELERATOR_PORT-1:0]                   [7:0] IDS_INTERLEAVED     = 32'hFFFF_FFFF,
  parameter                                            [7:0] PORT_SHARING_RATIO  = 8'h01,
  parameter [N_MASTER_PORT-1:0][PORT_SHARING_RATIO-1:0][7:0] IDS_PORTSHARED      = 32'h0000_0000
)
(
  input  logic                                               clk,
  input  logic                                               rst_n,

  // Cluster side - TCDM LINT protocol
  // Request side - INIT
  output logic [N_MASTER_PORT-1:0]                           tcdm_req_o,
  input  logic [N_MASTER_PORT-1:0]                           tcdm_gnt_i,
  output logic [N_MASTER_PORT-1:0][CLUS_ADDR_WIDTH-1:0]      tcdm_add_o,
  output logic [N_MASTER_PORT-1:0]                           tcdm_type_o,
  output logic [N_MASTER_PORT-1:0][CLUS_BE_WIDTH-1:0]        tcdm_be_o,
  output logic [N_MASTER_PORT-1:0][CLUS_DATA_WIDTH-1:0]      tcdm_data_o,
  // Response side  - INIT
  input  logic [N_MASTER_PORT-1:0][CLUS_DATA_WIDTH-1:0]      tcdm_r_data_i,
  input  logic [N_MASTER_PORT-1:0]                           tcdm_r_valid_i,

  // Catapult-C Side
  // Accelerator control flow
  output logic                                               catc_en_o,
  input  logic                                               catc_done_i,

  // Catapult C Port - CATC Protocol
  // Request side - INIT
  input  logic [N_ACCELERATOR_PORT-1:0]                      catc_cs_n_i,
  output logic [N_ACCELERATOR_PORT-1:0]                      catc_wait_n_o,
  input  logic [N_ACCELERATOR_PORT-1:0]                      catc_type_i,
  input  logic [N_ACCELERATOR_PORT-1:0][CATC_ADDR_WIDTH-1:0] catc_addr_i,
  input  logic [N_ACCELERATOR_PORT-1:0][CATC_BE_WIDTH-1:0]   catc_be_i,
  input  logic [N_ACCELERATOR_PORT-1:0][CATC_DATA_WIDTH-1:0] catc_wdata_i,
  output logic [N_ACCELERATOR_PORT-1:0][CATC_DATA_WIDTH-1:0] catc_rdata_o,

  // From/to configuration
  input  regfile_t                                           reg_file,
  input  logic                                               is_working,
  output logic                                               done_ctrl
);

  logic [N_ACCELERATOR_PORT-1:0][CLUS_ADDR_WIDTH-1:0] trans_add;

  typedef struct packed {
    logic                       req;
    logic                       we;
    logic [CLUS_ADDR_WIDTH-1:0] add;
    logic [CLUS_BE_WIDTH-1:0]   be;
    logic [CLUS_DATA_WIDTH-1:0] wdata;
  } req_t;

  typedef struct packed {
    logic                       gnt;
    logic                       valid;
    logic [CLUS_DATA_WIDTH-1:0] rdata;
  } resp_t;

  req_t [N_ACCELERATOR_PORT-1:0] catc_req_int;
  req_t [N_ACCELERATOR_PORT-1:0] catc_req_reg;
  req_t [N_ACCELERATOR_PORT-1:0] catc_req_mux;
  req_t [N_MASTER_PORT-1:0]      tcdm_req_int;
  logic [N_ACCELERATOR_PORT-1:0] tcdm_ok;
  logic [N_ACCELERATOR_PORT-1:0] tcdm_ok_state;
  logic [N_ACCELERATOR_PORT-1:0] tcdm_nognt;
  logic [N_MASTER_PORT-1:0]      tcdm_gnt_interleaved;
  logic [N_ACCELERATOR_PORT-1:0][CATC_DATA_WIDTH-1:0] catc_rdata_o_ff;
  logic [N_ACCELERATOR_PORT-1:0][CATC_DATA_WIDTH-1:0] catc_rdata_o_comb;

  genvar i;
  generate
    for(i=0; i<N_ACCELERATOR_PORT; i++) begin : address_trans_gen
      hwpe_sm_address #(
        .CLUS_ADDR_WIDTH    (CLUS_ADDR_WIDTH   ),
        .CATC_ADDR_WIDTH    (CATC_ADDR_WIDTH   ),
        .BASE_ALIGNMENT_BIT (BASE_ALIGNMENT_BIT),
        .N_INTERLEAVED      (NS_INTERLEAVED[i] ),
        .ID_INTERLEAVED     (IDS_INTERLEAVED[i]),
        .N_POINTERS         (N_IO_REGS         ),
      .BANK_SIZE     ( BANK_SIZE            )
      ) address_i (
        .catc_add  (catc_addr_i[i]),
        .reg_file  (reg_file      ),
        .trans_add (trans_add[i]  )
      );
    end
  endgenerate

  // Request side
  genvar j;
  generate

    for(i=0; i<N_ACCELERATOR_PORT; i++) begin : catc_req_gen
       assign catc_req_int[i].req   = ~catc_cs_n_i[i];
       assign catc_req_int[i].we    = catc_type_i [i];
       assign catc_req_int[i].add   = trans_add   [i];
       assign catc_req_int[i].be    = catc_be_i   [i];
       assign catc_req_int[i].wdata = catc_wdata_i[i];

      always_ff @(posedge clk or negedge rst_n)
      begin : catc_reg_seq
        if (rst_n == 1'b0) begin
          catc_req_reg [i] <= 0;
        end
        else if(tcdm_nognt[i]) begin
          catc_req_reg[i] <= catc_req_int[i];
        end
      end

       assign catc_req_mux[i] = (tcdm_ok_state[i] == 1'b1) ? catc_req_int[i] : catc_req_reg[i];
    end

    // if (N_ACCELERATOR_PORT != N_MASTER_PORT) begin : sequencer_gen
    //   hwpe_sm_sequencer sequencer_i (
    //     .clk          (clk),
    //     .rst_n        (rst_n),
    //     .catc_req_mux (catc_req_mux),
    //     .tcdm_req_int (tcdm_req_int)
    //   );
    // end
    // else begin : no_sequencer_gen
     assign tcdm_req_int = catc_req_mux;
    // end

    for(j=0; j<N_MASTER_PORT; j++) begin : tcdm_req_gen
       assign tcdm_req_o [j] = tcdm_req_int[j].req;
       assign tcdm_add_o [j] = tcdm_req_int[j].add;
       assign tcdm_type_o[j] = tcdm_req_int[j].we;
       assign tcdm_be_o  [j] = tcdm_req_int[j].be;
       assign tcdm_data_o[j] = tcdm_req_int[j].wdata;
    end

  endgenerate

  // Response side

  genvar k;
  generate

    for(j=0; j<N_MASTER_PORT; j++) begin : tcdm_resp_gen

      logic [PORT_SHARING_RATIO-1:0] tcdm_gnt_tmp;
      for(k=0; k<PORT_SHARING_RATIO; k++) begin : tcdm_gnt_tmp_gen
         assign tcdm_gnt_tmp[k] = tcdm_gnt_i[j];
      end

      always_comb
      begin : tcdm_gnt_interleaved_comb
        tcdm_gnt_interleaved[j] = 1'b1;
        for(int k=0; k<PORT_SHARING_RATIO; k++) begin
          tcdm_gnt_interleaved[j] = tcdm_gnt_interleaved[j] & tcdm_gnt_tmp[k];
        end
      end

      for(k=0; k<PORT_SHARING_RATIO; k++) begin : catc_wait_gen

         localparam i=j; // this breaks port sharing...

         assign tcdm_nognt[i] = ~tcdm_gnt_interleaved[j] & catc_req_int[i].req;

         assign tcdm_ok[i] = tcdm_gnt_interleaved[j];

        always_ff @(posedge clk or negedge rst_n)
        begin : tcdm_ok_state_seq
          if(rst_n == 1'b0)
            tcdm_ok_state[i] <= 1'b1;
          else
            if (tcdm_ok_state[i] == 1'b1) begin
              if(tcdm_nognt[i] == 1'b0)
                tcdm_ok_state[i] <= 1'b1;
              else
                tcdm_ok_state[i] <= 1'b0;
            end
            else begin
              if(tcdm_gnt_interleaved[j] == 1'b1)
                tcdm_ok_state[i] <= 1'b1;
              else
                tcdm_ok_state[i] <= 1'b0;
            end
        end

        assign catc_wait_n_o[i] = tcdm_ok_state[i];

        assign catc_rdata_o[i] = tcdm_r_data_i[j];

      end

    end

  endgenerate

  logic [1:0] en_count;
  always_ff @(posedge clk or negedge rst_n)
  begin
    if(rst_n==1'b0) begin
      en_count  <= 0;
      catc_en_o <= 1'b0;
    end
    else begin
      if (en_count != 2'b11) begin
        en_count  <= en_count + 1;
        catc_en_o <= 1'b0;
      end
      else begin
        en_count  <= en_count;
        catc_en_o <= 1'b1;
      end
    end
  end

  logic almost_done;
  logic ready_to_done;

  always_comb
  begin
    ready_to_done = 1'b1;
    for(int i=0; i<N_ACCELERATOR_PORT; i++)
      ready_to_done = ready_to_done & tcdm_ok_state[i];
  end

  always_ff @(posedge clk or negedge rst_n)
  begin
    if(rst_n==1'b0) begin
      almost_done <= 1'b0;
      done_ctrl   <= 1'b0;
    end
    else begin
      if(is_working==1'b0) begin
        almost_done <= 1'b0;
        done_ctrl   <= 1'b0;
      end
      else begin
        if (done_ctrl==1'b1) begin
          almost_done <= 1'b0;
          done_ctrl   <= 1'b0;
        end
        else if(catc_done_i==1'b1) begin
          almost_done <= 1'b1;
          done_ctrl   <= 1'b0;
        end
        else if (almost_done==1'b1) begin
          almost_done <= 1'b1;
          if(ready_to_done==1'b1)
            done_ctrl <= 1'b1;
          else
            done_ctrl <= 1'b0;
        end
        else begin
          almost_done <= 1'b0;
          done_ctrl   <= 1'b0;
        end
      end
    end
  end

endmodule
