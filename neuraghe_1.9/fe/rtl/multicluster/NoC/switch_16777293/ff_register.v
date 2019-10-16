`include "noc_parameters.v"

module ff_register(clk, rst, FLIT_in, VALID_in, FWDAUX1_in, BWDAUX1_out, BWDAUX2_out, BWDAUX3_out, FLIT_in_s, VALID_in_s, FWDAUX1_in_s, BWDAUX1_out_c, BWDAUX2_out_c, BWDAUX3_out_c);

    parameter FLIT_WIDTH = 32;

    input  clk;
    input  rst;

    // Input signals to flip-flop bank
    input  [FLIT_WIDTH - 1 : 0] FLIT_in;
    input  VALID_in, FWDAUX1_in;
    input  BWDAUX1_out_c, BWDAUX2_out_c, BWDAUX3_out_c;

    // Input signals from flip-flop bank
    output [FLIT_WIDTH - 1 : 0] FLIT_in_s;
    reg    [FLIT_WIDTH - 1 : 0] FLIT_in_s;
    output VALID_in_s, FWDAUX1_in_s;
    reg    VALID_in_s, FWDAUX1_in_s;
    output BWDAUX1_out, BWDAUX2_out, BWDAUX3_out;
    reg    BWDAUX1_out, BWDAUX2_out;
    wire   BWDAUX3_out;

    assign BWDAUX3_out = 1'b0; // unused

    always@(posedge clk `RESET_SENSITIVITY)
      begin
        if (rst == `RESET_ACTIVE_VALUE)
          begin
            FLIT_in_s    <= 0;
            VALID_in_s   <= 1'b0;
            FWDAUX1_in_s <= 1'b0;
            BWDAUX1_out  <= 1'b0;
            BWDAUX2_out  <= 1'b0;
          end
        else
          begin
            FLIT_in_s    <= FLIT_in;
            VALID_in_s   <= VALID_in;
            FWDAUX1_in_s <= FWDAUX1_in;
            BWDAUX1_out  <= BWDAUX1_out_c;
            BWDAUX2_out  <= BWDAUX2_out_c;
          end
        end

endmodule
