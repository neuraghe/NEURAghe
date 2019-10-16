#!/bin/tcsh
source scripts/colors.sh

\rm -rf modelsim_libs
vlib modelsim_libs

setenv MSIM_LIBS_PATH ./modelsim_libs
setenv IPS_PATH ../ips

echo ""
echo "${Green}--> Compiling PULP Libraries... ${NC}"

source ${IPS_PATH}/scripts/vcompile_hwce.do                   || exit 1
source ${IPS_PATH}/scripts/vcompile_epfl.do                   || exit 1
source ${IPS_PATH}/scripts/vcompile_fll.do                   || exit 1
source ${IPS_PATH}/scripts/vcompile_adv_dbg_if.do             || exit 1
#source ${IPS_PATH}/scripts/vcompile_tech_ST_28FDSOI.do        || exit 1
#source ${IPS_PATH}/scripts/vcompile_tech_UMC_65BULK.do        || exit 1
source ${IPS_PATH}/scripts/vcompile_cluster_interconnect.do   || exit 1
source ${IPS_PATH}/scripts/vcompile_pulp_jtag.do              || exit 1
source ${IPS_PATH}/scripts/vcompile_or1200.do                 || exit 1
source ${IPS_PATH}/scripts/vcompile_axi_id_remap.do           || exit 1
source ${IPS_PATH}/scripts/vcompile_axi2per.do                || exit 1
source ${IPS_PATH}/scripts/vcompile_per2axi.do                || exit 1
source ${IPS_PATH}/scripts/vcompile_wb2axi.do                 || exit 1
source ${IPS_PATH}/scripts/vcompile_axi_node.do               || exit 1
source ${IPS_PATH}/scripts/vcompile_axi_mem_if.do             || exit 1
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
source ${IPS_PATH}/scripts/vcompile_apb_fll_if.do             || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_i2c.do                || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_audio.do              || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_cerebro_ctrl.do       || exit 1
source ${IPS_PATH}/scripts/vcompile_apb_soc_ctrl.do           || exit 1
source ${IPS_PATH}/scripts/vcompile_mchan.do                  || exit 1
source ${IPS_PATH}/scripts/vcompile_clock_divider.do          || exit 1
source ${IPS_PATH}/scripts/vcompile_scm.do                    || exit 1
source ${IPS_PATH}/scripts/vcompile_common_cells.do           || exit 1
source ${IPS_PATH}/scripts/vcompile_or10n.do                  || exit 1
source ${IPS_PATH}/scripts/vcompile_icache_new.do             || exit 1
source ${IPS_PATH}/scripts/vcompile_icache.do                 || exit 1
source ${IPS_PATH}/scripts/vcompile_cluster_peripherals.do    || exit 1
source ${IPS_PATH}/scripts/vcompile_vip_axi_monitor.do        || exit 1
source ${IPS_PATH}/scripts/vcompile_hwacc.do                  || exit 1

echo "${Green}--> PULP Libraries compilation Complete! ${NC}"
echo ""
