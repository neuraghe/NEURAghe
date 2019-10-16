`include "noc_parameters.v"

module axi_ni_request(noc_clk, Clock_div, core_clk, rst, AWID, AWADDR, AWLEN, AWSIZE, AWBURST, AWLOCK, AWCACHE, AWPROT, AWVALID, AWREADY, WID, WDATA, WSTRB, WLAST, WVALID, WREADY, ARID, ARADDR, ARLEN, ARSIZE, ARBURST, ARLOCK, ARCACHE, ARPROT, ARVALID, ARREADY, SOURCE, lut_path, failed_decoding, lut_address, decr_outs_wr_cntr, decr_outs_rd_cntr, response_awaited, stall, valid, flit);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter AXIARADDRWD = 32;
    parameter AXIAWADDRWD = 32;
    parameter AXIRDATAWD = 32;
    parameter AXIWDATAWD = 32;
    parameter ADDRESSMAPWD = 8;
    parameter ENDIANNESS = `LITTLE_ENDIAN;
    parameter MAX_SUPPORTED_IDS = 16;
    parameter ID_MAP = 16'b1111111111111111;
    parameter LOG_MAX_OUTSTANDING_WRITES_PER_ID = 4;
    parameter LOG_MAX_OUTSTANDING_READS_PER_ID = 0; // TODO this is safe but a bit overcautious, could be done for reads to different slaves only
    parameter LOG_AW_FIFO_DEPTH = 2;
    parameter LOG_AR_FIFO_DEPTH = 2;
    parameter LOG_WD_FIFO_DEPTH = 2;
    `include "axi_parameters.v"
    `include "ni_parameters.v"
    // Write/Read address channel buffer width
    localparam AXIWSTRBWD = AXIWDATAWD / 8;
    localparam AXI_AW_WD = AXIAWADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD + `AXILOCKWD + `AXICACHEWD + `AXIPROTWD;
    localparam AXI_AR_WD = AXIARADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD + `AXILOCKWD + `AXICACHEWD + `AXIPROTWD;
    localparam AXI_WD_WD = AXIWDATAWD + AXIWSTRBWD + `AXILASTWD;

    input noc_clk;
    input [`COUNTERWD - 1 : 0] Clock_div;
    input core_clk;
    input rst;

    input [`AXIIDWD - 1 : 0]         AWID;
    input [AXIAWADDRWD - 1 : 0]      AWADDR;
    input [`AXILENWD - 1 : 0]        AWLEN;
    input [`AXISIZEWD - 1 : 0]       AWSIZE;
    input [`AXIBURSTWD - 1 : 0]      AWBURST;
    input [`AXILOCKWD - 1 : 0]       AWLOCK;
    input [`AXICACHEWD - 1 : 0]      AWCACHE;
    input [`AXIPROTWD - 1 : 0]       AWPROT;
    input                            AWVALID;
    output                           AWREADY;
    input [`AXIIDWD - 1 : 0]         WID;
    input [AXIWDATAWD - 1 : 0]       WDATA;
    input [(AXIWDATAWD / 8) - 1 : 0] WSTRB;
    input                            WLAST;
    input	                     WVALID;
    output	                     WREADY;
    input [`AXIIDWD - 1 : 0]         ARID;
    input [AXIARADDRWD - 1 : 0]      ARADDR;
    input [`AXILENWD - 1 : 0]        ARLEN;
    input [`AXISIZEWD - 1 : 0]       ARSIZE;
    input [`AXIBURSTWD - 1 : 0]      ARBURST;
    input [`AXILOCKWD - 1 : 0]       ARLOCK;
    input [`AXICACHEWD - 1 : 0]      ARCACHE;
    input [`AXIPROTWD - 1 : 0]       ARPROT;
    input                            ARVALID;
    output                           ARREADY;
    // to routing lut
    input [`SOURCEWD - 1 : 0] SOURCE;
    input [`ROUTEWD - 1 : 0] lut_path;
    input failed_decoding;
    output [ADDRESSMAPWD - 1 : 0] lut_address;
    // to ni_response
    input [MAX_SUPPORTED_IDS - 1 : 0] decr_outs_wr_cntr;
    input [MAX_SUPPORTED_IDS - 1 : 0] decr_outs_rd_cntr;
    output [MAX_SUPPORTED_IDS - 1 : 0] response_awaited;
    //to output buffer or NoC
    input stall;
    output valid;
    output [FLIT_WIDTH - 1 : 0] flit;

    wire  [MAX_SUPPORTED_IDS - 1 : 0] outs_rd_ovfl; // outstanding read overflow
    wire  [MAX_SUPPORTED_IDS - 1 : 0] outs_wr_ovfl; // outstanding write overflow
    wire  [MAX_SUPPORTED_IDS - 1 : 0] outs_rd_unfl; // outstanding read underflow
    wire  [MAX_SUPPORTED_IDS - 1 : 0] outs_wr_unfl; // outstanding write underflow
    wire  [MAX_SUPPORTED_IDS - 1 : 0] outs_rd_max;  // outstanding read max
    wire  [MAX_SUPPORTED_IDS - 1 : 0] outs_wr_max;  // outstanding write max

    wire send_message;
    wire [`COUNTERFLITWD - 1 : 0] num_flit_to_transmit;
    wire last_clock_beat;
    wire tx_gone;
    wire [`COUNTERFLITWD - 1 : 0] flit_counter;
    wire is_payload;
    wire [REQ_PAYLOADLENGTH - 1 : 0] payload;
    wire [BASE_WIDTH - 1 : 0] payload_chunk;
    wire sample_payload;
    wire [REQ_HEADERLENGTH - 1 : 0] header;
    wire [BASE_WIDTH - 1 : 0] header_chunk;
    wire sample_header;
    wire [`FTYPEWD - 1 : 0] flit_sequence;
    wire [`FTYPEWD - 1 : 0] flit_type;
    wire write_select;
    wire [`PACKETBURSTLENGTHWD - 1 : 0] burst_length;
    wire [`PACKETBURSTSEQWD - 1 : 0] burst_sequence;
    wire [`PACKETBURSTINCRWD - 1 : 0] burst_increment;
    wire burst_precise;
    wire [`PACKETBYTEENABLEWD - 1 : 0] byte_enables;
    wire [`PACKETCOMMANDWD - 1 : 0] command;
    wire [`PACKETADDRESSWD - 1 : 0] address;

    // Buffer signals
    wire [MAX_SUPPORTED_IDS - 1 : 0]    aw_rempty;
    wire [MAX_SUPPORTED_IDS - 1 : 0]    aw_wfull;
    wire [MAX_SUPPORTED_IDS - 1 : 0]    aw_winc;
    wire [MAX_SUPPORTED_IDS - 1 : 0]    aw_rinc;
    wire [AXI_AW_WD - 1 : 0]            aw_wdata;
    wire [AXI_AW_WD - 1 : 0]            aw_rdata[MAX_SUPPORTED_IDS - 1 : 0];
    wire [LOG_AW_FIFO_DEPTH : 0]        aw_words[MAX_SUPPORTED_IDS - 1 : 0];

    wire [MAX_SUPPORTED_IDS - 1 : 0]    ar_rempty;
    wire [MAX_SUPPORTED_IDS - 1 : 0]    ar_wfull;
    wire [MAX_SUPPORTED_IDS - 1 : 0]    ar_winc;
    wire [MAX_SUPPORTED_IDS - 1 : 0]    ar_rinc;
    wire [AXI_AR_WD - 1 : 0]            ar_wdata;
    wire [AXI_AR_WD - 1 : 0]            ar_rdata[MAX_SUPPORTED_IDS - 1 : 0];
    wire [LOG_AR_FIFO_DEPTH : 0]        ar_words[MAX_SUPPORTED_IDS - 1 : 0];

    wire [MAX_SUPPORTED_IDS - 1 : 0]    wd_rempty;
    wire [MAX_SUPPORTED_IDS - 1 : 0]    wd_wfull;
    wire [MAX_SUPPORTED_IDS - 1 : 0]    wd_winc;
    wire [MAX_SUPPORTED_IDS - 1 : 0]    wd_rinc;
    wire [AXI_WD_WD - 1 : 0]            wd_wdata;
    wire [AXI_WD_WD - 1 : 0]            wd_rdata[MAX_SUPPORTED_IDS - 1 : 0];
    wire [LOG_WD_FIFO_DEPTH : 0]        wd_words[MAX_SUPPORTED_IDS - 1 : 0];

    wire [`AXIIDWD - 1 : 0] atid;          // current transaction ID

    wire [AXIWDATAWD - 1 : 0] wdata;       // current write data 
    wire [AXIWSTRBWD - 1 : 0] wstrb;       // current write strobe 
    wire wlast;                            // current write last
    wire [AXIARADDRWD - 1 : 0] araddr;     // current read address
    wire [AXIAWADDRWD - 1 : 0] awaddr;     // current write address
    wire [`AXIPROTWD - 1 : 0] aprotection; // current protection
    wire [`AXICACHEWD - 1 : 0] acache;     // current cache
    wire [`AXILOCKWD - 1 : 0] alock;       // current lock
    wire [`AXILENWD - 1 : 0] alen;         // current burst length
    wire [`AXISIZEWD - 1 : 0] asize;       // current burst size
    wire [`AXIBURSTWD - 1 : 0] aburst;     // current burst type

    assign wdata = wd_rdata[atid][AXIWDATAWD - 1 : 0];
    assign wstrb = wd_rdata[atid][AXIWDATAWD + AXIWSTRBWD - 1 : AXIWDATAWD];
    assign wlast = wd_rdata[atid][AXIWDATAWD + AXIWSTRBWD + `AXILASTWD - 1 : AXIWDATAWD + AXIWSTRBWD];
    assign araddr = ar_rdata[atid][AXIARADDRWD - 1 : 0];
    assign awaddr = aw_rdata[atid][AXIAWADDRWD - 1 : 0];
    assign aprotection  = (write_select == 1'b1 ? aw_rdata[atid][AXIAWADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD + `AXILOCKWD + `AXICACHEWD + `AXIPROTWD - 1 : AXIAWADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD + `AXILOCKWD + `AXICACHEWD] : ar_rdata[atid][AXIARADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD + `AXILOCKWD + `AXICACHEWD + `AXIPROTWD - 1 : AXIARADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD + `AXILOCKWD + `AXICACHEWD]);
    assign acache = (write_select == 1'b1 ? aw_rdata[atid][AXIAWADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD + `AXILOCKWD + `AXICACHEWD -1 : AXIAWADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD + `AXILOCKWD] : ar_rdata[atid][AXIARADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD + `AXILOCKWD + `AXICACHEWD - 1 : AXIARADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD + `AXILOCKWD]);
    assign alock  = (write_select == 1'b1 ? aw_rdata[atid][AXIAWADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD + `AXILOCKWD - 1 : AXIAWADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD] : ar_rdata[atid][AXIARADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD + `AXILOCKWD - 1 : AXIARADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD]);
    assign alen = (write_select == 1'b1 ? aw_rdata[atid][AXIAWADDRWD + `AXILENWD - 1 : AXIAWADDRWD] : ar_rdata[atid][AXIARADDRWD + `AXILENWD - 1 : AXIARADDRWD]);
    assign asize = (write_select == 1'b1 ? aw_rdata[atid][AXIAWADDRWD + `AXILENWD + `AXISIZEWD - 1 : AXIAWADDRWD + `AXILENWD] : ar_rdata[atid][AXIARADDRWD + `AXILENWD + `AXISIZEWD - 1 : AXIARADDRWD + `AXILENWD]);
    assign aburst = (write_select == 1'b1 ? aw_rdata[atid][AXIAWADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD - 1 : AXIAWADDRWD + `AXILENWD + `AXISIZEWD] : ar_rdata[atid][AXIARADDRWD + `AXILENWD + `AXISIZEWD + `AXIBURSTWD - 1 : AXIARADDRWD + `AXILENWD + `AXISIZEWD]);

    // Flow control: Write Address Channel, Read Address Channel, Write Data Channel
    assign AWREADY = !aw_wfull[AWID];
    assign ARREADY = !ar_wfull[ARID];
    assign WREADY = !wd_wfull[WID];
    // Buffer inputs: Write Address Channel, Read Address Channel, Write Data Channel
    assign aw_wdata = {AWPROT, AWCACHE, AWLOCK, AWBURST, AWSIZE, AWLEN, AWADDR};
    assign ar_wdata = {ARPROT, ARCACHE, ARLOCK, ARBURST, ARSIZE, ARLEN, ARADDR};
    assign wd_wdata = {WLAST, WSTRB, WDATA};
    // Buffer control: Write Address Channel, Read Address Channel, Write Data Channel
    assign aw_winc = 'h0 | ((AWVALID && AWREADY) ? (1 << AWID) : 'h0);
    assign ar_winc = 'h0 | ((ARVALID && ARREADY) ? (1 << ARID) : 'h0);
    assign wd_winc = 'h0 | ((WVALID && WREADY)   ? (1 << WID)  : 'h0);

    // Actual buffer instantiation
    genvar i;
    generate
        for (i = 0; i < MAX_SUPPORTED_IDS; i = i + 1)
        begin: buffers
            if ((1 << i) & (ID_MAP))
            begin
                 synch_fifo #(.DSIZE(AXI_AW_WD), .ASIZE(LOG_AW_FIFO_DEPTH)) u_aw_synch_fifo (.wrst(rst), .rrst(rst), .wclk(core_clk), .rclk(noc_clk), .winc(aw_winc[i]), .rinc(aw_rinc[i]), .wdata(aw_wdata), .num_stored_words(aw_words[i]), .wfull(aw_wfull[i]), .rempty(aw_rempty[i]), .rdata(aw_rdata[i]));
                 synch_fifo #(.DSIZE(AXI_AR_WD), .ASIZE(LOG_AR_FIFO_DEPTH)) u_ar_synch_fifo (.wrst(rst), .rrst(rst), .wclk(core_clk), .rclk(noc_clk), .winc(ar_winc[i]), .rinc(ar_rinc[i]), .wdata(ar_wdata), .num_stored_words(ar_words[i]), .wfull(ar_wfull[i]), .rempty(ar_rempty[i]), .rdata(ar_rdata[i]));
                 synch_fifo #(.DSIZE(AXI_WD_WD), .ASIZE(LOG_WD_FIFO_DEPTH)) u_wd_synch_fifo (.wrst(rst), .rrst(rst), .wclk(core_clk), .rclk(noc_clk), .winc(wd_winc[i]), .rinc(wd_rinc[i]), .wdata(wd_wdata), .num_stored_words(wd_words[i]), .wfull(wd_wfull[i]), .rempty(wd_rempty[i]), .rdata(wd_rdata[i]));
            end
            else
            begin
                assign aw_words[i]  = 0; 
                assign aw_wfull[i]  = 1'b0;
                assign aw_rempty[i] = 1'b1;
                assign aw_rdata[i]  = 0;

                assign ar_words[i]  = 0; 
                assign ar_wfull[i]  = 1'b0;
                assign ar_rempty[i] = 1'b1;
                assign ar_rdata[i]  = 0;

                assign wd_words[i]  = 0; 
                assign wd_wfull[i]  = 1'b0;
                assign wd_rempty[i] = 1'b1;
                assign wd_rdata[i]  = 0;
            end
        end
    endgenerate

    ni_transmit_control transmit_control(.clk(noc_clk), .rst(rst), .send_message(send_message), .num_flit_to_transmit(num_flit_to_transmit), .stall(stall), .last_clock_beat(last_clock_beat), .valid(valid), .tx_gone(tx_gone), .flit_counter(flit_counter));

    ni_request_payload_shifter #(.FLIT_WIDTH(FLIT_WIDTH)) payload_shifter(.payload(payload), .flit_counter(flit_counter), .is_payload(is_payload), .payload_chunk(payload_chunk));

    axi_ni_request_payload_register #(.FLIT_WIDTH(FLIT_WIDTH), .AXIWDATAWD(AXIWDATAWD), .ENDIANNESS(ENDIANNESS)) payload_register(.clk(core_clk), .rst(rst), .byte_enables(byte_enables), .WDATA(wdata), .sample_payload(sample_payload), .payload(payload));

    ni_request_header_shifter #(.FLIT_WIDTH(FLIT_WIDTH)) header_shifter(.header(header), .flit_counter(flit_counter), .is_payload(is_payload), .header_chunk(header_chunk));

    axi_ni_request_header_register #(.FLIT_WIDTH(FLIT_WIDTH), .ADDRESSMAPWD(ADDRESSMAPWD)) header_register(.clk(core_clk), .rst(rst), .burst_length(burst_length), .burst_sequence(burst_sequence), .burst_increment(burst_increment), .burst_precise(burst_precise), .byte_enables(byte_enables), .command(command), .address(address), .id(atid), .aprotection(aprotection), .acache(acache), .alock(alock), .sample_header(sample_header), .SOURCE(SOURCE), .lut_address(lut_address), .lut_path(lut_path), .header(header));

    axi_ni_request_fsm #(.FLIT_WIDTH(FLIT_WIDTH), .MAX_SUPPORTED_IDS(MAX_SUPPORTED_IDS), .LOG_MAX_OUTSTANDING_WRITES_PER_ID(LOG_MAX_OUTSTANDING_WRITES_PER_ID), .LOG_MAX_OUTSTANDING_READS_PER_ID(LOG_MAX_OUTSTANDING_READS_PER_ID)) fsm(.clk(core_clk), .rst(rst), .last_beat(wlast), .aw_rempty(aw_rempty), .wd_rempty(wd_rempty), .ar_rempty(ar_rempty), .aw_rinc(aw_rinc), .ar_rinc(ar_rinc), .wd_rinc(wd_rinc), .outs_rd_ovfl(outs_rd_ovfl), .outs_wr_ovfl(outs_wr_ovfl), .outs_rd_unfl(outs_rd_unfl), .outs_wr_unfl(outs_wr_unfl), .outs_rd_max(outs_rd_max), .outs_wr_max(outs_wr_max), .curr_tid(atid), .write_select(write_select), .decr_outs_wr_cntr(decr_outs_wr_cntr), .decr_outs_rd_cntr(decr_outs_rd_cntr), .is_payload(is_payload), .sample_header(sample_header), .sample_payload(sample_payload), .send_message(send_message), .response_awaited(response_awaited), .flit_sequence(flit_sequence), .num_flit_to_transmit(num_flit_to_transmit), .tx_gone(tx_gone));

    ni_flit_type flit_type_unit(.flit_sequence(flit_sequence), .flit_counter(flit_counter), .num_flit_to_transmit(num_flit_to_transmit), .flit_type(flit_type));

    ni_flit_compose #(.FLIT_WIDTH(FLIT_WIDTH)) flit_compose(.flit_type(flit_type), .is_payload(is_payload), .header_chunk(header_chunk), .payload_chunk(payload_chunk), .flit(flit));

    ni_clock_synchro clock_synchro(.clk(noc_clk), .clkdiv(Clock_div), .rst(rst), .enable(send_message), .last_clock_beat(last_clock_beat));

    axi_ni_request_encoder #(.FLIT_WIDTH(FLIT_WIDTH), .AXIARADDRWD(AXIARADDRWD), .AXIAWADDRWD(AXIAWADDRWD), .AXIRDATAWD(AXIRDATAWD), .AXIWDATAWD(AXIWDATAWD)) request_encoder(.araddr(araddr), .awaddr(awaddr), .aburst(aburst), .alen(alen), .asize(asize), .wstrb(wstrb), .write_select(write_select), .burst_length(burst_length), .burst_increment(burst_increment), .burst_sequence(burst_sequence), .burst_precise(burst_precise), .byte_enables(byte_enables), .command(command), .address(address));

endmodule
