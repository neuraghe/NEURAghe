#!/bin/tcsh
source scripts/colors.sh

setenv MSIM_LIBS_PATH `pwd`/modelsim_libs
setenv IPS_PATH `pwd`/../ips

echo ""
echo "${Green}--> Compiling icache core... ${NC}"

source ${IPS_PATH}/scripts/vcompile_icache.do || exit 1

echo "${Green}--> icache compilation Complete! ${NC}"
echo ""
