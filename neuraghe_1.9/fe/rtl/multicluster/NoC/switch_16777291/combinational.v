`include "noc_parameters.v"

module combinational(alloc_BWDAUX1_out, alloc_BWDAUX2_out, alloc_BWDAUX3_out, BWDAUX1_out_c, BWDAUX2_out_c, BWDAUX3_out_c);

    parameter SWITCH_OUTPUTS = 4;

    input  [SWITCH_OUTPUTS - 1 : 0] alloc_BWDAUX1_out;
    input  [SWITCH_OUTPUTS - 1 : 0] alloc_BWDAUX2_out;
    input  [SWITCH_OUTPUTS - 1 : 0] alloc_BWDAUX3_out;
    output BWDAUX1_out_c;
    output BWDAUX2_out_c;
    output BWDAUX3_out_c;

    assign BWDAUX1_out_c = (| alloc_BWDAUX1_out); // OR reduction
    assign BWDAUX2_out_c = (| alloc_BWDAUX2_out); // OR reduction
    assign BWDAUX3_out_c = (| alloc_BWDAUX3_out); // OR reduction

endmodule
