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
// Create Date:    06/07/2011                                                 // 
// Design Name:    LOG_INTERCONNECT                                           // 
// Module Name:    ArbitrationTree                                            //
// Project Name:   MegaLEON                                                   //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Arbitration tree: This block performs the arbitration      //
//                 between the N_MASTER requests. The arbitration is          //
//                 distributed in the several arbitration primitives that     //
//                 compose this routing block. The arbistrtion is round robin //
//                 and the round robin flag generator is embedded inside this //
//                 block. Flag updating happens only when requests are grant  //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - (19/02/2015) Restyling                                     //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module ArbitrationTree_SCM 
#(
    parameter ADDR_WIDTH  = 12,
    parameter N_MASTER    = 16,
    parameter DATA_WIDTH  = 32,
    parameter N_WAYS      = 4,
    parameter MAX_COUNT   = 2**N_MASTER-1
) 
(
    input  logic                                 clk,
    input  logic                                 rst_n,

    // ---------------- REQ_SIDE --------------------------
    input  logic [N_MASTER-1:0]                  data_req_i,
    input  logic [N_MASTER-1:0][ADDR_WIDTH-1:0]  data_add_i,
    input  logic [N_MASTER-1:0][DATA_WIDTH-1:0]  data_wdata_i,
    input  logic [N_MASTER-1:0][N_WAYS-1:0]      data_way_i,
    output logic [N_MASTER-1:0]                  data_gnt_o,
    // Outputs
    output logic                                 data_req_o,
    output logic [ADDR_WIDTH-1:0]                data_add_o,
    output logic [DATA_WIDTH-1:0]                data_wdata_o,
    output logic [N_WAYS-1:0]                    data_way_o,
    input  logic                                 data_gnt_i
);

    localparam LOG_MASTER         = $clog2(N_MASTER);
    localparam N_WIRE             =  N_MASTER - 2;

    logic [LOG_MASTER-1:0]        RR_FLAG;

    genvar j,k;


    generate
      if(N_MASTER == 2)
        begin : INCR // START of  MASTER  == 2
                    // ---------------- FAN IN PRIMITIVE  -------------------------
                    FanInPrimitive_Req_SCM 
                    #(
                        .ADDR_WIDTH     ( ADDR_WIDTH      ), 
                        .DATA_WIDTH     ( DATA_WIDTH      ),
                        .N_WAYS         ( N_WAYS          )
                    ) 
                    i_FanInPrimitive_Req
                    (
                        .RR_FLAG(RR_FLAG),
                        // LEFT SIDE"
                        .data_wdata0_i  ( data_wdata_i[0] ),
                        .data_wdata1_i  ( data_wdata_i[1] ),
                        .data_way0_i    ( data_way_i[0]   ),
                        .data_way1_i    ( data_way_i[1]   ),
                        .data_add0_i    ( data_add_i[0]   ),
                        .data_add1_i    ( data_add_i[1]   ),
                        .data_req0_i    ( data_req_i[0]   ),
                        .data_req1_i    ( data_req_i[1]   ),
                        .data_gnt0_o    ( data_gnt_o[0]   ),
                        .data_gnt1_o    ( data_gnt_o[1]   ),
                        // RIGTH SIDE"
                        .data_wdata_o   ( data_wdata_o    ),
                        .data_way_o     ( data_way_o      ),
                        .data_add_o     ( data_add_o      ),
                        .data_req_o     ( data_req_o      ),
                        .data_gnt_i     ( data_gnt_i      )
                    );
        end // END OF MASTER  == 2
      else // More than two master
        begin : BINARY_TREE
            //// ---------------------------------------------------------------------- ////
            //// -------               REQ ARBITRATION TREE WIRES           ----------- ////
            //// ---------------------------------------------------------------------- ////        
            logic [DATA_WIDTH-1:0]     data_wdata_LEVEL[N_WIRE-1:0];
            logic [N_WAYS-1:0]         data_way_LEVEL[N_WIRE-1:0];
            logic [ADDR_WIDTH-1:0]     data_add_LEVEL[N_WIRE-1:0];
            logic                      data_req_LEVEL[N_WIRE-1:0];
            logic                      data_gnt_LEVEL[N_WIRE-1:0];


               for(j=0; j < LOG_MASTER; j++) // Iteration for the number of the stages minus one
                begin : STAGE
                  for(k=0; k<2**j; k=k+1) // Iteration needed to create the binary tree
                    begin : INCR_VERT

                      if (j == 0 )  // LAST NODE, drives the module outputs
                      begin : LAST_NODE
                          FanInPrimitive_Req_SCM 
                          #(
                              .ADDR_WIDTH     ( ADDR_WIDTH              ), 
                              .DATA_WIDTH     ( DATA_WIDTH              ),
                              .N_WAYS         ( N_WAYS                  )
                          ) 
                          i_FanInPrimitive_Req
                          (
                              .RR_FLAG(RR_FLAG[LOG_MASTER-j-1]),
                              // LEFT SIDE
                              .data_wdata0_i  ( data_wdata_LEVEL[2*k]   ),
                              .data_wdata1_i  ( data_wdata_LEVEL[2*k+1] ),
                              .data_way0_i    ( data_way_LEVEL[2*k]     ),
                              .data_way1_i    ( data_way_LEVEL[2*k+1]   ),                              
                              .data_add0_i    ( data_add_LEVEL[2*k]     ),
                              .data_add1_i    ( data_add_LEVEL[2*k+1]   ),
                              .data_req0_i    ( data_req_LEVEL[2*k]     ),
                              .data_req1_i    ( data_req_LEVEL[2*k+1]   ),
                              .data_gnt0_o    ( data_gnt_LEVEL[2*k]     ),
                              .data_gnt1_o    ( data_gnt_LEVEL[2*k+1]   ),
                              // RIGTH SIDE
                              .data_wdata_o   ( data_wdata_o            ),
                              .data_way_o     ( data_way_o              ),
                              .data_add_o     ( data_add_o              ),
                              .data_req_o     ( data_req_o              ),
                              .data_gnt_i     ( data_gnt_i              )
                          );
                      end 
                      else if ( j < LOG_MASTER - 1) // Middle Nodes
                              begin : MIDDLE_NODES // START of MIDDLE LEVELS Nodes   
                                  FanInPrimitive_Req_SCM 
                                  #(
                                      .ADDR_WIDTH     ( ADDR_WIDTH                              ), 
                                      .DATA_WIDTH     ( DATA_WIDTH                              ),
                                      .N_WAYS         ( N_WAYS                                  )
                                  ) 
                                  i_FanInPrimitive_Req
                                  (
                                      .RR_FLAG(RR_FLAG[LOG_MASTER-j-1]),
                                      // LEFT SIDE
                                      .data_wdata0_i  ( data_wdata_LEVEL[((2**j)*2-2) + 2*k]    ),
                                      .data_wdata1_i  ( data_wdata_LEVEL[((2**j)*2-2) + 2*k +1] ),
                                      .data_way0_i    ( data_way_LEVEL[((2**j)*2-2) + 2*k]      ),
                                      .data_way1_i    ( data_way_LEVEL[((2**j)*2-2) + 2*k +1]   ), 
                                      .data_add0_i    ( data_add_LEVEL[((2**j)*2-2) + 2*k]      ),
                                      .data_add1_i    ( data_add_LEVEL[((2**j)*2-2) + 2*k+1]    ),
                                      .data_req0_i    ( data_req_LEVEL[((2**j)*2-2) + 2*k]      ),
                                      .data_req1_i    ( data_req_LEVEL[((2**j)*2-2) + 2*k+1]    ),
                                      .data_gnt0_o    ( data_gnt_LEVEL[((2**j)*2-2) + 2*k]      ),
                                      .data_gnt1_o    ( data_gnt_LEVEL[((2**j)*2-2) + 2*k+1]    ),

                                      // RIGTH SIDE
                                      .data_wdata_o   ( data_wdata_LEVEL[((2**(j-1))*2-2) + k]  ),
                                      .data_way_o     ( data_way_LEVEL[((2**(j-1))*2-2) + k]    ),
                                      .data_add_o     ( data_add_LEVEL[((2**(j-1))*2-2) + k]    ),
                                      .data_req_o     ( data_req_LEVEL[((2**(j-1))*2-2) + k]    ),
                                      .data_gnt_i     ( data_gnt_LEVEL[((2**(j-1))*2-2) + k]    )

                                  );
                              end  // END of MIDDLE LEVELS Nodes   
                           else // First stage (connected with the Main inputs ) --> ( j == N_MASTER - 1 )
                              begin : LEAF_NODES  // START of FIRST LEVEL Nodes (LEAF)
                                  FanInPrimitive_Req_SCM 
                                  #(
                                      .ADDR_WIDTH     ( ADDR_WIDTH      ), 
                                      .DATA_WIDTH     ( DATA_WIDTH      ),
                                      .N_WAYS         ( N_WAYS          )

                                  ) 
                                  i_FanInPrimitive_Req
                                  (
                                      .RR_FLAG(RR_FLAG[LOG_MASTER-j-1]),
                                      // LEFT SIDE
                                      .data_wdata0_i  ( data_wdata_i[2*k]  ),
                                      .data_wdata1_i  ( data_wdata_i[2*k+1]),
                                      .data_way0_i    ( data_way_i[2*k]    ),
                                      .data_way1_i    ( data_way_i[2*k+1]  ),
                                      .data_add0_i    ( data_add_i[2*k]    ),
                                      .data_add1_i    ( data_add_i[2*k+1]  ),
                                      .data_req0_i    ( data_req_i[2*k]    ),
                                      .data_req1_i    ( data_req_i[2*k+1]  ),
                                      .data_gnt0_o    ( data_gnt_o[2*k]    ),
                                      .data_gnt1_o    ( data_gnt_o[2*k+1]  ),

      
                                      // RIGTH SIDE
                                      .data_wdata_o   ( data_wdata_LEVEL[((2**(j-1))*2-2) + k] ),
                                      .data_way_o     ( data_way_LEVEL[((2**(j-1))*2-2) + k]   ),
                                      .data_add_o     ( data_add_LEVEL[((2**(j-1))*2-2) + k]   ),
                                      .data_req_o     ( data_req_LEVEL[((2**(j-1))*2-2) + k]   ),
                                      .data_gnt_i     ( data_gnt_LEVEL[((2**(j-1))*2-2) + k]   )
                                  );
                              end // End of FIRST LEVEL Nodes (LEAF)
                    end
                end
    end
    endgenerate

    //COUNTER USED TO SWITCH PERIODICALLY THE PRIORITY FLAG"
    RR_Flag_Req_SCM #( .WIDTH(LOG_MASTER), .MAX_COUNT(MAX_COUNT) )  RR_REQ
    (
        .clk          ( clk          ),
        .rst_n        ( rst_n        ),
        .RR_FLAG_o    ( RR_FLAG      ),
        .data_req_i   ( data_req_o   ),
        .data_gnt_i   ( data_gnt_i   )
    );


endmodule
