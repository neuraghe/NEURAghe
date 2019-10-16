#!/bin/tcsh
source scripts/colors.sh

# decide if we want to build for riscv or or1k
if ( ! $?PULP_CORE) then
  set PULP_CORE="OR10N"
endif

if ( $PULP_CORE == "riscv" ) then
  set CORE_DEFINES=+define+RISCV
  echo "${Yellow} Compiling for RISCV core ${NC}"
else
  set CORE_DEFINES=+define+OR10N
  echo "${Yellow} Compiling for OR10N core ${NC}"
endif

echo ""
echo "${Green}--> Compiling axi slice dc wrap...${NC}"
echo "${Red}"

vlog -quiet -sv +define+SYNTHESIS +incdir+./../rtl/includes ../rtl/ulpcluster/axi_slice_dc_master_wrap.sv || exit 1
vlog -quiet -sv +define+SYNTHESIS +incdir+./../rtl/includes ../rtl/ulpcluster/axi_slice_dc_slave_wrap.sv  || exit 1

echo "${Cyan} axi slice dc wrap has been Compiled Succesfully${NC}"

if ( "$1" != "USE_CLUSTER_NETLIST" ) then

  #############################################################################
  # FULL CLUSTER SIMULATION
  #############################################################################
  echo ""
  echo "${Green}--> Compiling ULPCLUSTER components...${NC}"
  echo "${Green}Compiling component:   ${Brown} work.ulpcluster ${NC}"
  echo "${Green}library: work ${NC}"
  echo "${Red}"
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/axi_boot_addr_tran_wrap.sv                    || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/cluster_peripherals.sv                        || exit 1
  #vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/tcdm_banks_wrap.sv                            || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/tcdm_dp_banks_asym.sv                         || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/xbar_master_sel.sv                            || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/cluster_interconnect_wrap.sv                  || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/hwce_p2p_tcdm.sv                             || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/tcdm_xbar.sv                             || exit 1
    vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/tcdm_hwce_xbar.sv                             || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/tcdm_g_master.sv                         || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/tcdm_g_slave.sv                          || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/hwce_periph_adapt.sv                          || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/axi_slice_wrap.sv                             || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/per2axi_wrap.sv                               || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/axi2per_wrap.sv                               || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/axi2mem_wrap.sv                               || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/dmac_per_wrap.sv                              || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/dmac_wrap.sv                                  || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/mchan_prog.sv                                 || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/uC_to_prog.sv                                 || exit 1
  #vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/mchan_per_prog.sv                             || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/instr_bus_wrap.sv                             || exit 1

  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/adv_debug_if_wrap.sv                          || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/cluster_bus_wrap.sv                           || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/clkgate_bbmux_unit.sv                         || exit 1

  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/mmu_wrap.sv                                   || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/mmu.sv                                        || exit 1

  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/core_demux.sv                                 || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/core_data_memory.sv                                 || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/periph_demux.sv                               || exit 1


  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/hwce_wrap.sv                                  || exit 1

  #vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/cluster_int_region.sv                         || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpcluster/cluster_ext_region.sv                         || exit 1

  vlog -quiet -sv +incdir+./../rtl/includes $CORE_DEFINES  ../rtl/ulpcluster/core_region.sv                 || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes                ../rtl/ulpcluster/periph_FIFO.sv                 || exit 1
  vlog -quiet -sv +incdir+./../rtl/includes                ../rtl/ulpcluster/periph_FIFO_wrap.sv            || exit 1
  vlog -quiet -sv                                         ../rtl/ulpcluster/ibus_lint_memory.sv             || exit 1

  #vlog -quiet  -sv +incdir+./../rtl/includes $CORE_DEFINES ../rtl/ulpcluster/ulpcluster.sv                  || exit 1

  echo "${Cyan} ULPCLUSTER components have been Compiled Succesfully${NC}"

else
  #############################################################################
  # POST-LAYOUT SIMULATION!
  #############################################################################

  echo "${Green} -> Compiling cluster netlist and wrapper ..."

  echo "${Red}"


  vlog -quiet ../../st28fdsoi/syn_ulpcluster_8T/export/ulpcluster.v                                         || exit 1


  echo "${Cyan} cluster netlist and wrapper has been compiled Succesfully${NC}"

endif

if ( "$1" == "USE_CLUSTER_FPGANETLIST" ) then

echo "${Green} -> Compiling cluster FPGA netlist and wrapper ..."

echo "${Red}"

vlog -quiet ../../fpga/ulpcluster/ulpcluster_funcsim.v                                                      || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../../fpga/rtl/ulpcluster_wrap.sv                                 || exit 1

echo "${Cyan} cluster FPGA netlist and wrapper have been compiled Succesfully${NC}"

endif
