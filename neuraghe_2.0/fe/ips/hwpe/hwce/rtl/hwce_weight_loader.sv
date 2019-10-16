/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 *          EOLAB @ DIEE - Università degli studi di Cagliari                 *
 *                      Via marengo 2 - 09123                                 *
 *                              Cagliari                                      *
 *                                                                            *
 *                                                                            *
 * Engineer:       Francesco Conti  - f.conti@unibo.it                        *
 *                 Gianfranco Deriu - gian.deriu@gmail.com                    *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           weight_loader.sv                                           *
 * Description:    Weight loader for the HWCE                                 *
 *                                                                            *
 ******************************************************************************/

module hwce_weight_loader
#(
  parameter WL_PORTS    = 48, //n_row*n_col 
  parameter CONV_WIDTH  = 16,
  parameter BE_WIDTH    = CONV_WIDTH/8,
  parameter N_ROW       = 4, //4
  parameter N_COL       = 4, //4
  parameter REG_WIDTH   = CONV_WIDTH*N_ROW
)
(
  input  logic                               clk,
  input  logic                               rst_n,
  input  logic                               start_i,
  output logic                               done_o,
  input  logic [32-1:0]                      bl_base_addr_i,
  input  logic                               wei_mem_req,
  input  logic [32-1:0]                      wei_mem_add,
  output logic [WL_PORTS-1:0][CONV_WIDTH-1:0]wei_mem_r_data,
  input  logic [16-1:0]                       bias_pos, 
  output logic [N_ROW-1:0][CONV_WIDTH-1:0]   bias,
  
  WEIGHT_BANK_MEM_BUS_16BIT.Master           w_mem_bus [WL_PORTS - 1:0]
);

  localparam NUM_OF_BIAS      = N_ROW; 
  localparam ADDR_WIDTH       = 1;
  
  logic [32-1:0]              base_addr;
  
  logic [32-1:0]              bias_addr;
  
  logic                       bias_we;
  logic [BE_WIDTH*N_ROW-1:0]  bias_be;
  
  logic [N_ROW-1:0][CONV_WIDTH-1:0]  bias_in;
  logic [N_ROW-1:0][CONV_WIDTH-1:0]  bias_mem;

  assign bias_addr = base_addr + (bias_pos <<< 1);

  // weight address computation - interleaved
  assign base_addr = bl_base_addr_i;
  genvar i,j;
  generate
    for(i=0; i < N_ROW; i++)begin
      assign bias_in[i] = w_mem_bus[i*N_COL].rdata;
     for(j=0; j < N_COL; j++)begin
       always_comb begin
         if(start_i) begin
           w_mem_bus[i*N_COL + j].add  = bias_addr;
           w_mem_bus[i*N_COL + j].req  = (j==0) ? 1'b1 : 1'b0;
	   wei_mem_r_data[i*N_COL + j] = {(CONV_WIDTH){1'bz}};
         end
         else begin
           w_mem_bus[i*N_COL + j].req  = wei_mem_req;
           w_mem_bus[i*N_COL + j].add  = wei_mem_add;
           wei_mem_r_data[i*N_COL + j] = w_mem_bus[i*N_COL + j].rdata;
         end
       end
     end
    end
  endgenerate
  
  // scm
  register_file_1r_1w_all #(
    .ADDR_WIDTH ( ADDR_WIDTH  ),
    .DATA_WIDTH ( REG_WIDTH   )
  ) weights_i (
    .clk        ( clk         ),
    .rst_n      ( rst_n       ),
    .ReadEnable ( 1'b0        ), // tied to 0
    .ReadAddr   ( 1'b0        ),
    .ReadData   (             ), // not used
    .WriteAddr  ( 1'b0        ),
    .WriteEnable( bias_we     ),
    .WriteData  ( bias_in     ),
    .WriteBE    ( bias_be     ),
    .MemContent ( bias_mem    )
  );

  assign bias_we   = (done_o) ? 1'b1 : 1'b0;
  assign bias_be   = {(BE_WIDTH*N_ROW){1'b1}};
  
  always_ff @(posedge clk)begin
    if (rst_n == 1'b0) begin
      done_o <= 1'b0;
    end
    else begin
      if(start_i)
        done_o <= 1'b1;
      else
        done_o <= 1'b0;
    end
  end

  // biases are stored in the last slot of each set of weights.
  genvar b;
  generate
    for (b=0;b<N_ROW;b++)
      assign bias [b] = bias_mem[b];
  endgenerate


endmodule
