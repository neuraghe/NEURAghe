#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling UMC-FARADAY 65nm technology libraries... ${NC}"

echo "${Green}library: tech_lib_UMC65 ${NC}"

rm -rf ${MSIM_LIBS_PATH}/tech_lib_UMC65

vlib ${MSIM_LIBS_PATH}/tech_lib_UMC65
vmap tech_lib_UMC65 ${MSIM_LIBS_PATH}/tech_lib_UMC65

echo "${Green}Compiling component:   ${Brown} clock libraries ${NC}"
echo "${Red}"



#High, Regular and Low Vt Cell Libraries

vlog -quiet +define+FUNCTIONAL -work tech_lib_UMC65 ${IPS_PATH}/tech/UMC_65_BULK/uk65lscllmvbbh_sdf30.v         || exit 1 
vlog -quiet +define+FUNCTIONAL -work tech_lib_UMC65 ${IPS_PATH}/tech/UMC_65_BULK/uk65lscllmvbbl_sdf30.v         || exit 1
vlog -quiet +define+FUNCTIONAL -work tech_lib_UMC65 ${IPS_PATH}/tech/UMC_65_BULK/uk65lscllmvbbr_sdf30.v         || exit 1
vlog -quiet +define+functional -work tech_lib_UMC65 ${IPS_PATH}/tech/UMC_65_BULK/u065gioll25mvir.v              || exit 1
vlog -quiet +define+functional -work tech_lib_UMC65 ${IPS_PATH}/tech/UMC_65_BULK/iosc_lib.v                     || exit 1
vlog -quiet +define+functional -work tech_lib_UMC65 ${IPS_PATH}/tech/UMC_65_BULK/fll_mia.v                      || exit 1
vlog -quiet +define+functional -work tech_lib_UMC65 ${IPS_PATH}/tech/UMC_65_BULK/level_shifter.v                || exit 1

# MEMORY CUTS
vlog -sv -quiet +define+FUNCTIONAL -work tech_lib_UMC65 ${IPS_PATH}/tech/UMC_65_BULK/SHKA65_8192X8X4CM16.v          || exit 1
vlog -sv -quiet +define+FUNCTIONAL -work tech_lib_UMC65 ${IPS_PATH}/tech/UMC_65_BULK/SYKA65_512X8X4CM4.v            || exit 1
vlog -sv -quiet +define+FUNCTIONAL -work tech_lib_UMC65 ${IPS_PATH}/tech/UMC_65_BULK/SHKA65_1024X8X4CM8.v           || exit 1
vlog -sv -quiet +define+FUNCTIONAL -work tech_lib_UMC65 ${IPS_PATH}/tech/UMC_65_BULK/SPKA65_1024X64BM1A.v           || exit 1


echo "${Cyan}--> Technology libraries compilation complete! ${NC}"
