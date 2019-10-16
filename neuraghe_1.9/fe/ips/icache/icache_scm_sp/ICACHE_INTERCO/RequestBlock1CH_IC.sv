////////////////////////////////////////////////////////////////////////////////
// Company:        Micrel Lab @ DEIS - University of Bologna                  //  
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Igor Loi - igor.loi@unibo.it                               //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    02/07/2011                                                 // 
// Design Name:    LOG_INTERCONNECT                                           // 
// Module Name:    RequestBlock1CH                                            //
// Project Name:   MegaLEON                                                   //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Request Block: it embeds inside the routing trees and the  //
//                 Test and Set Interface                                     //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - Changes in the ADDRESS_WIDTH   ( 26/07/2011 )              //
// Revision v0.3 - Added Dual FlowControl Support ( 14/08/2012 )              //
// Revision v0.4 - Added read Broadcast feature   ( 19/02/2013 )              //
//                 Added Read Only Variant                                    //
// Revision v0.5 - 16/02/2015  - Improveved flexibility - configurability     //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "macro.v"

module RequestBlock1CH_IC
#(
   parameter ADDR_MEM_WIDTH          = 32,
   parameter N_CH0                   = 16,
   parameter ID_WIDTH                = N_CH0

)
(
   // INPUT CHANNELS
   input  logic [N_CH0-1:0]                                  data_req_CH0_i,
   input  logic [N_CH0-1:0][ADDR_MEM_WIDTH-1:0]              data_add_CH0_i, 
   input  logic [N_CH0-1:0][ID_WIDTH-1:0]                    data_ID_CH0_i,
   output logic [N_CH0-1:0]                                  data_gnt_CH0_o,
   output logic [N_CH0-1:0]                                  data_r_valid_CH0_o,



   // -----------------             MEMORY                    -------------------
   // ---------------- RequestBlock OUTPUT (Connected to MEMORY) ----------------
   output logic                                              data_req_o,
   output logic [ADDR_MEM_WIDTH-1:0]                         data_add_o,
   output logic [ID_WIDTH-1:0]                               data_ID_o,
   input  logic                                              data_gnt_i,
   input  logic                                              data_r_valid_i,
   input  logic [ID_WIDTH-1:0]                               data_r_ID_i,


   input  logic                                              clk,
   input  logic                                              rst_n
);

   // From Test And Set Interface to AddressDecoder_Resp
   logic [ID_WIDTH-1:0]                                      data_r_ID_MEM;
   logic                                                     data_r_valid_MEM;

   generate
       if(N_CH0 != 1) // Means 2 or more MAster, it requires Arbitration Tree and eires between Arb tree and Test and set interface
       begin : POLY_CH0
           // ---------------- Wires on the CACHE BANKS  --------------------------
           // Request Channel
           logic                                             data_req_MEM;
           logic [ADDR_MEM_WIDTH-1:0]                        data_add_MEM; // Memory address

           logic [ID_WIDTH-1:0]                              data_ID_MEM;
           // Response Channel
           logic                                             data_gnt_MEM;

           ArbitrationTree_IC #(.ADDR_WIDTH( ADDR_MEM_WIDTH ), .ID_WIDTH(ID_WIDTH), .N_MASTER(N_CH0)) CH0_ARB_TREE
           (
               .clk(clk),
               .rst_n(rst_n),
               // INPUTS
               .data_req_i(data_req_CH0_i),
               .data_add_i(data_add_CH0_i),
               .data_ID_i(data_ID_CH0_i),
               .data_gnt_o(data_gnt_CH0_o),

               // OUTPUTS
               .data_req_o(data_req_MEM),
               .data_add_o(data_add_MEM),
               .data_ID_o(data_ID_MEM),          
               .data_gnt_i(data_gnt_MEM)

           );


           assign  data_req_o   = data_req_MEM;
           assign  data_add_o   = data_add_MEM;
           assign  data_ID_o    = data_ID_MEM;
           assign data_gnt_MEM  = data_gnt_i;


       end 
       else 
       begin : MONO_CH0
       
       
           assign  data_req_o      = data_req_CH0_i;
           assign  data_add_o      = data_add_CH0_i;
           assign  data_ID_o       = data_ID_CH0_i;
           assign  data_gnt_CH0_o  = data_gnt_i;


        end            
   endgenerate

   AddressDecoder_Resp_IC #( .ID_WIDTH(ID_WIDTH), .N_MASTER(N_CH0) ) ADDR_DEC_RESP
   (
       // FROM Test And Set Interface
       .data_r_valid_i(data_r_valid_i),
       .data_ID_i(data_r_ID_i),
       // To Response Network
       .data_r_valid_o(data_r_valid_CH0_o)
   );
endmodule