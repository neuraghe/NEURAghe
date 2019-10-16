#!/bin/tcsh
clear
source scripts/colors.sh
source scripts/print_logo.csh
sleep 2


\rm -rf modelsim_libs
vlib modelsim_libs

\rm -rf work
vlib work

setenv MSIM_LIBS_PATH `pwd`/modelsim_libs
setenv IPS_PATH `pwd`/../ips

echo ""
echo "${Green}--> Compiling PULP Platform... ${NC}"

source ${IPS_PATH}/scripts/vcompile_tech_ST_28FDSOI.do        || exit 1

source ${IPS_PATH}/scripts/vcompile_common_cells.do           || exit 1

source ${IPS_PATH}/scripts/vcompile_hm_ST_28FDSOI.do          || exit 1

source ./scripts/vcompile_models.do                           || exit 1
source ./scripts/vcompile_tb.do "USE_TOP_NETLIST"             || exit 1


echo "${Green}Compiling component:   ${Brown} ulpcluster netlist ${NC}"
echo "${Red}"

vlog -quiet ulpcluster_netlist.v 

echo "${Green}Compiling component:   ${Brown} top netlist ${NC}"
echo "${Red}"

vlog -quiet pulp_chip_netlist.v 

echo "${Green}--> PULP platform compilation Complete! ${NC}"
echo ""
