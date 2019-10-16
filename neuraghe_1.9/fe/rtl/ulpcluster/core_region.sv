////////////////////////////////////////////////////////////////////////////////
// Company:        Multitherman Laboratory @ DEIS - University of Bologna     //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Davide Rossi - davide.rossi@unibo.it                       //
//                                                                            //
// Additional contributions by:                                               //
//                             -> igor.loi@unibo.it                           //
//                                                                            //
//                                                                            //
// Create Date:    11/04/2013                                                 // 
// Design Name:    Pulp3                                                      // 
// Module Name:    core_region                                                //
// Project Name:   PULP                                                       //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Wrapper for CORE ISLAND                                    //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - (14-02-2015): Support for FLexible CLuster                 //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "ulpsoc_defines.sv"


// USER DEFINED MACROS to improve self-testing capabilities
//`define DEBUG_FETCH_INTERFACE
//`define DATA_MISS
//`define DUMP_INSTR_FETCH

module core_region
#(
    // CORE PARAMETERS
    parameter CORE_ID            = 0,
    parameter ADDR_WIDTH         = 32,
    parameter DATA_WIDTH         = 32,
    parameter INSTR_RDATA_WIDTH  = 32,

    //BOOT PARAMETERS
    parameter ROM_BOOT_ADDR = 32'h1A000000,
    parameter BOOT_ADDR     = 32'h1C000000,

    parameter L2_SLM_FILE   = "./slm_files/l2_stim.slm",
    parameter ROM_SLM_FILE  = "../sw/apps/boot/slm_files/l2_stim.slm"
)
(

   input  logic             clk_i,
   input  logic             rst_ni,
   input  logic             init_ni,

`ifdef REMAP_ADDRESS
   input  logic [3:0]       base_addr_i, // FOR CLUSTER VIRTUALIZATION
`endif

   input  logic [4:0]       cluster_id_i,
   input  logic             IRQ_i,
   input  logic             NMIRQ_i,
   input  logic             fetch_en_i,
   input  logic             addr_tran_en_i,

   input  logic             test_mode_i,

   output logic             ready_to_shutdown_o,

   // Interface to Instruction Logaritmic interconnect (Req->grant handshake)
   output logic                         instr_req_o,
   input  logic                         instr_gnt_i,
   output logic                  [31:0] instr_addr_o,
   input  logic [INSTR_RDATA_WIDTH-1:0] instr_r_rdata_i,
   input  logic                         instr_r_valid_i,

   // Interface to DEBUG UNIT
   input  logic             dbginf_stall_i,
   output logic             dbginf_bp_o,
   input  logic             dbginf_strobe_i,
   output logic             dbginf_ack_o,
   input  logic             dbginf_we_i,
   input  logic [15:0]      dbginf_addr_i,
   input  logic [31:0]      dbginf_data_i,
   output logic [31:0]      dbginf_data_o,

   // Interface for DEMUX to TCDM INTERCONNECT ,PERIPHERAL INTERCONNECT and DMA CONTROLLER
   XBAR_TCDM_BUS.Master     tcdm_data_master,
   XBAR_TCDM_BUS.Master     dma_ctrl_master,
   XBAR_PERIPH_BUS.Master   eu_ctrl_master,
   XBAR_PERIPH_BUS.Master   periph_data_master

`ifdef TRACE_EXECUTION
   ,
   output logic [63:0] instr_trace_cycles_o,
   output logic [31:0] instr_trace_instr_o,
   output logic [31:0] instr_trace_pc_o,
   output logic        instr_trace_valid_o
`endif

);

   //********************************************************
   //***************** SIGNALS DECLARATION ******************
   //********************************************************
   XBAR_DEMUX_BUS    s_core_bus();         // Internal interface between CORE       <--> DEMUX
   XBAR_PERIPH_BUS   periph_demux_bus();   // Internal interface between CORE_DEMUX <--> PERIPHERAL DEMUX

   logic [31:0]     boot_addr;   // ADDR TRANSLATED for BOOT/L2 instr fetch
   logic            core_busy;   // NOT USED

   logic [4:0]      perf_counters;

   //********************************************************
   //***************** PROCESSORS ***************************
   //********************************************************
   `ifdef RISCV
      riscv_core
      #(
        .INSTR_RDATA_WIDTH   ( INSTR_RDATA_WIDTH ),
        .N_EXT_PERF_COUNTERS ( 5                 )
      )
      RISCV_CORE
      (
        .clk             (  clk_i             ),
        .rst_n           (  rst_ni            ),

        .boot_addr_i     ( boot_addr          ),
        .core_id_i       ( CORE_ID[4:0]       ),
        .cluster_id_i    ( cluster_id_i       ),

        .instr_addr_o    ( instr_addr_o       ),
        .instr_req_o     ( instr_req_o        ),
        .instr_rdata_i   ( instr_r_rdata_i    ),
        .instr_gnt_i     ( instr_gnt_i        ),
        .instr_rvalid_i  ( instr_r_valid_i    ),

        .data_addr_o     ( s_core_bus.add     ),
        .data_wdata_o    ( s_core_bus.wdata   ),
        .data_we_o       ( s_core_bus.we      ),
        .data_req_o      ( s_core_bus.req     ),
        .data_be_o       ( s_core_bus.be      ),
        .data_rdata_i    ( s_core_bus.r_rdata ),
        .data_gnt_i      ( s_core_bus.gnt     ),
        .data_rvalid_i   ( s_core_bus.r_valid ),

        .irq_i           ( IRQ_i              ),
        .irq_nm_i        ( NMIRQ_i            ),

        .dbginf_stall_i  ( dbginf_stall_i     ),
        .dbginf_bp_o     ( dbginf_bp_o        ),
        .dbginf_strobe_i ( dbginf_strobe_i    ),
        .dbginf_ack_o    ( dbginf_ack_o       ),
        .dbginf_we_i     ( dbginf_we_i        ),
        .dbginf_addr_i   ( dbginf_addr_i      ),
        .dbginf_data_i   ( dbginf_data_i      ),
        .dbginf_data_o   ( dbginf_data_o      ),

        .fetch_enable_i  ( fetch_en_i         ),
        .core_busy_o     ( core_busy          ),

        .ext_perf_counters_i ( perf_counters  )
      );
   `else
      or10n_core
      #(
        .N_EXT_PERF_COUNTERS ( 5               )
      )
      ORION_CORE
      (
         .clk             (  clk_i             ),
         .rst_n           (  rst_ni            ),

         .boot_addr_i     ( boot_addr          ),
         .core_id_i       ( CORE_ID[4:0]       ),
         .cluster_id_i    ( cluster_id_i       ),

         .instr_addr_o    ( instr_addr_o       ),
         .instr_req_o     ( instr_req_o        ),
         .instr_rdata_i   ( instr_r_rdata_i    ),
         .instr_grant_i   ( instr_gnt_i        ),
         .instr_rvalid_i  ( instr_r_valid_i    ),

         .data_addr_o     ( s_core_bus.add     ),
         .data_wdata_o    ( s_core_bus.wdata   ),
         .data_we_o       ( s_core_bus.we      ),
         .data_req_o      ( s_core_bus.req     ),
         .data_be_o       ( s_core_bus.be      ),
         .data_rdata_i    ( s_core_bus.r_rdata ),
         .data_gnt_i      ( s_core_bus.gnt     ),
         .data_r_valid_i  ( s_core_bus.r_valid ),

         .irq_i           ( IRQ_i              ),
         .irq_nm_i        ( NMIRQ_i            ),

         .dbginf_stall_i  ( dbginf_stall_i     ),
         .dbginf_bp_o     ( dbginf_bp_o        ),
         .dbginf_strobe_i ( dbginf_strobe_i    ),
         .dbginf_ack_o    ( dbginf_ack_o       ),
         .dbginf_we_i     ( dbginf_we_i        ),
         .dbginf_addr_i   ( dbginf_addr_i      ),
         .dbginf_data_i   ( dbginf_data_i      ),
         .dbginf_data_o   ( dbginf_data_o      ),

         .fetch_enable_i  ( fetch_en_i         ),
         .core_busy_o     ( core_busy          ),

         .ext_perf_counters_i ( perf_counters  )
`ifdef TRACE_EXECUTION
         ,
         .instr_trace_cycles_o ( instr_trace_cycles_o ),
         .instr_trace_instr_o  ( instr_trace_instr_o  ),
         .instr_trace_pc_o     ( instr_trace_pc_o     ),
         .instr_trace_valid_o  ( instr_trace_valid_o  )
`endif
      );
   `endif


   // ONLY CORE 0: IF addr_tran_en_i==1 then the boot is performed from ROM. viceversa the core0 boots from L2.
   if (CORE_ID == 0)
   begin
     assign boot_addr = (addr_tran_en_i == 1'b1) ? ROM_BOOT_ADDR : BOOT_ADDR;
   end
   else
   begin
     assign boot_addr = BOOT_ADDR;
   end


   //FIXME TODO MICHAEL: THIS NAME SHOLD BE CHANGED
   // if core is BUSY, then is not ready to shutdown
   assign ready_to_shutdown_o = core_busy;


   // Bind to 0 Unused Signals in CORE interface
   assign s_core_bus.r_gnt       = 1'b0;
   assign s_core_bus.barrier     = 1'b0;
   assign s_core_bus.exec_cancel = 1'b0;
   assign s_core_bus.exec_stall  = 1'b0;

   // Performance Counters
   assign perf_counters[4] = tcdm_data_master.req & (~tcdm_data_master.gnt);  // Cycles lost due to contention

   //********************************************************
   //****** DEMUX TO TCDM AND PERIPHERAL INTERCONNECT *******
   //********************************************************

   core_demux  core_demux_i
   (
      .clk                (  clk_i                      ),
      .rst_ni             (  rst_ni                     ),
      .test_en_i          ( test_mode_i                 ),
`ifdef REMAP_ADDRESS
      .base_addr_i        (  base_addr_i                ),
`endif

      .data_req_i         (  s_core_bus.req             ),
      .data_add_i         (  s_core_bus.add             ),
      .data_wen_i         ( ~s_core_bus.we              ), //inverted when using OR10N
      .data_wdata_i       (  s_core_bus.wdata           ),
      .data_be_i          (  s_core_bus.be              ),
      .data_gnt_o         (  s_core_bus.gnt             ),
      .data_r_gnt_i       (  s_core_bus.r_gnt           ),
      .data_r_valid_o     (  s_core_bus.r_valid         ),
      .data_r_opc_o       (                             ),
      .data_r_rdata_o     (  s_core_bus.r_rdata         ),

      .data_req_o_SH      (  tcdm_data_master.req       ),
      .data_add_o_SH      (  tcdm_data_master.add       ),
      .data_wen_o_SH      (  tcdm_data_master.wen       ),
      .data_wdata_o_SH    (  tcdm_data_master.wdata     ),
      .data_be_o_SH       (  tcdm_data_master.be        ),
      .data_gnt_i_SH      (  tcdm_data_master.gnt       ),
      .data_r_valid_i_SH  (  tcdm_data_master.r_valid   ),
      .data_r_rdata_i_SH  (  tcdm_data_master.r_rdata   ),

      .data_req_o_EXT     (  periph_demux_bus.req       ),
      .data_add_o_EXT     (  periph_demux_bus.add       ),
      .data_wen_o_EXT     (  periph_demux_bus.wen       ),
      .data_wdata_o_EXT   (  periph_demux_bus.wdata     ),
      .data_be_o_EXT      (  periph_demux_bus.be        ),
      .data_gnt_i_EXT     (  periph_demux_bus.gnt       ),
      .data_r_valid_i_EXT (  periph_demux_bus.r_valid   ),
      .data_r_rdata_i_EXT (  periph_demux_bus.r_rdata   ),
      .data_r_opc_i_EXT   (  periph_demux_bus.r_opc     ),

      .data_req_o_PE      (  periph_data_master.req     ),
      .data_add_o_PE      (  periph_data_master.add     ),
      .data_wen_o_PE      (  periph_data_master.wen     ),
      .data_wdata_o_PE    (  periph_data_master.wdata   ),
      .data_be_o_PE       (  periph_data_master.be      ),
      .data_gnt_i_PE      (  periph_data_master.gnt     ),
      .data_r_valid_i_PE  (  periph_data_master.r_valid ),
      .data_r_rdata_i_PE  (  periph_data_master.r_rdata ),
      .data_r_opc_i_PE    (  periph_data_master.r_opc   ),

      .perf_l2_ld_o       (  perf_counters[0]           ),
      .perf_l2_st_o       (  perf_counters[1]           ),
      .perf_l2_ld_cyc_o   (  perf_counters[2]           ),
      .perf_l2_st_cyc_o   (  perf_counters[3]           ),
      .CLUSTER_ID         (  cluster_id_i               )
   );



   periph_demux  periph_demux_i
   (
      .clk                ( clk_i                    ),
      .rst_ni             ( rst_ni                   ),

      .data_req_i         ( periph_demux_bus.req     ),
      .data_add_i         ( periph_demux_bus.add     ),
      .data_wen_i         ( periph_demux_bus.wen     ),
      .data_wdata_i       ( periph_demux_bus.wdata   ),
      .data_be_i          ( periph_demux_bus.be      ),
      .data_gnt_o         ( periph_demux_bus.gnt     ),

      .data_r_valid_o     ( periph_demux_bus.r_valid ),
      .data_r_opc_o       ( periph_demux_bus.r_opc   ),
      .data_r_rdata_o     ( periph_demux_bus.r_rdata ),

      .data_req_o_MH      (  dma_ctrl_master.req     ),
      .data_add_o_MH      (  dma_ctrl_master.add     ),
      .data_wen_o_MH      (  dma_ctrl_master.wen     ),
      .data_wdata_o_MH    (  dma_ctrl_master.wdata   ),
      .data_be_o_MH       (  dma_ctrl_master.be      ),
      .data_gnt_i_MH      (  dma_ctrl_master.gnt     ),

      .data_r_valid_i_MH  (  dma_ctrl_master.r_valid ),
      .data_r_rdata_i_MH  (  dma_ctrl_master.r_rdata ),
      .data_r_opc_i_MH    (  dma_ctrl_master.r_opc   ),

      .data_req_o_EU      (  eu_ctrl_master.req     ),
      .data_add_o_EU      (  eu_ctrl_master.add     ),
      .data_wen_o_EU      (  eu_ctrl_master.wen     ),
      .data_wdata_o_EU    (  eu_ctrl_master.wdata   ),
      .data_be_o_EU       (  eu_ctrl_master.be      ),
      .data_gnt_i_EU      (  eu_ctrl_master.gnt     ),

      .data_r_valid_i_EU  (  eu_ctrl_master.r_valid ),
      .data_r_rdata_i_EU  (  eu_ctrl_master.r_rdata ),
      .data_r_opc_i_EU    (  eu_ctrl_master.r_opc   )
   );

  //----------------------------------------------------------------------------------// 
  // DEBUG SECTION --> NOT SYNTHESIZABLE, JUST TO CHECK FETCH INTERFACE AND ADDRESSES //
  //----------------------------------------------------------------------------------// 

  //synopsys translate_off

   // CHECK IF THE CORE --> LS port is makin accesses in unmapped regions
   always @(posedge clk_i)
   begin : CHECK_ASSERTIONS
    `ifndef CLUSTER_ALIAS
      if ((s_core_bus.req == 1'b1) && (s_core_bus.add < 32'h1000_0000))
      begin
        $error("ERROR_1 (0x00000000 -> 0x10000000) : Data interface is making a request on unmapped region --> %8x\t at time %t [ns]" ,s_core_bus.add, $time()/1000 );
        $finish();
      end
      
      if ((s_core_bus.req == 1'b1) && (s_core_bus.add >= 32'h1040_0000) && ((s_core_bus.add < 32'h1A00_0000)))
      begin
        $error("ERROR_2 (0x10400000 -> 0x1A000000) : Data interface is making a request on unmapped region --> %8x\t at time %t [ns]" ,s_core_bus.add, $time()/1000 );
        $finish();
      end 
    
   `endif

      if ((s_core_bus.req == 1'b1) && (s_core_bus.add >= 32'h1A20_0000) && ((s_core_bus.add < 32'h1C00_0000)))
      begin
        $error("ERROR_3 (0x1A200000 -> 0x1C000000) : Data interface is making a request on unmapped region --> %8x\t at time %t [ns]" ,s_core_bus.add, $time()/1000 );
        $finish();
      end
      
  /*    if ((s_core_bus.req == 1'b1) && (s_core_bus.add >= 32'h2000_0000) && ((s_core_bus.add < 32'hFFFF_FFFF)))
      begin
        $error("ERROR_4 (0x20000000 -> 0xFFFFFFFF): Data interface is making a request on unmapped region --> %8x\t at time %t [ns]" ,s_core_bus.add, $time()/1000 );
        $finish();
      end
*/
   end

  // COMPARE THE output of the instruction CACHE with the slm files generated by the compiler 
`ifdef DEBUG_FETCH_INTERFACE
          integer          FILE;
          string           FILENAME;
          string           FILE_ID;

          logic            instr_gnt_L2;
          logic            instr_gnt_ROM;
          logic [31:0]     instr_r_rdata_ROM;
          logic            instr_r_valid_ROM;
          logic [31:0]     instr_r_rdata_L2;
          logic            instr_r_valid_L2;
          logic     destination; //--> 0 fetch from BOOT_ROM, 1--> fetch from L2_MEMORY

          initial
          begin
              FILE_ID.itoa(CORE_ID);
              FILENAME = {"FETCH_CORE_", FILE_ID, ".log" };
              FILE=$fopen(FILENAME,"w");
          end

          // BOOT code is loaded in this dummy ROM_MEMORY
          ibus_lint_memory
          #(
                .addr_width      ( 16              ),
                .INIT_MEM_FILE   ( "../../sw/apps/boot/slm_files/l2_stim.slm"    )
          )
          ROM_MEMORY
          (
                .clk             ( clk_i              ),
                .rst_n           ( rst_ni             ),
                .lint_req_i      ( instr_req_o        ), 
                .lint_grant_o    ( instr_gnt_ROM      ),
                .lint_addr_i     ( instr_addr_o[17:2] ), //instr_addr_o[17:2]   --> 2^17 bytes max program
                .lint_r_rdata_o  ( instr_r_rdata_ROM  ),
                .lint_r_valid_o  ( instr_r_valid_ROM  )
          );

          // application code is loaded in this dummy L2_MEMORY
          ibus_lint_memory
          #(
              .addr_width      ( 16                           ),
              .INIT_MEM_FILE   ( L2_SLM_FILE    )
          )
          L2_MEMORY
          (
              .clk             ( clk_i                        ),
              .rst_n           ( rst_ni                       ),

              .lint_req_i      ( instr_req_o                  ),
              .lint_grant_o    ( instr_gnt_L2                 ),
              .lint_addr_i     ( instr_addr_o[17:2]           ), //instr_addr_o[17:2]    --> 2^17 bytes max program

              .lint_r_rdata_o  ( instr_r_rdata_L2             ),
              .lint_r_valid_o  ( instr_r_valid_L2             )
          );


          // SELF CHECK ROUTINES TO compare isntruction fetches with slm files
          always_ff @(posedge clk_i)
          begin 

                if(instr_r_valid_i)
                begin
                    $fwrite( FILE , "\t --> %8h\n",instr_r_rdata_i);

                    case(destination)
                    1'b0: begin 
                        if(instr_r_rdata_i !== instr_r_rdata_L2)
                        begin
                          $warning("Error DURING L2 fetch: %x != %x", instr_r_rdata_i, instr_r_rdata_L2);
                          $stop();
                        end
                    end

                    1'b1: begin 
                        if(instr_r_rdata_i !== instr_r_rdata_ROM)
                        begin
                          $warning("Error DURING ROM Fetch: %x != %x", instr_r_rdata_i, instr_r_rdata_ROM);
                          $stop();
                        end
                    end
                    endcase
                end

           `ifdef DUMP_INSTR_FETCH
              //DUMP TO FILE every transaction to instruction cache
              if(instr_req_o & instr_gnt_i)
              begin
                  if(instr_addr_o[31:24] == ROM_BOOT_ADDR[31:24])
                    destination <= 1'b0;
                  else
                    destination <= 1'b1;

                    $fwrite( FILE , "%t [ns]: FETCH at address %8h",$time/1000, instr_addr_o);
              end
           `endif

          end
`endif

          //------------------------------------------//
          // UNUSED STUFF only fir DEBUG purposes     //
          // MICHAEL FIXME TODO                       //
          //------------------------------------------//

       `ifdef DATA_MISS
          logic            data_hit;
          logic            req;
       `endif
          logic            reg_cache_refill;

          always_ff @(posedge clk_i)
          begin
              if ( rst_ni == 1'b0 )
              begin
                reg_cache_refill <= 1'b0;
              end
              else
              begin
                if (instr_req_o)
                    reg_cache_refill <= 1'b1;
                else if(instr_r_valid_i && !instr_req_o)
                    reg_cache_refill <= 1'b0;
              end
          end
//synopsys translate_on   

endmodule
