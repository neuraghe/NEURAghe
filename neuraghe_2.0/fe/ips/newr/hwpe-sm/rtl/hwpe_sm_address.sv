/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           hwpe_sm_address.sv                                         *
 * Description:    Address translation module                                 *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"

module hwpe_sm_address
#(
  parameter CLUS_ADDR_WIDTH = 32,
  parameter CATC_ADDR_WIDTH = 32,
  parameter BASE_ALIGNMENT_BIT = 6,
  parameter N_INTERLEAVED = 1,
  parameter ID_INTERLEAVED = -1,
  parameter N_POINTERS = 1,
  parameter BANK_SIZE = 4096,
  parameter CONTINUOUS_WEIGHTS_SET=1
)
(
  input  logic [CATC_ADDR_WIDTH-1:0] catc_add,
  input  regfile_t                   reg_file,
  output logic [CLUS_ADDR_WIDTH-1:0] trans_add
);

  localparam LOG_POINTERS = $clog2(N_POINTERS);

  logic [CATC_ADDR_WIDTH-1:0] catc_add_int;

  generate
    if (N_INTERLEAVED > 1) begin : interleaving_gen
       assign catc_add_int[CATC_ADDR_WIDTH-1:`log2(N_INTERLEAVED)] = catc_add[CATC_ADDR_WIDTH-`log2(N_INTERLEAVED)-1:0];
       assign catc_add_int[`log2(N_INTERLEAVED)-1:0]               = ID_INTERLEAVED;
    end
    else begin : no_interleaving_gen
       assign catc_add_int = catc_add;
    end
  endgenerate

  logic [LOG_POINTERS-1:0]       pointer_add;
  logic [N_POINTERS-1:0]         pointer_dec;
  logic [BASE_ALIGNMENT_BIT-1:0] element_add;
  logic [CLUS_ADDR_WIDTH-1:2]    base_add;

  decoder #(
    .SIZE(LOG_POINTERS)
  ) pointer_decoder_i (
    .d_in  (pointer_add),
    .d_out (pointer_dec)
  );

  always_comb
  begin : base_element_comb
    pointer_add = catc_add_int[BASE_ALIGNMENT_BIT+LOG_POINTERS-1:BASE_ALIGNMENT_BIT];
    element_add = catc_add_int[BASE_ALIGNMENT_BIT-1:0];
    base_add = 0;
    for(int i=0; i<N_POINTERS; i++) begin
      base_add = base_add | ((pointer_dec[i] == 1'b1) ? reg_file.hwpe_params[i][CLUS_ADDR_WIDTH-1:2] : 0);
    end
  end
 
  generate  
   if (CONTINUOUS_WEIGHTS_SET) begin
     assign trans_add = {base_add + element_add, 2'b0} + ((BANK_SIZE*ID_INTERLEAVED)<<2);
   end
   else begin
     assign trans_add = {base_add + element_add, 2'b0};
   end
  endgenerate
endmodule
