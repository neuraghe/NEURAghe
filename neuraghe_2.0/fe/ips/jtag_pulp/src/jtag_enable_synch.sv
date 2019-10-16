module jtag_enable_synch
  (
   input logic 	clk_i,
   input logic  rst_ni,
   input logic 	tck,
   output logic enable
   );

   logic 	tck1,tck2,tck3;
   
   always_ff @(negedge rst_ni, posedge clk_i)
     begin
	if (~rst_ni)
	  begin
	     tck1 <= 1'b0;
	     tck2 <= 1'b0;
	     tck3 <= 1'b0;
	  end
	else
	  begin
	     tck1 <= tck;
	     tck2 <= tck1;
	     tck3 <= tck2;
	  end
     end
   
   assign enable = ~tck3 & tck2;
      
endmodule // jtag_enable_synch

