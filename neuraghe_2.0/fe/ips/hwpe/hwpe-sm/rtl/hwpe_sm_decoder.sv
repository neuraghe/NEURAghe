module decoder
#(
   SIZE = 5
)
(
   input  logic[SIZE-1:0]    d_in,
   output logic[2**SIZE-1:0] d_out
);

   always_comb
   begin
      for(int i=0; i<2**SIZE; i++) begin
         if(d_in == i)
            d_out[i] = 1'b1;
         else
            d_out[i] = 1'b0;
      end
   end

endmodule
