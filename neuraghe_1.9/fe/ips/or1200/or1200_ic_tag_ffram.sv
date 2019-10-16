// register file to represent tag memory

`include "or1200_defines.v"

module or1200_ic_tag_ffram
  #(
    parameter dw = `OR1200_ICTAG_W,
    parameter aw = `OR1200_ICTAG
    )
   (
    input  logic              clk,
    input  logic              rst,

    input  logic              ce,
    input  logic              we, 
    input  logic [aw-1:0]     addr,
    input  logic [dw-1:0]     di,
    output logic [dw-1:0]     doq
    );
   
   

   // Internal wires and regs
   logic [aw-1:0] 	      intaddr;
   
   logic [2**aw-1:0][dw-1:0]  MemxDN;
   logic [2**aw-1:0][dw-1:0]  MemxDP;
   
   
   // Write port FF
   always @(posedge clk or `OR1200_RST_EVENT rst) begin
      if (rst == `OR1200_RST_VALUE) begin
	 MemxDP <= 0;
	 intaddr <= 0;
      end
      else begin
	 MemxDP <= MemxDN;
	 intaddr <= addr;
      end
   end

   always_comb begin
      MemxDN = MemxDP;
      if (we & ce)
        MemxDN[addr] = di;
   end
   
   
   always_comb begin
      doq = 0;
      if (ce) begin
	 doq = MemxDP[intaddr];
      end
   end
   
endmodule // or1200_ic_tag_ffram
