/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       MR - rusci@fbk.eu                                          *
 * Additional contributions: f.conti@unibo.it                                 *
 *                                                                            *
 * Project:        PULPv3 FPGA emulator                                       *
 * File:           register_file_1r_1w_all.sv                                 *
 * Description:    Single Port Register file.                                 *
 *                                                                            *
 ******************************************************************************/

module register_file_1r_1w_all
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
    input   logic [DATA_WIDTH-1:0]                    WriteData,
    input   logic [DATA_WIDTH/8-1:0]                  WriteBE,
    output  logic [2**ADDR_WIDTH-1:0][DATA_WIDTH-1:0] MemContent
);

  localparam N_SCM_REGISTERS = 2**ADDR_WIDTH;

  // signals
  logic [N_SCM_REGISTERS-1:0][DATA_WIDTH-1:0] MemContent_int;     //register
  logic                      [DATA_WIDTH-1:0] WriteData_int;

  assign MemContent = MemContent_int;

  // Read Port
  always_comb
  begin : register_read_port_behavioral
    ReadData <= MemContent_int[ReadAddr];
  end

  // Write Port
  genvar i;
  generate
    for(i=0; i<DATA_WIDTH/8; i++)
    begin : be_proc

      always_comb
      begin : writa_data_be_reg
        if(WriteBE[i]==1'b1) begin
          WriteData_int[i*8+7:i*8] = WriteData[i*8+7:i*8];
        end
        else begin
          WriteData_int[i*8+7:i*8] = MemContent_int[WriteAddr][i*8+7:i*8];
        end
      end

    end
  endgenerate

  always_ff @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0) begin
      MemContent_int <= '0;
    end
    else if(WriteEnable == 1'b1) begin
      MemContent_int[WriteAddr] <= WriteData_int;
    end
  end

endmodule
