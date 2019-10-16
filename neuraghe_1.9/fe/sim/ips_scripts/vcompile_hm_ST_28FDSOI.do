#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling Hard Macro Models... ${NC}"

echo "${Green}library: hm_lib ${NC}"

rm -rf ${MSIM_LIBS_PATH}/hm_lib

vlib ${MSIM_LIBS_PATH}/hm_lib
vmap hm_lib ${MSIM_LIBS_PATH}/hm_lib

vlib ${MSIM_LIBS_PATH}/common_cells_lib
vmap common_cells_lib ${MSIM_LIBS_PATH}/common_cells_lib

echo "${Green}Compiling component:   ${Brown} common_cells ${NC}"
echo "${Red}"

vcom -work common_cells_lib -quiet ${IPS_PATH}/cea/common_cells/clock_buffer_cmos028_fdsoi.vhd 
vcom -work common_cells_lib -quiet ${IPS_PATH}/cea/common_cells/clock_inverter_cmos028_fdsoi.vhd 
vcom -work common_cells_lib -quiet ${IPS_PATH}/cea/common_cells/clock_gating_cmos028_fdsoi.vhd
vcom -work common_cells_lib -quiet ${IPS_PATH}/cea/common_cells/clock_mux2_cmos028_fdsoi.vhd
vcom -work common_cells_lib -quiet ${IPS_PATH}/cea/common_cells/reset_synchronizer.vhd
vcom -work common_cells_lib -quiet ${IPS_PATH}/cea/common_cells/synchronizer.vhd

echo "${Cyan}--> CEA common_cells compilation complete! ${NC}"


echo "${Green}--> Compiling FLL... ${NC}"

echo "${Green}library: fll_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/fll_lib

vlib ${MSIM_LIBS_PATH}/fll_lib
vmap fll_lib ${MSIM_LIBS_PATH}/fll_lib

echo "${Green}Compiling component:   ${Brown} fll_top ${NC}"
echo "${Red}"

vcom -work fll_lib -quiet ${IPS_PATH}/cea/FLL/C12T32_LL_DCO_PB10_4DelayCells.vhd
vcom -work fll_lib -quiet ${IPS_PATH}/cea/FLL/DCO_cmos028_fdsoi.vhd
vcom -work fll_lib -quiet ${IPS_PATH}/cea/FLL/fll_clk_div_select.vhd
vcom -work fll_lib -quiet ${IPS_PATH}/cea/FLL/fll_clk_ref.vhd
vcom -work fll_lib -quiet ${IPS_PATH}/cea/FLL/fll_clk_select.vhd
vcom -work fll_lib -quiet ${IPS_PATH}/cea/FLL/fll_control.vhd
vcom -work fll_lib -quiet ${IPS_PATH}/cea/FLL/fll_counter.vhd
vcom -work fll_lib -quiet ${IPS_PATH}/cea/FLL/fll_fdiv2.vhd
vcom -work fll_lib -quiet ${IPS_PATH}/cea/FLL/fll_top.vhd

echo "${Cyan}--> CEA FLL compilation complete! ${NC}"

echo "${Green}Compiling component:   ${Brown} EPFL BBGEN Hard Macros ${NC}"
echo "${Red}"

vlog -sv -work hm_lib -quiet  ${IPS_PATH}/epfl/bbgenV1/behavioral/vbbgen_PULPV3_monitor.sv    || exit 1
vlog -sv -work hm_lib -quiet  ${IPS_PATH}/epfl/bbgenV1/behavioral/vbbgen_PULPV3_driver.sv     || exit 1
vlog -sv -work hm_lib -quiet  ${IPS_PATH}/epfl/bbgenV1/behavioral/vbbgen_PULPV3_weakdriver.sv || exit 1

echo "${Green}Compiling component:   ${Brown} CEA PMB Hard Macros ${NC}"
echo "${Red}"

vcom -quiet     -work hm_lib ${IPS_PATH}/cea/CVP_MPROBE/C28SOI_LL_MULTIPROBE_rtl.vhd

echo "${Green}Compiling component:   ${Brown} ST PMB Hard Macros ${NC}"
echo "${Red}"

vlog -quiet -sv -work hm_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_SENSOR_GO1_LR.v

echo "${Cyan}--> Hard Macro libraries compilation complete! ${NC}"
