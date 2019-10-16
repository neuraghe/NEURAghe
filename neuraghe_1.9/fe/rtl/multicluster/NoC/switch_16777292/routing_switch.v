`include "noc_parameters.v"

module routing_switch(clk, rst `ifdef SWITCH_ROUTING_DESTID , which_switch `elsif SWITCH_ROUTING_DESTCOORD , which_switch `endif , which_port, FLIT_in, VALID_in `ifdef SWITCH_ROUTING_DESTCOORD , LOCAL, NORTH, EAST, SOUTH, WEST `ifdef DESTCOORD_Z_WIDTH , UP, DOWN `endif `endif , lut_out);

    parameter FLIT_WIDTH = 32;
    parameter LOG_SWITCH_INPUTS = 3;
    parameter LOG_SWITCH_OUTPUTS = 3;

    input  clk;
    input  rst;
`ifdef SWITCH_ROUTING_DESTID
    input  [5 : 0] which_switch; //TODO no fixed width
`elsif SWITCH_ROUTING_DESTCOORD
  `ifdef DESTCOORD_Z_WIDTH
    input  [`DESTCOORD_X_WIDTH + `DESTCOORD_Y_WIDTH + `DESTCOORD_Z_WIDTH - 1 : 0] which_switch;
  `else
    input  [`DESTCOORD_X_WIDTH + `DESTCOORD_Y_WIDTH - 1 : 0] which_switch;
  `endif
`endif
    input  [LOG_SWITCH_INPUTS - 1 : 0] which_port;
    input  [FLIT_WIDTH - 1 : 0] FLIT_in;
    input  VALID_in;
`ifdef SWITCH_ROUTING_DESTCOORD
    input  [LOG_SWITCH_OUTPUTS - 1 : 0] LOCAL;
    input  [LOG_SWITCH_OUTPUTS - 1 : 0] NORTH;
    input  [LOG_SWITCH_OUTPUTS - 1 : 0] EAST;
    input  [LOG_SWITCH_OUTPUTS - 1 : 0] SOUTH;
    input  [LOG_SWITCH_OUTPUTS - 1 : 0] WEST;
  `ifdef DESTCOORD_Z_WIDTH
    input  [LOG_SWITCH_OUTPUTS - 1 : 0] UP;
    input  [LOG_SWITCH_OUTPUTS - 1 : 0] DOWN;
  `endif
`endif
    output [LOG_SWITCH_OUTPUTS - 1 : 0] lut_out;
    reg    [LOG_SWITCH_OUTPUTS - 1 : 0] lut_out;

`ifdef SWITCH_ROUTING_DESTCOORD
    integer x_dest;
    integer x_coordinate;
    integer y_dest;
    integer y_coordinate;
  `ifdef DESTCOORD_Z_WIDTH
    integer z_dest;
    integer z_coordinate;
  `endif
`endif

`ifdef SWITCH_ROUTING_DESTID

    always @(FLIT_in or VALID_in)
        begin: compute_route
            if (FLIT_in[`FTYPEWD - 1 : 0] == `ENC_HEAD)
                case (FLIT_in[`FTYPEWD + `ROUTEWD - 1 : `FTYPEWD]) //synopsys parallel_case
                  'h2:
                    lut_out <= 'h3; //TODO fill up
                  'h6:
                    lut_out <= 'h2;
                  'h7:
                    lut_out <= 'h1;
                  default:
                    lut_out <= 0;
                endcase
        end

`elsif SWITCH_ROUTING_DESTCOORD

    always @(FLIT_in or VALID_in)
        begin: compute_route
            if (FLIT_in[`FTYPEWD - 1 : 0] == `ENC_HEAD)
            begin
              // Numbering scheme: local = 0, N = 1, E = 2, S = 3, W = 4 (2D)
              // Numbering scheme: local = 0, N = 1, E = 2, S = 3, W = 4, U = 5, D = 6 (3D)
              // On meshes, on edge switches, local = 0 and other ports are counted clockwise starting from N, then up, then down
              // (0, 0) coordinate is in the top left corner of the mesh (2D)
              // (0, 0, 0) coordinate is in the top left upper corner of the mesh (3D)

              x_dest = FLIT_in[`FTYPEWD + `DESTCOORD_Y_WIDTH + `DESTCOORD_X_WIDTH - 1 : `FTYPEWD + `DESTCOORD_Y_WIDTH];
              x_coordinate = which_switch[`DESTCOORD_Y_WIDTH + `DESTCOORD_X_WIDTH - 1 : `DESTCOORD_Y_WIDTH];
              y_dest = FLIT_in[`FTYPEWD + `DESTCOORD_Y_WIDTH - 1 : `FTYPEWD];
              y_coordinate = which_switch[`DESTCOORD_Y_WIDTH - 1 : 0];
  `ifdef DESTCOORD_Z_WIDTH
              z_dest = FLIT_in[`FTYPEWD + `DESTCOORD_Z_WIDTH + `DESTCOORD_X_WIDTH + `DESTCOORD_Y_WIDTH - 1: `FTYPEWD + `DESTCOORD_X_WIDTH + `DESTCOORD_Y_WIDTH];
              z_coordinate = which_switch[`DESTCOORD_Z_WIDTH + `DESTCOORD_X_WIDTH + `DESTCOORD_Y_WIDTH - 1 : `DESTCOORD_X_WIDTH + `DESTCOORD_Y_WIDTH];
  `endif
              //TODO current storage is: MSB --- Z --- X --- Y --- LSB (counterintuitive)

  `ifdef DESTCOORD_Z_WIDTH
              // default routing policy: XYZ
              if      ((x_dest == x_coordinate) && (y_dest == y_coordinate) && (z_dest == z_coordinate))
                lut_out <= LOCAL;
              else if ((x_dest == x_coordinate) && (y_dest == y_coordinate) && (z_dest > z_coordinate))
                lut_out <= DOWN;
              else if ((x_dest == x_coordinate) && (y_dest == y_coordinate) && (z_dest < z_coordinate))
                lut_out <= UP;
              else if ((x_dest == x_coordinate) && (y_dest >  y_coordinate))
                lut_out <= SOUTH;
              else if ((x_dest == x_coordinate) && (y_dest <  y_coordinate))
                lut_out <= NORTH;
              else if ((x_dest >  x_coordinate))
                lut_out <= EAST;
              else // if ((x_dest <  x_coordinate))
                lut_out <= WEST;
  `else
              // default routing policy: XY
              if      ((x_dest == x_coordinate) && (y_dest == y_coordinate))
                lut_out <= LOCAL;
              else if ((x_dest == x_coordinate) && (y_dest >  y_coordinate))
                lut_out <= SOUTH;
              else if ((x_dest == x_coordinate) && (y_dest <  y_coordinate))
                lut_out <= NORTH;
              else if ((x_dest >  x_coordinate))
                lut_out <= EAST;
              else // if ((x_dest <  x_coordinate))
                lut_out <= WEST;
  `endif
            end
        end

`endif

endmodule
