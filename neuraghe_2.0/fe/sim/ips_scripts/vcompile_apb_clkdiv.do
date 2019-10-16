#!/bin/tcsh

source scripts/colors.sh

echo "${Green}--> Compiling APB CLKDIV INTERFACE... ${NC}"

# check if environment variables are defined
if (! $?MSIM_LIBS_PATH ) then
  echo "${Red} MSIM_LIBS_PATH is not defined ${NC}"
  exit 1
endif

if (! $?IPS_PATH ) then
  echo "${Red} IPS_PATH is not defined ${NC}"
  exit 1
endif


echo "${Green}library: apb_clkdiv_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/apb_clkdiv_lib

vlib ${MSIM_LIBS_PATH}/apb_clkdiv_lib
vmap apb_clkdiv_lib ${MSIM_LIBS_PATH}/apb_clkdiv_lib

echo "${Green}Compiling component:   ${Brown} axi_clkdiv ${NC}"
echo "${Red}"


vlog -work apb_clkdiv_lib -quiet -sv ${IPS_PATH}/apb_internals/apb_clkdiv/apb_clkdiv.sv    || exit 1

echo "${Cyan}--> APB CLKDIV INTERFACE compilation complete! ${NC}"

