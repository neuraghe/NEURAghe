`include "noc_parameters.v"

module shifter(mux, shift, shift_ctl);

  parameter L_SW_OUT   = 2;
  parameter FLIT_WIDTH = 32;

  input  [FLIT_WIDTH - 1 : 0] mux;
  input  shift_ctl;
  output [FLIT_WIDTH - 1 : 0] shift;
  reg    [FLIT_WIDTH - 1 : 0] shift;

  integer loop;

  always@(mux or shift_ctl)
    begin
`ifdef NI_ROUTING
      if (shift_ctl == 1'b1)
        begin
          shift[`FTYPEWD - 1 : 0] <= mux[`FTYPEWD - 1 : 0]; // flit type
          for (loop = 0; loop < `ROUTEWD - L_SW_OUT; loop = loop + 1) // do this as a loop to avoid errors when `ROUTEWD == L_SW_OUT
            shift[`FTYPEWD + loop] <= mux[`FTYPEWD + L_SW_OUT + loop]; // future path
          shift[FLIT_WIDTH - 1 : `ROUTEWD - L_SW_OUT + `FTYPEWD] <= mux[FLIT_WIDTH - 1 : `ROUTEWD - L_SW_OUT + `FTYPEWD]; // rest of flit
        end
      else
        shift <= mux;
`else
        shift <= mux;
`endif
    end

endmodule

