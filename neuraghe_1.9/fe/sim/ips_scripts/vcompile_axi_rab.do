#!/bin/tcsh

source scripts/colors.sh

echo "${Green}--> Compiling AXI RAB... ${NC}"

echo "${Green}library: axi_rab_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/axi_rab_lib

vlib ${MSIM_LIBS_PATH}/axi_rab_lib
vmap axi_rab_lib ${MSIM_LIBS_PATH}/axi_rab_lib

echo "${Green}Compiling component:   ${Brown} axi_rab ${NC}"
echo "${Red}"

vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi4_arch_buffer.v  || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi4_arch_sender.v  || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi4_awch_buffer.v  || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi4_awch_sender.v  || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi4_dwch_buffer.v  || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi4_dwch_sender.v  || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi4_rrch_buffer.v  || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi4_rrch_sender.v  || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi4_rwch_buffer.v  || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi4_rwch_sender.v  || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi_buffer_rab.v    || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi_regs_top_rab.sv || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/fsm.sv              || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/rab_core.sv         || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/rab_slice.sv        || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/slice_top.sv        || exit 1
vlog -work axi_rab_lib -quiet -sv ${IPS_PATH}/axi/axi_rab/axi_rab_top.sv      || exit 1

echo "${Cyan}--> AXI RAB compilation complete! ${NC}"

