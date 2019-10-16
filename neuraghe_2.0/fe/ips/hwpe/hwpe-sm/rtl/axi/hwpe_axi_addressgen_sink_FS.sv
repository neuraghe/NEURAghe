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

module hwpe_axi_addressgen_sink_FS
#(
  parameter CLUS_ADDR_WIDTH = 32,
  parameter CLUS_DATA_WIDTH = 32,
  parameter CLUS_BE_WIDTH   = CLUS_DATA_WIDTH/8,
  parameter WORD_STRIDE     = 32'h2,
  parameter STREAM_COUNTER_BITS = `STREAM_COUNTER_BITS,
  parameter N_SINK_STREAMS = 4,
  parameter NPX
)
(
  input  logic clk,
  input  logic rst_n,
  input  logic [N_SINK_STREAMS-1:0]           en,
  input  logic [N_SINK_STREAMS-1:0]           address_gen_inc_i,
  input stream_config_t [N_SINK_STREAMS-1:0]  stream_config_i,
  input  logic [31:0]                         wl_base_addr_i, 
  input  logic [2:0]                          zero_padding_i,
  input  logic [N_SINK_STREAMS-1:0][31:0]      stream_addr,             //NOT USED
  output logic [N_SINK_STREAMS-1:0][NPX-1:0][31:0]  gen_addr_o,
  output logic                     [31:0]     ker_addr_o,
  output logic                                in_progress_o,
  output stream_flags_t                       stream_flags_o_p,
  output logic                                change_feat
  //output logic [7:0] n_og_o
);

  logic        [31:0] base_addr;
  logic        [31:0] trans_size_m1;
  logic        [31:0] trans_size_m2;
  logic signed [15:0] line_stride;
  logic        [15:0] line_length_m1;
  logic signed [15:0] feat_stride;
  logic        [15:0] feat_length_m1;
  logic        [7:0]  fs_h_m1;
  logic        [7:0]  fs_w_m1;
  logic        [7:0]  fs_h_m2;
  logic        [7:0]  fs_w_m2;
  logic        [3:0]  dil_h;
  logic        [3:0]  dil_w;
  
  logic        [15:0] dil_word_stride;
  logic signed [15:0] dil_line_stride;
  
  assign base_addr = stream_config_i[0].base_addr;

  always_ff @(posedge clk or negedge rst_n)
  begin
    if (rst_n==1'b0) begin
      trans_size_m1  <= 0;
      trans_size_m2  <= 0;
      line_stride    <= 0;
      line_length_m1 <= 0;
      feat_stride    <= 0;
      feat_length_m1 <= 0;
      fs_h_m1        <= 0;
      fs_w_m1        <= 0;
      fs_h_m2        <= 0;
      fs_w_m2        <= 0;
      dil_h          <= 0;
      dil_w          <= 0;
      
      dil_word_stride <= 0;
      dil_line_stride <= 0;
    end
    else begin
      trans_size_m1  <= stream_config_i[0].trans_size - 1;
      trans_size_m2  <= stream_config_i[0].trans_size - 2;
      line_stride    <= stream_config_i[0].line_stride;
      line_length_m1 <= stream_config_i[0].line_length - 1;
      feat_stride    <= stream_config_i[0].feat_stride;
      feat_length_m1 <= stream_config_i[0].feat_length - 1;
      fs_h_m1        <= stream_config_i[0].weight_sizes[7:0]  - 1;
      fs_w_m1        <= stream_config_i[0].weight_sizes[15:8] - 1;
      fs_h_m2        <= (stream_config_i[0].weight_sizes[7:0]>1)  ? stream_config_i[0].weight_sizes[7:0]  - 2 : 0;
      fs_w_m2        <= (stream_config_i[0].weight_sizes[15:8]>1) ? stream_config_i[0].weight_sizes[15:8] - 2 : 0;
      dil_h          <= stream_config_i[0].fs_params[19:16];
      dil_w          <= stream_config_i[0].fs_params[23:20];
      
      dil_word_stride    <= stream_config_i[0].dil_strides[15:0];
      dil_line_stride    <= stream_config_i[0].dil_strides[31:16];
    end
  end

  logic [STREAM_COUNTER_BITS-1:0] overall_counter;
  logic [STREAM_COUNTER_BITS-1:0] word_counter;
  logic [STREAM_COUNTER_BITS-1:0] line_counter;
  logic [STREAM_COUNTER_BITS-1:0] feat_counter;
  logic [STREAM_COUNTER_BITS-1:0] fs_counter;
  logic [STREAM_COUNTER_BITS-1:0] fsxfs_counter;
  
  logic [CLUS_ADDR_WIDTH-1:0]     word_addr;
  logic [CLUS_ADDR_WIDTH-1:0]     line_addr;
  logic [CLUS_ADDR_WIDTH-1:0]     feat_addr;
  logic [CLUS_ADDR_WIDTH-1:0]     word_in_fs_addr;
  logic [CLUS_ADDR_WIDTH-1:0]     line_in_fs_addr;
  
  logic [CLUS_ADDR_WIDTH-1:0]     ker_addr;
 
 
 //assign n_og_o = feat_counter[7:0];
 
 
  // flags generation
  always_comb
  begin
    if(address_gen_inc_i == {N_SINK_STREAMS{1'b1}}) begin
      if(fs_counter < fs_w_m1)begin
        stream_flags_o_p.word_update = {N_SINK_STREAMS{1'b0}};
        stream_flags_o_p.line_update = {N_SINK_STREAMS{1'b0}};
        stream_flags_o_p.feat_update = {N_SINK_STREAMS{1'b0}};
      end
      else if(fsxfs_counter < fs_h_m1) begin
        stream_flags_o_p.word_update = {N_SINK_STREAMS{1'b0}};
        stream_flags_o_p.line_update = {N_SINK_STREAMS{1'b0}};
        stream_flags_o_p.feat_update = {N_SINK_STREAMS{1'b0}};
      end
      else if(word_counter < line_length_m1 - (NPX-1)) begin
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
  
  
   assign change_feat = ((&en == 1'b1) && 
                         (&address_gen_inc_i == 1'b1) && 
                         (word_counter  == line_length_m1 - (NPX-1)) &&
                         (line_counter  == feat_length_m1) &&
                         (fs_counter    == fs_w_m1 ) &&
                         (fsxfs_counter == fs_h_m1 ));

  
  // address generation
  always_ff @(posedge clk or negedge rst_n)
  begin : address_gen_counters_proc
    if (rst_n==1'b0) begin
      word_addr       <= 0;
      line_addr       <= 0;
      feat_addr       <= 0;
      word_in_fs_addr <= 0;
      line_in_fs_addr <= 0;
      
      ker_addr        <= 0;
      
      word_counter    <= 0;
      line_counter    <= 0;
      feat_counter    <= 0;
      overall_counter <= 0;
      fs_counter      <= 0;
      fsxfs_counter   <= 0;
    end
    else begin
      if(en == {N_SINK_STREAMS{1'b0}}) begin
        word_addr       <= 0;
        line_addr       <= 0;
        feat_addr       <= 0;
        word_in_fs_addr <= 0;
        line_in_fs_addr <= 0;
        
        ker_addr        <= 0;
        
        word_counter    <= 0;
        line_counter    <= 0;
        feat_counter    <= 0;
        overall_counter <= 0;
        fs_counter      <= 0;
        fsxfs_counter   <= 0;
      end
      else begin
        if(address_gen_inc_i == {N_SINK_STREAMS{1'b1}}) begin
          
          if(fs_counter < fs_w_m1)begin
            word_addr       <= word_addr;
            line_addr       <= line_addr;
            feat_addr       <= feat_addr;
            word_in_fs_addr <= word_in_fs_addr + dil_word_stride;//dil_w*WORD_STRIDE;
            line_in_fs_addr <= line_in_fs_addr;
            
            ker_addr        <= ker_addr + WORD_STRIDE;
            
            word_counter    <= word_counter;
            line_counter    <= line_counter;
            feat_counter    <= feat_counter;
            fs_counter      <= fs_counter + 1;
            fsxfs_counter   <= fsxfs_counter;
            overall_counter <= overall_counter;
          end
          else if(fsxfs_counter < fs_h_m1) begin
            word_addr       <= word_addr;
            line_addr       <= line_addr;
            feat_addr       <= feat_addr;
            word_in_fs_addr <= 0;
            line_in_fs_addr <= line_in_fs_addr + {{16{dil_line_stride[15]}}, dil_line_stride};
            
            ker_addr        <= ker_addr + WORD_STRIDE;
            
            word_counter    <= word_counter;
            line_counter    <= line_counter;
            feat_counter    <= feat_counter; 
            fs_counter      <= 0;
            fsxfs_counter   <= fsxfs_counter + 1;
            overall_counter <= overall_counter;
          end
          else if(word_counter < line_length_m1 - (NPX-1)) begin
            word_addr       <= word_addr + (WORD_STRIDE * NPX);
            line_addr       <= line_addr;
            feat_addr       <= feat_addr;
            word_in_fs_addr <= 0;
            line_in_fs_addr <= 0;
            
            ker_addr        <= 0;
            
            word_counter    <= word_counter + NPX;
            line_counter    <= line_counter;
            feat_counter    <= feat_counter;
            fs_counter      <= 0;
            fsxfs_counter   <= 0;
            overall_counter <= overall_counter + NPX;
          end
          else if(line_counter < feat_length_m1) begin
            word_addr       <= 0;
            line_addr       <= line_addr + {{16{line_stride[15]}}, line_stride};
            feat_addr       <= feat_addr;
            word_in_fs_addr <= 0;
            line_in_fs_addr <= 0;
            
            ker_addr        <= 0;
            
            word_counter    <= 0;
            line_counter    <= line_counter + 1;
            feat_counter    <= feat_counter;
            fs_counter      <= 0;
            fsxfs_counter   <= 0;
            overall_counter <= overall_counter + NPX;
          end
          else begin
            word_addr       <= 0;
            line_addr       <= 0;
            feat_addr       <= feat_addr;
            word_in_fs_addr <= 0;
            line_in_fs_addr <= 0;
            
            ker_addr        <= 0;
            
            word_counter    <= 0;
            line_counter    <= 0;
            feat_counter    <= feat_counter + 1;
            fs_counter      <= 0;
            fsxfs_counter   <= 0;
            overall_counter <= overall_counter + NPX;
          end
        end
        else begin
          word_addr       <= word_addr;
          line_addr       <= line_addr;
          feat_addr       <= feat_addr;
          word_in_fs_addr <= word_in_fs_addr;
          line_in_fs_addr <= line_in_fs_addr;
          
          ker_addr        <= 0;
          
          word_counter    <= word_counter;
          line_counter    <= line_counter;
          feat_counter    <= feat_counter;
          overall_counter <= overall_counter;
          fs_counter      <= fs_counter;
          fsxfs_counter   <= fsxfs_counter;
        end
      end
    end
  end
  
  
  
                        
                        
  always_ff @(posedge clk or negedge rst_n)
  begin
    if (rst_n==1'b0)
      in_progress_o <= 1'b1;
    else if (fs_h_m1 == 0 && fs_w_m1 == 0) begin
      if (overall_counter < trans_size_m2 -(NPX-1)-(NPX-1) && (trans_size_m2 >= (NPX-1) + (NPX-1)))
        in_progress_o <= 1'b1;
      else if ((overall_counter == trans_size_m2 -(NPX-1)-(NPX-1) && (trans_size_m2 >= (NPX-1) + (NPX-1))) && (address_gen_inc_i == {N_SINK_STREAMS{1'b0}}))
        in_progress_o <= 1'b1;
      else
        in_progress_o <= 1'b0;
    end
    else begin
      if (overall_counter < trans_size_m1-(NPX-1))
        in_progress_o <= 1'b1;
      else if (overall_counter == (trans_size_m1-(NPX-1))  && (fs_counter < fs_w_m2 || fsxfs_counter < fs_h_m1 ))
        in_progress_o <= 1'b1;
      else if ((fs_counter == fs_w_m2 ) && (address_gen_inc_i == {N_SINK_STREAMS{1'b0}}))
        in_progress_o <= 1'b1;
      else
        in_progress_o <= 1'b0;
    end
  end



  always_comb
  begin : address_gen_comb
    for(int i=0;i<N_SINK_STREAMS; i++)begin
      for(int j=0;j<NPX; j++)begin
        gen_addr_o[i][j] = stream_config_i[i].base_addr + feat_addr + line_addr + word_addr + word_in_fs_addr + line_in_fs_addr + j*WORD_STRIDE;
      end
    end
    ker_addr_o    = wl_base_addr_i + ker_addr;
  end

  
 // assign pause_o = (line_counter == feat_length_m1 && word_counter == line_length_m1)? 1'b1: 1'b0;
endmodule