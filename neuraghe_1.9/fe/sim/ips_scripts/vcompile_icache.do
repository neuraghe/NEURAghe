#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling  icache_top ip ... ${NC}"

rm -rf ${MSIM_LIBS_PATH}/icache_lib

vlib ${MSIM_LIBS_PATH}/icache_lib
vmap icache_lib ${MSIM_LIBS_PATH}/icache_lib

echo "${Green}Compiling component:   ${Brown} icache_top ${NC}"
echo "${Red}"

setenv MEMORY_MODELS_PATH     "${IPS_PATH}/icache/icache_scm_sp/MEMORY_MODELS"
setenv ICACHE_BANK_PATH       "${IPS_PATH}/icache/icache_scm_sp/ICACHE_BANK"
setenv ICACHE_INTERCO_PATH    "${IPS_PATH}/icache/icache_scm_sp/ICACHE_INTERCO"


vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals +incdir+$ICACHE_INTERCO_PATH +incdir+../rtl/includes $ICACHE_BANK_PATH/icache.sv                            || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals                                                      $ICACHE_BANK_PATH/LFSR_L2_Way_Repl.sv                  || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals                                                      $ICACHE_BANK_PATH/RefillTracker.sv                     || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals                                                      $ICACHE_BANK_PATH/RefillTracker_4.sv                   || exit 1

vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals +incdir+../rtl/includes                              ${IPS_PATH}/icache/icache_scm_sp/fetch_buffer/fetch_buffer_32.sv     || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals +incdir+../rtl/includes                              ${IPS_PATH}/icache/icache_scm_sp/fetch_buffer/fetch_buffer_64.sv     || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals +incdir+../rtl/includes                              ${IPS_PATH}/icache/icache_scm_sp/fetch_buffer/fetch_buffer_128.sv    || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals +incdir+../rtl/includes                              ${IPS_PATH}/icache/icache_scm_sp/fetch_buffer/fetch_buffer_256.sv    || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals +incdir+../rtl/includes                              ${IPS_PATH}/icache/icache_scm_sp/fetch_buffer/fetch_buffer_512.sv    || exit 1

vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals                                                      $ICACHE_BANK_PATH/AXI4_REFILL_Resp_Deserializer.sv     || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals +incdir+$ICACHE_INTERCO_PATH +incdir+../rtl/includes $ICACHE_BANK_PATH/icache_controller.sv                 || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals                                                      $ICACHE_BANK_PATH/onehot_to_bin.v                      || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals                                                      $ICACHE_BANK_PATH/REP_buffer_4.sv                      || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals +incdir+../rtl/includes                              $MEMORY_MODELS_PATH/ram_ws_rs_data_scm.v               || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals +incdir+../rtl/includes                              $MEMORY_MODELS_PATH/ram_ws_rs_tag_scm.v                || exit 1

vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/AddressDecoder_Req_IC.sv       || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/bin_to_onehot.sv               || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/FanInPrimitive_Resp_IC.sv      || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/ResponseBlock_IC.sv            || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/RR_Flag_Req_IC.sv              || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/AddressDecoder_Resp_IC.sv      || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/Broadcast_Check_IC.sv          || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/FlowCtrl_Handling_IC.sv +incdir+../rtl/includes || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/RequestBlock1CH_IC.sv          || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/XBAR_ICACHE.sv          +incdir+../rtl/includes || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/ArbitrationTree_IC.sv          || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/FanInPrimitive_Req_IC.sv       || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/MUX2_REQ_IC.sv                 || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/RequestBlock2CH_IC.sv          || exit 1
vlog -sv -quiet -work icache_lib +incdir+${IPS_PATH}/icache/icache_scm_sp/globals       $ICACHE_INTERCO_PATH/ResponseTree_IC.sv             || exit 1


vlog -sv -quiet +define+$1 -work icache_lib ${IPS_PATH}/icache/icache_scm_sp/ICACHE_TOP/icache_top.sv +incdir+${IPS_PATH}/icache/icache_scm_sp/globals +incdir+../rtl/includes        || exit 1


echo "${Cyan}--> icache_top ip compilation complete! ${NC}"
