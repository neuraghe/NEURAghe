///////////////////////////////////////////////////////////////////////////////
// Copyright 2009 iNoCs                                                      //
//                                                                           //
// name         /home/chester/Desktop/prj/XPIPES_fresh/inocs/flow/rtl/verilog/ni_initiator_67109007_CLUSTER_0/ni_initiator_67109007_CLUSTER_0.v                                     //
// author       Federico Angiolini - angiolini@inocs.com                     //
// author       Antonio Pullini - pullini@inocs.com                          //
// info         NI Initiator top-level module.  //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                    Automatically generated - don't edit                   //
//           File generated for topology: noc18_4sw_80bits_run0           //
///////////////////////////////////////////////////////////////////////////////

`include "noc_parameters.v"

module ni_initiator_67109007_CLUSTER_0(core_clk, noc_clk, Clock_div, rst, FLIT_in, VALID_in, FWDAUX1_in, BWDAUX1_out, BWDAUX2_out, BWDAUX3_out, FLIT_out, VALID_out, FWDAUX1_out, BWDAUX1_in, BWDAUX2_in, BWDAUX3_in, AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWCACHE, AWPROT, AWVALID, AWREADY, WID, WDATA, WSTRB, WLAST, WVALID, WREADY, ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARCACHE, ARPROT, ARVALID, ARREADY, RID, RDATA, RRESP, RLAST, RVALID, RREADY, BID, BRESP, BVALID, BREADY);

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
    input [`AXIIDWD - 1 : 0]        AWID;
    input [31 : 0]                  AWADDR;
    input [`AXILENWD - 1 : 0]       AWLEN;
    input [`AXISIZEWD - 1 : 0]      AWSIZE;
    input [`AXIBURSTWD - 1 : 0]     AWBURST;
    input [`AXILOCKWD - 1 : 0]      AWLOCK;
    input [`AXICACHEWD - 1 : 0]     AWCACHE;
    input [`AXIPROTWD - 1 : 0]      AWPROT;
    input                           AWVALID;
    output                          AWREADY;
    input [`AXIIDWD - 1 : 0]        WID;
    input [63 : 0]                  WDATA;
    input [7 : 0]                   WSTRB;
    input                           WLAST;
    input                           WVALID;
    output                          WREADY;
    output [`AXIIDWD - 1 : 0]       BID;
    output [`AXIRESPWD - 1 : 0]     BRESP;
    output                          BVALID;
    input                           BREADY;
    input [`AXIIDWD - 1 : 0]        ARID;
    input [31 : 0]                  ARADDR;
    input [`AXILENWD - 1 : 0]       ARLEN;
    input [`AXISIZEWD - 1 : 0]      ARSIZE;
    input [`AXIBURSTWD - 1 : 0]     ARBURST;
    input [`AXILOCKWD - 1 : 0]      ARLOCK;
    input [`AXICACHEWD - 1 : 0]     ARCACHE;
    input [`AXIPROTWD - 1 : 0]      ARPROT;
    input                           ARVALID;
    output                          ARREADY;
    output [`AXIIDWD - 1 : 0]       RID;
    output [63 : 0]                 RDATA;
    output [`AXIRESPWD - 1 : 0]     RRESP;
    output                          RLAST;
    output                          RVALID;
    input                           RREADY;

    // Internal linking wires - ni_request to out_buffer
    wire [79 : 0] flit_out;
    wire valid_out;
    wire stall_in;

    // Internal linking wires - in_buffer to ni_response
    wire [79 : 0] flit_in;
    wire valid_in;
    wire stall_out;

    wire [15 : 0] response_awaited;
    wire wait_read_response;
    wire [3 : 0] transaction_target;
    wire [3 : 0] SOURCE;
    wire [31 : 0] lut_address;
    wire [6 : 0] lut_path;
    wire failed_decoding;
    wire full_response;
    wire [15 : 0] decr_outs_wr_cntr;
    wire [15 : 0] decr_outs_rd_cntr;

    routing_initiator_67109007 nilut(.lut_address(lut_address), .lut_path(lut_path), .transaction_target(transaction_target), .failed_decoding(failed_decoding));

    assign SOURCE = 4'h2;

    in_buffer_6 #(.FLIT_WIDTH(80)) inbuff(.clk(noc_clk), .rst(rst), .FLIT_in(FLIT_in), .VALID_in(VALID_in), .FWDAUX1_in(FWDAUX1_in), .BWDAUX1_out(BWDAUX1_out), .BWDAUX2_out(BWDAUX2_out), .BWDAUX3_out(BWDAUX3_out), .flit_out(flit_in), .request_out(valid_in), .busy_out(stall_out));

    axi_ni_response #(.FLIT_WIDTH(80), .MAX_SUPPORTED_IDS(16), .AXIRDATAWD(64), .ENDIANNESS(0)) niresp(.core_clk(core_clk), .noc_clk(noc_clk), .rst(rst), .flit(flit_in), .valid(valid_in), .response_awaited(response_awaited), .wait_read_response(wait_read_response), .transaction_target(transaction_target), .stall(stall_out), .full_response(full_response), .decr_outs_wr_cntr(decr_outs_wr_cntr), .decr_outs_rd_cntr(decr_outs_rd_cntr), .RID(RID), .RDATA(RDATA), .RRESP(RRESP), .RLAST(RLAST), .RVALID(RVALID), .RREADY(RREADY), .BID(BID), .BRESP(BRESP), .BVALID(BVALID), .BREADY(BREADY));

    axi_ni_request #(.FLIT_WIDTH(80), .MAX_SUPPORTED_IDS(16), .LOG_AW_FIFO_DEPTH(1), .LOG_AR_FIFO_DEPTH(1), .LOG_WD_FIFO_DEPTH(1), .AXIAWADDRWD(32), .AXIARADDRWD(32), .AXIRDATAWD(64), .AXIWDATAWD(64), .ADDRESSMAPWD(32), .ENDIANNESS(0)) nireq(.core_clk(core_clk), .noc_clk(noc_clk), .Clock_div(Clock_div), .rst(rst), .stall(stall_in), .valid(valid_out), .decr_outs_wr_cntr(decr_outs_wr_cntr), .decr_outs_rd_cntr(decr_outs_rd_cntr), .response_awaited(response_awaited), .flit(flit_out), .SOURCE(SOURCE), .lut_address(lut_address), .lut_path(lut_path), .failed_decoding(failed_decoding), .AWID(AWID), .AWADDR(AWADDR), .AWLEN(AWLEN), .AWSIZE(AWSIZE), .AWBURST(AWBURST), .AWLOCK(AWLOCK), .AWCACHE(AWCACHE), .AWPROT(AWPROT), .AWVALID(AWVALID), .AWREADY(AWREADY), .WID(WID), .WDATA(WDATA), .WSTRB(WSTRB), .WLAST(WLAST), .WVALID(WVALID), .WREADY(WREADY), .ARID(ARID), .ARADDR(ARADDR), .ARLEN(ARLEN), .ARSIZE(ARSIZE), .ARBURST(ARBURST), .ARLOCK(ARLOCK), .ARCACHE(ARCACHE), .ARPROT(ARPROT), .ARVALID(ARVALID), .ARREADY(ARREADY));

    out_buffer #(.FLIT_WIDTH(80), .OUT_BUFFER_DEPTH(6), .LOG_OUT_BUFFER_DEPTH(3)) outbuff(.clk(noc_clk), .rst(rst), .FLIT_out(FLIT_out), .VALID_out(VALID_out), .FWDAUX1_out(FWDAUX1_out), .BWDAUX1_in(BWDAUX1_in), .BWDAUX2_in(BWDAUX2_in), .BWDAUX3_in(BWDAUX3_in), .data_in(flit_out), .write(valid_out), .full(stall_in));

endmodule
