cache_top_scm_mp#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling  New Uber icache_top ip ... ${NC}"

rm -rf ${MSIM_LIBS_PATH}/icache_new_lib

vlib ${MSIM_LIBS_PATH}/icache_new_lib
vmap icache_new_lib ${MSIM_LIBS_PATH}/icache_new_lib

echo "${Green}Compiling component:   ${Brown} New Uber icache_top ${NC}"
echo "${Red}"

setenv ICACHE_BANK_PATH       "${IPS_PATH}/icache/icache_scm_mp/ICACHE"
setenv ICACHE_INTERCO_PATH    "${IPS_PATH}/icache/icache_scm_mp/INTERCO"


vlog -sv -quiet -work icache_new_lib  $ICACHE_BANK_PATH/icache_top_scm_mp.sv                     || exit 1
vlog -sv -quiet -work icache_new_lib  $ICACHE_BANK_PATH/icache_bank.sv                           || exit 1
vlog -sv -quiet -work icache_new_lib  $ICACHE_BANK_PATH/init_icache.sv                           || exit 1

vlog -sv -quiet -work icache_new_lib  $ICACHE_INTERCO_PATH/AddressDecoder_Req_SCM.sv             || exit 1
vlog -sv -quiet -work icache_new_lib  $ICACHE_INTERCO_PATH/ArbitrationTree_SCM.sv                || exit 1
vlog -sv -quiet -work icache_new_lib  $ICACHE_INTERCO_PATH/FanInPrimitive_Req_SCM.sv             || exit 1
vlog -sv -quiet -work icache_new_lib  $ICACHE_INTERCO_PATH/MUX2_REQ_SCM.sv                       || exit 1
vlog -sv -quiet -work icache_new_lib  $ICACHE_INTERCO_PATH/RequestBlock1CH_SCM.sv                || exit 1
vlog -sv -quiet -work icache_new_lib  $ICACHE_INTERCO_PATH/RequestBlock2CH_SCM.sv                || exit 1
vlog -sv -quiet -work icache_new_lib  $ICACHE_INTERCO_PATH/ResponseBlock_SCM.sv                  || exit 1
vlog -sv -quiet -work icache_new_lib  $ICACHE_INTERCO_PATH/RR_Flag_Req_SCM.sv                    || exit 1
vlog -sv -quiet -work icache_new_lib  $ICACHE_INTERCO_PATH/XBAR_SCM.sv                           || exit 1

echo "${Cyan}--> NEW Uber icache_top ip compilation complete! ${NC}"
