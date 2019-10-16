///////////////////////////////////////////////////////////////////////////////
// Copyright 2009 iNoCs                                                      //
//                                                                           //
// name         /home/chester/Desktop/prj/XPIPES_fresh/inocs/flow/rtl/verilog/switch_16777291/switch_16777291.v                                     //
// author       Federico Angiolini - angiolini@inocs.com                     //
// author       Antonio Pullini - pullini@inocs.com                          //
// info         NoC switch component.  //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                    Automatically generated - don't edit                   //
//           File generated for topology: noc18_4sw_80bits_run0           //
///////////////////////////////////////////////////////////////////////////////

module switch_16777291(clk, rst, FLIT_in_0, VALID_in_0, FWDAUX1_in_0, BWDAUX1_out_0, BWDAUX2_out_0, BWDAUX3_out_0, FLIT_in_1, VALID_in_1, FWDAUX1_in_1, BWDAUX1_out_1, BWDAUX2_out_1, BWDAUX3_out_1, FLIT_in_2, VALID_in_2, FWDAUX1_in_2, BWDAUX1_out_2, BWDAUX2_out_2, BWDAUX3_out_2, FLIT_in_3, VALID_in_3, FWDAUX1_in_3, BWDAUX1_out_3, BWDAUX2_out_3, BWDAUX3_out_3, FLIT_in_4, VALID_in_4, FWDAUX1_in_4, BWDAUX1_out_4, BWDAUX2_out_4, BWDAUX3_out_4, FLIT_in_5, VALID_in_5, FWDAUX1_in_5, BWDAUX1_out_5, BWDAUX2_out_5, BWDAUX3_out_5, FLIT_out_0, VALID_out_0, FWDAUX1_out_0, BWDAUX1_in_0, BWDAUX2_in_0, BWDAUX3_in_0, FLIT_out_1, VALID_out_1, FWDAUX1_out_1, BWDAUX1_in_1, BWDAUX2_in_1, BWDAUX3_in_1, FLIT_out_2, VALID_out_2, FWDAUX1_out_2, BWDAUX1_in_2, BWDAUX2_in_2, BWDAUX3_in_2);

    input clk;
    input rst;
    // Input ports
    input  [79 : 0] FLIT_in_0;
    input  VALID_in_0;
    input  FWDAUX1_in_0;
    output BWDAUX1_out_0;
    output BWDAUX2_out_0;
    output BWDAUX3_out_0;
    input  [79 : 0] FLIT_in_1;
    input  VALID_in_1;
    input  FWDAUX1_in_1;
    output BWDAUX1_out_1;
    output BWDAUX2_out_1;
    output BWDAUX3_out_1;
    input  [79 : 0] FLIT_in_2;
    input  VALID_in_2;
    input  FWDAUX1_in_2;
    output BWDAUX1_out_2;
    output BWDAUX2_out_2;
    output BWDAUX3_out_2;
    input  [79 : 0] FLIT_in_3;
    input  VALID_in_3;
    input  FWDAUX1_in_3;
    output BWDAUX1_out_3;
    output BWDAUX2_out_3;
    output BWDAUX3_out_3;
    input  [79 : 0] FLIT_in_4;
    input  VALID_in_4;
    input  FWDAUX1_in_4;
    output BWDAUX1_out_4;
    output BWDAUX2_out_4;
    output BWDAUX3_out_4;
    input  [79 : 0] FLIT_in_5;
    input  VALID_in_5;
    input  FWDAUX1_in_5;
    output BWDAUX1_out_5;
    output BWDAUX2_out_5;
    output BWDAUX3_out_5;
    // Output ports
    output [79 : 0] FLIT_out_0;
    output VALID_out_0;
    output FWDAUX1_out_0;
    input  BWDAUX1_in_0;
    input  BWDAUX2_in_0;
    input  BWDAUX3_in_0;
    output [79 : 0] FLIT_out_1;
    output VALID_out_1;
    output FWDAUX1_out_1;
    input  BWDAUX1_in_1;
    input  BWDAUX2_in_1;
    input  BWDAUX3_in_1;
    output [79 : 0] FLIT_out_2;
    output VALID_out_2;
    output FWDAUX1_out_2;
    input  BWDAUX1_in_2;
    input  BWDAUX2_in_2;
    input  BWDAUX3_in_2;

    // Internal signals
    wire [1 : 0] allocator_constant[2 : 0];
    wire [79 : 0] FLIT_in_s[5 : 0];
    wire VALID_in_s[5 : 0];
    wire FWDAUX1_in_s[5 : 0];
    wire [79 : 0] mux[2 : 0];
    wire [1 : 0] mux_sel_0;
    wire [5 : 0] mux_sel_1;
    wire [1 : 0] mux_sel_2;
    wire [79 : 0] shift_0;
    wire full_0;
    wire fifo_valid_write_0;
    wire [79 : 0] shift_1;
    wire full_1;
    wire fifo_valid_write_1;
    wire shift_ctl[2 : 0];
    wire [1 : 0] alloc_BWDAUX1_out_0;
    wire [1 : 0] alloc_BWDAUX2_out_0;
    wire [1 : 0] alloc_BWDAUX3_out_0;
    wire [5 : 0] alloc_BWDAUX1_out_1;
    wire [5 : 0] alloc_BWDAUX2_out_1;
    wire [5 : 0] alloc_BWDAUX3_out_1;
    wire [1 : 0] alloc_BWDAUX1_out_2;
    wire [1 : 0] alloc_BWDAUX2_out_2;
    wire [1 : 0] alloc_BWDAUX3_out_2;
    wire BWDAUX1_out_c[5 : 0];
    wire BWDAUX2_out_c[5 : 0];
    wire BWDAUX3_out_c[5 : 0];

    assign allocator_constant[0] = 0;
    allocator_2x3_80 alloc_0(.clk(clk), .rst(rst), .which_port(allocator_constant[0]), .FLIT_in_0(FLIT_in_s[3]), .VALID_in_0(VALID_in_s[3]), .FWDAUX1_in_0(FWDAUX1_in_s[3]), .FLIT_in_1(FLIT_in_s[5]), .VALID_in_1(VALID_in_s[5]), .FWDAUX1_in_1(FWDAUX1_in_s[5]), .busy_in(full_0), .select(mux_sel_0), .shift_ctl(shift_ctl[0]), .VALID_out(fifo_valid_write_0), .BWDAUX1_out(alloc_BWDAUX1_out_0), .BWDAUX2_out(alloc_BWDAUX2_out_0), .BWDAUX3_out(alloc_BWDAUX3_out_0));
    assign allocator_constant[1] = 1;
    allocator_6x3_80 alloc_1(.clk(clk), .rst(rst), .which_port(allocator_constant[1]), .FLIT_in_0(FLIT_in_s[0]), .VALID_in_0(VALID_in_s[0]), .FWDAUX1_in_0(FWDAUX1_in_s[0]), .FLIT_in_1(FLIT_in_s[1]), .VALID_in_1(VALID_in_s[1]), .FWDAUX1_in_1(FWDAUX1_in_s[1]), .FLIT_in_2(FLIT_in_s[2]), .VALID_in_2(VALID_in_s[2]), .FWDAUX1_in_2(FWDAUX1_in_s[2]), .FLIT_in_3(FLIT_in_s[3]), .VALID_in_3(VALID_in_s[3]), .FWDAUX1_in_3(FWDAUX1_in_s[3]), .FLIT_in_4(FLIT_in_s[4]), .VALID_in_4(VALID_in_s[4]), .FWDAUX1_in_4(FWDAUX1_in_s[4]), .FLIT_in_5(FLIT_in_s[5]), .VALID_in_5(VALID_in_s[5]), .FWDAUX1_in_5(FWDAUX1_in_s[5]), .busy_in(full_1), .select(mux_sel_1), .shift_ctl(shift_ctl[1]), .VALID_out(fifo_valid_write_1), .BWDAUX1_out(alloc_BWDAUX1_out_1), .BWDAUX2_out(alloc_BWDAUX2_out_1), .BWDAUX3_out(alloc_BWDAUX3_out_1));
    assign allocator_constant[2] = 2;
    allocator_2x3_80 alloc_2(.clk(clk), .rst(rst), .which_port(allocator_constant[2]), .FLIT_in_0(FLIT_in_s[3]), .VALID_in_0(VALID_in_s[3]), .FWDAUX1_in_0(FWDAUX1_in_s[3]), .FLIT_in_1(FLIT_in_s[4]), .VALID_in_1(VALID_in_s[4]), .FWDAUX1_in_1(FWDAUX1_in_s[4]), .busy_in(BWDAUX1_in_2), .select(mux_sel_2), .shift_ctl(shift_ctl[2]), .VALID_out(VALID_out_2), .BWDAUX1_out(alloc_BWDAUX1_out_2), .BWDAUX2_out(alloc_BWDAUX2_out_2), .BWDAUX3_out(alloc_BWDAUX3_out_2));

    multiplexer_2_80 mux_0(.mux(mux[0]), .mux_sel(mux_sel_0), .FLIT_in_s_0(FLIT_in_s[3]), .FLIT_in_s_1(FLIT_in_s[5]));
    multiplexer_6_80 mux_1(.mux(mux[1]), .mux_sel(mux_sel_1), .FLIT_in_s_0(FLIT_in_s[0]), .FLIT_in_s_1(FLIT_in_s[1]), .FLIT_in_s_2(FLIT_in_s[2]), .FLIT_in_s_3(FLIT_in_s[3]), .FLIT_in_s_4(FLIT_in_s[4]), .FLIT_in_s_5(FLIT_in_s[5]));
    multiplexer_2_80 mux_2(.mux(mux[2]), .mux_sel(mux_sel_2), .FLIT_in_s_0(FLIT_in_s[3]), .FLIT_in_s_1(FLIT_in_s[4]));

    shifter #(.FLIT_WIDTH(80), .L_SW_OUT(2)) shifters_0(.mux(mux[0]), .shift(shift_0)  , .shift_ctl(shift_ctl[0]));
    shifter #(.FLIT_WIDTH(80), .L_SW_OUT(2)) shifters_1(.mux(mux[1]), .shift(shift_1)  , .shift_ctl(shift_ctl[1]));
    shifter #(.FLIT_WIDTH(80), .L_SW_OUT(2)) shifters_2(.mux(mux[2]), .shift(FLIT_out_2)  , .shift_ctl(shift_ctl[2]));

    out_buffer #(.FLIT_WIDTH(80), .OUT_BUFFER_DEPTH(6), .LOG_OUT_BUFFER_DEPTH(3)) outbuff_0(.clk(clk), .rst(rst), .FLIT_out(FLIT_out_0), .VALID_out(VALID_out_0), .FWDAUX1_out(FWDAUX1_out_0), .BWDAUX1_in(BWDAUX1_in_0), .BWDAUX2_in(BWDAUX2_in_0), .BWDAUX3_in(BWDAUX3_in_0), .data_in(shift_0), .full(full_0), .write(fifo_valid_write_0));
    out_buffer #(.FLIT_WIDTH(80), .OUT_BUFFER_DEPTH(6), .LOG_OUT_BUFFER_DEPTH(3)) outbuff_1(.clk(clk), .rst(rst), .FLIT_out(FLIT_out_1), .VALID_out(VALID_out_1), .FWDAUX1_out(FWDAUX1_out_1), .BWDAUX1_in(BWDAUX1_in_1), .BWDAUX2_in(BWDAUX2_in_1), .BWDAUX3_in(BWDAUX3_in_1), .data_in(shift_1), .full(full_1), .write(fifo_valid_write_1));

    combinational #(.SWITCH_OUTPUTS(1)) combinatorial_0(.alloc_BWDAUX1_out({alloc_BWDAUX1_out_1[0]}), .alloc_BWDAUX2_out({alloc_BWDAUX2_out_1[0]}), .alloc_BWDAUX3_out({alloc_BWDAUX3_out_1[0]}), .BWDAUX1_out_c(BWDAUX1_out_c[0]), .BWDAUX2_out_c(BWDAUX2_out_c[0]), .BWDAUX3_out_c(BWDAUX3_out_c[0]));
    combinational #(.SWITCH_OUTPUTS(1)) combinatorial_1(.alloc_BWDAUX1_out({alloc_BWDAUX1_out_1[1]}), .alloc_BWDAUX2_out({alloc_BWDAUX2_out_1[1]}), .alloc_BWDAUX3_out({alloc_BWDAUX3_out_1[1]}), .BWDAUX1_out_c(BWDAUX1_out_c[1]), .BWDAUX2_out_c(BWDAUX2_out_c[1]), .BWDAUX3_out_c(BWDAUX3_out_c[1]));
    combinational #(.SWITCH_OUTPUTS(1)) combinatorial_2(.alloc_BWDAUX1_out({alloc_BWDAUX1_out_1[2]}), .alloc_BWDAUX2_out({alloc_BWDAUX2_out_1[2]}), .alloc_BWDAUX3_out({alloc_BWDAUX3_out_1[2]}), .BWDAUX1_out_c(BWDAUX1_out_c[2]), .BWDAUX2_out_c(BWDAUX2_out_c[2]), .BWDAUX3_out_c(BWDAUX3_out_c[2]));
    combinational #(.SWITCH_OUTPUTS(3)) combinatorial_3(.alloc_BWDAUX1_out({alloc_BWDAUX1_out_2[0], alloc_BWDAUX1_out_1[3], alloc_BWDAUX1_out_0[0]}), .alloc_BWDAUX2_out({alloc_BWDAUX2_out_2[0], alloc_BWDAUX2_out_1[3], alloc_BWDAUX2_out_0[0]}), .alloc_BWDAUX3_out({alloc_BWDAUX3_out_2[0], alloc_BWDAUX3_out_1[3], alloc_BWDAUX3_out_0[0]}), .BWDAUX1_out_c(BWDAUX1_out_c[3]), .BWDAUX2_out_c(BWDAUX2_out_c[3]), .BWDAUX3_out_c(BWDAUX3_out_c[3]));
    combinational #(.SWITCH_OUTPUTS(2)) combinatorial_4(.alloc_BWDAUX1_out({alloc_BWDAUX1_out_2[1], alloc_BWDAUX1_out_1[4]}), .alloc_BWDAUX2_out({alloc_BWDAUX2_out_2[1], alloc_BWDAUX2_out_1[4]}), .alloc_BWDAUX3_out({alloc_BWDAUX3_out_2[1], alloc_BWDAUX3_out_1[4]}), .BWDAUX1_out_c(BWDAUX1_out_c[4]), .BWDAUX2_out_c(BWDAUX2_out_c[4]), .BWDAUX3_out_c(BWDAUX3_out_c[4]));
    combinational #(.SWITCH_OUTPUTS(2)) combinatorial_5(.alloc_BWDAUX1_out({alloc_BWDAUX1_out_1[5], alloc_BWDAUX1_out_0[1]}), .alloc_BWDAUX2_out({alloc_BWDAUX2_out_1[5], alloc_BWDAUX2_out_0[1]}), .alloc_BWDAUX3_out({alloc_BWDAUX3_out_1[5], alloc_BWDAUX3_out_0[1]}), .BWDAUX1_out_c(BWDAUX1_out_c[5]), .BWDAUX2_out_c(BWDAUX2_out_c[5]), .BWDAUX3_out_c(BWDAUX3_out_c[5]));

    in_buffer_6 #(.FLIT_WIDTH(80)) inbuff_0(.clk(clk), .rst(rst), .FLIT_in(FLIT_in_0), .VALID_in(VALID_in_0), .FWDAUX1_in(FWDAUX1_in_0), .BWDAUX1_out(BWDAUX1_out_0), .BWDAUX2_out(BWDAUX2_out_0), .BWDAUX3_out(BWDAUX3_out_0), .flit_out(FLIT_in_s[0]), .request_out(VALID_in_s[0]), .busy_out(BWDAUX1_out_c[0]));
    in_buffer_6 #(.FLIT_WIDTH(80)) inbuff_1(.clk(clk), .rst(rst), .FLIT_in(FLIT_in_1), .VALID_in(VALID_in_1), .FWDAUX1_in(FWDAUX1_in_1), .BWDAUX1_out(BWDAUX1_out_1), .BWDAUX2_out(BWDAUX2_out_1), .BWDAUX3_out(BWDAUX3_out_1), .flit_out(FLIT_in_s[1]), .request_out(VALID_in_s[1]), .busy_out(BWDAUX1_out_c[1]));
    in_buffer_6 #(.FLIT_WIDTH(80)) inbuff_2(.clk(clk), .rst(rst), .FLIT_in(FLIT_in_2), .VALID_in(VALID_in_2), .FWDAUX1_in(FWDAUX1_in_2), .BWDAUX1_out(BWDAUX1_out_2), .BWDAUX2_out(BWDAUX2_out_2), .BWDAUX3_out(BWDAUX3_out_2), .flit_out(FLIT_in_s[2]), .request_out(VALID_in_s[2]), .busy_out(BWDAUX1_out_c[2]));
    in_buffer_6 #(.FLIT_WIDTH(80)) inbuff_3(.clk(clk), .rst(rst), .FLIT_in(FLIT_in_3), .VALID_in(VALID_in_3), .FWDAUX1_in(FWDAUX1_in_3), .BWDAUX1_out(BWDAUX1_out_3), .BWDAUX2_out(BWDAUX2_out_3), .BWDAUX3_out(BWDAUX3_out_3), .flit_out(FLIT_in_s[3]), .request_out(VALID_in_s[3]), .busy_out(BWDAUX1_out_c[3]));
    in_buffer_6 #(.FLIT_WIDTH(80)) inbuff_4(.clk(clk), .rst(rst), .FLIT_in(FLIT_in_4), .VALID_in(VALID_in_4), .FWDAUX1_in(FWDAUX1_in_4), .BWDAUX1_out(BWDAUX1_out_4), .BWDAUX2_out(BWDAUX2_out_4), .BWDAUX3_out(BWDAUX3_out_4), .flit_out(FLIT_in_s[4]), .request_out(VALID_in_s[4]), .busy_out(BWDAUX1_out_c[4]));
    in_buffer_6 #(.FLIT_WIDTH(80)) inbuff_5(.clk(clk), .rst(rst), .FLIT_in(FLIT_in_5), .VALID_in(VALID_in_5), .FWDAUX1_in(FWDAUX1_in_5), .BWDAUX1_out(BWDAUX1_out_5), .BWDAUX2_out(BWDAUX2_out_5), .BWDAUX3_out(BWDAUX3_out_5), .flit_out(FLIT_in_s[5]), .request_out(VALID_in_s[5]), .busy_out(BWDAUX1_out_c[5]));


endmodule
