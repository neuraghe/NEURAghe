module jtagreg
#(
    parameter JTAGREGSIZE = 96,
    parameter SYNC = 1
)
(
    input logic                    clk_i,
    input logic                    rst_ni, // already synched
    input logic                    enable_i, // rising edge of tck
    input logic                    capture_dr_i,// capture&sel
    input logic                    shift_dr_i, // shift&sel
    input logic                    update_dr_i, // update&sel
    input logic [JTAGREGSIZE-1:0]  jtagreg_in_i,
    input logic                    mode_i,
    input logic                    scan_in_i,
    output logic                   scan_out_o, 
    output logic [JTAGREGSIZE-1:0] jtagreg_out_o
);

    logic [JTAGREGSIZE-2:0]         s_scanbit;

    logic                           scan_in_syn;


    bscell reg_bit_last
    (
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .mode_i(mode_i),
        .enable_i(enable_i),
        .shift_dr_i(shift_dr_i),
        .capture_dr_i(capture_dr_i),
        .update_dr_i(update_dr_i),
        .scan_in_i(scan_in_syn),
        .jtagreg_in_i(jtagreg_in_i[JTAGREGSIZE-1]),
        .scan_out_o(s_scanbit[0]),
        .jtagreg_out_o(jtagreg_out_o[JTAGREGSIZE-1])
    );

    generate
        for (genvar i=1;i<JTAGREGSIZE-1;i=i+1) 
        begin
            bscell reg_bit_mid
              (
                .clk_i(clk_i),
                .rst_ni(rst_ni),
                .mode_i(mode_i),
                .enable_i(enable_i),
                .shift_dr_i(shift_dr_i),
                .capture_dr_i(capture_dr_i),
                .update_dr_i(update_dr_i),
                .scan_in_i(s_scanbit[i-1]),
                .jtagreg_in_i(jtagreg_in_i[JTAGREGSIZE-1-i]),
                .scan_out_o(s_scanbit[i]),
                .jtagreg_out_o(jtagreg_out_o[JTAGREGSIZE-1-i])
                );
        end
    endgenerate 

    bscell reg_bit0
    (
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .mode_i(mode_i),
        .enable_i(enable_i),
        .shift_dr_i(shift_dr_i),
        .capture_dr_i(capture_dr_i),
        .update_dr_i(update_dr_i), 
        .scan_in_i(s_scanbit[JTAGREGSIZE-2]),
        .jtagreg_in_i(jtagreg_in_i[0]),
        .scan_out_o(scan_out_o),
        .jtagreg_out_o(jtagreg_out_o[0])
    );


    generate
        if (SYNC==1)
        begin : JTAG_SYNC
            jtag_sync jtag_sync_scanin
            (
                .clk_i(clk_i),
                .rst_ni(rst_ni),
                .tosynch(scan_in_i),
                .synched(scan_in_syn)
            );
        end
        else
        begin  : JTAG_NO_SYNC
            assign scan_in_syn = scan_in_i;
        end
    endgenerate

endmodule