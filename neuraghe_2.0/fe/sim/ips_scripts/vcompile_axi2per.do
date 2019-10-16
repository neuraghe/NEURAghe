#!/bin/tcsh
source scripts/colors.sh

echo "${Green}---> Compiling AXI2PER...${NC}"

echo "${Green}library: axi2per_lib ${NC}"

rm -rf ${MSIM_LIBS_PATH}/axi2per_lib

vlib ${MSIM_LIBS_PATH}/axi2per_lib
vmap axi2per_lib ${MSIM_LIBS_PATH}/axi2per_lib

echo "${Green}Compiling component:   ${Brown} axi2per ${NC}"
echo "${Red}"

vlog -quiet -work axi2per_lib -sv +incdir+${IPS_PATH}/axi/axi2per ${IPS_PATH}/axi/axi2per/axi2per_buffer.sv           || exit 1
vlog -quiet -work axi2per_lib -sv +incdir+${IPS_PATH}/axi/axi2per ${IPS_PATH}/axi/axi2per/axi2per_aw_buffer.sv        || exit 1
vlog -quiet -work axi2per_lib -sv +incdir+${IPS_PATH}/axi/axi2per ${IPS_PATH}/axi/axi2per/axi2per_ar_buffer.sv        || exit 1
vlog -quiet -work axi2per_lib -sv +incdir+${IPS_PATH}/axi/axi2per ${IPS_PATH}/axi/axi2per/axi2per_w_buffer.sv         || exit 1
vlog -quiet -work axi2per_lib -sv +incdir+${IPS_PATH}/axi/axi2per ${IPS_PATH}/axi/axi2per/axi2per_r_buffer.sv         || exit 1
vlog -quiet -work axi2per_lib -sv +incdir+${IPS_PATH}/axi/axi2per ${IPS_PATH}/axi/axi2per/axi2per_b_buffer.sv         || exit 1
vlog -quiet -work axi2per_lib -sv +incdir+${IPS_PATH}/axi/axi2per ${IPS_PATH}/axi/axi2per/axi2per_req_channel.sv      || exit 1
vlog -quiet -work axi2per_lib -sv +incdir+${IPS_PATH}/axi/axi2per ${IPS_PATH}/axi/axi2per/axi2per_res_channel.sv      || exit 1
vlog -quiet -work axi2per_lib -sv +incdir+${IPS_PATH}/axi/axi2per ${IPS_PATH}/axi/axi2per/axi2per.sv                  || exit 1

echo "${Cyan}---> AXI2PER compilation complete! ${NC}"
