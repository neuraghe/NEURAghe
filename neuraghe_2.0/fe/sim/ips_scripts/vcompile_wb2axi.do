#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling WB2AXI...${NC}"

echo "${Green}library: wb2axi_lib ${NC}"

rm -rf ${MSIM_LIBS_PATH}/wb2axi_lib

vlib ${MSIM_LIBS_PATH}/wb2axi_lib
vmap wb2axi_lib ${MSIM_LIBS_PATH}/wb2axi_lib

echo "${Green}Compiling component:   ${Brown} wb2axi ${NC}"
echo "${Red}"

vlog -work wb2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/wb2axi ${IPS_PATH}/axi/wb2axi/wb2axi_buffer.sv
vlog -work wb2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/wb2axi ${IPS_PATH}/axi/wb2axi/wb2axi_aw_buffer.sv
vlog -work wb2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/wb2axi ${IPS_PATH}/axi/wb2axi/wb2axi_ar_buffer.sv
vlog -work wb2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/wb2axi ${IPS_PATH}/axi/wb2axi/wb2axi_w_buffer.sv
vlog -work wb2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/wb2axi ${IPS_PATH}/axi/wb2axi/wb2axi_r_buffer.sv
vlog -work wb2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/wb2axi ${IPS_PATH}/axi/wb2axi/wb2axi_b_buffer.sv
vlog -work wb2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/wb2axi ${IPS_PATH}/axi/wb2axi/wb2axi_req_channel.sv
vlog -work wb2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/wb2axi ${IPS_PATH}/axi/wb2axi/wb2axi_res_channel.sv
vlog -work wb2axi_lib -quiet -sv +incdir+${IPS_PATH}/axi/wb2axi ${IPS_PATH}/axi/wb2axi/wb2axi.sv

echo "${Cyan}--> WB2AXI compilation complete! ${NC}"
