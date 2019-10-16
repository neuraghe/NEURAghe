/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Igor Loi - igor.loi@unibo.it                               *
 *                 Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           hwpe_axi_fifo_earlystall.sv                                *
 * Description:    Generic FIFO with early stalling                           *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"
`include "hwpe_axi_params.sv"

module hwpe_axi_fifo_earlystall #(
  parameter DATA_WIDTH = 32,
  parameter DATA_DEPTH = 8,
  parameter LATCH_FIFO = 0
)
(
  input  logic clk,
  input  logic rst_n,
  //PUSH SIDE
  input  logic [DATA_WIDTH-1:0] data_in,
  input  logic                  valid_in,
  output logic                  grant_out,
  //POP SIDE
  output logic [DATA_WIDTH-1:0] data_out,
  output logic                  valid_out,
  input  logic                  grant_in
);

  // Local Parameter
  localparam        ADDR_DEPTH = (DATA_DEPTH>1)?$clog2(DATA_DEPTH):1;

  enum logic [1:0] { EMPTY, FULL, MIDDLE } cs, ns;

  // Internal Signals
  logic [ADDR_DEPTH-1:0] Pop_Pointer_CS,  Pop_Pointer_NS;
  logic [ADDR_DEPTH-1:0] Push_Pointer_CS, Push_Pointer_NS;
  logic [DATA_WIDTH-1:0] fifo_registers[DATA_DEPTH-1:0];
  integer       i;

  // UPDATE THE STATE
  always_ff @(posedge clk, negedge rst_n)
  begin
    if(rst_n == 1'b0) begin
      cs              <= EMPTY;
      Pop_Pointer_CS  <= {ADDR_DEPTH {1'b0}};
      Push_Pointer_CS <= {ADDR_DEPTH {1'b0}};
    end
    else begin
      cs              <= ns;
      Pop_Pointer_CS  <= Pop_Pointer_NS;
      Push_Pointer_CS <= Push_Pointer_NS;
    end
  end

  // Compute Next State
  always_comb
  begin
    case(cs)
      EMPTY: begin
        grant_out = 1'b1;
        valid_out = 1'b0;
        case(valid_in)
          1'b0 : begin
            ns      = EMPTY;
            Push_Pointer_NS = Push_Pointer_CS;
            Pop_Pointer_NS  = Pop_Pointer_CS;
          end
          1'b1: begin
            ns      = MIDDLE;
            Push_Pointer_NS = Push_Pointer_CS + 1'b1;
            Pop_Pointer_NS  = Pop_Pointer_CS;
          end
        endcase
      end
      
      MIDDLE: begin
        if(Push_Pointer_CS > Pop_Pointer_CS) begin
          if(Push_Pointer_CS - Pop_Pointer_CS  < DATA_DEPTH-2)
            grant_out = 1'b1;
          else
            grant_out = grant_in;
        end
        else begin
          if(Pop_Pointer_CS - Push_Pointer_CS   > 1)
            grant_out = 1'b1;
          else
            grant_out = grant_in;
        end
        valid_out = 1'b1;
        case({valid_in,grant_in})
          2'b01: begin
            if((Pop_Pointer_CS == Push_Pointer_CS -1 ) || ((Pop_Pointer_CS == DATA_DEPTH-1) && (Push_Pointer_CS == 0) ))
              ns      = EMPTY;
            else
              ns      = MIDDLE;
            Push_Pointer_NS = Push_Pointer_CS;
            if(Pop_Pointer_CS == DATA_DEPTH-1)
              Pop_Pointer_NS  = 0;
            else
              Pop_Pointer_NS  = Pop_Pointer_CS + 1'b1;
          end
          2'b00 : begin
              ns      = MIDDLE;
              Push_Pointer_NS = Push_Pointer_CS;
              Pop_Pointer_NS  = Pop_Pointer_CS;
          end
          2'b11: begin
              ns      = MIDDLE;
              if(Push_Pointer_CS == DATA_DEPTH-1)
                Push_Pointer_NS = 0;
              else
                Push_Pointer_NS = Push_Pointer_CS + 1'b1;
              if(Pop_Pointer_CS == DATA_DEPTH-1)
                Pop_Pointer_NS  = 0;
              else
                Pop_Pointer_NS  = Pop_Pointer_CS  + 1'b1;
          end
          2'b10: begin
            if(( Push_Pointer_CS == Pop_Pointer_CS - 1) || ( (Push_Pointer_CS == DATA_DEPTH-1) && (Pop_Pointer_CS == 0) ))
              ns      = FULL;
            else
              ns    = MIDDLE;
            if(Push_Pointer_CS == DATA_DEPTH - 1)
              Push_Pointer_NS = 0;
            else
              Push_Pointer_NS = Push_Pointer_CS + 1'b1;
            Pop_Pointer_NS  = Pop_Pointer_CS;
          end
        endcase
      end
      
      FULL: begin
        grant_out = 1'b0;
        valid_out = 1'b1;
        case(grant_in)
          1'b1: begin
            grant_out = 1'b1;
            ns      = MIDDLE;
            Push_Pointer_NS = Push_Pointer_CS;
            if(Pop_Pointer_CS == DATA_DEPTH-1)
              Pop_Pointer_NS  = 0;
            else
              Pop_Pointer_NS  = Pop_Pointer_CS  + 1'b1;
          end
          1'b0: begin
            ns      = FULL;
            Push_Pointer_NS = Push_Pointer_CS;
            Pop_Pointer_NS  = Pop_Pointer_CS;
          end
        endcase
      end
      default : begin
        grant_out = 1'b0;
        valid_out = 1'b0;
        ns = EMPTY;
        Pop_Pointer_NS = 0;
        Push_Pointer_NS = 0;
      end
    endcase
  end

  logic [DATA_WIDTH-1:0] data_out_int;
  logic [DATA_WIDTH-1:0] data_out_reg;

  assign data_out_int = fifo_registers[Pop_Pointer_CS];

  generate
    if(LATCH_FIFO == 0) begin : fifo_ff_gen

      always_ff @(posedge clk, negedge rst_n)
      begin
        if(rst_n == 1'b0) begin
          for (i=0; i< DATA_DEPTH; i++)
            fifo_registers[i] <= {DATA_WIDTH {1'b0}};
        end
        else begin
          if(valid_in == 1'b1)
            fifo_registers[Push_Pointer_CS] <= data_in;
        end
      end

      assign data_out = data_out_int;

    end
    else begin : fifo_latch_gen

      register_file_1r_1w #(
        .ADDR_WIDTH(ADDR_DEPTH),
        .DATA_WIDTH(DATA_WIDTH)
      ) fifo_latch_i (
        .clk,
        .ReadEnable  (1'b1           ),
        .ReadAddr    (Pop_Pointer_NS ),
        .ReadData    (data_out       ),
        .WriteEnable (valid_in       ),
        .WriteAddr   (Push_Pointer_CS),
        .WriteData   (data_in        )
      );

      // always_latch
      // begin
      //   if (clk == 1'b1) begin
      //     if(valid_in == 1'b1)
      //       fifo_registers[Push_Pointer_CS] <= data_in;
      //   end
      // end

      // always_ff @(posedge clk or negedge rst_n)
      // begin
      //   if(rst_n == 1'b0)
      //     data_out_reg <= {DATA_WIDTH {1'b0}};
      //   else if(grant_out==1'b1)
      //     data_out_reg <= data_out_int;
      // end

      // assign data_out = (grant_out == 1'b1) ? data_out_int : data_out_reg;

    end
  endgenerate

endmodule
