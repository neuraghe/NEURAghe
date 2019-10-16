`include "noc_parameters.v"

module mem_elem (clk, rst, wr_en_n, wdata, rdata);

    parameter DSIZE = 8;

    input clk;
    input rst;
    input wr_en_n;
    input [DSIZE - 1 : 0] wdata;
    output [DSIZE - 1 : 0] rdata;

    reg [DSIZE - 1 : 0] data;

    assign rdata = !wr_en_n ? wdata : data;

    always @(posedge clk `RESET_SENSITIVITY)
    begin
        if (rst == `RESET_ACTIVE_VALUE)
            data <= 'h0;
        else
            data <= rdata;   
    end 

endmodule

