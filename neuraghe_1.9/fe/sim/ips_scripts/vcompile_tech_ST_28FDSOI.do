#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling technology libraries... ${NC}"

echo "${Green}library: tach_lib ${NC}"

rm -rf ${MSIM_LIBS_PATH}/tech_lib

vlib ${MSIM_LIBS_PATH}/tech_lib
vmap tech_lib ${MSIM_LIBS_PATH}/tech_lib

echo "${Green}Compiling component:   ${Brown} clock libraries ${NC}"
echo "${Red}"



#8T Cell Libraries
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_8_CLK_LR.v         || exit 1 
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_8_COREPBP10_LR.v   || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_8_COREPBP16_LR.v   || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_8_CORE_LR.v        || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_8_COREPBP4_LR.v    || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_8_PR_LR.v          || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_8_SHIFTLV_LR.v     || exit 1


# CLOCK LIBRARIES
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_CLK_LL.v          || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_CORE_LL.v         || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_CLK_LR.v          || exit 1

echo "${Green}Compiling component:   ${Brown} level shifters libraries ${NC}"
echo "${Red}"

# LEVEL SHIFTERS
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_SHIFT_LL.v || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_SHIFT_LR.v || exit 1

echo "${Green}Compiling component:   ${Brown} UWVR libraries ${NC}"
echo "${Red}"

vlog -quiet +define+functional -suppress 2633 -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_CLKUWVR_LLPB10.v       || exit 1
vlog -quiet +define+functional -suppress 2633 -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_CORUWVR_LLAPB10PB0.v   || exit 1
vlog -quiet +define+functional -suppress 2633 -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_CORUWVR_LLAPB16PB10.v  || exit 1
vlog -quiet +define+functional -suppress 2633 -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_CORUWVR_LLAPB16PB4.v   || exit 1
vlog -quiet +define+functional -suppress 2633 -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_CORUWVR_LLAPB4PB0.v    || exit 1
vlog -quiet +define+functional -suppress 2633 -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_CORUWVR_LLPB0.v        || exit 1
vlog -quiet +define+functional -suppress 2633 -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_CORUWVR_LLPB16.v       || exit 1
vlog -quiet +define+functional -suppress 2633 -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_FFPLUWVR_LL.v          || exit 1
vlog -quiet +define+functional -suppress 2633 -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_FFUWVR_LL.v            || exit 1
vlog -quiet +define+functional -suppress 2633 -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_NOM2UWVR_LL.v          || exit 1
vlog -quiet +define+functional -suppress 2633 -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_SC_12_SHIFTINUWVR_LL.v       || exit 1

echo "${Green}Compiling component:   ${Brown} memory cuts ${NC}"
echo "${Red}"

# MEMORY CUTS
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/PULP_ROM.v              || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/PULP_SPHD_LOLEAK.v      || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/PULP_SPREG_LOLEAK.v     || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/PULP_SPL1CACHE_HIPERF.v || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/unibo_16k.v             || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/SPHD_LOVOLT_PULP.v      || exit 1

echo "${Green}Compiling component:   ${Brown} pads ${NC}"
echo "${Red}"

# PADS
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_IO_ALLF_CORESUPPLY_EG_6U1X2U2X2T8XLB.v       || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_IO_ANAF_ANA_EG_6U1X2U2X2T8XLB.v              || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_IO_SF_BASIC_EG_6U1X2U2X2T8XLB.v              || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB.v      || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_IO_ALLF_FBBRBB_LR_EG_6U1X2U2X2T8XLB.v        || exit 1
vlog -quiet +define+functional -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_IO_SF_COMPENSATION1V8_LR_EG_6U1X2U2X2T8XLB.v || exit 1


echo "${Green}Compiling component:   ${Brown} bbmux ${NC}"
echo "${Red}"

# BBMUX
vlog -quiet -sv -work tech_lib ${IPS_PATH}/tech/ST_28_FDSOI/ETHZ_BBMUX_LVT.sv || exit 1

echo "${Cyan}--> Technology libraries compilation complete! ${NC}"
