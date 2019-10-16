module C28SOI_PM_CONTROL_LR_ASYNC_clock_gating_cell (CP, E, Q);
   input CP;
   input E;
   //input TE;
   output Q;
   
   reg Q;
   reg Q_latch;
   always @(CP, E) begin
      if (CP == 1'b0)
         Q_latch = E ;
   end
   
   always @(Q_latch or CP) begin
      if (CP == 1'b1)
         Q = Q_latch;
      else   
         Q = 1'b0;
   end

endmodule
