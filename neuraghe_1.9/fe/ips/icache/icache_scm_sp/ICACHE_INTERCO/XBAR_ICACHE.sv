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
// Module Name:    XBAR_ICACHE                                                //
// Project Name:   ARC Multicore                                              //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Top level for the ICACHE Crossbar. It includes both the    //
//                 Request and response Blocks.                               //
//                                                                            //
// Revision:                                                                  //
// v0.1 03/07/2011  - File Created                                            //
// v0.2 14/08/2012  - Improved the Interface Structure,                       //
//                    Changed the routing mechanism                           //
//                    Added Dual Flow Control Support                         //
// v0.3 19/02/2013  - Added read Broadcast feature,                           //
//                    Added Read Only Variant                                 //
// v0.4 25/11/2013  - New version Used for Shared Icache          //
// v0.5 16/02/2015  - Improveved flexibility - configurability                //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
`include "ulpsoc_defines.sv"
`include "macro.v"
`include "icache_config.v"
       
module XBAR_ICACHE 
#(
      parameter  N_CH0                  = 16, //--> CH0
      parameter  N_CH1                  = 0,  //--> CH1
      parameter  N_SLAVE                = 8,
      parameter  BLI_LSB                = 5, // BANK INTERLEAVING LSB for routing
      parameter  BLI_MSB                = 7, // BANK INTERLEAVING MSB for routing
      parameter  MULTICAST_FEATURE      = "ENABLED",
      parameter  MULTICAST_GRANULARITY  = 4,
      
      parameter  ADDR_WIDTH             = 32,
      parameter  DATA_WIDTH             = 32,
      parameter  ID_WIDTH               = N_CH0+N_CH1
)
(
        // ---------------- MASTER CH0+CH1 SIDE  --------------------------
        input  logic [N_CH0+N_CH1-1:0]                                          data_req_i,             // Data request
        input  logic [N_CH0+N_CH1-1:0][ADDR_WIDTH-1:0]                          data_add_i,             // Data request Address
        output logic [N_CH0+N_CH1-1:0]                                          data_gnt_o,             // Grant Incoming Request

        output logic [N_CH0+N_CH1-1:0]                                          data_r_valid_o,         // Data Response Valid (For LOAD/STORE commands)
        output logic [N_CH0+N_CH1-1:0][DATA_WIDTH-1:0]                          data_r_rdata_o,         // Data Response DATA (For LOAD commands)
        
        
        // ---------------- MM_SIDE (Interleaved) -------------------------- 
        output logic [N_SLAVE-1:0]                                              data_req_o,             // Data request
        output logic [N_SLAVE-1:0][ADDR_WIDTH-1:0]                              data_add_o,             // Data request Address
        output logic [N_SLAVE-1:0][ID_WIDTH-1:0]                                data_ID_o,              // Data request Address
        input  logic [N_SLAVE-1:0]                                              data_gnt_i,             // Data Grant
        input  logic [N_SLAVE-1:0]                                              data_r_valid_i,         // valid REspone (must be accepted always)
        input  logic [N_SLAVE-1:0][ID_WIDTH-1:0]                                data_r_ID_i,            // Data Response ID (For LOAD commands)
        input  logic [N_SLAVE-1:0][MULTICAST_GRANULARITY-1:0][DATA_WIDTH-1:0]   data_r_rdata_i,         // Data Response DATA (For LOAD and STORE)

        
        
        input  logic                                                            clk,
        input  logic                                                            rst_n,
        input  logic                                                            icache_is_private_i
);

        localparam ADDR_MEM_WIDTH = ADDR_WIDTH;

        // DATA ID array FORM address decoders to Request tree. // UNPACKED ARRAY
        logic [N_CH0+N_CH1-1:0][ID_WIDTH-1:0]                  data_ID;

        logic [N_SLAVE-1:0][N_CH0+N_CH1-1:0]                   data_gnt_from_MEM;
        logic [N_CH0+N_CH1-1:0][N_SLAVE-1:0]                   data_req_from_MASTER;
        logic [N_SLAVE-1:0][N_CH0+N_CH1-1:0]                   data_r_valid_from_MEM;


        logic [N_CH0+N_CH1-1:0][N_SLAVE-1:0]                   data_r_valid_to_MASTER;
        logic [N_SLAVE-1:0][N_CH0+N_CH1-1:0]                   data_req_to_MEM;
        logic [N_CH0+N_CH1-1:0][N_SLAVE-1:0]                   data_gnt_to_MASTER;

        logic [N_CH0+N_CH1-1:0][ADDR_WIDTH-1:0]                data_add;
        logic [N_CH0+N_CH1-1:0][`log2(N_SLAVE-1)-1:0]          data_routing;
        logic [N_CH0+N_CH1-1:0][ID_WIDTH-1:0]                  data_r_ID_int;                // Data Response ID (For LOAD commands)

        // Used only if MULTICAST_FEATURE is enabled
        logic [N_CH0+N_CH1-1:0][`log2_size(MULTICAST_GRANULARITY-1)-1:0]    relative_bcast_chunk;
        logic [N_CH0+N_CH1-1:0][N_CH0+N_CH1-1:0]                            broadcast_match;
        logic [N_CH0+N_CH1-1:0][DATA_WIDTH-1:0]                             data_r_rdata_to_BCAST_MUX;
        logic [N_CH0+N_CH1-1:0][N_SLAVE-1:0]                                data_r_rvalid_BCAST_muxsel;
        
        
        genvar j,k,i;
  
  
  
  generate

        if(MULTICAST_FEATURE == "ENABLED")
        begin : MCAST_BLOCKS
        
              for (k=0; k<N_CH0+N_CH1; k++)
              begin : BR_CHECK
                  Broadcast_Check_IC 
                  #(
                      .ADDR_WIDTH(ADDR_WIDTH),
                      .DATA_WIDTH(DATA_WIDTH),
                      .N_MASTER(N_CH0+N_CH1),
                      .PORT_ID(k),
                      .MULTICAST_GRANULARITY(MULTICAST_GRANULARITY)
                  )
                   BROADCAST_ADDR_CHECK
                  (
                      .data_add_i          ( data_add_i          ),
                      .data_req_i          ( data_req_i          ),
                      .match_o             ( broadcast_match[k]  )
                  `ifdef SUPPORT_BOTH_PRI_SH
                      ,
                      .disable_bcast_i     ( icache_is_private_i )
                  `endif
                  );
              end
              
              
              for (k=0; k<N_CH0+N_CH1; k++)
              begin : GRANT_MANIP
                  FlowCtrl_Handling_IC
                  #(
                      .ADDR_WIDTH(ADDR_WIDTH),
                      .DATA_WIDTH(DATA_WIDTH),
                      .N_MASTER(N_CH0+N_CH1),
                      .MULTICAST_GRANULARITY(MULTICAST_GRANULARITY),
                      .N_SLAVE(N_SLAVE)
                  )
                  FLOW_CTRL_MANIP
                  (
                      .clk(clk),
                      .rst_n(rst_n),
                      
                      .routing_addr_i(data_routing[k]),

                      .addr_i(data_add_i[k]),
                      .relative_bcast_chunk_o(relative_bcast_chunk[k]),
                      
                      .data_gnt_i(data_gnt_from_MEM),
                      .data_gnt_o(data_gnt_o[k]),
                      .match_i(broadcast_match[k]),

                      .rvalid_i(data_r_valid_from_MEM),
                      
                      .rvalid_o(data_r_valid_o[k]),
                      .rvalid_OH_o(data_r_rvalid_BCAST_muxsel[k])
                  );
              end   
  end
  

  
  
  
  
  
  for (k=0; k<N_CH0+N_CH1; k++)
  begin : wiring_req_rout
    
    
    if(N_SLAVE == 1)
       assign data_routing[k] =  '0; // Only one memory --> no routing info are needed
    else
    if(N_SLAVE == 2)
    begin
       if(N_SLAVE == N_CH0+N_CH1 )
       begin
          `ifdef SUPPORT_BOTH_PRI_SH
              assign data_routing[k] =  (icache_is_private_i == 1'b1) ? k :  data_add_i[k][BLI_LSB];   
          `else
              assign data_routing[k] =  data_add_i[k][BLI_LSB];   
          `endif
       end
       else
       begin
          assign data_routing[k] =  data_add_i[k][BLI_LSB];   
       end
    end
    else
    begin
       
       if(N_SLAVE == N_CH0+N_CH1 )
       begin
          `ifdef SUPPORT_BOTH_PRI_SH
             assign data_routing[k] =  (icache_is_private_i == 1'b1) ? k :  data_add_i[k][BLI_MSB:BLI_LSB];   
          `else
             assign data_routing[k] =  data_add_i[k][BLI_MSB:BLI_LSB];   
          `endif
       end
       else
       begin
            assign data_routing[k] =  data_add_i[k][BLI_MSB:BLI_LSB];
       end
    end

    
    
    
  
    for (j=0; j<N_SLAVE; j++)
      begin : Wiring_flow_ctrl
        assign data_r_valid_to_MASTER[k][j] = data_r_valid_from_MEM[j][k];
        assign data_req_to_MEM[j][k]        = data_req_from_MASTER[k][j];
        assign data_gnt_to_MASTER[k][j]     = data_gnt_from_MEM[j][k];

      end
  end


  for (j=0; j<  N_SLAVE; j++)
      begin : RequestBlock
      if(N_CH1 != 0)
        begin : CH0_CH1
            RequestBlock2CH_IC  #(  .ADDR_MEM_WIDTH(ADDR_MEM_WIDTH), .N_CH0(N_CH0), .N_CH1(N_CH1), .ID_WIDTH(ID_WIDTH) ) REQ_BLOCK_2CH
            (
                // CHANNEL CH0 -->   (example: Used for xP70s) 
                .data_req_CH0_i      ( data_req_to_MEM[j][N_CH0-1:0]                 ),
                .data_add_CH0_i      ( data_add_i[N_CH0-1:0]                         ), //icache Bank address
                .data_ID_CH0_i       ( data_ID[N_CH0-1:0]                            ),
                .data_gnt_CH0_o      ( data_gnt_from_MEM[j][N_CH0-1:0]               ),

                // CHANNEL CH1 -->   (example: Used for DMAs)
                .data_req_CH1_i      ( data_req_to_MEM[j][N_CH1+N_CH0-1:N_CH0]       ),
                .data_add_CH1_i      ( data_add_i[N_CH0+N_CH1-1:N_CH0]               ), //Memory cut address + T&S
                .data_ID_CH1_i       ( data_ID[N_CH1+N_CH0-1:N_CH0]                  ),
                .data_gnt_CH1_o      ( data_gnt_from_MEM[j][N_CH1+N_CH0-1:N_CH0]     ),

                // -----------------             MEMORY                    -------------------
                // ---------------- RequestBlock OUTPUT (Connected to MEMORY) ----------------
                .data_req_o          ( data_req_o[j]                                 ),
                .data_add_o          ( data_add_o[j]                                 ),
                // GEN VALID_SIGNALS in the response path
                .data_r_valid_CH0_o  ( data_r_valid_from_MEM[j][N_CH0-1:0]           ), // N_CH0 Bit
                .data_r_valid_CH1_o  ( data_r_valid_from_MEM[j][N_CH0+N_CH1-1:N_CH0] ), // N_CH1 Bit
                .clk                 ( clk                                           ),
                .rst_n               ( rst_n                                         )
          );
      end
      else
      begin : CH0_ONLY
          RequestBlock1CH_IC   #(  .ADDR_MEM_WIDTH(ADDR_MEM_WIDTH), .N_CH0(N_CH0), .ID_WIDTH(ID_WIDTH) ) REQ_BLOCK_1CH
          (
                // CHANNEL CH0 --> (example: Used for xP70s) 
                .data_req_CH0_i(data_req_to_MEM[j]),
                .data_add_CH0_i(data_add_i),
                .data_ID_CH0_i(data_ID),
                .data_gnt_CH0_o(data_gnt_from_MEM[j]),

                // -----------------             MEMORY                    -------------------
                // ---------------- RequestBlock OUTPUT (Connected to MEMORY) ----------------
                .data_req_o(data_req_o[j]),
                .data_add_o(data_add_o[j]),
                .data_ID_o(data_ID_o[j]),
                .data_gnt_i(data_gnt_i[j]),        

                
                .data_r_valid_i(data_r_valid_i[j]),
                .data_r_ID_i(data_r_ID_i[j]),        
                
                     // GEN VALID_SIGNALS in the response path
                .data_r_valid_CH0_o(data_r_valid_from_MEM[j]), // N_CH0 Bit
                .clk(clk),
                .rst_n(rst_n)
          );
      end
      
      end
      
      for (j=0; j<  N_CH0+N_CH1; j++)
        begin : ResponseBlock
          
          if(MULTICAST_FEATURE == "ENABLED")
                begin
                      ResponseBlock_IC #( .DATA_WIDTH(DATA_WIDTH), .ID(2**j), .ID_WIDTH(ID_WIDTH), .N_SLAVE(N_SLAVE), .MULTICAST_FEATURE(MULTICAST_FEATURE), .MULTICAST_GRANULARITY(MULTICAST_GRANULARITY)) RESP_BLOCK
                      (
                          // Signals from Memory cuts
                          .data_r_valid_i(data_r_rvalid_BCAST_muxsel[j]),
                          .data_r_rdata_i(data_r_rdata_i),
                          .data_r_ID_i(data_r_ID_i),
                          
                          
                          // Output of the ResponseTree Block
                          .data_r_valid_o(),
                          .relative_bcast_chunk_i(relative_bcast_chunk[j]),
                          .data_r_rdata_o(data_r_rdata_o[j]),
                          .data_r_ID_o(data_r_ID_int[j]),


              
                          // Inputs form MAsters
                          .data_req_i(data_req_i[j]),
                          .routing_addr_i(data_routing[j]),
                          .data_gnt_o(),


                          // Signal to/from Request Block
                          .data_req_o(data_req_from_MASTER[j]),
                          .data_gnt_i(data_gnt_to_MASTER[j]),

                          // Generated ID
                          .data_ID_o(data_ID[j]) 
                      );
                end
                else  //MULTICAST_FEATURE == "DISABLED"
                begin
                      ResponseBlock_IC #( .DATA_WIDTH(DATA_WIDTH), .ID(2**j), .ID_WIDTH(ID_WIDTH), .N_SLAVE(N_SLAVE), .MULTICAST_FEATURE(MULTICAST_FEATURE), .MULTICAST_GRANULARITY(MULTICAST_GRANULARITY) ) RESP_BLOCK
                      (
                          // Signals from Memory cuts
                          .data_r_valid_i(data_r_valid_to_MASTER[j]),
                          .data_r_rdata_i(data_r_rdata_i),
                          .data_r_ID_i(data_r_ID_i),
                          
                          
                          // Output of the ResponseTree Block
                          .relative_bcast_chunk_i(),
                          .data_r_valid_o(data_r_valid_o[j]),
                          .data_r_rdata_o(data_r_rdata_o[j]),
                          .data_r_ID_o(data_r_ID_int[j]),


              
                          // Inputs form MAsters
                          .data_req_i(data_req_i[j]),
                          .routing_addr_i(data_routing[j]),
                          .data_gnt_o(data_gnt_o[j]),

                          // Signal to/from Request Block
                          .data_req_o(data_req_from_MASTER[j]),
                          .data_gnt_i(data_gnt_to_MASTER[j]),

                          // Generated ID
                          .data_ID_o(data_ID[j])    
                      );
                end
        end
  
  endgenerate


endmodule
