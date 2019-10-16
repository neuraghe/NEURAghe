///////////////////////////////////////////////////////////////////////////////
// Copyright 2009 iNoCs                                                      //
//                                                                           //
// name         /home/chester/Desktop/prj/XPIPES_fresh/inocs/flow/rtl/verilog/ni_initiator_67109009_CLUSTER_1/routing_initiator_67109009.v                                     //
// author       Federico Angiolini - angiolini@inocs.com                     //
// author       Antonio Pullini - pullini@inocs.com                          //
// info         Routing tables for NI initiators.  //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                    Automatically generated - don't edit                   //
//           File generated for topology: noc18_4sw_80bits_run0           //
///////////////////////////////////////////////////////////////////////////////

`include "noc_parameters.v"

// Route encoding: first hop in the LSBs, last hop in the MSBs

module routing_initiator_67109009(lut_address, lut_path, transaction_target, failed_decoding);

    input [31 : 0] lut_address;
    output reg [6 : 0] lut_path;
    output reg [3 : 0] transaction_target;
    output reg failed_decoding;

    always @(lut_address)
        begin: compute_route
            if ( (lut_address >= 32'h1a000000) && (lut_address < 32'h1fffffff) )
            begin
                lut_path <= 7'b0000001;
                transaction_target <= 4'hc;
                failed_decoding <= 0;
            end
            else
              begin
                lut_path <= 0;
                transaction_target <= 0;
                failed_decoding <= 1;
              end
        end

endmodule
