/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           hwpe_axi_addressgen.sv                                     *
 * Description:    Address generator for the AXI-Stream HWPE wrapper          *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"
`include "hwpe_axi_params.sv"

module hwpe_axi_addressgen
#(
  parameter CLUS_ADDR_WIDTH = 32,
  parameter CLUS_DATA_WIDTH = 32,
  parameter CLUS_BE_WIDTH   = CLUS_DATA_WIDTH/8,
  parameter WORD_STRIDE     = 32'h4,
  parameter STREAM_COUNTER_BITS = `STREAM_COUNTER_BITS
)
(
  input  logic clk,
  input  logic rst_n,
  input  logic en,
  input  logic           address_gen_inc_i,
  input  stream_config_t stream_config_i,
  output logic [31:0]    gen_addr_o,
  output logic           in_progress_o,
  output stream_flags_t  stream_flags_o
);

  logic        [31:0] base_addr;
  logic        [31:0] trans_size_m2;
  logic signed [15:0] line_stride;
  logic        [15:0] line_length_m1;
  logic signed [15:0] feat_stride;
  logic        [15:0] feat_length_m1;

  always_ff @(posedge clk or negedge rst_n)
  begin
    if (rst_n==1'b0) begin
      base_addr      <= 0;
      trans_size_m2  <= 0;
      line_stride    <= 0;
      line_length_m1 <= 0;
      feat_stride    <= 0;
      feat_length_m1 <= 0;
    end
    else begin
      base_addr      <= stream_config_i.base_addr;
      trans_size_m2  <= stream_config_i.trans_size - 2;
      line_stride    <= stream_config_i.line_stride;
      line_length_m1 <= stream_config_i.line_length - 1;
      feat_stride    <= stream_config_i.feat_stride;
      feat_length_m1 <= stream_config_i.feat_length - 1;
    end
  end

  logic [STREAM_COUNTER_BITS-1:0] overall_counter;
  logic [STREAM_COUNTER_BITS-1:0] word_counter;
  logic [STREAM_COUNTER_BITS-1:0] line_counter;
  logic [STREAM_COUNTER_BITS-1:0] feat_counter;
  logic [CLUS_ADDR_WIDTH-1:0]      word_addr;
  logic [CLUS_ADDR_WIDTH-1:0]      line_addr;
  logic [CLUS_ADDR_WIDTH-1:0]      feat_addr;

  // flags generation
  always_comb
  begin
    if(address_gen_inc_i == 1'b1) begin
      if(word_counter < line_length_m1) begin
        stream_flags_o.word_update = 1'b1;
        stream_flags_o.line_update = 1'b0;
        stream_flags_o.feat_update = 1'b0;
      end
      else if(line_counter < feat_length_m1) begin
        stream_flags_o.word_update = 1'b1;
        stream_flags_o.line_update = 1'b1;
        stream_flags_o.feat_update = 1'b0;
      end
      else begin
        stream_flags_o.word_update = 1'b1;
        stream_flags_o.line_update = 1'b1;
        stream_flags_o.feat_update = 1'b1;
      end
    end
    else begin
      stream_flags_o.word_update = 1'b0;
      stream_flags_o.line_update = 1'b0;
      stream_flags_o.feat_update = 1'b0;
    end
  end
  assign stream_flags_o.in_progress = in_progress_o;

  // address generation
  always_ff @(posedge clk or negedge rst_n)
  begin : address_gen_counters_proc
    if (rst_n==1'b0) begin
      word_addr    <= 0;
      line_addr    <= 0;
      feat_addr    <= 0;
      word_counter    <= 0;
      line_counter    <= 0;
      feat_counter    <= 0;
      overall_counter <= 0;
    end
    else begin
      if(en == 1'b0) begin
        word_addr    <= 0;
        line_addr    <= 0;
        feat_addr    <= 0;
        word_counter    <= 0;
        line_counter    <= 0;
        feat_counter    <= 0;
        overall_counter <= 0;
      end
      else begin
        if(address_gen_inc_i == 1'b1) begin
          if(word_counter < line_length_m1) begin
            word_addr <= word_addr + WORD_STRIDE;
            line_addr <= line_addr;
            feat_addr <= feat_addr;
            word_counter <= word_counter + 1;
            line_counter <= line_counter;
            feat_counter <= feat_counter;
          end
          else if(line_counter < feat_length_m1) begin
            word_addr <= 0;
            line_addr <= line_addr + {{16{line_stride[15]}}, line_stride};
            feat_addr <= feat_addr;
            word_counter <= 0;
            line_counter <= line_counter + 1;
            feat_counter <= feat_counter;
          end
          else begin
            word_addr <= 0;
            line_addr <= 0;
            feat_addr <= feat_addr ;//+ {{16{feat_stride[15]}}, feat_stride};
            word_counter <= 0;
            line_counter <= 0;
            feat_counter <= feat_counter + 1;
          end
          overall_counter <= overall_counter + 1;
        end
        else begin
          word_addr    <= word_addr;
          line_addr    <= line_addr;
          feat_addr    <= feat_addr;
          word_counter    <= word_counter;
          line_counter    <= line_counter;
          feat_counter    <= feat_counter;
          overall_counter <= overall_counter;
        end
      end
    end
  end

  always_ff @(posedge clk or negedge rst_n)
  begin
    if (rst_n==1'b0)
      in_progress_o <= 1'b1;
    else
      if (overall_counter < trans_size_m2)
        in_progress_o <= 1'b1;
      else if ((overall_counter == trans_size_m2) && (address_gen_inc_i == 1'b0))
        in_progress_o <= 1'b1;
      else
        in_progress_o <= 1'b0;
  end

  always_comb
  begin : address_gen_comb
    gen_addr_o = base_addr + feat_addr + line_addr + word_addr;
  end

endmodule
