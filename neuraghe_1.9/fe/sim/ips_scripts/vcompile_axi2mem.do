#!/bin/tcsh
source scripts/colors.sh

echo "${Green}---> Compiling AXI2MEM...${NC}"

echo "${Green}library: axi2mem_lib ${NC}"

rm -rf ${MSIM_LIBS_PATH}/axi2mem_lib

vlib ${MSIM_LIBS_PATH}/axi2mem_lib
vmap axi2mem_lib ${MSIM_LIBS_PATH}/axi2mem_lib

echo "${Green}Compiling component:   ${Brown} axi2mem ${NC}"
echo "${Red}"

vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_buffer.sv           || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_aw_buffer.sv        || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_ar_buffer.sv        || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_w_buffer.sv         || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_r_buffer.sv         || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_b_buffer.sv         || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_wr_channel.sv       || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_rd_channel.sv       || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_trans_unit.sv       || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_tcdm_rd_if.sv       || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_tcdm_wr_if.sv       || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_tcdm_synch.sv       || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_tcdm_unit.sv        || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem_busy_unit.sv        || exit 1
vlog -quiet -work axi2mem_lib -sv +incdir+${IPS_PATH}/axi/axi2mem ${IPS_PATH}/axi/axi2mem/axi2mem.sv                  || exit 1

echo "${Cyan}---> AXI2MEM compilation complete! ${NC}"
