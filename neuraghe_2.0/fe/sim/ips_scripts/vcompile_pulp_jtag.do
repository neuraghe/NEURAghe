#!/bin/tcsh
source scripts/colors.sh

echo "${Green}---> Compiling JTAG components..."

echo "${Green}library: jtag_lib ${NC}"

\rm -rf ${MSIM_LIBS_PATH}/jtag_lib

vlib ${MSIM_LIBS_PATH}/jtag_lib
vmap jtag_lib ${MSIM_LIBS_PATH}/jtag_lib

echo "${Green}Compiling component:   ${Brown} tap_top ${NC}"
echo "${Red}"

vlog -sv -quiet -work jtag_lib ${IPS_PATH}/jtag_pulp/src/jtag_sync.sv             || exit 1
vlog -sv -quiet -work jtag_lib ${IPS_PATH}/jtag_pulp/src/jtag_rst_synch.sv        || exit 1
vlog -sv -quiet -work jtag_lib ${IPS_PATH}/jtag_pulp/src/jtag_enable_synch.sv     || exit 1

vlog -quiet -work jtag_lib ${IPS_PATH}/jtag_pulp/src/tap_top.v                    || exit 1
vlog -quiet -sv -work jtag_lib ${IPS_PATH}/jtag_pulp/src/bscell.sv                || exit 1
vlog -quiet -sv -work jtag_lib ${IPS_PATH}/jtag_pulp/src/jtagreg.sv               || exit 1
vlog -quiet -sv -work jtag_lib ${IPS_PATH}/jtag_pulp/src/jtag_enable.sv           || exit 1

echo "${Green}Compiling component:   ${Brown} jtag_axi_wrap ${NC}"
vlog -quiet -sv -work jtag_lib  +incdir+./../rtl/includes ${IPS_PATH}/jtag_pulp/src/jtag_axi_wrap.sv         || exit 1



echo "${Cyan}--> JTAG components compilation complete! ${NC}"
