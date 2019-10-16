#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling EPFL BBGEN... ${NC}"

echo "${Green}library: bbgen_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/bbgen_lib

vlib ${MSIM_LIBS_PATH}/bbgen_lib
vmap bbgen_lib ${MSIM_LIBS_PATH}/bbgen_lib

echo "${Green}Compiling component:   ${Brown} bbgen_lib ${NC}"
echo "${Red}"

vcom -work bbgen_lib -quiet ${IPS_PATH}/epfl/bbgenV1/rtl/bbgen_package.vhd                      || exit 1
vcom -work bbgen_lib -quiet ${IPS_PATH}/epfl/bbgenV1/rtl/CVP/cvp_package.vhd                    || exit 1
vcom -work bbgen_lib -quiet ${IPS_PATH}/epfl/bbgenV1/rtl/bbgen_synchronizer.vhd                 || exit 1
vcom -work bbgen_lib -quiet ${IPS_PATH}/epfl/bbgenV1/rtl/bbgen_clock_box.vhd                    || exit 1
vcom -work bbgen_lib -quiet ${IPS_PATH}/epfl/bbgenV1/rtl/bbgen_cvp_interface.vhd                || exit 1
vcom -work bbgen_lib -quiet ${IPS_PATH}/epfl/bbgenV1/rtl/bbgen_nwell_control.vhd                || exit 1
vcom -work bbgen_lib -quiet ${IPS_PATH}/epfl/bbgenV1/rtl/bbgen_pwell_control.vhd                || exit 1
vcom -work bbgen_lib -2008 -quiet ${IPS_PATH}/epfl/bbgenV1/rtl/bbgen_register_bank.vhd          || exit 1
vcom -work bbgen_lib -quiet ${IPS_PATH}/epfl/bbgenV1/rtl/bbgen_control.vhd                      || exit 1


#EMPTY MODULES --> EPFL please check
vlog -sv -work bbgen_lib -quiet  ${IPS_PATH}/epfl/bbgenV1/behavioral/vbbgen_PULPV3_monitor.sv    || exit 1
vlog -sv -work bbgen_lib -quiet  ${IPS_PATH}/epfl/bbgenV1/behavioral/vbbgen_PULPV3_driver.sv     || exit 1
vlog -sv -work bbgen_lib -quiet  ${IPS_PATH}/epfl/bbgenV1/behavioral/vbbgen_PULPV3_weakdriver.sv || exit 1


echo "${Cyan}--> CEA common_cells compilation complete! ${NC}"

