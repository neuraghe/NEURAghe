`include "ulpsoc_defines.sv"

// `undef SCM_BASED_ICACHE
module ram_ws_rs_data 
#(
    parameter data_width     = 64,
    parameter addr_width     = 7,
    parameter be_width       = data_width/8
)
(
    input  logic                        clk,
    input  logic                        rst_n,
    input  logic [addr_width-1:0]       raddr,
    input  logic [addr_width-1:0]       waddr,
    input  logic                        req,
    input  logic                        write,
    input  logic [be_width-1:0][7:0]    wdata,
    input  logic [be_width-1:0]         be,
    output logic [data_width-1:0]       rdata
);

`ifdef SCM_BASED_ICACHE

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
          .rst_n        (rst_n             ),

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

`else
    localparam numwords = 2**addr_width;


    reg [be_width-1:0][7:0]  ram [numwords];
    integer i;


    always @(posedge clk) 
    begin
        if(req)
        begin
        if(write) // write
        begin
          for(i=0;i<be_width;i++)
          begin
            if(be[i])
            ram[waddr][i]    <= wdata[i];
          end
          rdata        <= {data_width{1'bx}};
          end
          else
          begin // read
          rdata        <= ram[raddr];
          end
        end
        else //~ not request
        begin
        rdata          <= {data_width{1'bx}};
        end
    end
`endif
endmodule
