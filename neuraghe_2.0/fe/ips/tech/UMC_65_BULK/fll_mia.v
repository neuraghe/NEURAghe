module fll_mia
(
    input                        ref_clk_i,
    input                        rstn_i,
    input                        cfg_req,
    input                        cfg_wrn,
    input             [1:0]      cfg_add,
    input            [31:0]      cfg_data,
    output                       cfg_ack,
    output           [31:0]      cfg_r_data,
    output                       clk_out
);

    assign clk_out = ref_clk_i;

endmodule
