#!/bin/tcsh
source scripts/colors.sh

echo ""
echo "${Green}  -> Compiling ULPSoC components...${NC}"

echo "${Green}Compiling component:   ${Brown} work.pulp_chip ${NC}"
echo "${Green}library: work ${NC}"
echo "${Red}"
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/soc_peripherals.sv                                 || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/axi2apb_wrap.sv                                    || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/axi_mem_if_wrap.sv                                 || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/axi_mem_if_DP_wrap.sv                              || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/axi_spi_slave_wrap.sv                              || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/soc_bus_wrap.sv                                    || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/axi_id_remap_wrap.sv                               || exit 1
vlog -quiet -sv  +define+$1 +incdir+./../rtl/includes ../rtl/ulpsoc/l2_ram.sv                              || exit 1
vlog -quiet -sv  +define+$1 +incdir+./../rtl/includes ../rtl/ulpsoc/l2_ram_dp.sv                           || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/boot_rom.sv                                        || exit 1
vlog -quiet -sv +define+'BIG_L2_ONLY_SIM' +incdir+./../rtl/includes ../rtl/ulpsoc/ulpsoc.sv                                          || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/axi_jtag_wrap.sv                                   || exit 1

#Level Shifters from CLUSTER to SOC
vlog -quiet  -sv +incdir+./../rtl/includes  ../rtl/ulpsoc/ulpcluster_ls_wrap.sv                            || exit 1
vlog -quiet  -sv +incdir+./../rtl/includes  ../rtl/ulpsoc/ulpcluster_axi_master_LSIN_wrap.sv               || exit 1
vlog -quiet  -sv +incdir+./../rtl/includes  ../rtl/ulpsoc/ulpcluster_axi_slave_LSIN_wrap.sv                || exit 1



vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/jtag_tap_top.sv                                    || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/axi_dbg_wrap.sv                                    || exit 1

vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/level_shifter_wrap_soc.sv                          || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/ulpsoc_axi_slave_LSIN_wrap.sv                      || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/ulpsoc_axi_master_LSIN_wrap.sv                     || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/ulpsoc_LSIN_wrap.sv                                || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/pulp_chip_LS_wrap.sv                               || exit 1

vlog -quiet -sv +incdir+./../rtl/includes ../rtl/ulpsoc/BBGEN_wrap.sv                                      || exit 1



echo "${Cyan} ULPSoC components have been Compiled Succesfully${NC}"
