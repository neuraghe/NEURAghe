#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling cluster interconnect...${NC}"

echo "${Green}library: cluster_interconnect_lib ${NC}"

rm -rf ${MSIM_LIBS_PATH}/cluster_interconnect_lib

vlib ${MSIM_LIBS_PATH}/cluster_interconnect_lib
vmap cluster_interconnect_lib ${MSIM_LIBS_PATH}/cluster_interconnect_lib

echo "${Green}Compiling component:   ${Brown} XBAR_TCDM ${NC}"
echo "${Red}"

vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/FanInPrimitive_Req.sv    || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/RR_Flag_Req.sv           || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ArbitrationTree.sv       || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/MUX2_REQ.sv              || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/AddressDecoder_Resp.sv   || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/TestAndSet.sv            || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/RequestBlock2CH.sv       || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/RequestBlock1CH.sv       || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/FanInPrimitive_Resp.sv   || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ResponseTree.sv          || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ResponseBlock.sv         || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/AddressDecoder_Req.sv    || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/XBAR_TCDM.sv             || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/XBAR_TCDM_WRAPPER.sv     || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/TCDM_PIPE_REQ.sv         || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/TCDM_PIPE_RESP.sv        || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/ ${IPS_PATH}/cluster_interconnect/rtl/low_latency_interco/grant_mask.sv            || exit 1

echo "${Green}Compiling component:   ${Brown} XBAR_PE ${NC}"
echo "${Red}"

vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ ${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/AddressDecoder_PE_Req.sv   || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ ${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/AddressDecoder_Resp_PE.sv  || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ ${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ArbitrationTree_PE.sv      || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ ${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/FanInPrimitive_Req_PE.sv   || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ ${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/RR_Flag_Req_PE.sv          || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ ${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/MUX2_REQ_PE.sv             || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ ${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/FanInPrimitive_PE_Resp.sv  || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ ${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/RequestBlock1CH_PE.sv      || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ ${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/RequestBlock2CH_PE.sv      || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ ${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ResponseBlock_PE.sv        || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ ${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ResponseTree_PE.sv         || exit 1
vlog -work cluster_interconnect_lib -quiet -sv  +incdir+${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/ ${IPS_PATH}/cluster_interconnect/rtl/peripheral_interco/XBAR_PE.sv                 || exit 1

echo "${Cyan}--> Cluster interconnect compilation complete! ${NC}"
