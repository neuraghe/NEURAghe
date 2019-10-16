///////////////////////////////////////////////////////////////////////////////
// Copyright 2009 iNoCs                                                      //
//                                                                           //
// name         /home/chester/Desktop/prj/XPIPES_fresh/inocs/flow/rtl/verilog/noc_parameters.v                                     //
// author       Federico Angiolini - angiolini@inocs.com                     //
// author       Antonio Pullini - pullini@inocs.com                          //
// info         NoC configuration parameters.  //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                    Automatically generated - don't edit                   //
//           File generated for topology: noc18_4sw_80bits_run0           //
///////////////////////////////////////////////////////////////////////////////

// width of the clock counter for clock division support
`define COUNTERWD 1
`define FTYPEWD 2           // width of the Flit Type header field
`define SOURCEWD 4          // width of a Network Interface ID
`define MAX_SUPPORTED_ID_WD 4 // max transaction IDs to be supported in packet headers (width in bits)

// switch arbitration policy. `define ONE AND ONLY ONE among the lines below
`define FIXEDPRI_SWITCH_POLICY
//`define RROBIN_SWITCH_POLICY

// support for redundancy policies in the NoC
//`define WITH_REDUNDANCY_SUPPORT

// routing mechanism
`define NI_ROUTING
`define STATIC_ROUTING

// flow control policy
`define STALL_GO

// possible encodings of the Flit Type header field
`define ENC_HEAD 3
`define ENC_PAYL 2
`define ENC_SING 1
`define ENC_TAIL 0

`define COUNTERFLITWD 5

`define ROUTEWD 7

`define RESET_ACTIVE_VALUE 1
`define RESET_SENSITIVITY or posedge rst
`define RESET_SENSITIVE_EDGE posedge
`define RESET_INSENSITIVE_EDGE negedge

`define LITTLE_ENDIAN 1'b0
`define BIG_ENDIAN 1'b1
