`include "ulpsoc_defines.sv"

//`undef SCM_BASED_ICACHE
module ram_ws_rs_tag
#(
    parameter data_width = 7,
    parameter addr_width = 6
) 
(
    input  logic                     clk,
    input  logic                     rst_n,
    input  logic  [addr_width-1:0]   raddr,
    input  logic  [addr_width-1:0]   waddr,
    input  logic                     req,
    input  logic                     write,
    input  logic [data_width-1:0]    wdata,
    output logic [data_width-1:0]    rdata
);

    localparam numwords = 2**addr_width;


`ifdef SCM_BASED_ICACHE


            register_file_1r_1w 
            #(
              .ADDR_WIDTH(addr_width),
              .DATA_WIDTH(data_width)
            )
            scm_tag
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
            );

`else
    reg [data_width-1:0] ram [numwords-1:0];

    always @(posedge clk) 
    begin
        if(req)
        begin
        if(write)
        begin
            ram[waddr] <= wdata;
            rdata     <= {data_width{1'bx}};
          end
          else // read
          begin 
          rdata       <= ram[raddr];
          end
        end
        else //~ not request
        begin
        rdata        <= {data_width{1'bx}};
        end
    end
`endif


endmodule
