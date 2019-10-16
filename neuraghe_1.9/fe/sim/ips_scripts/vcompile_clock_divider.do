#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling clock_divider_lib... ${NC}"

echo "${Green}library: clock_divider_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/clock_divider_lib

vlib ${MSIM_LIBS_PATH}/clock_divider_lib
vmap clock_divider_lib ${MSIM_LIBS_PATH}/clock_divider_lib

echo "${Green}Compiling component:   ${Brown} clock_divider ${NC}"
echo "${Red}"

vlog -quiet -work clock_divider_lib -sv ${IPS_PATH}/clock_divider/clock_divider_counter.sv    || exit 1 
vlog -quiet -work clock_divider_lib -sv ${IPS_PATH}/clock_divider/clock_divider.sv            || exit 1

echo "${Cyan}--> clock_divider_lib compilation complete! ${NC}"



