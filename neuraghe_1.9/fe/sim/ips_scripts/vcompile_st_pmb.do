#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling ST PMB... ${NC}"

echo "${Green}library: st_pmb ${NC}"
rm -rf ${MSIM_LIBS_PATH}/st_pmb_lib

vlib ${MSIM_LIBS_PATH}/st_pmb_lib
vmap st_pmb_lib ${MSIM_LIBS_PATH}/st_pmb_lib

echo "${Green}Compiling component:   ${Brown} st_pmb ${NC}"
echo "${Red}"

# PROCESS MONITORS
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/C28SOI_PM_CONTROL_LR_ASYNC_CPR_pmb_wrapper.v                               || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/C28SOI_PM_CONTROL_LR_ASYNC_master_controller.v                             || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper.v                                   || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/C28SOI_PM_CONTROL_LR_ASYNC.v
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/controllers/C28SOI_PM_CONTROL_LR_ASYNC_promip_controller_if.v              || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/controllers/C28SOI_PM_CONTROL_LR_ASYNC_promip_ctrl_gen.v                   || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/controllers/promip_apb_if/C28SOI_PM_CONTROL_LR_ASYNC_promip_apb_if.v       || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/controllers/promip_jtag_if/C28SOI_PM_CONTROL_LR_ASYNC_bypass_reg.v         || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/controllers/promip_jtag_if/C28SOI_PM_CONTROL_LR_ASYNC_idcode_register.v    || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/controllers/promip_jtag_if/C28SOI_PM_CONTROL_LR_ASYNC_jtag_interface.v     || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/controllers/promip_jtag_if/C28SOI_PM_CONTROL_LR_ASYNC_promip_jtag_if.v     || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/CPR/C28SOI_PM_LOGIC_CPR_LR_GATE_TOP.v                                      || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/CPR/C28SOI_PM_LOGIC_CPR_LR_P16_TOP.v                                       || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/CPR/C28SOI_PM_LOGIC_CPR_LR_RCM5_GATE_TOP.v                                 || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/CPR/rc_ring_netlist/C28SOI_PM_LOGICCPR_SOFTRC_LR_P0.v                      || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/promip_registers/C28SOI_PM_CONTROL_LR_ASYNC_promip_register_if.v           || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/promip_registers/C28SOI_PM_CONTROL_LR_ASYNC_tdc_ctrl_reg.v                 || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/promip_registers/C28SOI_PM_CONTROL_LR_ASYNC_tdc_ctrl_sens_reg.v            || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/promip_registers/C28SOI_PM_CONTROL_LR_ASYNC_tdc_stat_reg.v                 || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/promip_sensor_if/C28SOI_PM_CONTROL_LR_ASYNC_promip_sensor_if.v             || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/tech_cells/C28SOI_PM_CONTROL_LR_ASYNC_clock_gating_cell.v                  || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/tech_cells/C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock.v                   || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/tech_cells/C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_reset.v                   || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/tech_cells/C28SOI_PM_CONTROL_LR_ASYNC_promip_divider2.v                    || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/tech_cells/C28SOI_PM_CONTROL_LR_ASYNC_synchroniser.v                       || exit 1
vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_CONTROL_LR_ASYNC/tech_cells/C28SOI_PM_CONTROL_LR_ASYNC_xor.v                                || exit 1

vlog -quiet -sv -work st_pmb_lib ${IPS_PATH}/tech/ST_28_FDSOI/C28SOI_PM_SENSOR_GO1_LR.v                                                                             || exit 1


echo "${Cyan}--> ST PMB libraries compilation complete! ${NC}"
