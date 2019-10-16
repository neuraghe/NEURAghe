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
// Module Name:    ResponseGen                                                //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    This Block Replace the test and set Module when The log    //
//                 interconnect is used as read only interconnect.            //
//                 It provides the data_r_valid_o and data_r_ID_o             //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created (19/02/2013 )                                 //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "icache_parameters.v"

module ResponseGen_IC
#(
    parameter ID_WIDTH       = `N_MASTER + `N_DMA
)
(
    input  logic				clk,
    input  logic				rst_n,
    input  logic				data_req_i,
    input  logic [ID_WIDTH-1:0] 		data_ID_i,
    output logic [ID_WIDTH-1:0] 		data_r_ID_o,
    output logic				data_r_valid_o
);


    always_ff @(posedge clk, negedge rst_n)
    begin : r_valid
        if(rst_n == 1'b0)
        begin
          data_r_valid_o <= 1'b0;
          data_r_ID_o    <= '0;
        end
        else
        begin
          data_r_valid_o <= data_req_i;
          if(data_req_i)// Allow for Clock Gating insertion
            data_r_ID_o    <= data_ID_i; 
        end
    end



endmodule
