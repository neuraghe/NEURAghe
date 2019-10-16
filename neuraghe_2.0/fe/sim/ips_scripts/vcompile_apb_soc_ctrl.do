#!/bin/tcsh

source scripts/colors.sh

echo "${Green}--> Compiling APB SOC control interface... ${NC}"

# check if environment variables are defined
if (! $?MSIM_LIBS_PATH ) then
  echo "${Red} MSIM_LIBS_PATH is not defined ${NC}"
  exit 1
endif

if (! $?IPS_PATH ) then
  echo "${Red} IPS_PATH is not defined ${NC}"
  exit 1
endif


echo "${Green}library: apb_soc_ctrl_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/apb_soc_ctrl_lib

vlib ${MSIM_LIBS_PATH}/apb_soc_ctrl_lib
vmap apb_soc_ctrl_lib ${MSIM_LIBS_PATH}/apb_soc_ctrl_lib

echo "${Green}Compiling component:   ${Brown} apb_soc_ctrl ${NC}"
echo "${Red}"


vlog -work apb_soc_ctrl_lib -quiet -sv ${IPS_PATH}/apb_internals/apb_soc_ctrl/apb_soc_ctrl.sv   || exit 1
vlog -work apb_soc_ctrl_lib -quiet -sv ${IPS_PATH}/apb_internals/apb_soc_ctrl/power_manager.sv  || exit 1
vlog -work apb_soc_ctrl_lib -quiet -sv ${IPS_PATH}/apb_internals/apb_soc_ctrl/counter.sv        || exit 1

echo "${Cyan}--> APB SOC control interface compilation complete! ${NC}"

