#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling CEA common_cells... ${NC}"

echo "${Green}library: common_cells ${NC}"
rm -rf ${MSIM_LIBS_PATH}/common_cells_lib

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

echo "${Cyan}--> FLL compilation complete! ${NC}"


echo "${Green}--> Compiling CVP... ${NC}"

echo "${Green}library: cvp_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/cvp_lib

vlib ${MSIM_LIBS_PATH}/cvp_lib
vmap cvp_lib ${MSIM_LIBS_PATH}/cvp_lib

echo "${Green}Compiling component:   ${Brown} cvp_top ${NC}"
echo "${Red}"

vcom -work cvp_lib -quiet ${IPS_PATH}/cea/CVP_MPROBE/C28SOI_LL_MULTIPROBE_rtl.vhd
vcom -work cvp_lib -quiet ${IPS_PATH}/cea/CVP_MPROBE/cvp_mprob_controller.vhd
vcom -work cvp_lib -quiet ${IPS_PATH}/cea/CVP_MPROBE/cvp_mprobe.vhd
vcom -work cvp_lib -quiet ${IPS_PATH}/cea/CVP/cvp_clock_gen.vhd
vcom -work cvp_lib -quiet ${IPS_PATH}/cea/CVP/cvp.vhd

echo "${Cyan}--> CVP compilation complete! ${NC}"


