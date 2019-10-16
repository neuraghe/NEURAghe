#!/bin/tcsh
source scripts/colors.sh

echo ""
echo "${Green}--> Compiling PULP generic components... ${NC}"

echo "${Green}library: interfaces ${NC}"
rm -rf ${MSIM_LIBS_PATH}/interfaces_lib

vlib ${MSIM_LIBS_PATH}/interfaces_lib
vmap interfaces_lib ${MSIM_LIBS_PATH}/interfaces_lib

vlog -work interfaces_lib -quiet -sv   +incdir+./../rtl/includes ../rtl/components/pulp_interfaces.sv || exit 1

echo "${Green}library: work ${NC}"
echo "${Red}"

vlog -quiet -sv   +incdir+./../rtl/includes ../rtl/components/memory_models.sv        || exit 1

vlog -quiet -sv   +incdir+./../rtl/includes ../rtl/components/memwrap.sv              || exit 1
vlog -quiet       +incdir+./../rtl/includes ../rtl/components/pad_frame_pulp.sv        || exit 1

vlog -quiet -sv +incdir+./../rtl/includes   ../rtl/components/apb_clkdiv.sv           || exit 1

vlog -quiet -sv +incdir+./../rtl/includes   ../rtl/components/apb_soc_ctrl.sv         || exit 1
vlog -quiet -sv +incdir+./../rtl/includes   ../rtl/components/counter.sv              || exit 1
vlog -quiet -sv +incdir+./../rtl/includes   ../rtl/components/power_manager.sv        || exit 1
vlog -quiet -sv +incdir+./../rtl/includes   ../rtl/components/freq_meter.sv           || exit 1

vlog -quiet ../rtl/components/l2_ram_32768x64.sv      || exit 1

echo "${Cyan} PULP generic componens compilation complete! ${NC}"
