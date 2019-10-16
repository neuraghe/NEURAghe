#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling  or1200 processor core... ${NC}"

rm -rf ${MSIM_LIBS_PATH}/or1200_lib

vlib ${MSIM_LIBS_PATH}/or1200_lib
vmap or1200_lib ${MSIM_LIBS_PATH}/or1200_lib

echo "${Green}Compiling component:   ${Brown} or1200_top ${NC}"
echo "${Red}"

vlog -quiet -sv -work or1200_lib ${IPS_PATH}/or1200/or_stack_monitor.sv            || exit 1

vcom -quiet -work or1200_lib ${IPS_PATH}/scm/scm128x32/VHDLTools.vhd           || exit 1
vcom -quiet -work or1200_lib ${IPS_PATH}/scm/scm128x32/SCM_pkg.vhd             || exit 1
vcom -quiet -work or1200_lib ${IPS_PATH}/scm/scm128x32/mcg.vhd                 || exit 1

vlog -quiet -sv -work or1200_lib -f ${IPS_PATH}/scripts/or1200.scr +incdir+${IPS_PATH}/or1200/includes ${IPS_PATH}/or1200/or1200_ic_tag_ffram.sv ${IPS_PATH}/or1200/or1200_top.v || exit 1

echo "${Cyan}--> or1200 processor core compilation complete! ${NC}"
