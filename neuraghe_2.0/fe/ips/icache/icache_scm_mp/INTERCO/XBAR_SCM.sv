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
// Create Date:    03/07/2011                                                 // 
// Design Name:    LOG_INTERCONNECT                                           // 
// Module Name:    XBAR_TCDM                                                  //
// Project Name:   MegaLEON / P2012                                           //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Top level for the TCDM Crossbar. It includes both the      //
//                 Request and response Blocks.                               //
//                                                                            //
// Revision:                                                                  //
// v0.1 03/07/2011  - File Created                                            //
// v0.2 14/08/2012  - Improved the Interface Structure,                       //
//                    Changed the routing mechanism                           //
// v0.3 19/02/2015  - Code Restyling,                                         //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
`define log2_non_zero(VALUE) ((VALUE) < ( 1 ) ? 1 : (VALUE) < ( 2 ) ? 1 : (VALUE) < ( 4 ) ? 2 : (VALUE)< (8) ? 3:(VALUE) < ( 16 )  ? 4 : (VALUE) < ( 32 )  ? 5 : (VALUE) < ( 64 )  ? 6 : (VALUE) < ( 128 ) ? 7 : (VALUE) < ( 256 ) ? 8 : (VALUE) < ( 512 ) ? 9 : 10)

module XBAR_SCM 
#(
    parameter N_CH0           = 4, //--> CH0
    parameter N_CH1           = 1, //--> CH1
    parameter N_SLAVE         = 4,
    parameter DATA_WIDTH      = 32,
    parameter N_WAYS          = 4,
    parameter ADDR_MEM_WIDTH  = 12
)
(
    // ---------------- MASTER CH0+CH1 SIDE  --------------------------
    input  logic [N_CH0+N_CH1-1:0]                                  data_req_i,            // Data request
    input  logic [N_CH0+N_CH1-1:0][`log2_non_zero(N_SLAVE-1)-1:0]   data_dest_i,           // Bank destination, One Hot encoding
    input  logic [N_CH0+N_CH1-1:0][ADDR_MEM_WIDTH-1:0]              data_add_i,            // Data request Address
    input  logic [N_CH0+N_CH1-1:0][N_WAYS-1:0]                      data_way_i,            // Data request Address
    input  logic [N_CH0+N_CH1-1:0][DATA_WIDTH-1:0]                  data_wdata_i,          // Data request Write data
    output logic [N_CH0+N_CH1-1:0]                                  data_gnt_o,            // Grant Incoming Request

    // ---------------- MM_SIDE (Interleaved) -------------------------- 
    output  logic [N_SLAVE-1:0]                                     data_req_o,            // Data request
    output  logic [N_SLAVE-1:0][ADDR_MEM_WIDTH-1:0]                 data_add_o,            // Data request Address
    output  logic [N_SLAVE-1:0][N_WAYS-1:0]                         data_way_o,            // Data request Address
    output  logic [N_SLAVE-1:0][DATA_WIDTH-1:0]                     data_wdata_o,          // Data request Wrire data
    input   logic [N_SLAVE-1:0]                                     data_gnt_i,            // Grant In

    input  logic                                                    clk,
    input  logic                                                    rst_n
);
    
    

    logic [N_CH0+N_CH1-1:0]      data_gnt_from_MEM[N_SLAVE-1:0];
    logic [N_CH0+N_CH1-1:0]      data_req_to_MEM[N_SLAVE-1:0];

    logic [N_SLAVE-1:0]          data_req_from_MASTER[N_CH0+N_CH1-1:0];
    logic [N_SLAVE-1:0]          data_gnt_to_MASTER[N_CH0+N_CH1-1:0];

    logic [N_CH0+N_CH1-1:0][ADDR_MEM_WIDTH-1:0]       data_add;
    
    logic [N_CH0+N_CH1-1:0][`log2_non_zero(N_SLAVE-1)-1:0]      data_routing;

    genvar j,k;

    generate




    for (k=0; k<N_CH0+N_CH1; k++)
    begin : wiring_req_rout

        assign data_add[k]     = data_add_i[k];

        if(N_SLAVE == 1)
           assign data_routing[k] =  '0; // Only one memory --> no routing info are needed
        else
           assign data_routing[k] =  data_dest_i[k];

        for (j=0; j<N_SLAVE; j++)
        begin : Wiring_flow_ctrl
            assign data_req_to_MEM[j][k]        = data_req_from_MASTER[k][j];
            assign data_gnt_to_MASTER[k][j]     = data_gnt_from_MEM[j][k];
        end
    end

        for (j=0; j<  N_SLAVE; j++)
        begin : RequestBlock
          if(N_CH1 != 0)
            begin : CH0_CH1
                RequestBlock2CH_SCM
                #(
                    .ADDR_MEM_WIDTH ( ADDR_MEM_WIDTH ), 
                    .N_CH0          ( N_CH0          ),
                    .N_CH1          ( N_CH1          ),
                    .DATA_WIDTH     ( DATA_WIDTH     )
                ) 
                i_RequestBlock2CH
                (
                    // CHANNEL CH0 --> (example: Used for xP70s) 
                    .data_req_CH0_i     ( data_req_to_MEM[j][N_CH0-1:0]     ),
                    .data_add_CH0_i     ( data_add[N_CH0-1:0]               ), //Memory cut address + T&S
                    .data_wdata_CH0_i   ( data_wdata_i[N_CH0-1:0]           ),
                    .data_way_CH0_i     ( data_way_i[N_CH0-1:0]             ),
                    .data_gnt_CH0_o     ( data_gnt_from_MEM[j][N_CH0-1:0]   ),

                    // CHANNEL CH1 --> (example: Used for DMAs)
                    .data_req_CH1_i     ( data_req_to_MEM[j][N_CH1+N_CH0-1:N_CH0] ),
                    .data_add_CH1_i     ( data_add[N_CH0+N_CH1-1:N_CH0]           ), //Memory cut address + T&S
                    .data_wdata_CH1_i   ( data_wdata_i[N_CH1+N_CH0-1:N_CH0]       ),
                    .data_way_CH1_i     ( data_way_i[N_CH1+N_CH0-1:N_CH0]              ),
                    .data_gnt_CH1_o     ( data_gnt_from_MEM[j][N_CH1+N_CH0-1:N_CH0]    ),
                    // -----------------             MEMORY                    -------------------
                    // ---------------- RequestBlock OUTPUT (Connected to MEMORY) ----------------
                    .data_req_o         ( data_req_o[j]                                 ),
                    .data_add_o         ( data_add_o[j]                                 ),
                    .data_wdata_o       ( data_wdata_o[j]                               ),
                    .data_way_o         ( data_way_o[j]                                 ),
                    .data_gnt_i         ( 1'b1                                          ),

                    // global sync signals
                    .clk                ( clk                                           ),
                    .rst_n              ( rst_n                                         )
                );
        end
          else
            begin : CH0_ONLY
                RequestBlock1CH_SCM
                #(
                    .ADDR_MEM_WIDTH     ( ADDR_MEM_WIDTH           ), 
                    .N_CH0              ( N_CH0                    ), 
                    .DATA_WIDTH         ( DATA_WIDTH               )
                ) 
                i_RequestBlock1CH
                (
                    // CHANNEL CH0 --> (example: Used for xP70s) 
                    .data_req_CH0_i     ( data_req_to_MEM[j]       ),
                    .data_add_CH0_i     ( data_add                 ),
                    .data_wdata_CH0_i   ( data_wdata_i             ),
                    .data_way_CH0_i     ( data_way_i               ),
                    .data_gnt_CH0_o     ( data_gnt_from_MEM[j]     ),

                    // -----------------             MEMORY                    -------------------
                    // ---------------- RequestBlock OUTPUT (Connected to MEMORY) ----------------
                    .data_req_o         ( data_req_o[j]            ),
                    .data_add_o         ( data_add_o[j]            ),
                    .data_wdata_o       ( data_wdata_o[j]          ),
                    .data_way_o         ( data_way_o[j]            ),
                    .data_gnt_i         ( 1'b1                     ),

                    .clk(clk),
                    .rst_n(rst_n)
                );
            end

          end

        for (j=0; j<  N_CH0+N_CH1; j++)
        begin : _ResponseBlock_SCM_
          ResponseBlock_SCM
          #( 
              .N_SLAVE         ( N_SLAVE                   )
          )
          i_ResponseBlock
          (              
              // Inputs form MAsters
              .data_req_i      ( data_req_i[j]             ),
              .routing_addr_i  ( data_routing[j]           ),
              .data_gnt_o      ( data_gnt_o[j]             ),


              .data_req_o      ( data_req_from_MASTER[j]   ),
              .data_gnt_i      ( data_gnt_to_MASTER[j]     )
          );
        end
    endgenerate
endmodule
