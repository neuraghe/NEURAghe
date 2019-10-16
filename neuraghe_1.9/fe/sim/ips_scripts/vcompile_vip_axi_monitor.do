#!/bin/tcsh
source scripts/colors.sh

echo "${Green}---> Compiling VIP axi monitor...${NC}"

echo "${Green}library: vip_axi_monitor_lib ${NC}"

rm -rf ${MSIM_LIBS_PATH}/vip_axi_monitor_lib

vlib ${MSIM_LIBS_PATH}/vip_axi_monitor_lib
vmap vip_axi_monitor_lib ${MSIM_LIBS_PATH}/vip_axi_monitor_lib

echo "${Green}Compiling component:   ${Brown} vip_axi_monitor ${NC}"
echo "${Red}"

vlog -quiet -work vip_axi_monitor_lib -sv +define+AXI4_XCHECK_OFF +incdir+${IPS_PATH}/vip/axi_monitor/sva ${IPS_PATH}/vip/axi_monitor/sva/Axi4PC.sv   || exit 1

echo "${Cyan}---> VIP axi monitor compilation complete! ${NC}"
