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
// Design Name:    memwrap32_028                                              // 
// Module Names:   - st_ic_ram_2048x32                                        //
//                 - st_ic_tag_512x20                                         //
//                 - st_tcdm_bank_2048x32                                     //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Wrappers for ULPSoC memories                               //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "ulpsoc_defines.sv"

//********************************************************
//************* L2 RAM MEMORY WRAPPER ********************
//********************************************************

module l2_generic
  #(
  parameter MEM_ADDR_WIDTH = 15
  )
  (
   input logic 	       CLK,
   input logic 	       RSTN,
   input logic 	       INITN,
   
   input logic 	       CEN,
   input logic 	       WEN,
   input logic [MEM_ADDR_WIDTH-1:0]  A,
   input logic [63:0]  D,
   input logic [7:0]   BE,
   output logic [63:0] Q,
   input logic [1:0]   WM,
   input logic [2:0]   RM,
   
   input logic	       TM
   
   );
   
   logic  	       s_cen;
   logic  	       s_wen;
            
   // GENERATION OF CEN
   always_comb
     begin
	s_cen = 1'b1;
	if (CEN == 1'b0)
	  s_cen = 1'b0;		      
     end
   
   // GENERATION OF WEN
   always_comb
     begin
	s_wen = 1'b1;
	if (WEN == 1'b0)
	  s_wen = 1'b0;	      
     end
   
   // MEMORY CUTS
   generic_memory
     #(
       .ADDR_WIDTH(MEM_ADDR_WIDTH)
       )
   cut_lo
     (
      .CLK(CLK),  
      .INITN(INITN),
      .CEN(s_cen),  
      .A(A[MEM_ADDR_WIDTH-1:0]),    
      .WEN(s_wen),  
      .D(D[31:0]),    
      .BEN(~BE[3:0]),  
      .Q(Q[31:0])	      
      );

   generic_memory 
     #(
       .ADDR_WIDTH(MEM_ADDR_WIDTH)
       )
   cut_hi
     (
      .CLK(CLK),  
      .INITN(INITN),
      .CEN(s_cen),  
      .A(A[MEM_ADDR_WIDTH-1:0]),    
      .WEN(s_wen),  
      .D(D[63:32]),    
      .BEN(~BE[7:4]),  
      .Q(Q[63:32])	      
      );
     
endmodule
