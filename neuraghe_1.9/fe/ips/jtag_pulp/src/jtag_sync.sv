module jtag_sync
  (
   input logic 	clk_i,
   input logic 	rst_ni,
   input logic 	tosynch,
   output logic synched
   );

   logic 	synch1,synch2,synch3;
   
   always_ff @(posedge clk_i, negedge rst_ni)
     begin
	if (~rst_ni)  begin
	   synch1 <= 1'b0;
	   synch2 <= 1'b0;
	   synch3 <= 1'b0;
	   synched <= 1'b0;
	end
	else begin
	   synch1 <= tosynch;
	   synch2 <= synch1;
	   synch3 <= synch2;
	   synched<= synch3;
	end
     end
   
   
endmodule // jtag_sync
