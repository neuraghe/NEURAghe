///////////////////////////////////////////////////////////////////////////////
// Copyright 2009 iNoCs                                                      //
//                                                                           //
// name         /home/chester/Desktop/prj/XPIPES_fresh/inocs/flow/rtl/verilog/ni_target_67109013_CLUSTER_2/ni_target_67109013_CLUSTER_2.v                                     //
// author       Federico Angiolini - angiolini@inocs.com                     //
// author       Antonio Pullini - pullini@inocs.com                          //
// info         NI Target top-level module.  //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                    Automatically generated - don't edit                   //
//           File generated for topology: noc18_4sw_80bits_run0           //
///////////////////////////////////////////////////////////////////////////////

`include "noc_parameters.v"

module ni_target_67109013_CLUSTER_2(core_clk, noc_clk, Clock_div, rst, FLIT_in, VALID_in, FWDAUX1_in, BWDAUX1_out, BWDAUX2_out, BWDAUX3_out, FLIT_out, VALID_out, FWDAUX1_out, BWDAUX1_in, BWDAUX2_in, BWDAUX3_in, AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWCACHE, AWPROT, AWVALID, AWREADY, WID, WDATA, WSTRB, WLAST, WVALID, WREADY, ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARCACHE, ARPROT, ARVALID, ARREADY, RID, RDATA, RRESP, RLAST, RVALID, RREADY, BID, BRESP, BVALID, BREADY);

    input core_clk;
    input noc_clk;
    input [`COUNTERWD - 1 : 0] Clock_div;
    input rst;
    input [79 : 0] FLIT_in;
    input VALID_in;
    input FWDAUX1_in;
    output BWDAUX1_out;
    output BWDAUX2_out;
    output BWDAUX3_out;
    output [79 : 0] FLIT_out;
    output VALID_out;
    output FWDAUX1_out;
    input BWDAUX1_in;
    input BWDAUX2_in;
    input BWDAUX3_in;

    `include "axi_parameters.v"
    output [`AXIIDWD - 1 : 0]       AWID;
    output [31 : 0]                 AWADDR;
    output [`AXILENWD - 1 : 0]      AWLEN;
    output [`AXISIZEWD - 1 : 0]     AWSIZE;
    output [`AXIBURSTWD - 1 : 0]    AWBURST;
    output [`AXILOCKWD - 1 : 0]     AWLOCK;
    output [`AXICACHEWD - 1 : 0]    AWCACHE;
    output [`AXIPROTWD - 1 : 0]     AWPROT;
    output                          AWVALID;
    input                           AWREADY;
    output [`AXIIDWD - 1 : 0]       WID;
    output [63 : 0]                 WDATA;
    output [7 : 0]                  WSTRB;
    output                          WLAST;
    output                          WVALID;
    input                           WREADY;
    input [`AXIIDWD - 1 : 0]        BID;
    input [`AXIRESPWD - 1 : 0]      BRESP;
    input                           BVALID;
    output                          BREADY;
    output [`AXIIDWD - 1 : 0]       ARID;
    output [31 : 0]                 ARADDR;
    output [`AXILENWD - 1 : 0]      ARLEN;
    output [`AXISIZEWD - 1 : 0]     ARSIZE;
    output [`AXIBURSTWD - 1 : 0]    ARBURST;
    output [`AXILOCKWD - 1 : 0]     ARLOCK;
    output [`AXICACHEWD - 1 : 0]    ARCACHE;
    output [`AXIPROTWD - 1 : 0]     ARPROT;
    output                          ARVALID;
    input                           ARREADY;
    input [`AXIIDWD - 1 : 0]        RID;
    input [63 : 0]                  RDATA;
    input [`AXIRESPWD - 1 : 0]      RRESP;
    input                           RLAST;
    input                           RVALID;
    output                          RREADY;

    // Internal linking wires - ni_resend to out_buffer
    wire [79 : 0] flit_out;
    wire valid_out;
    wire stall_in;

    // Internal linking wires - in_buffer to ni_receive
    wire [79 : 0] flit_in;
    wire valid_in;
    wire stall_out;

    wire new_packet_type_is_read;
    wire [`MAX_SUPPORTED_ID_WD - 1 : 0] new_received_id;
    wire [3 : 0] new_message_source;
    wire [3 : 0] SOURCE;
    wire [3 : 0] lut_address;
    wire [6 : 0] lut_path;
    wire start_receive_response;
    wire enable_new_request;
    wire new_message_is_locked;
    wire [15 : 0] wrr_wfull;
    wire [15 : 0] rdr_wfull;
    wire [15 : 0] wrr_winc;
    wire [15 : 0] rdr_winc;

    routing_target_67109013 nilut(.lut_address(lut_address), .lut_path(lut_path));

    assign SOURCE = 4'h8;

    axi_ni_resend #(.FLIT_WIDTH(80), .MAX_SUPPORTED_IDS(16), .LOG_RR_FIFO_DEPTH(1), .LOG_BR_FIFO_DEPTH(1), .AXIRDATAWD(64), .ENDIANNESS(0)) nires(.core_clk(core_clk), .noc_clk(noc_clk), .Clock_div(Clock_div), .rst(rst), .new_packet_type_is_read(new_packet_type_is_read), .new_message_source(new_message_source), .new_message_is_locked(new_message_is_locked), .wrr_winc(wrr_winc), .rdr_winc(rdr_winc), .wrr_wfull(wrr_wfull), .rdr_wfull(rdr_wfull), .stall(stall_in), .start_receive_response(start_receive_response), .valid(valid_out), .flit(flit_out), .enable_new_request(enable_new_request), .SOURCE(SOURCE), .lut_address(lut_address), .lut_path(lut_path),  .RID(RID), .RDATA(RDATA), .RRESP(RRESP), .RLAST(RLAST), .RVALID(RVALID), .RREADY(RREADY), .BID(BID), .BRESP(BRESP), .BVALID(BVALID), .BREADY(BREADY));

    out_buffer #(.FLIT_WIDTH(80), .OUT_BUFFER_DEPTH(6), .LOG_OUT_BUFFER_DEPTH(3)) outbuff(.clk(noc_clk), .rst(rst), .FLIT_out(FLIT_out), .VALID_out(VALID_out), .FWDAUX1_out(FWDAUX1_out), .BWDAUX1_in(BWDAUX1_in), .BWDAUX2_in(BWDAUX2_in), .BWDAUX3_in(BWDAUX3_in), .data_in(flit_out), .write(valid_out), .full(stall_in));

    in_buffer_6 #(.FLIT_WIDTH(80)) inbuff(.clk(noc_clk), .rst(rst), .FLIT_in(FLIT_in), .VALID_in(VALID_in), .FWDAUX1_in(FWDAUX1_in), .BWDAUX1_out(BWDAUX1_out), .BWDAUX2_out(BWDAUX2_out), .BWDAUX3_out(BWDAUX3_out), .flit_out(flit_in), .request_out(valid_in), .busy_out(stall_out));

    axi_ni_receive #(.FLIT_WIDTH(80), .MAX_SUPPORTED_IDS(16), .AXIAWADDRWD(32), .AXIARADDRWD(32), .AXIWDATAWD(64), .ENDIANNESS(0)) nirecv(.core_clk(core_clk), .noc_clk(noc_clk), .rst(rst), .flit(flit_in), .valid(valid_in), .stall(stall_out), .wrr_wfull(wrr_wfull), .rdr_wfull(rdr_wfull), .wrr_winc(wrr_winc), .rdr_winc(rdr_winc), .message_source(new_message_source), .message_is_locked(new_message_is_locked), .packet_type_is_read(new_packet_type_is_read), .AWID(AWID), .AWADDR(AWADDR), .AWLEN(AWLEN), .AWSIZE(AWSIZE), .AWBURST(AWBURST), .AWLOCK(AWLOCK), .AWCACHE(AWCACHE), .AWPROT(AWPROT), .AWVALID(AWVALID), .AWREADY(AWREADY), .WID(WID), .WDATA(WDATA), .WSTRB(WSTRB), .WLAST(WLAST), .WVALID(WVALID), .WREADY(WREADY), .ARID(ARID), .ARADDR(ARADDR), .ARLEN(ARLEN), .ARSIZE(ARSIZE), .ARBURST(ARBURST), .ARLOCK(ARLOCK), .ARCACHE(ARCACHE), .ARPROT(ARPROT), .ARVALID(ARVALID), .ARREADY(ARREADY));

endmodule
