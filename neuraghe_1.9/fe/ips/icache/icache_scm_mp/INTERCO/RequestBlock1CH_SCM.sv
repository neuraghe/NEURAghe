
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
// Description:    Arbitration tree: This block performs the arbitration      //
//                 between the N_MASTER requests. The arbitration is          //
//                 distributed in the several arbitration primitives that     //
//                 compose this routing block. The arbistrtion is round robin //
//                 and the round robin flag generator is embedded inside this //
//                 block. Flag updating happens only when requests are grant  //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - Changes in the ADDRESS_WIDTH ( 26/07/2011 )                //
// Revision v0.3 - Code Restyling ( 19/02/2015 )                              //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module RequestBlock1CH_SCM
#(
    parameter ADDR_MEM_WIDTH = 12,
    parameter N_CH0          = 16,
    parameter DATA_WIDTH     = 32,
    parameter N_WAYS         = 4
)
(
    // CHANNEL CH0 --> (example: Used for xP70s) 
    input  logic [N_CH0-1:0]                     data_req_CH0_i,
    input  logic [N_CH0-1:0][ADDR_MEM_WIDTH-1:0] data_add_CH0_i, // Memory address + T&S bit
    input  logic [N_CH0-1:0][DATA_WIDTH-1:0]     data_wdata_CH0_i,
    input  logic [N_CH0-1:0][N_WAYS-1:0]         data_way_CH0_i,
    output logic [N_CH0-1:0]                     data_gnt_CH0_o,


    // -----------------             MEMORY                    -------------------
    // ---------------- RequestBlock OUTPUT (Connected to MEMORY) ----------------
    output logic                                 data_req_o,
    output logic [ADDR_MEM_WIDTH-1:0]            data_add_o,
    output logic [DATA_WIDTH-1:0]                data_wdata_o,
    output logic [N_WAYS-1:0]                    data_way_o,
    input  logic                                 data_gnt_i,


    input  logic                                 clk,
    input  logic                                 rst_n
);



    // CHANNEL CH0 --> (example: Used for Processing Elements / CORES) 
    logic [2**$clog2(N_CH0)-1:0]                                data_req_CH0_int;
    logic [2**$clog2(N_CH0)-1:0][ADDR_MEM_WIDTH-1:0]            data_add_CH0_int;
    logic [2**$clog2(N_CH0)-1:0][DATA_WIDTH-1:0]                data_wdata_CH0_int;
    logic [2**$clog2(N_CH0)-1:0][N_WAYS-1:0]                    data_way_CH0_int;
    logic [2**$clog2(N_CH0)-1:0]                                data_gnt_CH0_int;



generate

    if(2**$clog2(N_CH0) != N_CH0) // if N_CH0 is not power of 2 --> then use power 2 ports
    begin : _DUMMY_CH0_PORTS_
      
      logic [2**$clog2(N_CH0)-N_CH0 -1 :0]                                data_req_CH0_dummy;
      logic [2**$clog2(N_CH0)-N_CH0 -1 :0][ADDR_MEM_WIDTH-1:0]            data_add_CH0_dummy; // Memory address + T&S bit
      logic [2**$clog2(N_CH0)-N_CH0 -1 :0][DATA_WIDTH-1:0]                data_wdata_CH0_dummy;
      logic [2**$clog2(N_CH0)-N_CH0 -1 :0][N_WAYS-1:0]                    data_way_CH0_dummy;
      logic [2**$clog2(N_CH0)-N_CH0 -1 :0]                                data_gnt_CH0_dummy;

      assign data_req_CH0_dummy    = '0 ;  
      assign data_add_CH0_dummy    = '0 ;    
      assign data_wdata_CH0_dummy  = '0 ;
      assign data_way_CH0_dummy    = '0 ;

      assign data_req_CH0_int      = {  data_req_CH0_dummy  ,     data_req_CH0_i     };
      assign data_add_CH0_int      = {  data_add_CH0_dummy  ,     data_add_CH0_i     };
      assign data_wdata_CH0_int    = {  data_wdata_CH0_dummy  ,   data_wdata_CH0_i   };
      assign data_way_CH0_int      = {  data_way_CH0_dummy    ,   data_way_CH0_i     };

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







    if(N_CH0 != 1) // Means 2 or more MAster, it requires Arbitration Tree and eires between Arb tree and Test and set interface
    begin : POLY_CH0

        ArbitrationTree_SCM 
        #(
            .ADDR_WIDTH     ( ADDR_MEM_WIDTH     ),
            .N_MASTER       ( 2**$clog2(N_CH0)   ),
            .DATA_WIDTH     ( DATA_WIDTH         ),
            .MAX_COUNT      ( N_CH0-1            ),
            .N_WAYS         ( N_WAYS             )
        )
        i_ArbitrationTree 
        (
            .clk            ( clk                ),
            .rst_n          ( rst_n              ),
            // INPUTS
            .data_req_i     ( data_req_CH0_int   ),
            .data_add_i     ( data_add_CH0_int   ),
            .data_wdata_i   ( data_wdata_CH0_int ),
            .data_way_i     ( data_way_CH0_int   ),
            .data_gnt_o     ( data_gnt_CH0_int   ),

            // OUTPUTS
            .data_req_o     ( data_req_o         ),
            .data_add_o     ( data_add_o         ),
            .data_wdata_o   ( data_wdata_o       ),
            .data_way_o     ( data_way_o         ),
            .data_gnt_i     ( data_gnt_i         )
        );

    end 
    else 
    begin : MONO_CH0
        assign data_req_o   = data_req_CH0_int;
        assign data_add_o   = data_add_CH0_int;
        assign data_wdata_o = data_wdata_CH0_int;
        assign data_way_o   = data_way_CH0_int;
        assign data_gnt_CH0_int = data_gnt_i;
    end
  endgenerate


endmodule