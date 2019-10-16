`include "noc_parameters.v"

module axi_ni_receive_pinout_mask (mask_aw_command, mask_ar_command, mask_wd_command, received_id, received_address, received_data, decoded_LEN, decoded_SIZE, decoded_BURST, decoded_LOCK, decoded_CACHE, decoded_PROT, decoded_WSTRB, AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWCACHE, AWPROT, AWVALID, WID, WDATA, WSTRB, WVALID, ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARCACHE, ARPROT, ARVALID);

    parameter FLIT_WIDTH = 32;
    parameter AXIARADDRWD = 32;
    parameter AXIAWADDRWD = 32;
    parameter AXIWDATAWD = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    input                                mask_aw_command;
    input                                mask_ar_command;
    input                                mask_wd_command;
    input [`PACKETTRANSIDWD - 1 : 0]     received_id;
    input [`PACKETADDRESSWD - 1 : 0]     received_address;
    input [`PACKETWRITEDATAWD - 1 : 0]   received_data;
    input [`AXILENWD - 1 : 0]            decoded_LEN;
    input [`AXISIZEWD - 1 : 0]           decoded_SIZE;
    input [`AXIBURSTWD - 1 : 0]          decoded_BURST;
    input [`AXILOCKWD - 1 : 0]           decoded_LOCK;
    input [`AXICACHEWD - 1 : 0]          decoded_CACHE;
    input [`AXIPROTWD - 1 : 0]           decoded_PROT;
    input [AXIWDATAWD / 8 - 1 : 0]       decoded_WSTRB;
    output [`AXIIDWD - 1 : 0]	         AWID;
    output [AXIAWADDRWD - 1 : 0]         AWADDR;
    output [`AXILENWD - 1 : 0]           AWLEN;
    output [`AXISIZEWD - 1 : 0]          AWSIZE;
    output [`AXIBURSTWD - 1 : 0]         AWBURST;
    output [`AXILOCKWD - 1 : 0]          AWLOCK;
    output [`AXICACHEWD - 1 : 0]         AWCACHE;
    output [`AXIPROTWD - 1 : 0]          AWPROT;
    output                               AWVALID;
    output [`AXIIDWD - 1 : 0]            WID;
    output [AXIWDATAWD - 1 : 0]          WDATA;
    output [AXIWDATAWD / 8 - 1 : 0]	 WSTRB;
    output                               WVALID;
    output [`AXIIDWD - 1 : 0]            ARID;
    output [AXIARADDRWD - 1 : 0]         ARADDR;
    output [`AXILENWD - 1 : 0]           ARLEN;
    output [`AXISIZEWD - 1 : 0]          ARSIZE;
    output [`AXIBURSTWD - 1 : 0]         ARBURST;
    output [`AXILOCKWD - 1 : 0]          ARLOCK;
    output [`AXICACHEWD - 1 : 0]         ARCACHE;
    output [`AXIPROTWD - 1 : 0]          ARPROT;
    output                               ARVALID;

    assign AWID = (mask_aw_command ? 'h0 : received_id);
    assign AWADDR = (mask_aw_command ? 'h0 : received_address);
    assign AWLEN = (mask_aw_command ? 'h0 : decoded_LEN);
    assign AWSIZE = (mask_aw_command ? 'h0 : decoded_SIZE);
    assign AWBURST = (mask_aw_command ? 'h0 : decoded_BURST);
    assign AWLOCK = (mask_aw_command ? 'h0 : decoded_LOCK);
    assign AWCACHE = (mask_aw_command ? 'h0 : decoded_CACHE);
    assign AWPROT = (mask_aw_command ? 'h0 : decoded_PROT);
    assign AWVALID = ~mask_aw_command;

    assign ARID = (mask_ar_command ? 'h0 : received_id);
    assign ARADDR = (mask_ar_command ? 'h0 : received_address);
    assign ARLEN = (mask_ar_command ? 'h0 : decoded_LEN);
    assign ARSIZE = (mask_ar_command ? 'h0 : decoded_SIZE);
    assign ARBURST = (mask_ar_command ? 'h0 : decoded_BURST);
    assign ARLOCK = (mask_ar_command ? 'h0 : decoded_LOCK);
    assign ARCACHE = (mask_ar_command ? 'h0 : decoded_CACHE);
    assign ARPROT = (mask_ar_command ? 'h0 : decoded_PROT);
    assign ARVALID = ~mask_ar_command;

    assign WID = (mask_wd_command ? 'h0 : received_id);
    assign WDATA = (mask_wd_command ? 'h0 : received_data);
    assign WSTRB = (mask_wd_command ? 'h0 : decoded_WSTRB);
    assign WVALID = ~mask_wd_command;

endmodule
