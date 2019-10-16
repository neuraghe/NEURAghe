module ram_ws_rs_tag
#(
    parameter data_width = 7,
    parameter addr_width = 6
) 
(
    input wire				clk, 
    input wire				rst_n, 
    input  logic  [addr_width-1:0]      raddr,
    input  logic  [addr_width-1:0]      waddr,
    input wire				req,
    input wire				write,
    input wire [data_width-1:0] 	wdata,
    output reg [data_width-1:0] 	rdata
);

//`define BRAM_BASED_ICACHE_TAG

`ifdef BRAM_BASED_ICACHE_TAG
   wire                           rsta;
   assign rsta = ~rst_n;
   
   xilinx_icache_bank_tag_16x8 icache_tag_i
     (
      // Read port
      .clka (clk         ),
      .rsta (rsta        ),
      .ena  (req & ~write),
      .wea  ('0          ),
      .addra(raddr       ),
      .dina (            ),
      .douta(rdata       ),
      
      // Write port
      .clkb (clk        ),
      .enb  (req & write),
      .web  (req & write),
      .addrb(waddr      ),
      .dinb (wdata      ),
      .doutb(           )
      );
`else 
       register_file_1r_1w 
       #(
         .ADDR_WIDTH(addr_width),
         .DATA_WIDTH(data_width)
       )
       scm_tag
       (
         .clk           (clk),
         .rst_n         (rst_n),

         // Read port
         .ReadEnable    (req & ~write),
         .ReadAddr      (raddr),
         .ReadData      (rdata),

         // Write port
         .WriteEnable   (req & write),
         .WriteAddr     (waddr),
         .WriteData     (wdata)
       );
`endif

 endmodule
