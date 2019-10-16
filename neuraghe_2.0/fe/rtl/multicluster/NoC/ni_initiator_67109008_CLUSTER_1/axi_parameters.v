//---------------------------------------------------------------------
//                         AMBA AXI DEFINES
//---------------------------------------------------------------------
// AMBA AXI signal widths
`define AXIIDWD              `MAX_SUPPORTED_ID_WD
`define AXILENWD             8
`define AXISIZEWD            3
`define AXIBURSTWD           2
`define AXILOCKWD            2
`define AXICACHEWD           4
`define AXIPROTWD            3
`define AXIRESPWD            2
`define AXILASTWD            1

// AMBA AXI BURST TYPE values
`define AXIBURST_FIXED       2'b00  // Fixed transfer
`define AXIBURST_INCR        2'b01  // Incrementing burst
`define AXIBURST_WRAP        2'b10  // Wrapping burst

// AMBA AXI BURST SIZE values
`define AXISIZE_8bits        3'b000 //   8  bits Byte
`define AXISIZE_16bits       3'b001 //  16  bits Halfword
`define AXISIZE_32bits       3'b010 //  32  bits Word
`define AXISIZE_64bits       3'b011 //  64  bits 2-word line
`define AXISIZE_128bits      3'b100 // 128  bits 4-word line
`define AXISIZE_256bits      3'b101 // 256  bits 8-word line
`define AXISIZE_512bits      3'b110 // 512  bits 16-word line
`define AXISIZE_1024bits     3'b111 // 1024 bits 32-word line

// AMBA AXI RESP values
`define AXIRESP_OK           2'b00
`define AXIRESP_EXOKAY       2'b01
`define AXIRESP_SLVERR       2'b10
`define AXIRESP_DECERR       2'b11

// AMBA AXI LOCK values
`define AXILOCK_NORMAL       2'b00
`define AXILOCK_EXCL         2'b01
`define AXILOCK_LOCKED       2'b10
// 2'b11 is reserved

