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
// Create Date:    29/06/2011                                                 // 
// Design Name:    LOG_INTERCONNECT                                           // 
// Module Name:    parameters.v                                               //
// Project Name:   P2012 - ENCORE                                             //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    two input multiplxer whith custom ports used to multiplex  //
//                 the datapath request data. It includes an embeddedd        //
//                 Fixed Priory arbiter with max priority to Channel 0 (CH0)  //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - Added Dual Flow Control                                    //
// Revision v0.3 - Added ReadBoradcast                                        //
// Revision v0.4 - Added ReadOnly Feature                                     //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
`include "macro.v"
//`include "common.v"


`define LOAD   1'b0
`define STORE  1'b1


// Low Latency Interconnect

// reuse-pragma attr Description Number of the Master (xP70) Attached on TCDM Interconnect and PE Interconnect
// reuse-pragma attr Label XP70 CARDINALITY
// reuse-pragma attr EnumValues 1 2 4 8 16 32 64 128 256 512 1024
`define N_MASTER 	4		// NUMBER OF PROCESSING ELEMENT with High Priorities (Eg. Processors)

// reuse-pragma attr EnumValues 1 2 4 8 16 32 64 128 256 512 1024
// reuse-pragma attr Label DMA CARDINALITY
`define N_DMA		0		// NUMBER OF PROCESSING ELEMENT with Low  Priorities (Eg. DMAs)


// reuse-pragma attr Description Number of the MEMORY CUTS Attached on TCDM Interconnect
// reuse-pragma attr Label Number of CACHE BANKS
// reuse-pragma attr EnumValues 2 4 8 16 32 64 128 256 512 1024
`define N_SLAVE  	2		// NUMBER OF CACHE BANKS



// MAIN Interconnect PARAMETERS


// reuse-pragma attr Description Width of DATA bus
// reuse-pragma attr Label BUS DATA WIDTH
// reuse-pragma attr EnumValues 32 64 128 256 512
`define DATA_WIDTH 	32		// MUST BE: 32 or 64 or 128 or 256 ......

// reuse-pragma attr Description Width of ADDRESS bus
// reuse-pragma attr Label BUS ADDRESS WIDTH
// reuse-pragma attr EnumValues 32 64
`define ADDR_WIDTH 	32		// DO NOT EDIT THIS PARAMETER -->




//---------------------------------------------------//
//             CALCULATED PARAMETERS                 //
//---------------------------------------------------//
// Removed : IGOR. These are calculated in macro.v PLease use (  `ADDR_OFFSET(VALUE) )
// `define ADDR_OFFSET ( `log2(`DATA_WIDTH-1) - 3 ) // Address Offset: OFFSET IS 32bit--> 2bit; 64bit--> 3bit; 128bit--> 4bit and so on


