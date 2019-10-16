///////////////////////////////////////////////////////////////////////////////
// Copyright 2009 iNoCs                                                      //
//                                                                           //
// name         /home/chester/Desktop/prj/XPIPES_fresh/inocs/flow/rtl/verilog/ni_target_67109017_L2_MEM/in_buffer_6.v                                     //
// author       Federico Angiolini - angiolini@inocs.com                     //
// author       Antonio Pullini - pullini@inocs.com                          //
// info         Implementation of the input buffer of NIs and switches.  //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                    Automatically generated - don't edit                   //
//           File generated for topology: noc18_4sw_80bits_run0           //
///////////////////////////////////////////////////////////////////////////////

`include "noc_parameters.v"

module in_buffer_6(clk, rst, FLIT_in, VALID_in, FWDAUX1_in, BWDAUX1_out, BWDAUX2_out, BWDAUX3_out, flit_out, request_out, busy_out);

    parameter FLIT_WIDTH = 32;

    reg    [5 : 0] CS, NS;

    input  clk, rst;

    // Network side
    input  [FLIT_WIDTH - 1 : 0] FLIT_in;
    input  VALID_in;
    input  FWDAUX1_in;       // REPLAY on ACK_NACK, unused otherwise
    output BWDAUX1_out;      // ACK on ACK_NACK, STALL on STALL_GO and T_ERROR
    reg    BWDAUX1_out;
    output BWDAUX2_out;      // ACK_VALID on ACK_NACK, unused otherwise
    output BWDAUX3_out;      // unused

    // Component side
    output [FLIT_WIDTH - 1 : 0] flit_out;
    reg    [FLIT_WIDTH - 1 : 0] flit_out;
    output request_out;
    reg    request_out;
    input  busy_out;

    // Internal state
    reg    [FLIT_WIDTH - 1 : 0] flit [4 : 0];
    reg    [FLIT_WIDTH - 1 : 0] mux_out;
    reg    enable_0, enable_all;
    reg    [5 : 0] sel;
    integer loop;

    assign BWDAUX2_out = 1'b0;
    assign BWDAUX3_out = 1'b0;

    always @(posedge clk `RESET_SENSITIVITY)
        begin: update_fsm
            if (rst == `RESET_ACTIVE_VALUE)
                CS <= 0;
            else
                CS <= NS;
        end

    always @(CS or VALID_in or busy_out)
        begin: compute_fsm_state
            case (CS)
                0:
                    if (!VALID_in)
                        NS <= 0;
                    else
                        NS <= 1;

                1:
                    if (!VALID_in && !busy_out)
                        NS <= 0;
                    else if ((VALID_in && !busy_out) || (!VALID_in && busy_out))
                        NS <= 1;
                    else
                        NS <= 2;

                2:
                    if (!VALID_in && !busy_out)
                        NS <= 1;
                    else if ((VALID_in && !busy_out) || (!VALID_in && busy_out))
                        NS <= 2;
                    else
                        NS <= 3;

                3:
                    if (!VALID_in && !busy_out)
                        NS <= 2;
                    else if ((VALID_in && !busy_out) || (!VALID_in && busy_out))
                        NS <= 3;
                    else
                        NS <= 4;

                4:
                    if (!VALID_in && !busy_out)
                        NS <= 3;
                    else if ((VALID_in && !busy_out) || (!VALID_in && busy_out))
                        NS <= 4;
                    else
                        NS <= 5;

                5:
                    if (!VALID_in && !busy_out)
                        NS <= 4;
                    else if ((VALID_in && !busy_out) || (!VALID_in && busy_out))
                        NS <= 5;
                    else
                        NS <= 6;

                6:
                    if (busy_out)
                        NS <= 6;
                    else
                        NS <= 5;

                default:
                    NS <= 0;
       endcase
    end

    always @(CS or VALID_in or busy_out)
        begin: compute_output
            case (CS)
                0:
                    begin
                        if (VALID_in)
                            enable_0 <= 1'b1;
                        else
                            enable_0 <= 1'bx;
                        enable_all <= 1'bx;
                        sel <= 1;
                        request_out <= 1'b0;
                        BWDAUX1_out <= 1'b0;
                    end

                1:
                    begin
                        if (VALID_in && !busy_out)
                            enable_0 <= 1'b1;
                        else
                            enable_0 <= 1'b0;
                        if (VALID_in && busy_out)
                            enable_all <= 1'b1;
                        else
                            enable_all <= 1'bx;
                        sel <= 1;
                        request_out <= 1'b1;
                        BWDAUX1_out <= 1'b0;
                    end

                2:
                    begin
                        if (!busy_out)
                            enable_0 <= 1'b1;
                        else
                            enable_0 <= 1'b0;
                        if (VALID_in)
                            enable_all <= 1'b1;
                        else
                            enable_all <= 1'b0;
                        sel <= 2;
                        request_out <= 1'b1;
                        BWDAUX1_out <= 1'b0;
                    end

                3:
                    begin
                        if (!busy_out)
                            enable_0 <= 1'b1;
                        else
                            enable_0 <= 1'b0;
                        if (VALID_in)
                            enable_all <= 1'b1;
                        else
                            enable_all <= 1'b0;
                        sel <= 4;
                        request_out <= 1'b1;
                        BWDAUX1_out <= 1'b0;
                    end

                4:
                    begin
                        if (!busy_out)
                            enable_0 <= 1'b1;
                        else
                            enable_0 <= 1'b0;
                        if (VALID_in)
                            enable_all <= 1'b1;
                        else
                            enable_all <= 1'b0;
                        sel <= 8;
                        request_out <= 1'b1;
                        BWDAUX1_out <= 1'b0;
                    end

                5:
                    begin
                        if (!busy_out)
                            enable_0 <= 1'b1;
                        else
                            enable_0 <= 1'b0;
                        if (VALID_in)
                            enable_all <= 1'b1;
                        else
                            enable_all <= 1'b0;
                        sel <= 16;
                        request_out <= 1'b1;
                        BWDAUX1_out <= 1'b0;
                    end

                6:
                    begin
                        if (!busy_out)
                            enable_0 <= 1'b1;
                        else
                            enable_0 <= 1'b0;
                        enable_all <= 1'b0;
                        sel <= 32;
                        request_out <= 1'b1;
                        BWDAUX1_out <= 1'b1;
                    end

                default:
                    begin
                        enable_0 <= 1'bx;
                        enable_all <= 1'bx;
                        sel <= 1;
                        request_out <= 1'b0;
                        BWDAUX1_out <= 1'b0;
                    end
            endcase
        end

    always @(FLIT_in or sel or flit[0] or flit[1] or flit[2] or flit[3] or flit[4])
        begin: mux
            case (sel)
                1:
                    mux_out <= FLIT_in;
                2:
                    mux_out <= flit[0];
                4:
                    mux_out <= flit[1];
                8:
                    mux_out <= flit[2];
                16:
                    mux_out <= flit[3];
                32:
                    mux_out <= flit[4];
                default:
                    mux_out <= flit[0];
            endcase
        end

    always @(posedge clk `RESET_SENSITIVITY)
        begin: flip_flop
            if (rst == `RESET_ACTIVE_VALUE)
            begin
                flit_out <= 0;
                for (loop = 0; loop < 5; loop = loop + 1)
                    flit[loop] <= 0;
            end
            else
            begin
                if (enable_0 == 1'b1)
                    flit_out <= mux_out;
                if (enable_all == 1'b1)
                begin
                    flit[0] <= FLIT_in;
                    for (loop = 1; loop < 5; loop = loop + 1)
                        flit[loop] <= flit[loop - 1];
                end
            end
    end

endmodule
