#!/bin/tcsh

source scripts/colors.sh

echo "${Green}--> Compiling AXI GPREG INTERFACE... ${NC}"

echo "${Green}library: axi_gpreg_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/axi_gpreg_lib

vlib ${MSIM_LIBS_PATH}/axi_gpreg_lib
vmap axi_gpreg_lib ${MSIM_LIBS_PATH}/axi_gpreg_lib

echo "${Green}Compiling component:   ${Brown} axi_gpreg ${NC}"
echo "${Red}"

vlog -work axi_gpreg_lib -quiet -sv ${IPS_PATH}/axi/axi_gpreg/axi_gpreg.sv    || exit 1
vlog -work axi_gpreg_lib -quiet -sv ${IPS_PATH}/axi/axi_gpreg/uart_fifo.sv    || exit 1 
vlog -work axi_gpreg_lib -quiet -sv ${IPS_PATH}/axi/axi_gpreg/uart.sv         || exit 1 
vlog -work axi_gpreg_lib -quiet -sv ${IPS_PATH}/axi/axi_gpreg/uart_tx.sv      || exit 1

echo "${Cyan}--> AXI GPREG INTERFACE compilation complete! ${NC}"

