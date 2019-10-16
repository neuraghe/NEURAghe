#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling PER2AXI...${NC}"

echo "${Green}library: per2axi_lib ${NC}"

rm -rf ${MSIM_LIBS_PATH}/per2axi_lib

vlib ${MSIM_LIBS_PATH}/per2axi_lib
vmap per2axi_lib ${MSIM_LIBS_PATH}/per2axi_lib

echo "${Green}Compiling component:   ${Brown} per2axi ${NC}"
echo "${Red}"

vlog -work per2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/per2axi ${IPS_PATH}/axi/per2axi/per2axi_buffer.sv       || exit 1
vlog -work per2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/per2axi ${IPS_PATH}/axi/per2axi/per2axi_aw_buffer.sv    || exit 1
vlog -work per2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/per2axi ${IPS_PATH}/axi/per2axi/per2axi_ar_buffer.sv    || exit 1
vlog -work per2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/per2axi ${IPS_PATH}/axi/per2axi/per2axi_w_buffer.sv     || exit 1
vlog -work per2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/per2axi ${IPS_PATH}/axi/per2axi/per2axi_r_buffer.sv     || exit 1
vlog -work per2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/per2axi ${IPS_PATH}/axi/per2axi/per2axi_b_buffer.sv     || exit 1
vlog -work per2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/per2axi ${IPS_PATH}/axi/per2axi/per2axi_req_channel.sv  || exit 1
vlog -work per2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/per2axi ${IPS_PATH}/axi/per2axi/per2axi_res_channel.sv  || exit 1
vlog -work per2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/per2axi ${IPS_PATH}/axi/per2axi/per2axi_busy_unit.sv    || exit 1
vlog -work per2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/per2axi ${IPS_PATH}/axi/per2axi/per2axi.sv              || exit 1

echo "${Cyan}--> PER2AXI compilation complete! ${NC}"
