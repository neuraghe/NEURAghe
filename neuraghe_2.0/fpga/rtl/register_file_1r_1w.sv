/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        PULPv3 FPGA emulator                                       *
 * File:           register_file_1r_1w.sv                                     *
 * Description:    Single Port SCM-equivalent register file.                  *
 *                                                                            *
 ******************************************************************************/

module register_file_1r_1w
#(
    parameter ADDR_WIDTH    = 5,
    parameter DATA_WIDTH    = 64
)
(  
    input   logic                                     clk,
    input   logic                                     rst_n,

    input   logic                                     ReadEnable,
    input   logic [ADDR_WIDTH-1:0]                    ReadAddr,
    output  logic [DATA_WIDTH-1:0]                    ReadData,

    input   logic [ADDR_WIDTH-1:0]                    WriteAddr, 
    input   logic                                     WriteEnable,
    input   logic [DATA_WIDTH-1:0]                    WriteData
);

  localparam N_SCM_REGISTERS = 2**ADDR_WIDTH;

  // signals
  logic [N_SCM_REGISTERS-1:0][DATA_WIDTH-1:0] MemContent_int;     // register
  logic [DATA_WIDTH-1:0]                      ReadData_reg;

  // Read Port
  always_ff @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      ReadData_reg <= '0;
    else if(ReadEnable == 1'b1)
      ReadData_reg <= MemContent_int[ReadAddr];
  end

  always_comb
  begin : register_read_port_behavioral
    ReadData <= ReadData_reg;
  end

  // Write Port
  always_ff @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0) begin
      MemContent_int <= '0;
    end
    else if(WriteEnable == 1'b1) begin
      MemContent_int[WriteAddr] <= WriteData;
    end
  end

endmodule
