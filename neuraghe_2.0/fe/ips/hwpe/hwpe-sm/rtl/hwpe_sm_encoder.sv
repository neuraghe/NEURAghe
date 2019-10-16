`define log2(N) ((N)<=(1) ? 0 : (N)<=(2) ? 1 : (N)<=(4) ? 2 : (N)<=(8) ? 3 : (N)<=(16) ? 4 : (N)<=(32) ? 5 : (N)<=(64) ? 6 : (N)<=(128) ? 7 : (N)<=(256) ? 8 : (N)<=(512) ? 9 : (N)<=(1024) ? 10 : -1)

module encoder
#(
   SIZE = 32
)
(
   input  logic[SIZE-1:0]        d_in,
   output logic[`log2(SIZE)-1:0] d_out
);

   always_comb
   begin
      d_out = {`log2(SIZE){1'b0}};
      for(int i=0; i<SIZE; i++) begin
         if(d_in == i)
            d_out = 1 << i;
      end
   end

endmodule
