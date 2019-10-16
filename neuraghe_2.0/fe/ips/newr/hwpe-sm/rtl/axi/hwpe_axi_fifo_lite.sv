/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Gianfranco Deriu - gian.deriu@gmail.com                    *
 *                 Igor Loi - igor.loi@unibo.it                               *
 *                 Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           hwpe_axi_fifo.sv                                           *
 * Description:    Generic FIFO                                               *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"
`include "hwpe_axi_params.sv"

module hwpe_axi_fifo_lite #(
  parameter DATA_WIDTH = 32,
  parameter DATA_DEPTH = 8,
  parameter LATCH_FIFO = 0
)
(
  input  logic      clk,
  input  logic      rst_n,
  //PUSH SIDE
  input  logic [DATA_WIDTH-1:0] data_in,
  input  logic                  valid_in,
  output logic                  grant_out,
  //POP SIDE
  output logic [DATA_WIDTH-1:0] data_out,
  output logic                  valid_out,
  input  logic                  grant_in
);


  enum logic [1:0] { EMPTY, MIDDLE, FULL } cs, ns;
  // Internal Signals

  logic                        grant_in_delay;
  logic [1:0] [DATA_WIDTH-1:0] fifo_register;
  logic out_pointer;

  // UPDATE THE STATE
  always_ff @(posedge clk)
  begin
    if(rst_n == 1'b0) begin
      cs              <= EMPTY;
      grant_in_delay  <= 1'b0;
    end
    else begin
      cs              <= ns;
      grant_in_delay  <= grant_in;
    end
  end

  // Compute Next State
  always_comb
  begin
    case(cs)
      EMPTY: begin
        grant_out = 1'b1;
        valid_out = 1'b0;       
        out_pointer=1'b0;
        case(valid_in)
          1'b0 : begin
            ns      = EMPTY;
          end
          1'b1 : begin
            ns      = MIDDLE;
          end
        endcase
      end
      MIDDLE : begin
        //grant_out = grant_in;
        valid_out = 1'b1;        
        out_pointer=1'b0;
        case({grant_in,valid_in})
          2'b00 : begin
            ns      = MIDDLE;
            grant_out = 1'b1;
          end
          2'b01 : begin
            ns      = FULL;
            grant_out = 1'b0;
          end
          2'b10 : begin
            ns      = EMPTY;
            grant_out = 1'b1;
          end
          2'b11 : begin
            ns      = MIDDLE;
            grant_out = 1'b1;
          end
        endcase
      end
      FULL : begin
        //grant_out = grant_in;
        valid_out = 1'b1;
        out_pointer=1'b1;
        case(grant_in)
          1'b0 : begin
            ns      = FULL;
            grant_out = 1'b0;
          end
          1'b1 : begin
            ns      = MIDDLE;
            grant_out = 1'b1;
          end
        endcase
      end
      default : begin
        grant_out = 1'b0;
        valid_out = 1'b0;       
        out_pointer=1'b0;
        ns = EMPTY;
      end
    endcase
  end

 // logic [DATA_WIDTH-1:0] data_out_int;
 // logic [DATA_WIDTH-1:0] data_out_reg;
    

  always_ff @(posedge clk)
  begin
    if(rst_n == 1'b0) begin
      fifo_register <= {2*DATA_WIDTH {1'b0}};
    end
    else begin
      if((grant_out == 1'b1) && (valid_in == 1'b1)) begin
        fifo_register[0] <= data_in;
      
      end
      if (valid_in == 1'b1)
        fifo_register[1] <= fifo_register[0];
        
    end
  end

  assign data_out = fifo_register[out_pointer];


endmodule

