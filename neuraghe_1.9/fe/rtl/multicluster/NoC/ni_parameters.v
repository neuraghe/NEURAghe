`include "noc_parameters.v"

//---------------------------------------------------------------------
//                         PACKET FORMAT DEFINES
//---------------------------------------------------------------------
// Packet field widths
//FIXME these have to be worst-case for whole platform
//FIXME no check if any protocol-specific width is wider (and even if narrower??) ni_req_h, ni_req_p, ni_resp_p
`define PACKETBURSTPRECISEWD  1
`define PACKETBURSTSEQWD      3
`define PACKETBURSTINCRWD     3
`define PACKETBURSTLENGTHWD   5
`define PACKETCOMMANDWD       2
`define PACKETADDRESSWD       32
`define PACKETWRITEDATAWD     64
`define PACKETREADDATAWD      64
`define PACKETBYTEENABLEWD    ((`PACKETWRITEDATAWD >> 3))
`define PACKETRESPONSEWD      2
`define PACKETRESPTYPEWD      2
`define PACKETATTRIBUTEWD     17
`define PACKETTRANSIDWD       `MAX_SUPPORTED_ID_WD

// Packet command encodings
`define PACKETCMDIDLE         2'b00
`define PACKETCMDWRITE        2'b01
`define PACKETCMDREAD         2'b10
`define PACKETCMDWRNP         2'b11

// Packet byte enable encodings (note: OCP-compatible)
`define PACKETBENNULL         'h0
`define PACKETBENBYTE         'h1
`define PACKETBENHALFWORD     'h3
`define PACKETBENWORD         'hf
`define PACKETBENDWORD        'hff
`define PACKETBENQWORD        'hffff
`define PACKETBENOWORD        'hffffffff
`define PACKETBENSWORD        'hffffffffffffffff
`define PACKETBENTWORD        'hffffffffffffffffffffffffffffffff

// Packet burst sequence encodings (note: OCP-compatible)
`define PACKETBURSTINCR       'h0
`define PACKETBURSTWRAP       'h2
`define PACKETBURSTSTRM       'h5

// Packet response encodings (note: OCP-compatible)
`define PACKETRESPNULL        2'b00
`define PACKETRESPDVA         2'b01
`define PACKETRESPFAIL        2'b10
`define PACKETRESPERR         2'b11

// Packet response type encodings
`define PACKETRESPTYPEREAD    2'b00
`define PACKETRESPTYPEWRITE   2'b01
`define PACKETRESPTYPEEXREAD  2'b10
`define PACKETRESPTYPEEXWRITE 2'b11

// -----------------------------------------------------------------------
// Don't touch anything unless you want to change the packet format
// -----------------------------------------------------------------------
// Header Register for Requests
`ifdef WITH_REDUNDANCY_SUPPORT
  parameter RH_REQ_BASE_CRIT              = 0;
  parameter RH_REQ_BASE_READ              = RH_REQ_BASE_CRIT + 1;
  parameter RH_REQ_BASE_ADDR              = RH_REQ_BASE_READ + 1;
`else
  parameter RH_REQ_BASE_ADDR              = 0;
`endif
parameter RH_REQ_BASE_TRANS_ID            = RH_REQ_BASE_ADDR + `PACKETADDRESSWD;
parameter RH_REQ_BASE_CMD                 = RH_REQ_BASE_TRANS_ID + `PACKETTRANSIDWD;
parameter RH_REQ_BASE_BE                  = RH_REQ_BASE_CMD + `PACKETCOMMANDWD;
parameter RH_REQ_BASE_BP                  = RH_REQ_BASE_BE + `PACKETBYTEENABLEWD;
parameter RH_REQ_BASE_BSEQ                = RH_REQ_BASE_BP + `PACKETBURSTPRECISEWD;
parameter RH_REQ_BASE_BINCR               = RH_REQ_BASE_BSEQ + `PACKETBURSTSEQWD;
parameter RH_REQ_BASE_BLEN                = RH_REQ_BASE_BINCR + `PACKETBURSTINCRWD;
parameter RH_REQ_BASE_ATTRIBUTES          = RH_REQ_BASE_BLEN + `PACKETBURSTLENGTHWD;
`ifdef WITH_REDUNDANCY_SUPPORT
  parameter RH_REQ_WD                     = 2 + `PACKETADDRESSWD + `PACKETTRANSIDWD + `PACKETCOMMANDWD + `PACKETBYTEENABLEWD + `PACKETBURSTPRECISEWD + `PACKETBURSTSEQWD + `PACKETBURSTINCRWD + `PACKETBURSTLENGTHWD + `PACKETATTRIBUTEWD;
`else
  parameter RH_REQ_WD                     = `PACKETADDRESSWD + `PACKETTRANSIDWD + `PACKETCOMMANDWD + `PACKETBYTEENABLEWD + `PACKETBURSTPRECISEWD + `PACKETBURSTSEQWD + `PACKETBURSTINCRWD + `PACKETBURSTLENGTHWD + `PACKETATTRIBUTEWD;
`endif
parameter REQ_HEADERFLITS                 = ((`ROUTEWD + `SOURCEWD + RH_REQ_WD) / BASE_WIDTH) + ((`ROUTEWD + `SOURCEWD + RH_REQ_WD) % BASE_WIDTH ? 1 : 0);
parameter REQ_HEADERLENGTH                = BASE_WIDTH * REQ_HEADERFLITS;

// Payload Register for Requests
parameter RP_REQ_BASE_BE                  = 0;
parameter RP_REQ_BASE_DATA                = RP_REQ_BASE_BE + `PACKETBYTEENABLEWD;
parameter READ_RP_REQ_WD                  = `PACKETBYTEENABLEWD;
parameter WRITE_RP_REQ_WD                 = `PACKETBYTEENABLEWD + `PACKETWRITEDATAWD;
parameter MAX_RP_REQ_WD                   = WRITE_RP_REQ_WD;
parameter READ_REQ_PAYLOADFLITS           = ((READ_RP_REQ_WD / BASE_WIDTH) + (READ_RP_REQ_WD % BASE_WIDTH ? 1 : 0));
parameter WRITE_REQ_PAYLOADFLITS          = ((WRITE_RP_REQ_WD / BASE_WIDTH) + (WRITE_RP_REQ_WD % BASE_WIDTH ? 1 : 0));
parameter MAX_REQ_PAYLOADFLITS            = WRITE_REQ_PAYLOADFLITS;
parameter REQ_PAYLOADLENGTH               = BASE_WIDTH * MAX_REQ_PAYLOADFLITS;

// Header Register for Responses
parameter RH_RESP_BASE_TYPE               = 0;
parameter RH_RESP_BASE_TRANS_ID           = RH_RESP_BASE_TYPE + `PACKETRESPTYPEWD;
parameter RH_RESP_WD                      = `PACKETRESPTYPEWD + `PACKETTRANSIDWD;
parameter RESP_HEADERFLITS                = (`ROUTEWD + `SOURCEWD + RH_RESP_WD) / BASE_WIDTH + ((`ROUTEWD + `SOURCEWD + RH_RESP_WD) % BASE_WIDTH ? 1 : 0);
parameter RESP_HEADERLENGTH               = BASE_WIDTH * RESP_HEADERFLITS;

// Payload Register for Responses
parameter RP_RESP_BASE_RESP               = 0;
parameter RP_RESP_BASE_DATA               = RP_RESP_BASE_RESP + `PACKETRESPONSEWD;
parameter READ_RP_RESP_WD                 = `PACKETRESPONSEWD + `PACKETREADDATAWD;
parameter WRITE_RP_RESP_WD                = `PACKETRESPONSEWD;
parameter MAX_RP_RESP_WD                  = READ_RP_RESP_WD;
parameter READ_RESP_PAYLOADFLITS          = ((READ_RP_RESP_WD / BASE_WIDTH) + (READ_RP_RESP_WD % BASE_WIDTH ? 1 : 0));
parameter WRITE_RESP_PAYLOADFLITS         = ((WRITE_RP_RESP_WD / BASE_WIDTH) + (WRITE_RP_RESP_WD % BASE_WIDTH ? 1 : 0));
parameter MAX_RESP_PAYLOADFLITS           = READ_RESP_PAYLOADFLITS;
parameter RESP_PAYLOADLENGTH              = BASE_WIDTH * MAX_RESP_PAYLOADFLITS;
