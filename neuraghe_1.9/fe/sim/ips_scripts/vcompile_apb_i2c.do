#!/bin/tcsh

source scripts/colors.sh

echo "${Green}--> Compiling APB I2C INTERFACE... ${NC}"

# check if environment variables are defined
if (! $?MSIM_LIBS_PATH ) then
  echo "${Red} MSIM_LIBS_PATH is not defined ${NC}"
  exit 1
endif

if (! $?IPS_PATH ) then
  echo "${Red} IPS_PATH is not defined ${NC}"
  exit 1
endif


echo "${Green}library: apb_i2c_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/apb_i2c_lib

vlib ${MSIM_LIBS_PATH}/apb_i2c_lib
vmap apb_i2c_lib ${MSIM_LIBS_PATH}/apb_i2c_lib

echo "${Green}Compiling component:   ${Brown} apb_i2c ${NC}"
echo "${Red}"

vlog -work apb_i2c_lib +incdir+${IPS_PATH}/apb_peripherals/apb_i2c -quiet -sv ${IPS_PATH}/apb_peripherals/apb_i2c/apb_i2c.sv               || exit 1
vlog -work apb_i2c_lib +incdir+${IPS_PATH}/apb_peripherals/apb_i2c -quiet -sv ${IPS_PATH}/apb_peripherals/apb_i2c/i2c_master_byte_ctrl.sv  || exit 1
vlog -work apb_i2c_lib +incdir+${IPS_PATH}/apb_peripherals/apb_i2c -quiet -sv ${IPS_PATH}/apb_peripherals/apb_i2c/i2c_master_bit_ctrl.sv   || exit 1

echo "${Cyan}--> APB I2C INTERFACE compilation complete! ${NC}"

