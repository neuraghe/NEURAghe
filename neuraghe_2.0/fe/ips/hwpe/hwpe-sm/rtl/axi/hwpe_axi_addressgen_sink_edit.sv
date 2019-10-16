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

module hwpe_axi_addressgen_sink
#(
  parameter CLUS_ADDR_WIDTH = 32,
  parameter CLUS_DATA_WIDTH = 32,
  parameter CLUS_BE_WIDTH   = CLUS_DATA_WIDTH/8,
  parameter WORD_STRIDE     = 32'h4,
  parameter STREAM_COUNTER_BITS = `STREAM_COUNTER_BITS,
  parameter N_SINK_STREAMS = 4
)
(
  input  logic clk,
  input  logic rst_n,
  input  logic [N_SINK_STREAMS-1:0] en,
  input  logic [N_SINK_STREAMS-1:0]          address_gen_inc_i,
  input stream_config_t [N_SINK_STREAMS-1:0]  stream_config_i,
  input logic [N_SINK_STREAMS-1:0][31:0] stream_addr,
  output logic [N_SINK_STREAMS-1:0][31:0]    gen_addr_o,
  output logic          in_progress_o,
  output stream_flags_t  stream_flags_o_p,
  output logic       change_feat//,
  //output logic [7:0] n_og_o
);

  logic        [31:0] base_addr;
  logic        [31:0] trans_size_m2;
  logic signed [15:0] line_stride;
  logic        [15:0] line_length_m1;
  logic signed [15:0] feat_stride;
  logic        [15:0] feat_length_m1;
  
  
  assign base_addr = stream_config_i[0].base_addr;

  always_ff @(posedge clk or negedge rst_n)
  begin
    if (rst_n==1'b0) begin
   //   base_addr      <= 0;
      trans_size_m2  <= 0;
      line_stride    <= 0;
      line_length_m1 <= 0;
      feat_stride    <= 0;
      feat_length_m1 <= 0;
    end
    else begin
     // base_addr      <= stream_config_i.base_addr;
      trans_size_m2  <= stream_config_i[0].trans_size - 2;
      line_stride    <= stream_config_i[0].line_stride;
      line_length_m1 <= stream_config_i[0].line_length - 1;
      feat_stride    <= stream_config_i[0].feat_stride;
      feat_length_m1 <= stream_config_i[0].feat_length - 1;
    end
  end

  logic [STREAM_COUNTER_BITS-1:0] overall_counter;
  logic [STREAM_COUNTER_BITS-1:0] word_counter;
  logic [STREAM_COUNTER_BITS-1:0] line_counter;
  logic [STREAM_COUNTER_BITS-1:0] feat_counter;
  logic [CLUS_ADDR_WIDTH-1:0]     word_addr;
  logic [CLUS_ADDR_WIDTH-1:0]     line_addr;
  logic [CLUS_ADDR_WIDTH-1:0]     feat_addr;
 
 
 //assign n_og_o = feat_counter[7:0];
 
 
  // flags generation
  always_comb
  begin
    if(address_gen_inc_i == {N_SINK_STREAMS{1'b1}}) begin
      if(word_counter < line_length_m1) begin
        stream_flags_o_p.word_update = {N_SINK_STREAMS{1'b1}};
        stream_flags_o_p.line_update = {N_SINK_STREAMS{1'b0}};
        stream_flags_o_p.feat_update = {N_SINK_STREAMS{1'b0}};
      end
      else if(line_counter < feat_length_m1) begin
        stream_flags_o_p.word_update = {N_SINK_STREAMS{1'b1}};
        stream_flags_o_p.line_update = {N_SINK_STREAMS{1'b1}};
        stream_flags_o_p.feat_update = {N_SINK_STREAMS{1'b0}};
      end
      else begin
        stream_flags_o_p.word_update = {N_SINK_STREAMS{1'b1}};
        stream_flags_o_p.line_update = {N_SINK_STREAMS{1'b1}};
        stream_flags_o_p.feat_update = {N_SINK_STREAMS{1'b1}};
      end
    end
    else begin
      stream_flags_o_p.word_update = {N_SINK_STREAMS{1'b0}};
      stream_flags_o_p.line_update = {N_SINK_STREAMS{1'b0}};
      stream_flags_o_p.feat_update = {N_SINK_STREAMS{1'b0}};
    end
  end
  assign stream_flags_o_p.in_progress = in_progress_o;
  
  
   assign change_feat = ((&en == 1'b1) && (&address_gen_inc_i == 1'b1) && (word_counter == line_length_m1) && (line_counter == feat_length_m1));



  genvar j;
  generate
    for (j=0;j<N_SINK_STREAMS;j++)
    begin 
      always_ff @(posedge clk)
      begin
        if (rst_n==1'b0)      
          gen_addr_o[j] <=0;      
        else      
          if(en[0] == 1'b0 || change_feat ==1'b1)        
            gen_addr_o[j] <=stream_config_i[j].base_addr ;        
          else        
            if(address_gen_inc_i[0] == 1'b1)              
              gen_addr_o[j]   <= gen_addr_o[j] + WORD_STRIDE;          
            else          
              gen_addr_o[j] <= gen_addr_o[j];                      
      end
    end
  endgenerate

   integer i;
  // address generation
  always_ff @(posedge clk)
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
      if(en == {N_SINK_STREAMS{1'b0}}) begin
        word_addr    <= 0;
        line_addr    <= 0;
        feat_addr    <= 0;
        word_counter    <= 0;
        line_counter    <= 0;
        feat_counter    <= 0;
        overall_counter <= 0;
      end
      else begin
        if(address_gen_inc_i == {N_SINK_STREAMS{1'b1}}) begin
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
      else if ((overall_counter == trans_size_m2) && (address_gen_inc_i == {N_SINK_STREAMS{1'b0}}))
        in_progress_o <= 1'b1;
      else
        in_progress_o <= 1'b0;
  end

/*
  always_comb
  begin : address_gen_comb
    for(int i=0;i<N_SINK_STREAMS; i++)begin
    gen_addr_o[i] = stream_config_i[i].base_addr + feat_addr + line_addr + word_addr;
    end
  end
*/
  
 // assign pause_o = (line_counter == feat_length_m1 && word_counter == line_length_m1)? 1'b1: 1'b0;
endmodule
