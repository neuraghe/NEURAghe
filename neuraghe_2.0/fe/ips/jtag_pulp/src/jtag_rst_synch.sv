module jtag_rst_synch
  (
   input logic 	clk_i,
   input logic  trst_ni,
   output logic rst_sync,
   input logic  test_mode_i,
   input logic  rst_ni
   );

   logic 	trst1,trst2,trst3,trst4,trst5;
   
   always_ff @(posedge clk_i, negedge trst_ni)
     begin
	if (~trst_ni)  begin
	   trst1 <= 1'b0;
	   trst2 <= 1'b0;
	   trst3 <= 1'b0;
	   trst4 <= 1'b0;
	   trst5 <= 1'b0;
	end
	else begin
	   trst1 <= trst_ni;
	   trst2 <= trst1;
	   trst3 <= trst2;
	   trst4 <= trst3;
	   trst5 <= trst4;
	end
     end

   assign rst_sync = (test_mode_i) ? rst_ni : trst5 & trst_ni;
   
   
endmodule // jtag_rst_synch

