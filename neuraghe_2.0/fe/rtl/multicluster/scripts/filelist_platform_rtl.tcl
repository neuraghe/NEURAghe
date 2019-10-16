#!/bin/tcsh
source scripts/colors.sh
setenv MSIM_LIBS_PATH `pwd`/modelsim_libs
setenv IPS_PATH `pwd`/../ips
setenv NOC_PATH `pwd`/../rtl/multicluster/NoC/

echo "${Green}--> Compiling Network on Chip... ${NC}"

echo "${Green}library: noc_lib ${NC}"

rm -rf ${MSIM_LIBS_PATH}/noc_lib

vlib ${MSIM_LIBS_PATH}/noc_lib
vmap noc_lib ${MSIM_LIBS_PATH}/noc_lib

echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109075_CLUSTER_0 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/axi_ni_response_pinout_mask.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/synch_fifo.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/ni_admit_control.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/ni_request_header_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/ni_initiator_67109075_CLUSTER_0.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/ni_resend_transaction_store.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/axi_ni_request.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/ni_clock_synchro.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/ni_request_payload_shifter.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/ni_flit_compose.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/ni_flit_type.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/axi_ni_request_payload_register.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/axi_ni_response_fsm.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/axi_ni_request_fsm.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/axi_ni_response.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/axi_ni_request_header_register.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/axi_ni_request_encoder.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/ni_response_transaction_store.v     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/routing_initiator_67109075.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/axi_ni_response_header_register.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/out_buffer.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/ni_resend_header_shifter.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/in_buffer_6.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/ni_transmit_control.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/ni_resend_payload_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/mem_elem.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109075_CLUSTER_0/axi_ni_response_payload_register.v  || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109075_CLUSTER_0 compilation complete! ${NC}"



echo "${Green}Compiling component:   ${Brown} noc_lib.ni_target_67109076_CLUSTER_0 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/synch_fifo.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/ni_admit_control.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/ni_request_header_shifter.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/axi_ni_resend.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/routing_target_67109076.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/ni_resend_transaction_store.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/ni_clock_synchro.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/ni_request_payload_shifter.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/ni_flit_compose.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/ni_flit_type.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/axi_ni_resend_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/ni_target_67109076_CLUSTER_0.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/axi_ni_resend_payload_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/ni_response_transaction_store.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/axi_ni_receive_pinout_mask.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/axi_ni_receive_fsm.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/out_buffer.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/ni_resend_header_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/axi_ni_receive_header_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/in_buffer_6.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/ni_transmit_control.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/axi_ni_resend_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/ni_resend_payload_shifter.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/mem_elem.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/axi_ni_receive.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/axi_ni_receive_payload_register.v      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109076_CLUSTER_0/axi_ni_receive_decoder.v               || exit 1
echo "${Cyan}--> noc_lib.ni_target_67109076_CLUSTER_0 compilation complete! ${NC}"



echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109077_CLUSTER_0 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/axi_ni_response_pinout_mask.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/synch_fifo.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/ni_admit_control.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/ni_request_header_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/ni_resend_transaction_store.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/axi_ni_request.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/ni_clock_synchro.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/ni_request_payload_shifter.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/ni_flit_compose.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/ni_flit_type.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/axi_ni_request_payload_register.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/axi_ni_response_fsm.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/axi_ni_request_fsm.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/axi_ni_response.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/axi_ni_request_header_register.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/axi_ni_request_encoder.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/ni_response_transaction_store.v     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/ni_initiator_67109077_CLUSTER_0.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/axi_ni_response_header_register.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/out_buffer.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/ni_resend_header_shifter.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/in_buffer_6.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/ni_transmit_control.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/routing_initiator_67109077.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/ni_resend_payload_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/mem_elem.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109077_CLUSTER_0/axi_ni_response_payload_register.v  || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109077_CLUSTER_0 compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109078_CLUSTER_1 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/axi_ni_response_pinout_mask.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/synch_fifo.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/ni_initiator_67109078_CLUSTER_1.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/ni_admit_control.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/ni_request_header_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/ni_resend_transaction_store.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/axi_ni_request.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/routing_initiator_67109078.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/ni_clock_synchro.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/ni_request_payload_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/ni_flit_compose.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/ni_flit_type.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/axi_ni_request_payload_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/axi_ni_response_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/axi_ni_request_fsm.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/axi_ni_response.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/axi_ni_request_header_register.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/axi_ni_request_encoder.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/ni_response_transaction_store.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/axi_ni_response_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/out_buffer.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/ni_resend_header_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/in_buffer_6.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/ni_transmit_control.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/ni_resend_payload_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/mem_elem.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109078_CLUSTER_1/axi_ni_response_payload_register.v       || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109078_CLUSTER_1 compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109079_CLUSTER_1 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/axi_ni_response_pinout_mask.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/synch_fifo.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/routing_initiator_67109079.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/ni_admit_control.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/ni_request_header_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/ni_resend_transaction_store.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/axi_ni_request.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/ni_clock_synchro.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/ni_request_payload_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/ni_flit_compose.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/ni_flit_type.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/axi_ni_request_payload_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/axi_ni_response_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/axi_ni_request_fsm.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/axi_ni_response.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/axi_ni_request_header_register.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/axi_ni_request_encoder.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/ni_response_transaction_store.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/axi_ni_response_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/out_buffer.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/ni_resend_header_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/in_buffer_6.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/ni_transmit_control.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/ni_resend_payload_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/mem_elem.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/axi_ni_response_payload_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109079_CLUSTER_1/ni_initiator_67109079_CLUSTER_1.v        || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109079_CLUSTER_1 compilation complete! ${NC}"

echo "${Green}Compiling component:   ${Brown} noc_lib.ni_target_67109080_CLUSTER_1 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/synch_fifo.v                                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/ni_admit_control.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/ni_request_header_shifter.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/axi_ni_resend.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/ni_resend_transaction_store.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/ni_clock_synchro.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/ni_request_payload_shifter.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/ni_flit_compose.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/ni_flit_type.v                              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/axi_ni_resend_header_register.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/axi_ni_resend_payload_register.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/ni_response_transaction_store.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/axi_ni_receive_pinout_mask.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/axi_ni_receive_fsm.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/out_buffer.v                                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/ni_resend_header_shifter.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/axi_ni_receive_header_register.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/routing_target_67109080.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/in_buffer_6.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/ni_target_67109080_CLUSTER_1.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/ni_transmit_control.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/axi_ni_resend_fsm.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/ni_resend_payload_shifter.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/mem_elem.v                                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/axi_ni_receive.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/axi_ni_receive_payload_register.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109080_CLUSTER_1/axi_ni_receive_decoder.v                    || exit 1
echo "${Cyan}--> noc_lib.ni_target_67109080_CLUSTER_1 compilation complete! ${NC}"





echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109081_CLUSTER_2 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/axi_ni_response_pinout_mask.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/synch_fifo.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/ni_admit_control.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/ni_request_header_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/routing_initiator_67109081.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/ni_resend_transaction_store.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/axi_ni_request.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/ni_clock_synchro.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/ni_request_payload_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/ni_flit_compose.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/ni_flit_type.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/axi_ni_request_payload_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/axi_ni_response_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/axi_ni_request_fsm.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/axi_ni_response.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/ni_initiator_67109081_CLUSTER_2.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/axi_ni_request_header_register.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/axi_ni_request_encoder.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/ni_response_transaction_store.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/axi_ni_response_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/out_buffer.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/ni_resend_header_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/in_buffer_6.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/ni_transmit_control.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/ni_resend_payload_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/mem_elem.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109081_CLUSTER_2/axi_ni_response_payload_register.v       || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109081_CLUSTER_2 compilation complete! ${NC}"

echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109082_CLUSTER_2 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/axi_ni_response_pinout_mask.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/synch_fifo.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/ni_admit_control.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/routing_initiator_67109082.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/ni_initiator_67109082_CLUSTER_2.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/ni_request_header_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/ni_resend_transaction_store.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/axi_ni_request.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/ni_clock_synchro.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/ni_request_payload_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/ni_flit_compose.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/ni_flit_type.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/axi_ni_request_payload_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/axi_ni_response_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/axi_ni_request_fsm.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/axi_ni_response.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/axi_ni_request_header_register.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/axi_ni_request_encoder.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/ni_response_transaction_store.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/axi_ni_response_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/out_buffer.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/ni_resend_header_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/in_buffer_6.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/ni_transmit_control.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/ni_resend_payload_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/mem_elem.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109082_CLUSTER_2/axi_ni_response_payload_register.v       || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109082_CLUSTER_2 compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.ni_target_67109083_CLUSTER_2 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/synch_fifo.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/ni_admit_control.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/routing_target_67109083.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/ni_request_header_shifter.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/axi_ni_resend.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/ni_resend_transaction_store.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/ni_clock_synchro.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/ni_request_payload_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/ni_flit_compose.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/ni_flit_type.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/axi_ni_resend_header_register.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/axi_ni_resend_payload_register.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/ni_response_transaction_store.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/axi_ni_receive_pinout_mask.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/axi_ni_receive_fsm.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/out_buffer.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/ni_resend_header_shifter.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/axi_ni_receive_header_register.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/in_buffer_6.v                              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/ni_transmit_control.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/axi_ni_resend_fsm.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/ni_resend_payload_shifter.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/mem_elem.v                                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/axi_ni_receive.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/axi_ni_receive_payload_register.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/ni_target_67109083_CLUSTER_2.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109083_CLUSTER_2/axi_ni_receive_decoder.v                   || exit 1
echo "${Cyan}--> noc_lib.ni_target_67109083_CLUSTER_2 compilation complete! ${NC}"






echo "${Green}Compiling component:   ${Brown} noc_lib.ni_target_67109084_CLUSTER_3 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/axi_ni_response_pinout_mask.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/synch_fifo.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/ni_admit_control.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/ni_request_header_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/ni_initiator_67109084_CLUSTER_3.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/ni_resend_transaction_store.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/axi_ni_request.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/ni_clock_synchro.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/ni_request_payload_shifter.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/ni_flit_compose.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/ni_flit_type.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/axi_ni_request_payload_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/axi_ni_response_fsm.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/axi_ni_request_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/axi_ni_response.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/axi_ni_request_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/axi_ni_request_encoder.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/ni_response_transaction_store.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/axi_ni_response_header_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/out_buffer.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/ni_resend_header_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/in_buffer_6.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/ni_transmit_control.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/ni_resend_payload_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/routing_initiator_67109084.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/mem_elem.v                              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109084_CLUSTER_3/axi_ni_response_payload_register.v      || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109084_CLUSTER_3 compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.initiator_67109085_CLUSTER_3 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/axi_ni_response_pinout_mask.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/synch_fifo.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/routing_initiator_67109085.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/ni_admit_control.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/ni_request_header_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/ni_resend_transaction_store.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/axi_ni_request.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/ni_clock_synchro.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/ni_request_payload_shifter.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/ni_flit_compose.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/ni_flit_type.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/axi_ni_request_payload_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/axi_ni_response_fsm.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/axi_ni_request_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/axi_ni_response.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/axi_ni_request_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/axi_ni_request_encoder.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/ni_response_transaction_store.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/axi_ni_response_header_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/out_buffer.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/ni_resend_header_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/in_buffer_6.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/ni_transmit_control.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/ni_resend_payload_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/ni_initiator_67109085_CLUSTER_3.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/mem_elem.v                              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109085_CLUSTER_3/axi_ni_response_payload_register.v      || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109085_CLUSTER_3 compilation complete! ${NC}"

echo "${Green}Compiling component:   ${Brown} noc_lib.ni_target_67109086_CLUSTER_3 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/synch_fifo.v                              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/ni_admit_control.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/ni_request_header_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/axi_ni_resend.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/routing_target_67109086.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/ni_resend_transaction_store.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/ni_clock_synchro.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/ni_request_payload_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/ni_flit_compose.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/ni_flit_type.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/axi_ni_resend_header_register.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/ni_target_67109086_CLUSTER_3.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/axi_ni_resend_payload_register.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/ni_response_transaction_store.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/axi_ni_receive_pinout_mask.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/axi_ni_receive_fsm.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/out_buffer.v                              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/ni_resend_header_shifter.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/axi_ni_receive_header_register.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/in_buffer_6.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/ni_transmit_control.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/axi_ni_resend_fsm.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/ni_resend_payload_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/mem_elem.v                                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/axi_ni_receive.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/axi_ni_receive_payload_register.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109086_CLUSTER_3/axi_ni_receive_decoder.v                  || exit 1
echo "${Cyan}--> noc_lib.ni_target_67109086_CLUSTER_3 compilation complete! ${NC}"





echo "${Green}Compiling component:   ${Brown} noc_lib.ni_target_67109087_L2_MEM ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/synch_fifo.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/ni_target_67109087_L2_MEM.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/ni_admit_control.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/ni_request_header_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/axi_ni_resend.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/ni_resend_transaction_store.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/ni_clock_synchro.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/ni_request_payload_shifter.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/ni_flit_compose.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/ni_flit_type.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/axi_ni_resend_header_register.v     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/routing_target_67109087.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/axi_ni_resend_payload_register.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/ni_response_transaction_store.v     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/axi_ni_receive_pinout_mask.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/axi_ni_receive_fsm.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/out_buffer.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/ni_resend_header_shifter.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/axi_ni_receive_header_register.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/in_buffer_6.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/ni_transmit_control.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/axi_ni_resend_fsm.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/ni_resend_payload_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/mem_elem.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/axi_ni_receive.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/axi_ni_receive_payload_register.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109087_L2_MEM/axi_ni_receive_decoder.v            || exit 1
echo "${Cyan}--> noc_lib.ni_target_67109087_L2_MEM compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109088_SOC_MASTER ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/axi_ni_response_pinout_mask.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/synch_fifo.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/ni_admit_control.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/ni_request_header_shifter.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/ni_resend_transaction_store.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/axi_ni_request.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/ni_clock_synchro.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/routing_initiator_67109088.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/ni_request_payload_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/ni_flit_compose.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/ni_flit_type.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/axi_ni_request_payload_register.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/axi_ni_response_fsm.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/axi_ni_request_fsm.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/axi_ni_response.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/axi_ni_request_header_register.v     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/axi_ni_request_encoder.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/ni_response_transaction_store.v      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/axi_ni_response_header_register.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/out_buffer.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/ni_resend_header_shifter.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/ni_initiator_67109088_SOC_MASTER.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/in_buffer_6.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/ni_transmit_control.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/ni_resend_payload_shifter.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/mem_elem.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109088_SOC_MASTER/axi_ni_response_payload_register.v   || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109088_SOC_MASTER compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.switch_16777245 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777245/allocator_3x5_32.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777245/multiplexer_4_32.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777245/multiplexer_3_32.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777245/switch_16777245.v     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777245/combinational.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777245/allocator_4x5_32.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777245/out_buffer.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777245/in_buffer_6.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777245/shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777245/ff_register.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777245/routing_switch.v      || exit 1
echo "${Cyan}--> noc_lib.switch_16777245 compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.switch_16777246 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777246/multiplexer_4_32.v      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777246/allocator_4x4_32.v      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777246/combinational.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777246/out_buffer.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777246/in_buffer_6.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777246/shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777246/ff_register.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777246/routing_switch.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777246/switch_16777246.v       || exit 1
echo "${Cyan}--> noc_lib.switch_16777246 compilation complete! ${NC}"



echo "${Green}Compiling component:   ${Brown} noc_lib.switch_16777247 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777247/allocator_7x2_32.v      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777247/allocator_2x2_32.v      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777247/switch_16777247.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777247/combinational.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777247/out_buffer.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777247/in_buffer_6.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777247/shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777247/multiplexer_7_32.v      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777247/ff_register.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777247/multiplexer_2_32.v      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777247/routing_switch.v        || exit 1
echo "${Cyan}--> noc_lib.switch_16777247 compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.switch_16777248 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777248/switch_16777248.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777248/combinational.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777248/allocator_2x7_32.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777248/out_buffer.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777248/allocator_1x7_32.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777248/in_buffer_6.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777248/shifter.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777248/ff_register.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777248/multiplexer_2_32.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777248/routing_switch.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777248/multiplexer_1_32.v        || exit 1
echo "${Cyan}--> noc_lib.switch_16777248 compilation complete! ${NC}"

echo "${Green}Compiling component:   ${Brown} noc_lib.noc_interconnect ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/noc_interconnect.sv                       || exit 1
echo "${Cyan}--> noc_lib.noc_interconnect compilation complete! ${NC}"