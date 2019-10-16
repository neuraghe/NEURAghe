module ETHZ_BBMUX_LVT
//synthesis translate_off
  #(
    parameter IND=0
    )
//synthesis translate_on
   (
   input logic [1:0] SEL
   );

//synthesis translate_off
   always_comb
     $display("BBMUX reg: %d status: %b", IND, SEL);
//synthesis translate_on
   
endmodule // ETHZ_BBMUX_LVT
