#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling AXI ID remapper...${NC}"

echo "${Green}library: axi_id_remap_lib ${NC}"

rm -rf ${MSIM_LIBS_PATH}/axi_id_remap_lib

vlib ${MSIM_LIBS_PATH}/axi_id_remap_lib
vmap axi_id_remap_lib ${MSIM_LIBS_PATH}/axi_id_remap_lib

echo "${Green}Compiling component:   ${Brown} axi_id_remap ${NC}"
echo "${Red}"

vlog -work axi_id_remap_lib -quiet -sv +incdir+${IPS_PATH}/axi/axi_node ${IPS_PATH}/axi/axi_id_remap/ID_Gen_16.sv    || exit 1
vlog -work axi_id_remap_lib -quiet -sv +incdir+${IPS_PATH}/axi/axi_node ${IPS_PATH}/axi/axi_id_remap/ID_Gen_64.sv    || exit 1
vlog -work axi_id_remap_lib -quiet -sv +incdir+${IPS_PATH}/axi/axi_node ${IPS_PATH}/axi/axi_id_remap/ID_Gen_4.sv     || exit 1
vlog -work axi_id_remap_lib -quiet -sv +incdir+${IPS_PATH}/axi/axi_node ${IPS_PATH}/axi/axi_id_remap/axi_id_remap.sv || exit 1

echo "${Cyan}--> AXI ID remapper compilation complete! ${NC}"
