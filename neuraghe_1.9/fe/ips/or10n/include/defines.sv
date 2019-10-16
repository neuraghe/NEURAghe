////////////////////////////////////////////////////////////////////////////////
// Company:        IIS @ ETHZ - Federal Institute of Technology               //
//                                                                            //
// Engineer:       Matthias Baer - baermatt@student.ethz.ch                   //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    19/09/2013                                                 //
// Design Name:    Pipelined Processor                                        //
// Module Name:    defines.sv                                                 //
// Project Name:   Processor                                                  //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Defines for the the pipelined processor                    //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
// BTW: If you want to create more of those fancy ASCII art comments:
// http://patorjk.com/software/taag/#p=display&v=0&f=Standard&t=Fancy%20ASCII%20Art
////////////////////////////////////////////////////////////////////////////////

`define log2(VALUE) ((VALUE) <= ( 1 ) ? 0 : (VALUE) <= ( 2 ) ? 1 : (VALUE) <= ( 4 ) ? 2 : (VALUE)<= (8) ? 3:(VALUE) <= ( 16 )  ? 4 : (VALUE) <= ( 32 )  ? 5 : (VALUE) <= ( 64 )  ? 6 : (VALUE) <= ( 128 ) ? 7 : (VALUE) <= ( 256 ) ? 8 : (VALUE) <= ( 512 ) ? 9 : 10)


`ifndef SYNTHESIS
`timescale 1ns/1ps
`define TRACE_EXECUTION
`endif

////////////////////////////////////////////////
//    ___         ____          _             //
//   / _ \ _ __  / ___|___   __| | ___  ___   //
//  | | | | '_ \| |   / _ \ / _` |/ _ \/ __|  //
//  | |_| | |_) | |__| (_) | (_| |  __/\__ \  //
//   \___/| .__/ \____\___/ \__,_|\___||___/  //
//        |_|                                 //
////////////////////////////////////////////////

`define OPCODE_J      6'h00
`define OPCODE_JAL    6'h01
`define OPCODE_HWLOOP 6'h02
`define OPCODE_BNF    6'h03
`define OPCODE_BF     6'h04
`define OPCODE_NOP    6'h05
`define OPCODE_MOVHI  6'h06 // also used for l.macrc
`define OPCODE_SYNC   6'h08 // also used for l.trap
`define OPCODE_RFE    6'h09
`define OPCODE_VEC    6'h0a // vectorial instructions
`define OPCODE_VCMP   6'h0b // vectorial compare instructions
`define OPCODE_JR     6'h11
`define OPCODE_JALR   6'h12
`define OPCODE_MACI   6'h13
`define OPCODE_STPOST 6'h14 // ST post-increment
`define OPCODE_STPRE  6'h15 // ST pre-increment
`define OPCODE_LDPOST 6'h16 // LD post-increment
`define OPCODE_LDPRE  6'h17 // LD pre-increment
`define OPCODE_LWZ    6'h21
`define OPCODE_LWS    6'h22
`define OPCODE_LBZ    6'h23
`define OPCODE_LBS    6'h24
`define OPCODE_LHZ    6'h25
`define OPCODE_LHS    6'h26
`define OPCODE_ADDI   6'h27
`define OPCODE_ADDIC  6'h28
`define OPCODE_ANDI   6'h29
`define OPCODE_ORI    6'h2a
`define OPCODE_XORI   6'h2b
`define OPCODE_MULI   6'h2c
`define OPCODE_MFSPR  6'h2d
`define OPCODE_SHIFT  6'h2e
`define OPCODE_SFI    6'h2f
`define OPCODE_MTSPR  6'h30
`define OPCODE_MAC    6'h31
`define OPCODE_SW     6'h35
`define OPCODE_SB     6'h36
`define OPCODE_SH     6'h37
`define OPCODE_ALU    6'h38
`define OPCODE_SF     6'h39


//////////////////////////////////////////////////////////////////////////////
//      _    _    _   _    ___                       _   _                  //
//     / \  | |  | | | |  / _ \ _ __   ___ _ __ __ _| |_(_) ___  _ __  ___  //
//    / _ \ | |  | | | | | | | | '_ \ / _ \ '__/ _` | __| |/ _ \| '_ \/ __| //
//   / ___ \| |__| |_| | | |_| | |_) |  __/ | | (_| | |_| | (_) | | | \__ \ //
//  /_/   \_\_____\___/   \___/| .__/ \___|_|  \__,_|\__|_|\___/|_| |_|___/ //
//                             |_|                                          //
//////////////////////////////////////////////////////////////////////////////

`define ALU_OP_WIDTH 6

// Movhi Operation
`define ALU_MOVHI 6'b001111
// Standard Operations
`define ALU_ADD   6'b000_000
`define ALU_ADDC  6'b000_001
`define ALU_SUB   6'b000_010
`define ALU_AND   6'b000_011
`define ALU_OR    6'b000_100
`define ALU_XOR   6'b000_101

`define ALU_AVG   6'b000_110
`define ALU_AVGU  6'b000_111
// Shift Operations
`define ALU_SLL   6'b0010_00
`define ALU_SRL   6'b0010_01
`define ALU_SRA   6'b0010_10
`define ALU_ROR   6'b0010_11
// CMOV operation
`define ALU_CMOV  6'b00_1110
// Extension Operations
`define ALU_EXTHS 6'b010_000
`define ALU_EXTWS 6'b010_001
`define ALU_EXTBS 6'b010_010
`define ALU_EXTWZ 6'b010_011
`define ALU_EXTHZ 6'b010_100
`define ALU_EXTBZ 6'b010_110
// No Operation
`define ALU_NOP   6'b011111
// Comparison Operations
`define ALU_EQ    6'b10_0000
`define ALU_NE    6'b10_0001
`define ALU_GTU   6'b10_0010
`define ALU_GEU   6'b10_0011
`define ALU_LTU   6'b10_0100
`define ALU_LEU   6'b10_0101
`define ALU_GTS   6'b10_1010
`define ALU_GES   6'b10_1011
`define ALU_LTS   6'b10_1100
`define ALU_LES   6'b10_1101

`define ALU_MIN   6'b10_1110
`define ALU_MINU  6'b11_1110
`define ALU_MAX   6'b10_1111
`define ALU_MAXU  6'b11_1111

`define ALU_ABS   6'b11_1010

`define ALU_INS   6'b11_1101
`define ALU_EXT   6'b11_1100

`define ALU_CNT   6'b11_0000
`define ALU_FF1   6'b11_0010
`define ALU_FL1   6'b11_0011
`define ALU_CLB   6'b11_0001


// Vector Mode
`define VEC_MODE32  2'b00
`define VEC_MODE16  2'b10
`define VEC_MODE8   2'b11
`define VEC_MODE216 2'b01

// ALU comparison mode
`define ALU_CMP_FULL 2'b00
`define ALU_CMP_ANY  2'b01
`define ALU_CMP_ALL  2'b10


////////////////////////////////////////////////////////
//  ____  ____    ____            _     _             //
// / ___||  _ \  |  _ \ ___  __ _(_)___| |_ ___ _ __  //
// \___ \| |_) | | |_) / _ \/ _` | / __| __/ _ \ '__| //
//  ___) |  __/  |  _ <  __/ (_| | \__ \ ||  __/ |    //
// |____/|_|     |_| \_\___|\__, |_|___/\__\___|_|    //
//                          |___/                     //
////////////////////////////////////////////////////////

// Special-Purpose Register Addresses
// see OpenRISC manual p. 22ff
`define SP_GRP_SYS     5'h00
`define SP_NPC        11'h010
`define SP_SR         11'h011
`define SP_PPC        11'h012
`define SP_EPCR       11'h020
`define SP_ESR        11'h040

// Core and Cluster ID are put into the system control and status
// registers group
`define SP_COREID     11'h680
`define SP_CLUSTERID  11'h681

// Supervision Register
`define SR_IEE   0
`define SR_F     1
`define SR_CY    2
`define SR_OV    3
`define SR_PCOVE 4

// used to select the correct bits for the internal SR register
`define SR_EXT_IEE     2
`define SR_EXT_F       9
`define SR_EXT_CY     10
`define SR_EXT_OV     11
`define SR_EXT_PCOVE  17

// SPR for HWLoops
`define SP_GRP_HWLP          5'h0C

// SPR for Performance Counters
`define SP_GRP_PCCR    5'h07


// SPR for debugger, not accessible by CPU
`define SP_DVR0       16'h3000
`define SP_DCR0       16'h3008
`define SP_DMR1       16'h3010
`define SP_DMR2       16'h3011

`define SP_DVR_MSB 8'h00
`define SP_DCR_MSB 8'h01
`define SP_DMR_MSB 8'h02
`define SP_DSR_MSB 8'h04


//igor addon
`define REG_A 20:16
`define REG_B 15:11

// forwarding operand mux
`define SEL_REGFILE    2'b00
`define SEL_FW_EX      2'b01
`define SEL_FW_WB      2'b10

// operand a selection
`define OP_A_REGA_OR_FWD   2'b00
`define OP_A_CURRPC        2'b10
`define OP_A_IMM16         2'b11

// operand b selection
`define OP_B_REGB_OR_FWD   2'b00
`define OP_B_REGC_OR_FWD   2'b01
`define OP_B_IMM           2'b10

// immediate selection
`define IMM_5N11           4'b0000
`define IMM_21S            4'b0001
`define IMM_8Z             4'b0010
`define IMM_16Z            4'b0011
`define IMM_16             4'b0100
`define IMM_11S            4'b0101
`define IMM_5N6S           4'b0110
`define IMM_VEC            4'b0111
`define IMM_HEX4           4'b1000


// PC mux selector defines
`define INCR_PC          3'b000
`define NO_INCR          3'b001
`define PC_FROM_REGFILE  3'b010
`define PC_FROM_IMM      3'b011
`define PC_EXCEPTION     3'b100
`define EXC_PC_REG       3'b101
`define HWLOOP_ADDR      3'b110
`define PC_BRANCH_PRED   3'b111

// Exception PC mux selector defines
`define EXC_PC_NO_INCR   3'b000
`define EXC_PC_ILLINSN   3'b001
`define EXC_PC_IRQ       3'b010
`define EXC_PC_IRQ_NM    3'b011
`define EXC_PC_PERF_OV   3'b100

// Exceptions offsets
// It is assumed that the lower 8 bits are enough for all exception
// offsets, so the upper 24 bits of the boot address are used and the
// lower 8 bits of the exception offset
`define EXC_ILLINSN      8'h30
`define EXC_IRQ          8'h38
`define EXC_IRQ_NM       8'h70
`define EXC_PERF_OV      8'h78 // ??


// Hardware loops addon
`define HWLOOP_REGS 2

// Debug module
`define N_WP      2     // #Watchpoints
`define DCR_DP    0
`define DCR_CC    3:1
`define DCR_SC    4
`define DCR_CT    7:5

`define DMR1_ST   22
`define DMR2_WGB0 12
`define DMR2_WBS0 22

`define DSR_IIE   0
`define DSR_INTE  1



// TCDM_ADDRES PRE CALCULATION --> Bring part of the alu_adder_o calculation in the ID stage
//`define TCDM_ADDR_PRECAL

`define BRANCH_PREDICTION
