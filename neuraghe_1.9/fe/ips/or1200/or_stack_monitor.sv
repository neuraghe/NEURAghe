module or_stack_monitor
  #(
    parameter CORE_ID = 0
    )
   (
    input logic fetch_en_i
    );
   
   
   logic [31:0] stackpointer;

   // register r1 is the stackpointer
   assign stackpointer = or1200_cpu.or1200_rf.or1200_rf.rf_a.mem[63:32];
   
   
   always_comb begin
      if (fetch_en_i) begin

	 // stack overflow
	 if (CORE_ID == 0) begin
	    if ((stackpointer != 32'b0) & (stackpointer != 32'h10000000) & (stackpointer != 32'b1) & (stackpointer < 32'h10004000)) begin
	       $display("Stack Pointer of core %d out of range!!! %h: %t", CORE_ID, stackpointer, $time);
	       $stop;
	    end
	 end
	 else if (CORE_ID == 1) begin
	    if ((stackpointer != 32'b0) & (stackpointer != 32'h10000000) & (stackpointer != 32'b1) & (stackpointer != 32'h10004000) & (stackpointer < 32'h10004400)) begin
	       $display("Stack Pointer of core %d out of range!!! %h: %t", CORE_ID, stackpointer, $time);
	       $stop;
	    end
	 end
	 else if (CORE_ID == 2) begin
	    if ((stackpointer != 32'b0) & (stackpointer != 32'h10000000) & (stackpointer != 32'b1) & (stackpointer != 32'h10004000) & (stackpointer < 32'h10004800)) begin
	       $display("Stack Pointer of core %d out of range!!! %h: %t", CORE_ID, stackpointer, $time);
	       $stop;
	    end
	 end
	 else begin
	    if ((stackpointer != 32'b0) & (stackpointer != 32'h10000000) & (stackpointer != 32'b1) & (stackpointer != 32'h10004000) & (stackpointer < 32'h10004C00)) begin
	       $display("Stack Pointer of core %d out of range!!! %h: %t", CORE_ID, stackpointer, $time);
	       $stop;
	    end
	 end

	 // stack pointer out of range
	 if (stackpointer > 32'h10005000) begin
	    $display("Stack Pointer of core %d out of range!!! %h: %t", CORE_ID, stackpointer, $time);
	    $stop;
	 end
	 
      end
   end

   
endmodule
