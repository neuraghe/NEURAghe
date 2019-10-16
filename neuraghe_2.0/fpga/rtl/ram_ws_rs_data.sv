module ram_ws_rs_data #(
    parameter data_width = 64,  // works only for 32 bit
    parameter addr_width = 7,
    parameter be_width   = data_width/8
) (
    input  logic				clk, 
    input wire				        rst_n,
    input  logic [addr_width-1:0]     		raddr,
    input  logic [addr_width-1:0]       	waddr,
    input  logic				req,
    input  logic				write,
    input  logic [be_width-1:0][7:0] 		wdata,
    input  logic [be_width-1:0] 		be,
    output logic [data_width-1:0] 		rdata
);

`define BRAM_BASED_ICACHE_DATA

`ifdef BRAM_BASED_ICACHE_DATA
   wire                               rsta;
   assign rsta = ~rst_n;
   
   xilinx_icache_bank_data_16x128 icache_data_i
     (
      // Read port
      .clka (clk         ),
      .rsta (rsta        ),
      .ena  (req & ~write),
      .wea  ('0          ),
      .addra(raddr       ),
      .dina ('0          ),
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
      // when we are writing the data on the icache, the be is always '1, no need of scm with BE
      //register_file_1r_1w_be
      register_file_1r_1w
      #(
          .ADDR_WIDTH(addr_width),
          .DATA_WIDTH(data_width)
      )
      scm_data
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
          //, .WriteBE       (be)
      ); 
`endif
   
endmodule
