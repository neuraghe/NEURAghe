
module C28SOI_PM_CONTROL_LR_ASYNC_synchroniser (Q, D, CLK, RST_N);

parameter SYNC_DEPTH = 3;

output Q;
input D, CLK, RST_N;

reg [SYNC_DEPTH - 1 : 0] local_q;
integer i;


assign  Q = local_q[SYNC_DEPTH - 1];

always @(posedge CLK or negedge RST_N) begin

 if(RST_N == 1'b0) begin
  local_q <= {SYNC_DEPTH{1'b0}};
 end   

 else begin
   local_q[0] <= D;
  for(i = 1; i < SYNC_DEPTH; i = i + 1) begin
   local_q[i] <= local_q[i - 1];
  end   
 end   

end

endmodule
