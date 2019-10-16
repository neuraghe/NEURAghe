`include "noc_parameters.v"

module axi_ni_response_pinout_mask(mask_response, received_response, received_data, packet_type_is_read, message_is_locked, received_id, RID, RDATA, RRESP, RVALID, BID, BRESP, BVALID);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter AXIRDATAWD = 32;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    input mask_response;
    input [`PACKETRESPONSEWD - 1 : 0] received_response;
    input [`PACKETREADDATAWD - 1 : 0] received_data;
    input [`PACKETTRANSIDWD - 1 : 0] received_id;
    input packet_type_is_read;
    input message_is_locked;
    output [`AXIIDWD - 1 : 0] RID;
    output [AXIRDATAWD - 1 : 0] RDATA;
    output [`AXIRESPWD - 1 : 0] RRESP;
    output RVALID;
    output [`AXIIDWD - 1 : 0] BID;
    output [`AXIRESPWD - 1 : 0] BRESP;
    output BVALID;

    assign RID = (mask_response ? 'h0 : (packet_type_is_read ? received_id : 'h0));
    assign RDATA = (mask_response ? 'h0 : (packet_type_is_read ? received_data : 'h0));
    assign RRESP = (mask_response || ~packet_type_is_read) ? `AXIRESP_OK :
                             (received_response == `PACKETRESPDVA && message_is_locked ? `AXIRESP_EXOKAY :
                             (received_response == `PACKETRESPDVA && ~message_is_locked ? `AXIRESP_OK :
                             (received_response == `PACKETRESPFAIL ? `AXIRESP_OK : `AXIRESP_SLVERR)));
    assign RVALID = !mask_response & packet_type_is_read;

    assign BID = (mask_response ? 'h0 : (packet_type_is_read ? 'h0 : received_id));
    assign BRESP = (mask_response || packet_type_is_read) ? `AXIRESP_OK :
                             (received_response == `PACKETRESPDVA && message_is_locked ? `AXIRESP_EXOKAY :
                             (received_response == `PACKETRESPDVA && ~message_is_locked ? `AXIRESP_OK :
                             (received_response == `PACKETRESPFAIL ? `AXIRESP_OK : `AXIRESP_SLVERR)));
    assign BVALID = !mask_response & !packet_type_is_read;

endmodule
