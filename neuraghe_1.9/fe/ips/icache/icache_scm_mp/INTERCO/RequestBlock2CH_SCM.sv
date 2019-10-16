
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
// Module Name:    RequestBlock2CH                                            //
// Project Name:   MegaLEON                                                   //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Request Block: it embeds the routing trees and the         //
//                 Multiplexer to mix the request from two channels (one      //
//                 distributed in the several arbitration primitives that     //
//                 compose this routing block. The arbistrtion is round robin //
//                 and the round robin flag generator is embedded inside this //
//                 block. Flag updating happens only when requests are grant  //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - Changes in the ADDRESS_WIDTH ( 26/07/2011 )                //
// Revision v0.3 - Restyling ( 19/02/2015 )                                   //
// Revision v0.4 - N_CHO now can assume any value ( 21/08/2015 )              //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

// FOR TWO INPUTS
module RequestBlock2CH_SCM
#(
    parameter N_CH0          = 16, // Example Number of CORES
    parameter N_CH1          = 4,  // Example Number of DMAs
    parameter N_WAYS         = 4,

    parameter ADDR_MEM_WIDTH = 32,
    parameter DATA_WIDTH     = 32
)
(
    // CHANNEL CH0 --> (example: Used for Processing Elements / CORES) 
    input  logic [N_CH0-1:0]                                data_req_CH0_i,
    input  logic [N_CH0-1:0][ADDR_MEM_WIDTH-1:0]            data_add_CH0_i, // Memory address
    input  logic [N_CH0-1:0][DATA_WIDTH-1:0]                data_wdata_CH0_i,
    input  logic [N_CH0-1:0][N_WAYS-1:0]                    data_way_CH0_i,
    output logic [N_CH0-1:0]                                data_gnt_CH0_o,

    // CHANNEL CH1 --> (example: Used for DMAs)
    input  logic [N_CH1-1:0]                                data_req_CH1_i,
    input  logic [N_CH1-1:0][ADDR_MEM_WIDTH-1:0]            data_add_CH1_i, // Memory address
    input  logic [N_CH1-1:0][DATA_WIDTH-1:0]                data_wdata_CH1_i,
    input  logic [N_CH1-1:0][N_WAYS-1:0]                    data_way_CH1_i,
    output logic [N_CH1-1:0]                                data_gnt_CH1_o,

    // -----------------             MEMORY                    -------------------
    // ---------------- RequestBlock OUTPUT (Connected to MEMORY) ----------------
    output logic                                            data_req_o,
    output logic [ADDR_MEM_WIDTH-1:0]                       data_add_o, // Memory address
    output logic [DATA_WIDTH-1:0]                           data_wdata_o,
    output logic [N_WAYS-1:0]                               data_way_o,
    input  logic                                            data_gnt_i, 

    input  logic                                            clk,
    input  logic                                            rst_n
);

    // OUT CHANNEL CH0 --> (example: Used for CORES) 
    logic                                                   data_req_CH0;
    logic [ADDR_MEM_WIDTH-1:0]                              data_add_CH0; // Memory address
    logic [DATA_WIDTH-1:0]                                  data_wdata_CH0;
    logic [N_WAYS-1:0]                                      data_way_CH0;
    logic                                                   data_gnt_CH0;



    // OUT CHANNEL CH1 --> (example: Used for DMAs)
    logic                                                   data_req_CH1;
    logic [ADDR_MEM_WIDTH-1:0]                              data_add_CH1; // Memory address
    logic [DATA_WIDTH-1:0]                                  data_wdata_CH1;
    logic [N_WAYS-1:0]                                      data_way_CH1;
    logic                                                   data_gnt_CH1;

    // CHANNEL CH0 --> (example: Used for Processing Elements / CORES) 
    logic [2**$clog2(N_CH0)-1:0]                                data_req_CH0_int;
    logic [2**$clog2(N_CH0)-1:0][ADDR_MEM_WIDTH-1:0]            data_add_CH0_int;
    logic [2**$clog2(N_CH0)-1:0][DATA_WIDTH-1:0]                data_wdata_CH0_int;
    logic [2**$clog2(N_CH0)-1:0][N_WAYS-1:0]                    data_way_CH0_int;
    logic [2**$clog2(N_CH0)-1:0]                                data_gnt_CH0_int;



    // CHANNEL CH0 --> (example: Used for Processing Elements / CORES) 
    logic [2**$clog2(N_CH1)-1:0]                                data_req_CH1_int;
    logic [2**$clog2(N_CH1)-1:0][ADDR_MEM_WIDTH-1:0]            data_add_CH1_int;
    logic [2**$clog2(N_CH1)-1:0][DATA_WIDTH-1:0]                data_wdata_CH1_int;
    logic [2**$clog2(N_CH1)-1:0][N_WAYS-1:0]                    data_way_CH1_int;
    logic [2**$clog2(N_CH1)-1:0]                                data_gnt_CH1_int;




generate
            if(2**$clog2(N_CH0) != N_CH0) // if N_CH0 is not power of 2 --> then use power 2 ports
            begin : _DUMMY_CH0_PORTS_
              
              logic [2**$clog2(N_CH0)-N_CH0 -1 :0]                                data_req_CH0_dummy;
              logic [2**$clog2(N_CH0)-N_CH0 -1 :0][ADDR_MEM_WIDTH-1:0]            data_add_CH0_dummy; // Memory address
              logic [2**$clog2(N_CH0)-N_CH0 -1 :0][DATA_WIDTH-1:0]                data_wdata_CH0_dummy;
              logic [2**$clog2(N_CH0)-N_CH0 -1 :0][N_WAYS-1:0]                    data_way_CH0_dummy;
              logic [2**$clog2(N_CH0)-N_CH0 -1 :0]                                data_gnt_CH0_dummy;


              assign data_req_CH0_dummy    = '0 ;  
              assign data_add_CH0_dummy    = '0 ;    
              assign data_wdata_CH0_dummy  = '0 ;
              assign data_way_CH0_dummy    = '0 ;

              assign data_req_CH0_int      = {  data_req_CH0_dummy   ,   data_req_CH0_i     };
              assign data_add_CH0_int      = {  data_add_CH0_dummy   ,   data_add_CH0_i     };
              assign data_wdata_CH0_int    = {  data_wdata_CH0_dummy ,   data_wdata_CH0_i   };      
              assign data_way_CH0_int      = {  data_way_CH0_dummy   ,   data_way_CH0_i     };      


              for(genvar j=0; j<N_CH0; j++)
              begin : _MERGING_CH0_DUMMY_PORTS_OUT_      
                assign data_gnt_CH0_o[j]     = data_gnt_CH0_int[j];
              end


          end
          else // N_CH0 is power of 2
          begin
                assign data_req_CH0_int   = data_req_CH0_i;
                assign data_add_CH0_int   = data_add_CH0_i;
                assign data_wdata_CH0_int = data_wdata_CH0_i;
                assign data_way_CH0_int   = data_way_CH0_i;
                assign data_gnt_CH0_o     = data_gnt_CH0_int;
          end

  






            if(2**$clog2(N_CH1) != N_CH1) // if N_CH1 is not power of 2 --> then use power 2 ports
            begin : _DUMMY_CH1_PORTS_
              
              logic [2**$clog2(N_CH1)-N_CH1 -1 :0]                                data_req_CH1_dummy;
              logic [2**$clog2(N_CH1)-N_CH1 -1 :0][ADDR_MEM_WIDTH-1:0]            data_add_CH1_dummy; // Memory address
              logic [2**$clog2(N_CH1)-N_CH1 -1 :0][DATA_WIDTH-1:0]                data_wdata_CH1_dummy;
              logic [2**$clog2(N_CH1)-N_CH1 -1 :0][N_WAYS-1:0]                    data_way_CH1_dummy;
              logic [2**$clog2(N_CH1)-N_CH1 -1 :0]                                data_gnt_CH1_dummy;

              assign data_req_CH1_dummy    = '0 ;  
              assign data_add_CH1_dummy    = '0 ;     
              assign data_wdata_CH1_dummy  = '0 ;
              assign data_way_CH1_dummy    = '0 ;

              assign data_req_CH1_int      = {  data_req_CH1_dummy    ,    data_req_CH1_i   };
              assign data_add_CH1_int      = {  data_add_CH1_dummy    ,    data_add_CH1_i   };
              assign data_wdata_CH1_int    = {  data_wdata_CH1_dummy  ,    data_wdata_CH1_i };
              assign data_way_CH1_int      = {  data_way_CH1_dummy    ,    data_way_CH1_i   };


              for(genvar j=0; j<N_CH1; j++)
              begin : _MERGING_CH1_DUMMY_PORTS_OUT_  
                assign data_gnt_CH1_o[j]     = data_gnt_CH1_int[j];
              end


          end
          else // N_CH1 is power of 2
          begin
                assign data_req_CH1_int   = data_req_CH1_i;
                assign data_add_CH1_int   = data_add_CH1_i;
                assign data_wdata_CH1_int = data_wdata_CH1_i;
                assign data_way_CH1_int   = data_way_CH1_i;
                assign data_gnt_CH1_o     = data_gnt_CH1_int;
          end





          if(N_CH0 > 1)
          begin : CH0_ARB_TREE
              ArbitrationTree_SCM 
              #(
                  .ADDR_WIDTH   ( ADDR_MEM_WIDTH   ),
                  .N_MASTER     ( 2**$clog2(N_CH0) ),
                  .DATA_WIDTH   ( DATA_WIDTH       ),
                  .N_WAYS       ( N_WAYS           ),
                  .MAX_COUNT    ( N_CH0-1          )
              ) 
              i_ArbitrationTree
              (
                  .clk          ( clk                ),
                  .rst_n        ( rst_n              ),
                  // INPUTS
                  .data_req_i   ( data_req_CH0_int   ),
                  .data_add_i   ( data_add_CH0_int   ),
                  .data_wdata_i ( data_wdata_CH0_int ),
                  .data_way_i   ( data_way_CH0_int   ),
                  .data_gnt_o   ( data_gnt_CH0_int   ),

                  // OUTPUTS
                  .data_req_o   ( data_req_CH0     ),
                  .data_add_o   ( data_add_CH0     ),
                  .data_wdata_o ( data_wdata_CH0   ),
                  .data_way_o   ( data_way_CH0     ),
                  .data_gnt_i   ( data_gnt_CH0     )

            );
          end

          if(N_CH1 > 1)
          begin : CH1_ARB_TREE
              ArbitrationTree_SCM 
              #(
                  .ADDR_WIDTH   ( ADDR_MEM_WIDTH      ),
                  .N_MASTER     ( 2**$clog2(N_CH1)    ),
                  .DATA_WIDTH   ( DATA_WIDTH          ),
                  .N_WAYS       ( N_WAYS              ),
                  .MAX_COUNT    ( N_CH1-1             )
              ) 
              i_ArbitrationTree
              (
                  .clk(clk),
                  .rst_n(rst_n),
                  // INPUTS
                  .data_req_i   ( data_req_CH1_int   ),
                  .data_add_i   ( data_add_CH1_int   ),
                  .data_wdata_i ( data_wdata_CH1_int ),
                  .data_way_i   ( data_way_CH1_int   ),
                  .data_gnt_o   ( data_gnt_CH1_int   ),
                  // OUTPUTS
                  .data_req_o   ( data_req_CH1       ),
                  .data_add_o   ( data_add_CH1       ),
                  .data_wdata_o ( data_wdata_CH1     ),
                  .data_way_o   ( data_way_CH1       ),
                  .data_gnt_i   ( data_gnt_CH1       )
            );
          end

          if(N_CH1 == 1)
          begin : MONO_CH1
            if(N_CH0 == 1)
                begin : MONO_CH0
                  MUX2_REQ_SCM 
                  #(
                      .ADDR_WIDTH     ( ADDR_MEM_WIDTH   ),
                      .DATA_WIDTH     ( DATA_WIDTH       ),
                      .N_WAYS         ( N_WAYS           )
                  )
                  i_MUX2_REQ
                  (
                    // CH0 input
                    .data_req_CH0_i   ( data_req_CH0_int   ),
                    .data_add_CH0_i   ( data_add_CH0_int   ),
                    .data_wdata_CH0_i ( data_wdata_CH0_int ),
                    .data_way_CH0_i   ( data_way_CH0_int   ),
                    .data_gnt_CH0_o   ( data_gnt_CH0_int   ),

                    // CH1 input
                    .data_req_CH1_i   ( data_req_CH1_int   ),
                    .data_add_CH1_i   ( data_add_CH1_int   ),
                    .data_wdata_CH1_i ( data_wdata_CH1_int ),
                    .data_way_CH1_i   ( data_way_CH1_int   ),
                    .data_gnt_CH1_o   ( data_gnt_CH1_int   ),

                    // MUX output
                    .data_req_o       ( data_req_o         ),
                    .data_add_o       ( data_add_o         ),
                    .data_wdata_o     ( data_wdata_o       ),
                    .data_way_o       ( data_way_o         ),
                    .data_gnt_i       ( data_gnt_i         ),

                    .clk              ( clk                ),
                    .rst_n            ( rst_n              )
                );
                end // END MONO_CH0
            else
                  begin : POLY_CH0
                    MUX2_REQ_SCM 
                    #(
                        .ADDR_WIDTH     ( ADDR_MEM_WIDTH   ),
                        .DATA_WIDTH     ( DATA_WIDTH       ),
                        .N_WAYS         ( N_WAYS           )
                    )
                    i_MUX2_REQ
                    (
                      // CH0 input
                      .data_req_CH0_i   ( data_req_CH0       ),
                      .data_add_CH0_i   ( data_add_CH0       ),
                      .data_wdata_CH0_i ( data_wdata_CH0     ),
                      .data_way_CH0_i   ( data_way_CH0       ),
                      .data_gnt_CH0_o   ( data_gnt_CH0       ),

                      // CH1 input
                      .data_req_CH1_i   ( data_req_CH1_int   ),
                      .data_add_CH1_i   ( data_add_CH1_int   ),
                      .data_wdata_CH1_i ( data_wdata_CH1_int ),
                      .data_way_CH1_i   ( data_way_CH1_int   ),
                      .data_gnt_CH1_o   ( data_gnt_CH1_int   ),

                      // MUX output
                      .data_req_o       ( data_req_o         ),
                      .data_add_o       ( data_add_o         ),
                      .data_wdata_o     ( data_wdata_o       ),
                      .data_way_o       ( data_way_o         ),
                      .data_gnt_i       ( data_gnt_i         ),

                      .clk              ( clk                ),
                      .rst_n            ( rst_n              )
                  );
                  end // END POLY_CH0
          end 
          else  
          begin : POLY_CH1
            if(N_CH0 == 1)
            begin : MONO_CH0
                MUX2_REQ_SCM 
                #(
                    .ADDR_WIDTH     ( ADDR_MEM_WIDTH   ),
                    .DATA_WIDTH     ( DATA_WIDTH       ),
                    .N_WAYS         ( N_WAYS           )
                )
                i_MUX2_REQ
                (
                    // CH0 input
                    .data_req_CH0_i     ( data_req_CH0_int  ),
                    .data_add_CH0_i     ( data_add_CH0_int  ),
                    .data_wdata_CH0_i   ( data_wdata_CH0_int),
                    .data_way_CH0_i     ( data_way_CH0_int  ),
                    .data_gnt_CH0_o     ( data_gnt_CH0_int  ),

                    // CH1 input
                    .data_req_CH1_i     ( data_req_CH1      ),
                    .data_add_CH1_i     ( data_add_CH1      ),
                    .data_wdata_CH1_i   ( data_wdata_CH1    ),
                    .data_way_CH1_i     ( data_way_CH1      ),
                    .data_gnt_CH1_o     ( data_gnt_CH1      ),

                    // MUX output
                    .data_req_o         ( data_req_o        ),
                    .data_add_o         ( data_add_o        ),
                    .data_wdata_o       ( data_wdata_o      ),
                    .data_way_o         ( data_way_o        ),
                    .data_gnt_i         ( data_gnt_i        ),
  
                    .clk                ( clk               ),
                    .rst_n              ( rst_n             )
                );
            end
            else
            begin : POLY_CH0
                  MUX2_REQ_SCM 
                  #(
                      .ADDR_WIDTH     ( ADDR_MEM_WIDTH   ),
                      .DATA_WIDTH     ( DATA_WIDTH       ),
                      .N_WAYS         ( N_WAYS           )     
                  )
                  i_MUX2_REQ
                  (
                    // CH0 input
                    .data_req_CH0_i   ( data_req_CH0    ),
                    .data_add_CH0_i   ( data_add_CH0    ),
                    .data_wdata_CH0_i ( data_wdata_CH0  ),
                    .data_way_CH0_i   ( data_way_CH0    ),
                    .data_gnt_CH0_o   ( data_gnt_CH0    ),

                    // CH1 input
                    .data_req_CH1_i   ( data_req_CH1    ),
                    .data_add_CH1_i   ( data_add_CH1    ),
                    .data_wdata_CH1_i ( data_wdata_CH1  ),
                    .data_way_CH1_i   ( data_way_CH1    ),
                    .data_gnt_CH1_o   ( data_gnt_CH1    ),

                    // MUX output
                    .data_req_o       ( data_req_o      ),
                    .data_add_o       ( data_add_o      ),
                    .data_wdata_o     ( data_wdata_o    ),
                    .data_way_o       ( data_way_o      ),
                    .data_gnt_i       ( data_gnt_i      ),

                    .clk              ( clk             ),
                    .rst_n            ( rst_n           )
                );
            end
    end
    endgenerate


endmodule
