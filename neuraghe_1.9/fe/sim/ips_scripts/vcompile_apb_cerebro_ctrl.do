#!/bin/tcsh

source scripts/colors.sh

echo "${Green}--> Compiling APB Cerebro Control Block... ${NC}"

# check if environment variables are defined
if (! $?MSIM_LIBS_PATH ) then
  echo "${Red} MSIM_LIBS_PATH is not defined ${NC}"
  exit 1
endif

if (! $?IPS_PATH ) then
  echo "${Red} IPS_PATH is not defined ${NC}"
  exit 1
endif


echo "${Green}library: apb_cerebro_ctrl_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/apb_cerebro_ctrl_lib

vlib ${MSIM_LIBS_PATH}/apb_cerebro_ctrl_lib
vmap apb_cerebro_ctrl_lib ${MSIM_LIBS_PATH}/apb_cerebro_ctrl_lib

echo "${Green}Compiling component:   ${Brown} apb_cerebro_ctrl ${NC}"
echo "${Red}"


vlog -work apb_cerebro_ctrl_lib -quiet -sv +incdir+${IPS_PATH}/apb_internals/apb_cerebro_ctrl/ ${IPS_PATH}/apb_internals/apb_cerebro_ctrl/cerebro_ctrl.sv    || exit 1
vlog -work apb_cerebro_ctrl_lib -quiet -sv +incdir+${IPS_PATH}/apb_internals/apb_cerebro_ctrl/ ${IPS_PATH}/apb_internals/apb_cerebro_ctrl/confBus_Master.sv  || exit 1
vlog -work apb_cerebro_ctrl_lib -quiet -sv +incdir+${IPS_PATH}/apb_internals/apb_cerebro_ctrl/ ${IPS_PATH}/apb_internals/apb_cerebro_ctrl/adc_ctrl.sv        || exit 1
vlog -work apb_cerebro_ctrl_lib -quiet -sv +incdir+${IPS_PATH}/apb_internals/apb_cerebro_ctrl/ ${IPS_PATH}/apb_internals/apb_cerebro_ctrl/fifo_adc.sv        || exit 1

vlog -work apb_cerebro_ctrl_lib -quiet -sv +incdir+${IPS_PATH}/apb_internals/apb_cerebro_ctrl/ ${IPS_PATH}/apb_internals/apb_cerebro_ctrl/sar_dummy.sv       || exit 1
vcom -work apb_cerebro_ctrl_lib -quiet                                                         ${IPS_PATH}/apb_internals/apb_cerebro_ctrl/confBus_IP1.vhd    || exit 1

echo "${Cyan}--> APB Cerebro Control Block compilation complete! ${NC}"

