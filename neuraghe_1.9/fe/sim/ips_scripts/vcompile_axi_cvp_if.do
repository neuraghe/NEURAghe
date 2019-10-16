#!/bin/tcsh

source scripts/colors.sh

echo "${Green}--> Compiling AXI cvp interface... ${NC}"

echo "${Green}library: axi_cvp_if_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/axi_cvp_if_lib

vlib ${MSIM_LIBS_PATH}/axi_cvp_if_lib
vmap axi_cvp_if_lib ${MSIM_LIBS_PATH}/axi_cvp_if_lib

echo "${Green}Compiling component:   ${Brown} axi_cvp_if ${NC}"
echo "${Red}"



vlog -work axi_cvp_if_lib -quiet -sv ${IPS_PATH}/axi/axi_cvp_if/axi_cvp_if.sv     || exit 1

echo "${Cyan}--> AXI cvp interface compilation complete! ${NC}"

