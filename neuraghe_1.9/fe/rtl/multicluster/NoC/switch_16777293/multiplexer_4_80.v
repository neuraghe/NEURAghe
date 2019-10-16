///////////////////////////////////////////////////////////////////////////////
// Copyright 2009 iNoCs                                                      //
//                                                                           //
// name         /home/chester/Desktop/prj/XPIPES_fresh/inocs/flow/rtl/verilog/switch_16777293/multiplexer_4_80.v                                     //
// author       Federico Angiolini - angiolini@inocs.com                     //
// author       Antonio Pullini - pullini@inocs.com                          //
// info         Switch crossbar.  //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                    Automatically generated - don't edit                   //
//           File generated for topology: noc18_4sw_80bits_run0           //
///////////////////////////////////////////////////////////////////////////////

module multiplexer_4_80(FLIT_in_s_0, FLIT_in_s_1, FLIT_in_s_2, FLIT_in_s_3, mux_sel, mux);

  input  [79 : 0] FLIT_in_s_0;
  input  [79 : 0] FLIT_in_s_1;
  input  [79 : 0] FLIT_in_s_2;
  input  [79 : 0] FLIT_in_s_3;
  input  [3 : 0] mux_sel;
  output [79 : 0] mux;
  reg    [79 : 0] mux;

  always@(mux_sel or FLIT_in_s_0 or FLIT_in_s_1 or FLIT_in_s_2 or FLIT_in_s_3)
    begin
      case(mux_sel)
       1:
                begin
                  mux <= FLIT_in_s_0;
                end
       2:
                begin
                  mux <= FLIT_in_s_1;
                end
       4:
                begin
                  mux <= FLIT_in_s_2;
                end
       8:
                begin
                  mux <= FLIT_in_s_3;
                end
       default:
                begin
                  mux <= 0;
                end
    endcase
  end

endmodule
