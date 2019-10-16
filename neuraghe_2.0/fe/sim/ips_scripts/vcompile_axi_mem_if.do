#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling AXI memory interface...${NC}"

echo "${Green}library: axi_mem_if_lib ${NC}"

rm -rf ${MSIM_LIBS_PATH}/axi_mem_if_lib

vlib ${MSIM_LIBS_PATH}/axi_mem_if_lib
vmap axi_mem_if_lib ${MSIM_LIBS_PATH}/axi_mem_if_lib

echo "${Green}Compiling component:   ${Brown} axi_mem_if ${NC}"
echo "${Red}"

vlog -work axi_mem_if_lib -quiet -sv +incdir+${IPS_PATH}/axi/axi_node ${IPS_PATH}/axi/axi_mem_if/axi_mem_if.sv                   || exit 1
vlog -work axi_mem_if_lib -quiet -sv +incdir+${IPS_PATH}/axi/axi_node ${IPS_PATH}/axi/axi_mem_if/axi_mem_if_var_latency.sv       || exit 1

echo "${Cyan}--> AXI memory interface compilation complete! ${NC}"
