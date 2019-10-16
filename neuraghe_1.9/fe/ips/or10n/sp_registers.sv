////////////////////////////////////////////////////////////////////////////////
// Company:        IIS @ ETHZ - Federal Institute of Technology               //
//                                                                            //
// Engineer:       Matthias Baer - baermatt@student.ethz.ch                   //
//                                                                            //
// Additional contributions by:                                               //
//                 Igor Loi - igor.loi@unibo.it                               //
//                 Andreas Traber - atraber@student.ethz.ch                   //
//                                                                            //
//                                                                            //
// Create Date:    19/09/2013                                                 //
// Design Name:    Pipelined Processor                                        //
// Module Name:    sp_registers.sv                                            //
// Project Name:   Processor                                                  //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Special-Purpose Registers of the pipelined processor       //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - (August 7th 2014) Changed port and signal names, added     //
//                 comments                                                   //
// Revision v0.3 - (December 1th 2014) Merged debug unit                      //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
// NOTES
//
// wdata = write data to special registers
// we    = write enable to special registers
// rdata = read data from special registers
//
//

`include "defines.sv"

// use all performance counters in FPGA + simulation targets, only one in synthesis

`ifdef SYNTHESIS
  `undef ALL_PCCR
`else
  `define ALL_PCCR
`endif

module sp_registers
#(
  parameter N_EXT_PERF_COUNTERS = 0
  )
(
   // Clock and Reset
   input logic         clk,
   input logic         rst_n,

   // Core and Cluster ID from outside
   input logic [4:0]   core_id_i,
   input logic [4:0]   cluster_id_i,

   // Interface to Special register (SRAM LIKE)
   input  logic [15:0] sp_addr_i,
   input  logic [31:0] sp_wdata_i,
   input  logic        sp_we_i,
   output logic [31:0] sp_rdata_o,

   // Direct inputs for MAC - CARRY - OVERFLOW and FLAGS
   // Overflow and Carry from ex stage
   input  logic        flag_i,
   input  logic        carry_i,
   input  logic        overflow_i,

   input  logic        set_flag_i,
   input  logic        set_carry_i,
   input  logic        set_overflow_i,

   // Stall direct write
   input  logic        enable_direct_write_i,

   // HWLoop Signals
   input  logic [`HWLOOP_REGS-1:0] [31:0] hwlp_start_addr_i,
   input  logic [`HWLOOP_REGS-1:0] [31:0] hwlp_end_addr_i,
   input  logic [`HWLOOP_REGS-1:0] [31:0] hwlp_counter_i,

   output  logic [31:0]                   hwlp_start_o,
   output  logic [31:0]                   hwlp_end_o,
   output  logic [31:0]                   hwlp_counter_o,
   output  logic [1:0]                    hwlp_regid_o,
   output  logic [2:0]                    hwlp_we_o,

   // Interrupts
   input  logic [31:0] curr_pc_if_i,
   input  logic [31:0] curr_pc_id_i,
   input  logic        save_pc_if_i,
   input  logic        save_pc_id_i,
   input  logic        save_sr_i,
   input  logic        restore_sr_i,
   output logic [31:0] epcr_o,
   output logic        irq_enable_o,

   output logic        perf_overflow_en_o,   // performance counter overflow enabled
   output logic        perf_overflow_o,      // a performance counter has overflowed

   // signals for NPC register
   output logic [31:0] npc_o,
   output logic        set_npc_o,

   // Direct outputs
   output logic        flag_fw_o,
   output logic        flag_o,
   output logic        carry_o,

   // Performance Counters
   input  logic        stall_id_i,        // Stall ID stage

   input  logic        instr_fetch_i,     // instruction fetch

   input  logic        jump_i,            // jump instruction seen   (j, jr, jal, jalr)
   input  logic        branch_i,          // branch instruction seen (bf, bnf)
   input  logic        delay_nop_i,       // empty delay slot seen
   input  logic        ld_stall_i,        // load use hazard
   input  logic        jmp_stall_i,       // jump register use hazard

   input  logic        branch_stall_i,    // wrong branch taken

   input  logic        mem_load_i,        // load from memory in this cycle
   input  logic        mem_store_i,       // store to memory in this cycle

   input  logic [N_EXT_PERF_COUNTERS-1:0]   ext_counters_i
);

  localparam N_PERF_COUNTERS = 12 + N_EXT_PERF_COUNTERS;

`ifdef ALL_PCCR
  localparam N_PERF_REGS     = N_PERF_COUNTERS;
`else
  localparam N_PERF_REGS     = 1;
`endif



  // Register Declaration
  logic [4:0] SR_q, SR_n;
  logic [4:0] ESR_q, ESR_n;
  logic [31:0] EPCR_q, EPCR_n;

  // Performance Counter Signals
  logic                          stall_id_q;
  logic [N_PERF_COUNTERS-1:0]    PCCR_in;  // input signals for each counter category
  logic [N_PERF_COUNTERS-1:0]    PCCR_inc, PCCR_inc_q; // should the counter be increased?

  logic [1:0]                    PCMR_n, PCMR_q; // mode register, controls saturation and global enable
  logic [N_PERF_COUNTERS-1:0]    PCER_n, PCER_q; // selected counter input
  logic [N_PERF_COUNTERS-1:0]    PCCR_set; // set new value for performance counter

  logic [N_PERF_REGS-1:0] [31:0] PCCR_n, PCCR_q; // performance counters



  assign flag_fw_o    = set_flag_i ? flag_i : SR_q[`SR_F];
  assign flag_o       = SR_q[`SR_F];
  assign carry_o      = SR_q[`SR_CY];

  assign irq_enable_o       = SR_q[`SR_IEE];
  assign perf_overflow_en_o = SR_q[`SR_PCOVE];

  assign epcr_o       = EPCR_q;

  // Output logic, read from SPR
  always_comb
  begin
    sp_rdata_o = 32'b0;

    case (sp_addr_i[15:11])
      `SP_GRP_SYS: begin
        unique case (sp_addr_i[10:0])
          `SP_SR: begin
            sp_rdata_o[`SR_EXT_IEE]    = SR_q[`SR_IEE];
            sp_rdata_o[`SR_EXT_F]      = SR_q[`SR_F];
            sp_rdata_o[`SR_EXT_CY]     = SR_q[`SR_CY];
            sp_rdata_o[`SR_EXT_OV]     = SR_q[`SR_OV];
            sp_rdata_o[`SR_EXT_PCOVE]  = SR_q[`SR_PCOVE];
          end
          `SP_ESR: begin
            sp_rdata_o[`SR_EXT_IEE]    = ESR_q[`SR_IEE];
            sp_rdata_o[`SR_EXT_F]      = ESR_q[`SR_F];
            sp_rdata_o[`SR_EXT_CY]     = ESR_q[`SR_CY];
            sp_rdata_o[`SR_EXT_OV]     = ESR_q[`SR_OV];
            sp_rdata_o[`SR_EXT_PCOVE]  = ESR_q[`SR_PCOVE];
          end
          `SP_EPCR:      sp_rdata_o = EPCR_q;
          `SP_COREID:    sp_rdata_o = core_id_i;
          `SP_CLUSTERID: sp_rdata_o = cluster_id_i;
          `SP_PPC:       sp_rdata_o = curr_pc_id_i;
          `SP_NPC:       sp_rdata_o = curr_pc_if_i;
          default: ;
        endcase; //~case (sp_addr_i[10:0])
      end

      `SP_GRP_HWLP: begin
        unique case (sp_addr_i[10:1])
          10'h000: sp_rdata_o = hwlp_start_addr_i[sp_addr_i[0]];
          10'h008: sp_rdata_o = hwlp_end_addr_i[sp_addr_i[0]];
          10'h010: sp_rdata_o = hwlp_counter_i[sp_addr_i[0]];
          default: ;
        endcase; //~case (sp_addr_i[10:1])
      end

      `SP_GRP_PCCR: begin
        if (sp_addr_i[5] == 1'b0)
        begin
          `ifndef ALL_PCCR
            sp_rdata_o = PCCR_q[0];
          `else
            sp_rdata_o = PCCR_q[sp_addr_i[`log2(N_PERF_REGS)-1:0]];
          `endif
        end
        else
        begin
          unique case (sp_addr_i[4:0])
            5'h00: sp_rdata_o[N_PERF_COUNTERS-1:0] = PCER_q;
            5'h01: sp_rdata_o[1:0]                 = PCMR_q;
            default: ;
          endcase; // case (sp_addr_i[10:1])
        end
      end

      default: ;
    endcase; //~case (sp_addr_i[15:11])
  end

  // Input logic, write to SPR
  always_comb
  begin
    SR_n      = SR_q;
    EPCR_n    = EPCR_q;
    ESR_n     = ESR_q;
    npc_o      = 32'b0;
    set_npc_o  = 1'b0;

    hwlp_regid_o   = 2'h0;
    hwlp_we_o      = 3'b000;
    hwlp_start_o   = sp_wdata_i;
    hwlp_end_o     = sp_wdata_i;
    hwlp_counter_o = sp_wdata_i;

    PCMR_n   = PCMR_q;
    PCER_n   = PCER_q;
    PCCR_set = 'h0;

    if (sp_we_i == 1'b1) begin
      case (sp_addr_i[15:11])
        `SP_GRP_SYS: begin
          unique case (sp_addr_i[10:0])
            `SP_SR: begin
              SR_n[`SR_IEE]    = sp_wdata_i[`SR_EXT_IEE];
              SR_n[`SR_F]      = sp_wdata_i[`SR_EXT_F];
              SR_n[`SR_CY]     = sp_wdata_i[`SR_EXT_CY];
              SR_n[`SR_OV]     = sp_wdata_i[`SR_EXT_OV];
              SR_n[`SR_PCOVE]  = sp_wdata_i[`SR_EXT_PCOVE];
            end
            `SP_EPCR:  EPCR_n    = sp_wdata_i;
            `SP_ESR:                       ; // not allowed to write
            `SP_NPC: begin
              npc_o     = sp_wdata_i;
              set_npc_o = 1'b1;
            end
            default: ;
          endcase; // case (sp_addr_i[10:0])
        end

        `SP_GRP_HWLP: begin
          hwlp_regid_o = {1'b0, sp_addr_i[0]};

          unique case (sp_addr_i[10:1])
            10'h000: hwlp_we_o = 3'b001; // write to start
            10'h008: hwlp_we_o = 3'b010; // write to end
            10'h010: hwlp_we_o = 3'b100; // write to counter
            default: ;
          endcase; // case (sp_addr_i[10:1])
        end

        `SP_GRP_PCCR: begin
          if (sp_addr_i[5] == 1'b0)
          begin
            `ifndef ALL_PCCR
              PCCR_set[0] = 1'b1;
            `else
              if(sp_addr_i[4:0] == 5'b11111)
                PCCR_set = '1;
              else
                PCCR_set[sp_addr_i[`log2(N_PERF_REGS)-1:0]] = 1'b1;
            `endif
          end
          else
          begin
            unique case (sp_addr_i[4:0])
              5'h00: PCER_n = sp_wdata_i[N_PERF_COUNTERS-1:0];
              5'h01: PCMR_n = sp_wdata_i[1:0];
              default: ;
            endcase; // case (sp_addr_i[10:1])
          end
        end

        default: ;
      endcase
    end

    if (save_pc_if_i == 1'b1)
      EPCR_n = curr_pc_if_i;
    else if (save_pc_id_i == 1'b1)
      EPCR_n = curr_pc_id_i;

    if (save_sr_i == 1'b1)
      ESR_n = SR_q;

    if (restore_sr_i == 1'b1)
      SR_n = ESR_q;

    if (enable_direct_write_i == 1'b0)
    begin
      if (set_flag_i == 1'b1)
        SR_n[`SR_F] = flag_i;
      if (set_carry_i == 1'b1)
        SR_n[`SR_CY] = carry_i;
      if (set_overflow_i == 1'b1)
        SR_n[`SR_OV] = overflow_i;
    end

    // synopsys translate_off
    if (set_flag_i == 1'b1 & $isunknown(flag_i)) 
    begin
      $error("%t: FLAG is undefined!!!", $time);
      $finish;
    end
    // synopsys translate_on
  end


  // Register setup
  always_ff @(posedge clk, negedge rst_n)
  begin
    if (rst_n == 1'b0)
    begin
      SR_q    <= '0;
      EPCR_q  <= '0;
      ESR_q   <= '0;
    end
    else
    begin
      SR_q   <= SR_n;
      EPCR_q <= EPCR_n;
      ESR_q  <= ESR_n;
    end
  end


  /////////////////////////////////////////////////////////////////
  //   ____            __     ____                  _            //
  // |  _ \ ___ _ __ / _|   / ___|___  _   _ _ __ | |_ ___ _ __  //
  // | |_) / _ \ '__| |_   | |   / _ \| | | | '_ \| __/ _ \ '__| //
  // |  __/  __/ |  |  _|  | |__| (_) | |_| | | | | ||  __/ |    //
  // |_|   \___|_|  |_|(_)  \____\___/ \__,_|_| |_|\__\___|_|    //
  //                                                             //
  /////////////////////////////////////////////////////////////////


  assign PCCR_in[0]  = 1'b1;                           // cycle counter
  assign PCCR_in[1]  = ~stall_id_i;                    // instruction counter
  assign PCCR_in[2]  = ld_stall_i & (~stall_id_q);     // nr of load use hazards
  assign PCCR_in[3]  = jmp_stall_i & (~stall_id_q);    // nr of jump register hazards
  assign PCCR_in[4]  = instr_fetch_i;                  // cycles waiting for instruction fetches
  assign PCCR_in[5]  = branch_stall_i & (~stall_id_q); // nr of wrong branches taken
  assign PCCR_in[6]  = branch_stall_i;                 // cycles waiting due to wrong branch taken
  assign PCCR_in[7]  = mem_load_i;                     // nr of loads
  assign PCCR_in[8]  = mem_store_i;                    // nr of stores
  assign PCCR_in[9]  = jump_i   & (~stall_id_q);       // nr of jumps (unconditional)
  assign PCCR_in[10] = branch_i & (~stall_id_q);       // nr of branches (conditional)
  assign PCCR_in[11] = delay_nop_i & (~stall_id_q);    // nr of empty delay slots

  // assign external performance counters
  generate
    genvar i;
    for(i = 0; i < N_EXT_PERF_COUNTERS; i++)
      assign PCCR_in[N_PERF_COUNTERS - N_EXT_PERF_COUNTERS + i] = ext_counters_i[i];
  endgenerate


`ifndef ALL_PCCR
  assign PCCR_inc[0] = (|(PCCR_in & PCER_q)) & PCMR_q[0];

  always_comb
  begin
    perf_overflow_o = 1'b0;
    PCCR_n[0]       = PCCR_q[0];

    if (PCCR_q[0] == 32'hFFFFFFFF)
    begin
      // trigger exception
      perf_overflow_o = 1'b1;

      if (PCCR_inc_q[0] == 1'b1 && PCMR_q[1] == 1'b0) begin
        // we only increase the performance counter when saturation is not set
        PCCR_n[0] = PCCR_q[0] + 1;
      end
    end else begin
      if (PCCR_inc_q[0] == 1'b1) begin
        // just increase performance counter
        PCCR_n[0] = PCCR_q[0] + 1;
      end
    end

    if (PCCR_set[0] == 1'b1)
      PCCR_n[0] = sp_wdata_i;
  end
`else
  always_comb
  begin
    perf_overflow_o = 1'b0;

    for(int i = 0; i < N_PERF_COUNTERS; i++)
    begin : PERF_CNT_INC
      PCCR_inc[i] = PCCR_in[i] & PCER_q[i] & PCMR_q[0];

      PCCR_n[i]   = PCCR_q[i];

      if (PCCR_q[i] == 32'hFFFFFFFF)
      begin
        // trigger exception
        perf_overflow_o = 1'b1;

        if (PCCR_inc_q[i] == 1'b1 && PCMR_q[1] == 1'b0)
        begin
          // we only increase the performance counter when saturation is not set
          PCCR_n[i] = PCCR_q[i] + 1;
        end
      end else begin
        if (PCCR_inc_q[i] == 1'b1)
        begin
          // just increase performance counter
          PCCR_n[i] = PCCR_q[i] + 1;
        end
      end

      if (PCCR_set[i] == 1'b1)
        PCCR_n[i] = sp_wdata_i;
    end
  end
`endif

  // Performance Counter Registers
  always_ff @(posedge clk, negedge rst_n)
  begin
    if (rst_n == 1'b0)
    begin
      stall_id_q <= 1'b0;

      PCER_q <= 'h0;
      PCMR_q <= 2'h3;

      for(int i = 0; i < N_PERF_REGS; i++)
      begin
        PCCR_q[i]    <= 'h0;
        PCCR_inc_q[i] <= 'h0;
      end
    end
    else
    begin
      stall_id_q <= stall_id_i;

      PCER_q <= PCER_n;
      PCMR_q <= PCMR_n;

      for(int i = 0; i < N_PERF_REGS; i++)
      begin
        PCCR_q[i]     <= PCCR_n[i];
        PCCR_inc_q[i] <= PCCR_inc[i];
      end

    end
  end

endmodule //~module sp_registers
