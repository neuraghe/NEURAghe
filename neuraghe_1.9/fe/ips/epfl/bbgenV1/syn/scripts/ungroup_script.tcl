#ULP_CLUSTER_i
#ungroup [get_cells rstgen_i]                            -flatten


ungroup [get_cells instr_master_slice_i/*]              -flatten
ungroup [get_cells data_master_slice_i/*]               -flatten
ungroup [get_cells data_slave_slice_i/*]                -flatten

ungroup [get_cells CORE[0].core_region_i/ORION_CORE/*]  -flatten
ungroup [get_cells CORE[1].core_region_i/ORION_CORE/*]  -flatten
ungroup [get_cells CORE[2].core_region_i/ORION_CORE/*]  -flatten
ungroup [get_cells CORE[3].core_region_i/ORION_CORE/*]  -flatten

ungroup [get_cells icache_top_i/*]                      -flatten

#ungroup [get_cells tcdm_sram_island_1/*]                -flatten

ungroup [get_cells tcdm_scm_island/*]                   -flatten

ungroup [get_cells clkgate_bbmux_unit_i]


ungroup [get_cells hwce_wrap_i/*]   -flatten
ungroup [get_cells adv_dbg_if_i/*]  -flatten

# ungroup [get_cells CORE*/*]  -flatten

ungroup [get_cells clk*]           -flatten

ungroup [get_cells cluster_int_region_i/cluster_bus_wrap_i/*] -flatten
ungroup [get_cells cluster_int_region_i/axi2mem_wrap_i/*]     -flatten
ungroup [get_cells cluster_int_region_i/axi2per_wrap_i/*]     -flatten
ungroup [get_cells cluster_int_region_i/per2axi_wrap_i/*]     -flatten

ungroup [get_cells cluster_int_region_i/dmac_wrap_i/*]                  -flatten
ungroup [get_cells cluster_int_region_i/cluster_interconnect_wrap_i]
ungroup [get_cells cluster_int_region_i/cluster_interconnect_wrap_i/xbar_pe_inst/*]    -flatten
ungroup [get_cells cluster_int_region_i/cluster_interconnect_wrap_i/xbar_tcdm_inst_WRAP/*]    -flatten
ungroup [get_cells cluster_int_region_i/mmu_wrap_i/*]    -flatten

ungroup [get_cells cluster_int_region_i/cluster_peripherals_i]
#ungroup [get_cells cluster_int_region_i/cluster_peripherals_i/cluster_control_unit_i/* ] -flatten   ;#is already flatten
#ungroup [get_cells cluster_int_region_i/cluster_peripherals_i/timer_unit_i/*           ] -flatten
ungroup [get_cells cluster_int_region_i/cluster_peripherals_i/event_unit_i/*           ] -flatten
#ungroup [get_cells cluster_int_region_i/cluster_peripherals_i/tcdm_pipe_unit_i/*       ] -flatten
#ungroup [get_cells cluster_int_region_i/cluster_peripherals_i/mmu_config_unit_i/*      ] -flatten
#ungroup [get_cells cluster_int_region_i/cluster_peripherals_i/icache_ctrl_unit_i/*     ] -flatten
