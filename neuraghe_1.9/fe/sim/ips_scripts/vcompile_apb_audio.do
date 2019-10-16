#!/bin/tcsh

source scripts/colors.sh

echo "${Green}--> Compiling APB AUDIO INTERFACE... ${NC}"

# check if environment variables are defined
if (! $?MSIM_LIBS_PATH ) then
  echo "${Red} MSIM_LIBS_PATH is not defined ${NC}"
  exit 1
endif

if (! $?IPS_PATH ) then
  echo "${Red} IPS_PATH is not defined ${NC}"
  exit 1
endif


echo "${Green}library: apb_audio_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/apb_audio_lib

vlib ${MSIM_LIBS_PATH}/apb_audio_lib
vmap apb_audio_lib ${MSIM_LIBS_PATH}/apb_audio_lib

echo "${Green}Compiling component:   ${Brown} apb_audio ${NC}"
echo "${Red}"


vlog -work apb_audio_lib +incdir+${IPS_PATH}/apb/apb_audio -quiet -sv ${IPS_PATH}/apb_peripherals/apb_audio/apb_audio.sv         || exit 1
vlog -work apb_audio_lib +incdir+${IPS_PATH}/apb/apb_audio -quiet -sv ${IPS_PATH}/apb_peripherals/apb_audio/i2s_rx.sv            || exit 1
vlog -work apb_audio_lib +incdir+${IPS_PATH}/apb/apb_audio -quiet -sv ${IPS_PATH}/apb_peripherals/apb_audio/io_clk_gen.sv        || exit 1
vlog -work apb_audio_lib +incdir+${IPS_PATH}/apb/apb_audio -quiet -sv ${IPS_PATH}/apb_peripherals/apb_audio/io_generic_fifo.sv   || exit 1
vlog -work apb_audio_lib +incdir+${IPS_PATH}/apb/apb_audio -quiet -sv ${IPS_PATH}/apb_peripherals/apb_audio/io_event_counter.sv  || exit 1
vlog -work apb_audio_lib +incdir+${IPS_PATH}/apb/apb_audio -quiet -sv ${IPS_PATH}/apb_peripherals/apb_audio/io_shiftreg.sv       || exit 1

echo "${Cyan}--> APB AUDIO INTERFACE compilation complete! ${NC}"

