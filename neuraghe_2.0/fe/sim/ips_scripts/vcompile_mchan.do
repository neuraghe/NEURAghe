#!/bin/tcsh
source scripts/colors.sh

echo ""
echo "${Green}--> Compiling MCHAN...${NC}"

echo "${Green}library: mchan_lib ${NC}"

rm -rf ${MSIM_LIBS_PATH}/mchan_lib

vlib ${MSIM_LIBS_PATH}/mchan_lib
vmap mchan_lib ${MSIM_LIBS_PATH}/mchan_lib

echo "${Green}Compiling component:   ${Brown} mchan ${NC}"
echo "${Red}"

#vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/misc/mchan_fifo.sv                                   || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/misc/mchan_arb_primitive.sv                          || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/misc/mchan_rr_flag_req.sv                            || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/misc/mchan_arbiter.sv                                || exit 1

#vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/address_decoder.sv                         || exit 1
#vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/address_decoder_pe.sv                         || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/synch_unit.sv                              || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/cmd_counter.sv                             || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/ctrl_if.sv                                 || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/ctrl_fsm.sv                                || exit 1
#vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/core_if_pe.sv                                 || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/trans_allocator.sv                         || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/trans_queue.sv                             || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/trans_unpack.sv                            || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/twd_trans_queue.sv                         || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/twd_trans_splitter.sv                      || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/ctrl_unit.sv                               || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ctrl_unit/trans_arbiter_wrap.sv                                || exit 1

vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/trans_unit/trans_aligner.sv                          || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/trans_unit/trans_buffers.sv                          || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/trans_unit/trans_unit.sv                             || exit 1

vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/tcdm_unit/tcdm_cmd_unpack.sv                         || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/tcdm_unit/tcdm_tx_if.sv                              || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/tcdm_unit/tcdm_rx_if.sv                              || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/tcdm_unit/tcdm_synch.sv                              || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/tcdm_unit/tcdm_unit.sv                               || exit 1

vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ext_unit/ext_tid_gen.sv                              || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ext_unit/ext_opc_buf.sv                              || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ext_unit/ext_buffer.sv                               || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ext_unit/ext_aw_buffer.sv                            || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ext_unit/ext_ar_buffer.sv                            || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ext_unit/ext_w_buffer.sv                             || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ext_unit/ext_r_buffer.sv                             || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ext_unit/ext_b_buffer.sv                             || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ext_unit/ext_tx_if.sv                                || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ext_unit/ext_rx_if.sv                                || exit 1
vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/ext_unit/ext_unit.sv                                 || exit 1

vlog -work mchan_lib -quiet -sv +incdir+${IPS_PATH}/mchan/include ${IPS_PATH}/mchan/top/mchan.sv                                         || exit 1

echo "${Cyan} MCHAN components have been compiled Succesfully${NC}"
