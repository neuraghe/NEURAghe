`include "ulpsoc_defines.sv"

module clkgate_bbmux_unit
#(
    parameter NB_CORES = 16
)
(
    input logic                  clk_i,

    input logic                  test_mode_i,

    CLKGATE_CONFIG_BUS.Slave     clkgate_int_bus,

    output logic                 tcdm_sleep,

    output logic                 clk_tcdm,
    output logic [NB_CORES-1:0]  clk_core,
    output logic                 clk_int,
    output logic                 clk_scm,
    output logic                 clk_hwacc
);

   logic                        clkgate_tcdm;
   logic [NB_CORES-1:0]         clkgate_core;
   logic                        clkgate_int;
   logic                        clkgate_scm;
   logic                        clkgate_hwacc;

   genvar index;

   // CLKGATE SELECT RVT, default int
   assign clkgate_tcdm   =  clkgate_int_bus.clkgate_tcdm;
   assign clkgate_core   =  clkgate_int_bus.clkgate_core;
   assign clkgate_scm    =  clkgate_int_bus.clkgate_scm;
   assign clkgate_int    =  clkgate_int_bus.clkgate_int;
   assign clkgate_hwacc  =  clkgate_int_bus.clkgate_hwacc;

   // tcdm bank enable signal for MMU
   assign tcdm_sleep = clkgate_tcdm; // 1 -> NO clock feeed to SRAMs, MEM in STDBY;      0-> Clock not gated, MEM not in standby


   // ************ NO CLOCK GATING IS IMPLEMENTED FOR FPGA VERSION ************************* //

   assign clk_tcdm  = clk_i;
   assign clk_scm   = clk_i;
   assign clk_core  = {NB_CORES{clk_i}};
   assign clk_int   = clk_i;
   assign clk_hwacc = clk_i;
   
   
/*

   cluster_clock_gating clkgate_rvt_tcdm
   (
      .clk_o(clk_tcdm),
      .clk_i(clk_i),
      .en_i(~clkgate_tcdm),
      .test_en_i(test_mode_i)
   );

   generate
   for(index=0; index<NB_CORES; index++)
   begin : CK_GATE_CORES_CELLS
      cluster_clock_gating clkgate_rvt_core
      (
          .clk_o(clk_core[index]),
          .clk_i(clk_i),
          .en_i(~clkgate_core[index]),
          .test_en_i(test_mode_i)
      );
    end
   endgenerate


    cluster_clock_gating clkgate_rvt_int
    (
        .clk_o(clk_int),
        .clk_i(clk_i),
        .en_i(~clkgate_int),
        .test_en_i(test_mode_i)
    );

    cluster_clock_gating clkgate_rvt_scm
    (
        .clk_o(clk_scm),
        .clk_i(clk_i),
        .en_i(~clkgate_scm),
        .test_en_i(test_mode_i)
    );

    cluster_clock_gating clkgate_rvt_hwacc
    (
        .clk_o(clk_hwacc),
        .clk_i(clk_i),
        .en_i(~clkgate_hwacc),
        .test_en_i(test_mode_i)
    );

*/

endmodule // clkgate_bbmux_unit

