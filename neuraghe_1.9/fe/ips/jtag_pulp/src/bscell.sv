
module bscell
  (
   input logic 	clk_i,
   input logic 	rst_ni,
   input logic 	mode_i,
   input logic 	enable_i,
   input logic 	shift_dr_i,
   input logic 	capture_dr_i,
   input logic 	update_dr_i,
   input logic 	scan_in_i,
   input logic 	jtagreg_in_i,
   output logic scan_out_o,
   output logic jtagreg_out_o
   );

   logic 	r_dataout;
   logic 	r_datasample;
   logic 	s_datasample_next;
   
   always_ff @(negedge rst_ni, posedge clk_i)
     begin
	if (~rst_ni)
	  begin
	     r_datasample <= 1'b0;
	     r_dataout    <= 1'b0;
	  end
	else
	  begin
	     if ((shift_dr_i | capture_dr_i) & enable_i)
               r_datasample <= s_datasample_next;
	     if (update_dr_i & enable_i)
               r_dataout <= r_datasample;
	  end
     end

   assign s_datasample_next = (shift_dr_i) ? scan_in_i : jtagreg_in_i;
   assign jtagreg_out_o = (mode_i) ? r_dataout : jtagreg_in_i;
   assign scan_out_o = r_datasample;

endmodule






