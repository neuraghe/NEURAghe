#!/bin/tcsh

source scripts/colors.sh

echo "${Green}--> Compiling CLUSTER PERIPHERALS... ${NC}"

echo "${Green}library: cluster_peripherals ${NC}"
rm -rf ${MSIM_LIBS_PATH}/cluster_peripherals_lib

vlib ${MSIM_LIBS_PATH}/cluster_peripherals_lib
vmap cluster_peripherals_lib ${MSIM_LIBS_PATH}/cluster_peripherals_lib

echo "${Green}Compiling component:   ${Brown} event_unit ${NC}"
echo "${Red}"

vlog -work cluster_peripherals_lib -quiet -sv +incdir+${IPS_PATH}/cluster_peripherals/include +incdir+${IPS_PATH}/cluster_peripherals/event_unit/include ${IPS_PATH}/cluster_peripherals/event_unit/event_unit_arbiter.sv   || exit 1
vlog -work cluster_peripherals_lib -quiet -sv +incdir+${IPS_PATH}/cluster_peripherals/include +incdir+${IPS_PATH}/cluster_peripherals/event_unit/include ${IPS_PATH}/cluster_peripherals/event_unit/HW_barrier.sv   || exit 1
vlog -work cluster_peripherals_lib -quiet -sv +incdir+${IPS_PATH}/cluster_peripherals/include +incdir+${IPS_PATH}/cluster_peripherals/event_unit/include ${IPS_PATH}/cluster_peripherals/event_unit/HW_barrier_logic.sv   || exit 1
vlog -work cluster_peripherals_lib -quiet -sv +incdir+${IPS_PATH}/cluster_peripherals/include +incdir+${IPS_PATH}/cluster_peripherals/event_unit/include ${IPS_PATH}/cluster_peripherals/event_unit/event_unit_input.sv   || exit 1
vlog -work cluster_peripherals_lib -quiet -sv +incdir+${IPS_PATH}/cluster_peripherals/include +incdir+${IPS_PATH}/cluster_peripherals/event_unit/include ${IPS_PATH}/cluster_peripherals/event_unit/interrupt_mask.sv   || exit 1
vlog -work cluster_peripherals_lib -quiet -sv +incdir+${IPS_PATH}/cluster_peripherals/include +incdir+${IPS_PATH}/cluster_peripherals/event_unit/include ${IPS_PATH}/cluster_peripherals/event_unit/event_unit_mux.sv   || exit 1
vlog -work cluster_peripherals_lib -quiet -sv +incdir+${IPS_PATH}/cluster_peripherals/include +incdir+${IPS_PATH}/cluster_peripherals/event_unit/include ${IPS_PATH}/cluster_peripherals/event_unit/event_unit_sm.sv   || exit 1
vlog -work cluster_peripherals_lib -quiet -sv +incdir+${IPS_PATH}/cluster_peripherals/include +incdir+${IPS_PATH}/cluster_peripherals/event_unit/include ${IPS_PATH}/cluster_peripherals/event_unit/event_unit.sv   || exit 1

echo "${Green}Compiling component:   ${Brown} timer_unit ${NC}"
echo "${Red}"

vlog -work cluster_peripherals_lib -quiet -sv +incdir+${IPS_PATH}/cluster_peripherals/include  ${IPS_PATH}/cluster_peripherals/timer_unit/timer_unit.sv   || exit 1

echo "${Green}Compiling component:   ${Brown} mmu_config_unit ${NC}"
echo "${Red}"

vlog -work cluster_peripherals_lib -quiet -sv +incdir+${IPS_PATH}/cluster_peripherals/include  ${IPS_PATH}/cluster_peripherals/mmu_config_unit/mmu_config_unit.sv   || exit 1

echo "${Green}Compiling component:   ${Brown} cluster_control_unit ${NC}"
echo "${Red}"

vlog -work cluster_peripherals_lib -quiet +define+$1 -sv +incdir+${IPS_PATH}/cluster_peripherals/include  ${IPS_PATH}/cluster_peripherals/cluster_control_unit/cluster_control_unit.sv   || exit 1

echo "${Green}Compiling component:   ${Brown} tcdm_pipe_unit ${NC}"
echo "${Red}"

vlog -work cluster_peripherals_lib -quiet -sv +incdir+${IPS_PATH}/cluster_peripherals/include  ${IPS_PATH}/cluster_peripherals/tcdm_pipe_unit/tcdm_pipe_unit.sv   || exit 1

echo "${Green}Compiling component:   ${Brown} icache_ctrl_unit ${NC}"
echo "${Red}"

vlog -work cluster_peripherals_lib -quiet -sv +incdir+../rtl/includes  ${IPS_PATH}/cluster_peripherals/icache_ctrl_unit/icache_ctrl_unit.sv  || exit 1


echo "${Cyan}--> CLUSTER PERIPHERALS compilation complete! ${NC}"

