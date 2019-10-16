#!/bin/tcsh

source scripts/colors.sh

echo "${Green}--> Compiling AXI SPI MASTER INTERFACE... ${NC}"

echo "${Green}library: axi_spi_master_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/axi_spi_master_lib

vlib ${MSIM_LIBS_PATH}/axi_spi_master_lib
vmap axi_spi_master_lib ${MSIM_LIBS_PATH}/axi_spi_master_lib

echo "${Green}Compiling component:   ${Brown} axi_spi_master ${NC}"
echo "${Red}"



vlog -work axi_spi_master_lib -quiet -sv ${IPS_PATH}/axi/axi_spi_master/spi_master_axi_if.sv     || exit 1
vlog -work axi_spi_master_lib -quiet -sv ${IPS_PATH}/axi/axi_spi_master/spi_master_clkgen.sv     || exit 1
vlog -work axi_spi_master_lib -quiet -sv ${IPS_PATH}/axi/axi_spi_master/spi_master_fifo.sv       || exit 1
vlog -work axi_spi_master_lib -quiet -sv ${IPS_PATH}/axi/axi_spi_master/spi_master_rx.sv         || exit 1
vlog -work axi_spi_master_lib -quiet -sv ${IPS_PATH}/axi/axi_spi_master/spi_master_tx.sv         || exit 1
vlog -work axi_spi_master_lib -quiet -sv ${IPS_PATH}/axi/axi_spi_master/spi_master_controller.sv || exit 1
vlog -work axi_spi_master_lib -quiet -sv ${IPS_PATH}/axi/axi_spi_master/axi_spi_master.sv        || exit 1

echo "${Cyan}--> AXI SPI MASTER INTERFACE compilation complete! ${NC}"

