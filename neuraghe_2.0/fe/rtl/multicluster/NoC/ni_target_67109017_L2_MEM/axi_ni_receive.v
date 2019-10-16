`include "noc_parameters.v"

module axi_ni_receive(noc_clk, core_clk, rst, AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWCACHE, AWPROT, AWVALID, AWREADY, WID, WDATA, WSTRB, WLAST, WVALID, WREADY, ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARCACHE, ARPROT, ARVALID, ARREADY, flit, valid, stall, wrr_wfull, rdr_wfull, wrr_winc, rdr_winc, message_source, message_is_locked, packet_type_is_read);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter AXIARADDRWD = 32;
    parameter AXIAWADDRWD = 32;
    parameter AXIWDATAWD = 32;
    parameter MAX_SUPPORTED_IDS = 16;
    parameter ENDIANNESS = `LITTLE_ENDIAN;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    input noc_clk;
    input core_clk;
    input rst;
    output [`AXIIDWD - 1 : 0]         AWID;
    output [AXIAWADDRWD - 1 : 0]      AWADDR;
    output [`AXILENWD - 1 : 0]        AWLEN;
    output [`AXISIZEWD - 1 : 0]       AWSIZE;
    output [`AXIBURSTWD - 1 : 0]      AWBURST;
    output [`AXILOCKWD - 1 : 0]       AWLOCK;
    output [`AXICACHEWD - 1 : 0]      AWCACHE;
    output [`AXIPROTWD - 1 : 0]       AWPROT;
    output                            AWVALID;
    input                             AWREADY;
    output [`AXIIDWD - 1 : 0]         WID;
    output [AXIWDATAWD - 1 : 0]       WDATA;
    output [(AXIWDATAWD / 8) - 1 : 0] WSTRB;
    output                            WLAST;
    output	                      WVALID;
    input	                      WREADY;
    output [`AXIIDWD - 1 : 0]         ARID;
    output [AXIARADDRWD - 1 : 0]      ARADDR;
    output [`AXILENWD - 1 : 0]        ARLEN;
    output [`AXISIZEWD - 1 : 0]       ARSIZE;
    output [`AXIBURSTWD - 1 : 0]      ARBURST;
    output [`AXILOCKWD - 1 : 0]       ARLOCK;
    output [`AXICACHEWD - 1 : 0]      ARCACHE;
    output [`AXIPROTWD - 1 : 0]       ARPROT;
    output                            ARVALID;
    input                             ARREADY;
    // Input buffer
    input [FLIT_WIDTH - 1 : 0] flit;
    input valid;
    output stall;
    // ni_resend
    input [MAX_SUPPORTED_IDS - 1 : 0] wrr_wfull;
    input [MAX_SUPPORTED_IDS - 1 : 0] rdr_wfull;
    output [MAX_SUPPORTED_IDS - 1 : 0] wrr_winc;
    output [MAX_SUPPORTED_IDS - 1 : 0] rdr_winc;
    output [`SOURCEWD - 1 : 0] message_source;
    output message_is_locked;
    output packet_type_is_read;
    // pinout_mask
    wire mask_aw_command;
    wire mask_ar_command;
    wire mask_wd_command;
    wire transaction_complete;
    wire [`PACKETTRANSIDWD - 1 : 0] received_id;
    wire [`PACKETADDRESSWD - 1 : 0] received_address;
    wire [`PACKETWRITEDATAWD - 1 : 0] received_data;
    wire [`AXILENWD - 1 : 0] decoded_LEN;
    wire [`AXISIZEWD - 1 : 0] decoded_SIZE;
    wire [`AXIBURSTWD - 1 : 0] decoded_BURST;
    wire [`AXILOCKWD - 1 : 0] decoded_LOCK;
    wire [`AXICACHEWD - 1 : 0] decoded_CACHE;
    wire [`AXIPROTWD - 1 : 0] decoded_PROT;
    wire [AXIWDATAWD / 8 - 1 : 0] decoded_WSTRB;
    // decoding block
    wire [`PACKETATTRIBUTEWD - 1 : 0] received_attributes;
    wire [`PACKETBURSTSEQWD - 1 : 0] received_burst_sequence;
    wire [`PACKETBURSTINCRWD - 1 : 0] received_burst_increment;
    wire [`PACKETBYTEENABLEWD - 1 : 0] received_byte_enables_header;
    wire [`PACKETBYTEENABLEWD - 1 : 0] received_byte_enables_payload;
    wire [`PACKETBURSTLENGTHWD - 1 : 0] received_burst_length;
    wire received_burst_precise;
    // FSM
    wire sample_payload;
    wire [`COUNTERFLITWD - 1 : 0] flit_count;
    wire full_header;
    wire full_payload;
    wire packet_finished;
    wire receiving_header;
    wire receiving_payload;
    wire clear_flit_count;
    wire sample_header;
    wire [`COUNTERFLITWD - 1 : 0] header_flits;
    wire [`COUNTERFLITWD - 1 : 0] read_payload_flits;
    wire [`COUNTERFLITWD - 1 : 0] write_payload_flits;

    axi_ni_receive_pinout_mask #(.FLIT_WIDTH(FLIT_WIDTH), .AXIARADDRWD(AXIARADDRWD), .AXIAWADDRWD(AXIAWADDRWD), .AXIWDATAWD(AXIWDATAWD)) pinout_mask(.mask_aw_command(mask_aw_command), .mask_ar_command(mask_ar_command), .mask_wd_command(mask_wd_command), .received_id(received_id), .received_address(received_address), .received_data(received_data), .decoded_LEN(decoded_LEN), .decoded_SIZE(decoded_SIZE), .decoded_BURST(decoded_BURST), .decoded_LOCK(decoded_LOCK), .decoded_CACHE(decoded_CACHE), .decoded_PROT(decoded_PROT), .decoded_WSTRB(decoded_WSTRB), .AWID(AWID), .AWADDR(AWADDR), .AWLEN(AWLEN), .AWSIZE(AWSIZE), .AWBURST(AWBURST), .AWLOCK(AWLOCK), .AWCACHE(AWCACHE), .AWPROT(AWPROT), .AWVALID(AWVALID), .WID(WID), .WDATA(WDATA), .WSTRB(WSTRB), .WVALID(WVALID), .ARID(ARID), .ARADDR(ARADDR), .ARLEN(ARLEN), .ARSIZE(ARSIZE), .ARBURST(ARBURST), .ARLOCK(ARLOCK), .ARCACHE(ARCACHE), .ARPROT(ARPROT), .ARVALID(ARVALID));

    axi_ni_receive_payload_register #(.FLIT_WIDTH(FLIT_WIDTH), .ENDIANNESS(ENDIANNESS)) payload_register(.clk(noc_clk), .rst(rst), .flit(flit), .sample_payload(sample_payload), .flit_count(flit_count), .received_byte_enables_payload(received_byte_enables_payload), .received_data(received_data));

    axi_ni_receive_fsm #(.MAX_SUPPORTED_IDS(MAX_SUPPORTED_IDS)) fsm(.clk(core_clk), .rst(rst), .full_header(full_header), .full_payload(full_payload), .packet_finished(packet_finished), .packet_type_is_read(packet_type_is_read), .AWREADY(AWREADY), .WREADY(WREADY), .ARREADY(ARREADY), .WLAST(WLAST), .received_id(received_id), .wrr_wfull(wrr_wfull), .rdr_wfull(rdr_wfull), .wrr_winc(wrr_winc), .rdr_winc(rdr_winc), .receiving_header(receiving_header), .receiving_payload(receiving_payload), .mask_aw_command(mask_aw_command), .mask_ar_command(mask_ar_command), .mask_wd_command(mask_wd_command), .transaction_complete(transaction_complete), .clear_flit_count(clear_flit_count));

    axi_ni_receive_header_register #(.FLIT_WIDTH(FLIT_WIDTH)) header_register(.clk(noc_clk), .rst(rst), .flit(flit), .sample_header(sample_header), .flit_count(flit_count), .packet_type_is_read(packet_type_is_read), .message_source(message_source), .received_attributes(received_attributes), .received_burst_length(received_burst_length), .received_burst_sequence(received_burst_sequence), .received_burst_increment(received_burst_increment), .received_burst_precise(received_burst_precise), .received_byte_enables_header(received_byte_enables_header), .received_address(received_address), .received_id(received_id));

    ni_admit_control #(.FLIT_WIDTH(FLIT_WIDTH)) admit_control(.clk(noc_clk), .rst(rst), .valid(valid), .flit(flit), .clear_flit_count(clear_flit_count), .receiving_header(receiving_header), .receiving_payload(receiving_payload), .packet_type_is_read(packet_type_is_read), .header_flits(header_flits), .read_payload_flits(read_payload_flits), .write_payload_flits(write_payload_flits), .full_header(full_header), .full_payload(full_payload), .flit_count(flit_count), .stall(stall), .sample_header(sample_header), .sample_payload(sample_payload), .packet_finished(packet_finished));

    axi_ni_receive_decoder #(.FLIT_WIDTH(FLIT_WIDTH), .AXIWDATAWD(AXIWDATAWD)) receive_decoder(.received_burst_length(received_burst_length), .received_burst_sequence(received_burst_sequence), .received_burst_increment(received_burst_increment), .received_burst_precise(received_burst_precise), .received_attributes(received_attributes), .received_byte_enables_payload(received_byte_enables_payload), .decoded_LEN(decoded_LEN), .decoded_SIZE(decoded_SIZE), .decoded_BURST(decoded_BURST), .decoded_LOCK(decoded_LOCK), .decoded_CACHE(decoded_CACHE), .decoded_PROT(decoded_PROT), .decoded_WSTRB(decoded_WSTRB));

    assign write_payload_flits = WRITE_REQ_PAYLOADFLITS - 1;
    assign read_payload_flits = READ_REQ_PAYLOADFLITS - 1;
    assign header_flits = REQ_HEADERFLITS - 1;

    assign message_is_locked = (decoded_LOCK == `AXILOCK_EXCL || decoded_LOCK == `AXILOCK_LOCKED);

endmodule
