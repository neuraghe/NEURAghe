#!/bin/tcsh
clear
source scripts/colors.sh
source scripts/print_logo.csh
sleep 2


\rm -rf modelsim_libs
vlib modelsim_libs

\rm -rf work
vlib work

#vmap secureip xilinx_libs/secureip
#vmap simprims_ver xilinx_libs/simprims_ver
#vmap unifast xilinx_libs/unifast
#vmap unifast_ver xilinx_libs/unifast_ver
#vmap unimacro_ver xilinx_libs/unimacro_ver
#vmap unisim xilinx_libs/unisim
#vmap unisims_ver xilinx_libs/unisims_ver

vmap secureip /home/gian/pulp/pulp4/fe/sim/xilinx_libs/secureip
vmap simprims_ver /home/gian/pulp/pulp4/fe/sim/xilinx_libs/simprims_ver
vmap unifast /home/gian/pulp/pulp4/fe/sim/xilinx_libs/unifast
vmap unifast_ver /home/gian/pulp/pulp4/fe/sim/xilinx_libs/unifast_ver
vmap unimacro /home/gian/pulp/pulp4/fe/sim/xilinx_libs/unimacro
vmap unimacro_ver /home/gian/pulp/pulp4/fe/sim/xilinx_libs/unimacro_ver
vmap unisim /home/gian/pulp/pulp4/fe/sim/xilinx_libs/unisim
vmap unisims_ver /home/gian/pulp/pulp4/fe/sim/xilinx_libs/unisims_ver

setenv MSIM_LIBS_PATH `pwd`/modelsim_libs
setenv IPS_PATH `pwd`/../ips

echo ""
echo "${Green}--> Compiling PULP Platform... ${NC}"

source ${IPS_PATH}/scripts/vcompile_tech_ST_28FDSOI.do        || exit 1
source ${IPS_PATH}/scripts/vcompile_tech_UMC65.do             || exit 1

source ${IPS_PATH}/scripts/vcompile_st_pmb.do                 || exit 1
source ${IPS_PATH}/scripts/vcompile_epfl.do                   || exit 1
source ${IPS_PATH}/scripts/vcompile_fll.do                    || exit 1
source ${IPS_PATH}/scripts/vcompile_hwce.do                   || exit 1
source ${IPS_PATH}/scripts/vcompile_adv_dbg_if.do             || exit 1
#source ${IPS_PATH}/scripts/vcompile_tech_ST_28FDSOI.do       || exit 1
#source ${IPS_PATH}/scripts/vcompile_tech_UMC_65BULK.do       || exit 1
source ${IPS_PATH}/scripts/vcompile_cluster_interconnect.do   || exit 1
source ${IPS_PATH}/scripts/vcompile_pulp_jtag.do              || exit 1
source ${IPS_PATH}/scripts/vcompile_or1200.do                 || exit 1
source ${IPS_PATH}/scripts/vcompile_axi_id_remap.do           || exit 1
source ${IPS_PATH}/scripts/vcompile_axi2per.do                || exit 1
source ${IPS_PATH}/scripts/vcompile_per2axi.do                || exit 1
source ${IPS_PATH}/scripts/vcompile_wb2axi.do                 || exit 1
source ${IPS_PATH}/scripts/vcompile_axi_node.do               || exit 1
source ${IPS_PATH}/scripts/vcompile_axi_mem_if.do             || exit 1
source ${IPS_PATH}/scripts/vcompile_axi_mem_DP_if.do          || exit 1
source ${IPS_PATH}/scripts/vcompile_axi_slice.do              || exit 1
source ${IPS_PATH}/scripts/vcompile_axi_slice_dc.do           || exit 1
source ${IPS_PATH}/scripts/vcompile_axi_spi_master.do         || exit 1
source ${IPS_PATH}/scripts/vcompile_axi_spi_slave.do          || exit 1
source ${IPS_PATH}/scripts/vcompile_axi2mem.do                || exit 1
source ${IPS_PATH}/scripts/vcompile_axi2apb.do                || exit 1
source ${IPS_PATH}/scripts/vcompile_axi_id_remap.do           || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_gpio.do               || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_uart.do               || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_clkdiv.do             || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_spi_master.do         || exit 1
source ${IPS_PATH}/scripts/vcompile_cea.do                    || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_cvp_if.do             || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_i2c.do                || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_audio.do              || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_cerebro_ctrl.do       || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_soc_ctrl.do           || exit 1
source ${IPS_PATH}/scripts/vcompile_mchan.do                  || exit 1
source ${IPS_PATH}/scripts/vcompile_clock_divider.do          || exit 1
source ${IPS_PATH}/scripts/vcompile_scm.do                    || exit 1
source ${IPS_PATH}/scripts/vcompile_common_cells.do           || exit 1
source ${IPS_PATH}/scripts/vcompile_or10n.do                  || exit 1
source ${IPS_PATH}/scripts/vcompile_icache.do                 || exit 1
source ${IPS_PATH}/scripts/vcompile_cluster_peripherals.do    || exit 1
source ${IPS_PATH}/scripts/vcompile_vip_axi_monitor.do        || exit 1
source ${IPS_PATH}/scripts/vcompile_hwacc.do                  || exit 1
#source ${IPS_PATH}/scripts/vcompile_udma.do                  || exit 1

source ./scripts/vcompile_fpga_modules.do     || exit 1

source ./scripts/vcompile_components.do                       || exit 1
source ./scripts/vcompile_ulpcluster_fpga.do                  || exit 1
source ./scripts/vcompile_ulpsoc.do "USE_CLUSTER_FPGANETLIST" || exit 1
source ./scripts/vcompile_pulp_chip.do                        || exit 1
source ./scripts/vcompile_models.do                           || exit 1
source ./scripts/vcompile_tb.do "USE_CLUSTER_NETLIST"         || exit 1


echo "${Green}--> PULP platform compilation Complete! ${NC}"
echo ""
