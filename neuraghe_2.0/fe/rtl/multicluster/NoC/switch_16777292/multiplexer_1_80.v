///////////////////////////////////////////////////////////////////////////////
// Copyright 2009 iNoCs                                                      //
//                                                                           //
// name         /home/chester/Desktop/prj/XPIPES_fresh/inocs/flow/rtl/verilog/switch_16777292/multiplexer_1_80.v                                     //
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

module multiplexer_1_80(FLIT_in_s_0, mux_sel, mux);

  input  [79 : 0] FLIT_in_s_0;
  input  [0 : 0] mux_sel;
  output [79 : 0] mux;
  reg    [79 : 0] mux;

  always@(mux_sel or FLIT_in_s_0)
    begin
      case(mux_sel)
       1:
                begin
                  mux <= FLIT_in_s_0;
                end
       default:
                begin
                  mux <= 0;
                end
    endcase
  end

endmodule
