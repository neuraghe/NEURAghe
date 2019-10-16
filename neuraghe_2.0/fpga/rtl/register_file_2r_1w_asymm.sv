/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        PULPv3 FPGA emulator                                       *
 * File:           register_file_2r_1w_asymm.sv                               *
 * Description:    Dual-port behavioral register file                         *
 *                                                                            *
 ******************************************************************************/

module register_file_2r_1w_asymm
#(
    parameter ADDR_WIDTH    = 5,
    parameter DATA_WIDTH    = 32,
    parameter NUM_BYTE      = DATA_WIDTH/8,
    parameter ASYMM_FACTOR  = 3
)
(  
    // Clock and Reset
    input  logic         clk,
    input  logic         rst_n,

    // Read port a
    input  logic                                  ReadEnable_a,
    input  logic [ADDR_WIDTH-1:0]                 ReadAddr_a,
    output logic [DATA_WIDTH-1:0]                 ReadData_a,

    // Read port b (asymmetrical)
    input  logic                                  ReadEnable_b,
    input  logic [ADDR_WIDTH-1:0]                 ReadAddr_b,
    output logic [ASYMM_FACTOR*DATA_WIDTH-1:0]    ReadData_b,

    // Write port
    input  logic                                  WriteEnable,
    input  logic [ADDR_WIDTH-1:0]                 WriteAddr,
    input  logic [NUM_BYTE-1:0][7:0]              WriteData,
    input  logic [NUM_BYTE-1:0]                   WriteBE
);

  localparam    NUM_WORDS = 2**ADDR_WIDTH;
 
  logic [NUM_WORDS-1:0][DATA_WIDTH-1:0]              rf_reg;
  logic [NUM_WORDS-1:0][ASYMM_FACTOR*DATA_WIDTH-1:0] rf_reg_as;
  logic [NUM_WORDS-1:0]                              we_dec;
  logic [ADDR_WIDTH-1:0]                             ReadAddr_b_reg;

  always_comb
  begin : we_decoder
    for (int i=0; i<NUM_WORDS; i++) begin
      if (WriteAddr == i)
        we_dec[i] <= WriteEnable;
      else
        we_dec[i] <= 1'b0;
    end
  end

  genvar i;
  generate
    for (i=0; i<NUM_WORDS; i++)
    begin : rf_gen

      always_ff @(posedge clk or negedge rst_n)
      begin : register_write_behavioral
        if (rst_n==1'b0) begin
          rf_reg[i] <= 'b0;
        end
        else begin
          if(we_dec[i] == 1'b1)
            rf_reg[i] <= WriteData;
          else
            rf_reg[i] <= rf_reg[i];
        end
      end

    end
  endgenerate

  always_ff @(posedge clk or negedge rst_n)
  begin : register_read_a_behavioral
    if(rst_n==1'b0)
      ReadData_a <= {DATA_WIDTH{1'b0}};
    else if(ReadEnable_a)
      ReadData_a <= rf_reg[ReadAddr_a];
  end

  always_ff @(posedge clk or negedge rst_n)
  begin : register_addr_b_behavioral
    if(rst_n==1'b0)
      ReadAddr_b_reg <= {ASYMM_FACTOR*DATA_WIDTH{1'b0}};
    else if(ReadEnable_b)
      ReadAddr_b_reg <= ReadAddr_b;
  end
  assign ReadData_b = rf_reg_as[ReadAddr_b_reg];

  /* Asymmetric port - just wiring here */
  genvar x;
  generate
    for(x=0; x<2**ADDR_WIDTH; x++) 
    begin : asymm_circular_rewiring_gen
      localparam x_low  = x                  % (2**ADDR_WIDTH);
      localparam x_high = (x+ASYMM_FACTOR-1) % (2**ADDR_WIDTH);

      if(x_high > x_low)
        assign rf_reg_as[x_low] = rf_reg[x_high:x_low];
      else
        assign rf_reg_as[x_low] = {rf_reg[x_high:0], rf_reg[{ADDR_WIDTH{1'b1}}:x_low]};
    end
  endgenerate
  /* End asymettric port */
 
endmodule
