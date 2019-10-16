

module rab_slice

  ( input     logic       [31:0] cfg_min,
    input     logic       [31:0] cfg_max,
    input     logic       [31:0] cfg_offset,
    input     logic              cfg_wen,
    input     logic              cfg_ren,
    input     logic              cfg_en,
    input     logic              in_trans_type,
    input     logic       [31:0] in_addr_min,
    input     logic       [31:0] in_addr_max,
    output    logic              out_hit,
    output    logic              out_prot,
    output    logic       [31:0] out_addr);

   
  wire                 min_above_min;
  wire                 min_below_max;
  wire                 max_below_max;
   
   
  assign min_above_min = (in_addr_min >= cfg_min) ? 1'b1 : 1'b0;
  assign min_below_max = (in_addr_min <= cfg_max) ? 1'b1 : 1'b0;
  assign max_below_max = (in_addr_max <= cfg_max) ? 1'b1 : 1'b0;

  assign out_hit  = cfg_en & min_above_min & min_below_max & max_below_max;
  assign out_prot = out_hit & ((in_trans_type & ~cfg_wen) | (~in_trans_type & ~cfg_ren));
  assign out_addr = in_addr_min - cfg_min + cfg_offset;

endmodule
