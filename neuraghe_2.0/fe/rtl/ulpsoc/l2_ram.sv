////////////////////////////////////////////////////////////////////////////////
// Company:        Multitherman Laboratory @ DEIS - University of Bologna     //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Davide Rossi - davide.rossi@unibo.it                       //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    13/02/2013                                                 //
// Design Name:    ULPSoC                                                     //
// Module Name:    extinstrbus_wrap                                           //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    cluster instruction bus wrapper                            //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

// uncomment the following lines if you want to use gereric L2_ram to simulate the FPGA design.
// Remember to modify the test compilation scripts (in sw/utils) and the preloading instruction in tb_top.sv
// to adapt the slm files to the used L2_ram

//`include "ulpsoc_defines.sv"

// define USE_ST_RAM in the verilong compiling scritps to instance ST memories for simulation.

`ifdef PULP_HSA_SIM
   `define USE_GENERIC_RAM
`endif

module l2_ram
  #(
    parameter                   MEM_ADDR_WIDTH = 1,
    parameter                   RM_SIZE        = 4,
    parameter                   WM_SIZE        = 4
    )
   (
    input logic                 clk_i,
    input logic                 rst_ni,
    input logic                 init_ni,

    UNICAD_MEM_BUS_64.Slave     mem_slave,

    input logic                 test_mode_i,

    input logic [RM_SIZE-1:0]   rm_l2_mem_i,
    input logic [WM_SIZE-1:0]   wm_l2_mem_i,
    input logic                 LS_l2_mem_i,
    input logic                 HS_l2_mem_i,
    input logic                 sleep_l2_mem_i
    );
   
`ifdef USE_GENERIC_RAM
   
   l2_generic 
    #(
        .MEM_ADDR_WIDTH(MEM_ADDR_WIDTH)
     )
     
     l2_mem_i
     (
      .CLK   (clk_i),
      .RSTN  (rst_ni),
      .INITN (init_ni),
      .D     (mem_slave.wdata),
      .A     (mem_slave.add[MEM_ADDR_WIDTH-1:0]),
      .CEN   (mem_slave.csn),
      .WEN   (mem_slave.wen),
      .BE    (mem_slave.ben),
      .Q     (mem_slave.rdata),
      .WM    (wm_l2_mem),
      .RM    (rm_l2_mem),
      .TM    (test_mode_i)
      );
  
`else 
 `ifdef USE_ST_RAM
 
      st_l2_mem_8192x64 
     #(
       .RM_SIZE (RM_SIZE),
       .WM_SIZE (WM_SIZE)
       )
   l2_mem_i
     (
      .CLK   (clk_i               ),
      .RSTN  (rst_ni              ),
      .INITN (init_ni             ),
      .D     (mem_slave.wdata     ),
      .A     (mem_slave.add[12:0] ),
      .CEN   (mem_slave.csn       ),
      .WEN   (mem_slave.wen       ),
      .BE    (mem_slave.ben       ),
      .Q     (mem_slave.rdata     ),
      .WM    (wm_l2_mem_i         ),
      .RM    (rm_l2_mem_i         ),
      .TM    (test_mode_i         ),
      .LS    (LS_l2_mem_i         ),
      .HS    (HS_l2_mem_i         ),
      .STDBY (sleep_l2_mem_i     )
      );
 
 
 `else // XILINX RAM
 
   
   logic                        rsta;
   logic                        ena;
   logic [7:0]                  wea;
   genvar                       j;

   assign rsta = ~rst_ni;
   assign ena  = ~mem_slave.csn;

   generate
      for(j=0; j<8; j++)
        assign wea[j] = ~mem_slave.csn & ~mem_slave.wen & mem_slave.ben[j];
   endgenerate

   xilinx_l2_mem_32768x64 l2_mem_i 
     (
      .clka  (clk_i),
      .rsta  (rsta),
      .ena   (ena),
      .wea   (wea),
      .addra (mem_slave.add[MEM_ADDR_WIDTH-1:0]),
      .dina  (mem_slave.wdata),
      .douta (mem_slave.rdata)
      );
   
 `endif

`endif

endmodule
