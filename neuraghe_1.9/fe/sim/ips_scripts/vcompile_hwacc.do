#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling  HWACC Wrapper... ${NC}"

rm -rf ${MSIM_LIBS_PATH}/hwacc_lib

vlib ${MSIM_LIBS_PATH}/hwacc_lib
vmap hwacc_lib ${MSIM_LIBS_PATH}/hwacc_lib

echo "${Green}Compiling component:   ${Brown} hwacc_wrapper ${NC}"
echo "${Red}"

set INCDIRS='+incdir+${IPS_PATH}/hwpe/hwpe-sm/rtl/axi/ +incdir+${IPS_PATH}/hwpe/hwpe-sm/rtl'

vlog -quiet -sv -work hwacc_lib ${INCDIRS} +nowarnSVCHK ${IPS_PATH}/hwpe/hwpe-sm/rtl/axi/hwpe_axi_fifo.sv || exit 1
vlog -quiet -sv -work hwacc_lib ${INCDIRS} +nowarnSVCHK ${IPS_PATH}/hwpe/hwpe-sm/rtl/axi/hwpe_axi_fifo_earlystall.sv || exit 1
vlog -quiet -sv -work hwacc_lib ${INCDIRS} +nowarnSVCHK ${IPS_PATH}/hwpe/hwpe-sm/rtl/axi/hwpe_axi_addressgen.sv || exit 1
vlog -quiet -sv -work hwacc_lib ${INCDIRS} +nowarnSVCHK ${IPS_PATH}/hwpe/hwpe-sm/rtl/axi/hwpe_axi_source.sv || exit 1
vlog -quiet -sv -work hwacc_lib ${INCDIRS} +nowarnSVCHK ${IPS_PATH}/hwpe/hwpe-sm/rtl/axi/hwpe_axi_sink.sv || exit 1
vlog -quiet -sv -work hwacc_lib ${INCDIRS} +nowarnSVCHK ${IPS_PATH}/hwpe/hwpe-sm/rtl/hwpe_sm_decoder.sv || exit 1
vlog -quiet -sv -work hwacc_lib ${INCDIRS} +nowarnSVCHK ${IPS_PATH}/hwpe/hwpe-sm/rtl/hwpe_sm_encoder.sv || exit 1
vlog -quiet -sv -work hwacc_lib ${INCDIRS} +nowarnSVCHK ${IPS_PATH}/hwpe/hwpe-sm/rtl/hwpe_sm_regfile.sv || exit 1
vlog -quiet -sv -work hwacc_lib ${INCDIRS} +nowarnSVCHK ${IPS_PATH}/hwpe/hwpe-sm/rtl/hwpe_sm_slave.sv || exit 1
vlog -quiet -sv -work hwacc_lib ${INCDIRS} +nowarnSVCHK ${IPS_PATH}/hwpe/hwpe-sm/rtl/axi/hwpe_axi_wrapper.sv || exit 1

echo "${Cyan}--> HWACC Wrapper compilation complete! ${NC}"
