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
//`define ICACHE // it need a fix

module l2_ram_dp
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
    
    
    `ifdef ICACHE
     UNICAD_MEM_BUS_64.Slave     mem_slave_b,
    `else
     input logic  instr_req,
     input logic [31:0]  instr_addr,
     output logic instr_gnt,
     output logic instr_r_valid,
     output logic[31:0] instr_r_rdata,
    `endif
    

    input logic                 test_mode_i,

    input logic [RM_SIZE-1:0]   rm_l2_mem_i,
    input logic [WM_SIZE-1:0]   wm_l2_mem_i,
    input logic                 LS_l2_mem_i,
    input logic                 HS_l2_mem_i,
    input logic                 sleep_l2_mem_i
    );
   

   
   logic                        rsta;
   logic                        ena;
   logic [7:0]                  wea;
   
   logic                        rstb;
   logic                        enb;
   logic [7:0]                  web;
   genvar                       j;

   assign rsta = ~rst_ni;
   assign ena  = ~mem_slave.csn;
   
   assign rstb = ~rst_ni;
   `ifdef ICACHE
   assign enb  = ~mem_slave_b.csn;
  `endif
   generate
      for(j=0; j<8; j++) begin
        assign wea[j] = ~mem_slave.csn & ~mem_slave.wen & mem_slave.ben[j];
        `ifdef ICACHE
        assign web[j] = ~mem_slave_b.csn & ~mem_slave_b.wen & mem_slave_b.ben[j];
        `endif
      end
   endgenerate

`ifndef ICACHE
 assign instr_gnt=instr_req;
 
   always_ff @(posedge clk_i) 
   begin
      if (rst_ni==1'b0)begin
        instr_r_valid<=0;
      end
      else begin
        instr_r_valid<=instr_req;
      end      
   end
 
`endif



   generate
     if (MEM_ADDR_WIDTH==18)
     begin
    /* `ifdef ICACHE
       xilinx_l2_mem_262144x64_dp
     `else*/
       xilinx_l2_mem_262144x64_dp2
     //`endif
         l2_mem_i  
         (
         .clka     ( clk_i                               ),
         .rsta     ( rsta                                ),
         .ena      ( ena                                 ),
         .wea      ( wea                                 ),
         .addra    ( mem_slave.add[MEM_ADDR_WIDTH-1:0]   ),
         .dina     ( mem_slave.wdata                     ),
         .douta    ( mem_slave.rdata                     ),
         .clkb     ( clk_i                               ),
         .rstb     ( rstb                                ),
         `ifdef ICACHE
         .enb      ( enb                                 ),
         .web      ( web                                 ),
         .addrb    ( mem_slave_b.add[MEM_ADDR_WIDTH-1:0] ),
         .dinb     ( mem_slave_b.wdata                   ),
         .doutb    ( mem_slave_b.rdata                   )
         `else
         .enb      ( instr_req                           ),
         .web      ( '0                                   ),
         .addrb    ( instr_addr [MEM_ADDR_WIDTH+2:2]     ),
         .dinb     ( '0                                   ),
         .doutb    ( instr_r_rdata                       )     
         `endif
       );
     end
     else if (MEM_ADDR_WIDTH==17)
     begin
     /*`ifdef ICACHE
       xilinx_l2_mem_131072x64_dp
     `else*/
       xilinx_l2_mem_131072x64_dp2
     //`endif
         l2_mem_i  
         (
         .clka     ( clk_i                               ),
         .rsta     ( rsta                                ),
         .ena      ( ena                                 ),
         .wea      ( wea                                 ),
         .addra    ( mem_slave.add[MEM_ADDR_WIDTH-1:0]   ),
         .dina     ( mem_slave.wdata                     ),
         .douta    ( mem_slave.rdata                     ),
         .clkb     ( clk_i                               ),
         .rstb     ( rstb                                ),
         `ifdef ICACHE
         .enb      ( enb                                 ),
         .web      ( web                                 ),
         .addrb    ( mem_slave_b.add[MEM_ADDR_WIDTH-1:0] ),
         .dinb     ( mem_slave_b.wdata                   ),
         .doutb    ( mem_slave_b.rdata                   )
         `else
         .enb      ( instr_req                           ),
         .web      ( 0                                   ),
         .addrb    ( instr_addr  [MEM_ADDR_WIDTH+2:2]                        ),
         .dinb     ( 0                                   ),
         .doutb    ( instr_r_rdata                       )     
         `endif
       );
     end
     else if (MEM_ADDR_WIDTH==15)
     begin
     /*`ifdef ICACHE
       xilinx_l2_mem_32768x64_dp
     `else*/
       xilinx_l2_mem_32768x64_dp2
     //`endif       
         l2_mem_i  
         (
         .clka     ( clk_i                               ),
         .rsta     ( rsta                                ),
         .ena      ( ena                                 ),
         .wea      ( wea                                 ),
         .addra    ( mem_slave.add[MEM_ADDR_WIDTH-1:0]   ),
         .dina     ( mem_slave.wdata                     ),
         .douta    ( mem_slave.rdata                     ),
         .clkb     ( clk_i                               ),
         .rstb     ( rstb                                ),
         `ifdef ICACHE
         .enb      ( enb                                 ),
         .web      ( web                                 ),
         .addrb    ( mem_slave_b.add[MEM_ADDR_WIDTH-1:0] ),
         .dinb     ( mem_slave_b.wdata                   ),
         .doutb    ( mem_slave_b.rdata                   )
         `else
         .enb      ( instr_req                           ),
         .web      ( 0                                   ),
         .addrb    ( instr_addr[MEM_ADDR_WIDTH+2:2]      ),
         .dinb     ( 0                                   ),
         .doutb    ( instr_r_rdata                       )     
         `endif
       );
     end    
     else if (MEM_ADDR_WIDTH==13)
     begin
     /*`ifdef ICACHE
       xilinx_l2_mem_32768x64_dp
     `else*/
       xilinx_l2_mem_8192x64_dp2
     //`endif       
         l2_mem_i  
         (
         .clka     ( clk_i                               ),
         .rsta     ( rsta                                ),
         .ena      ( ena                                 ),
         .wea      ( wea                                 ),
         .addra    ( mem_slave.add[MEM_ADDR_WIDTH-1:0]   ),
         .dina     ( mem_slave.wdata                     ),
         .douta    ( mem_slave.rdata                     ),
         .clkb     ( clk_i                               ),
         .rstb     ( rstb                                ),
         `ifdef ICACHE
         .enb      ( enb                                 ),
         .web      ( web                                 ),
         .addrb    ( mem_slave_b.add[MEM_ADDR_WIDTH-1:0] ),
         .dinb     ( mem_slave_b.wdata                   ),
         .doutb    ( mem_slave_b.rdata                   )
         `else
         .enb      ( instr_req                           ),
         .web      ( 0                                   ),
         .addrb    ( instr_addr[MEM_ADDR_WIDTH+2:2]      ),
         .dinb     ( 0                                   ),
         .doutb    ( instr_r_rdata                       )     
         `endif
       );
     end
     else if (MEM_ADDR_WIDTH==12)
     begin
     /*`ifdef ICACHE
       xilinx_l2_mem_32768x64_dp
     `else*/
       xilinx_l2_mem_4096x64_dp2
     //`endif       
         l2_mem_i  
         (
         .clka     ( clk_i                               ),
         .rsta     ( rsta                                ),
         .ena      ( ena                                 ),
         .wea      ( wea                                 ),
         .addra    ( mem_slave.add[MEM_ADDR_WIDTH-1:0]   ),
         .dina     ( mem_slave.wdata                     ),
         .douta    ( mem_slave.rdata                     ),
         .clkb     ( clk_i                               ),
         .rstb     ( rstb                                ),
         `ifdef ICACHE
         .enb      ( enb                                 ),
         .web      ( web                                 ),
         .addrb    ( mem_slave_b.add[MEM_ADDR_WIDTH-1:0] ),
         .dinb     ( mem_slave_b.wdata                   ),
         .doutb    ( mem_slave_b.rdata                   )
         `else
         .enb      ( instr_req                           ),
         .web      ( 0                                   ),
         .addrb    ( instr_addr[MEM_ADDR_WIDTH+2:2]      ),
         .dinb     ( 0                                   ),
         .doutb    ( instr_r_rdata                       )     
         `endif
       );
     end     
   endgenerate

 

endmodule
