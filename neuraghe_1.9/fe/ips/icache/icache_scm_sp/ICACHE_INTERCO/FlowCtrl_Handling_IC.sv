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
// Create Date:    19/02/2013                                                 // 
// Design Name:    LOG_INTERCONNECT                                           // 
// Module Name:    FlowCtrl_Handling                                          //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    This Block takes the match array from the Broadcast Block  //
//                 and the Grant array from the arbitration tree, and         //
//                 generates the rigth grants, data_r_valid, and response     //
//                 routing address                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created (19/02/2013 )                                 //
// Revision v0.2 - 16/02/2015  - Improveved flexibility - configurability     //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
`include "ulpsoc_defines.sv"
`include "macro.v"

module FlowCtrl_Handling_IC
#(
    parameter   DATA_WIDTH               = 32,
    parameter   N_SLAVE                  = 32,
    parameter   N_MASTER                 = 16,
    parameter   MULTICAST_GRANULARITY    = 1,
    // do not edit parameters below this row
    parameter   ADDR_WIDTH               = 32,
    parameter   LOG2_NSLAVE              = `log2(N_SLAVE-1),
    parameter   LOG2_MCAST_GRANULARITY   = `log2_size(MULTICAST_GRANULARITY-1)
)
(
    input  logic                               clk,
    input  logic                               rst_n, 
    input  logic [LOG2_NSLAVE-1:0]             routing_addr_i,
      
    input  logic [N_SLAVE-1:0][N_MASTER-1:0]   data_gnt_i,
    output logic                               data_gnt_o,

       
    input  logic [N_MASTER-1:0]                match_i,
    
    input  logic [ADDR_WIDTH-1:0]              addr_i,
    output logic [LOG2_MCAST_GRANULARITY-1:0]  relative_bcast_chunk_o,
    
    input  logic [N_SLAVE-1:0][N_MASTER-1:0]   rvalid_i,
    
    output logic [N_SLAVE-1:0]                 rvalid_OH_o,
    output logic                               rvalid_o    
);

  
    logic [N_SLAVE-1:0]                     routing_addr_OH_d;
    logic [N_MASTER-1:0]                    gnt_w_match;    
    
    logic [N_MASTER-1:0]                    rvalid_w_match;
    
    logic [N_MASTER-1:0]                    match_Sampled;
    logic [LOG2_NSLAVE-1:0]                 routing_addr_Sampled;
    logic [N_SLAVE-1:0]                     routing_addr_Sampled_OH_d;
         
     
     
    assign rvalid_w_match   =  rvalid_i[routing_addr_Sampled] & match_Sampled;
    assign rvalid_o         = |rvalid_w_match;
    
    assign gnt_w_match      =  data_gnt_i[routing_addr_i] & match_i;
    assign data_gnt_o       = |gnt_w_match;

    
    assign rvalid_OH_o       = routing_addr_Sampled_OH_d;
    
    
    always_ff @(posedge clk, negedge rst_n)
    begin
    if(rst_n == 1'b0)
    begin
        match_Sampled          <= '0;
        routing_addr_Sampled   <= '0;
        relative_bcast_chunk_o <= '0;
    end
    else
    begin
        if((|match_i) & data_gnt_o)
        begin
          match_Sampled          <= match_i;
          routing_addr_Sampled   <= routing_addr_i;
          
          if(MULTICAST_GRANULARITY == 1)
          begin
        relative_bcast_chunk_o <= 1'b0;
          end
          else
          begin
        relative_bcast_chunk_o <= addr_i[LOG2_MCAST_GRANULARITY+`ADDR_OFFSET(DATA_WIDTH)-1:`ADDR_OFFSET(DATA_WIDTH)];
          end
        
        end
        else if(rvalid_o)
             begin
            match_Sampled          <= '0;
            routing_addr_Sampled   <= '0;
            relative_bcast_chunk_o <= '0;
         end
    end
    end
    
    
    
    
    bin_to_onehot #(.BIN_WIDTH(LOG2_NSLAVE), .ONEHOT_WIDTH(N_SLAVE) ) BIN_2_OH_ROUTING_I ( .bin(routing_addr_i) ,       .onehot(routing_addr_OH_d) );
    bin_to_onehot #(.BIN_WIDTH(LOG2_NSLAVE), .ONEHOT_WIDTH(N_SLAVE) ) BIN_2_OH_ROUTING_S ( .bin(routing_addr_Sampled) , .onehot(routing_addr_Sampled_OH_d) );
    
endmodule