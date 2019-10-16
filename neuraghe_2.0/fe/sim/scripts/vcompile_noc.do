#!/bin/tcsh
source scripts/colors.sh
setenv MSIM_LIBS_PATH `pwd`/modelsim_libs
setenv IPS_PATH `pwd`/../ips
setenv NOC_PATH `pwd`/../rtl/multicluster/NoC/

echo "${Green}--> Compiling Network on Chip... ${NC}"

echo "${Green}library: all noc libs ${NC}"

rm -rf ${MSIM_LIBS_PATH}/ni_initiator_67109005_CLUSTER_0_lib  
rm -rf ${MSIM_LIBS_PATH}/ni_initiator_67109007_CLUSTER_0_lib  
rm -rf ${MSIM_LIBS_PATH}/ni_target_67109006_CLUSTER_0_lib  
rm -rf ${MSIM_LIBS_PATH}/ni_initiator_67109009_CLUSTER_1_lib  
rm -rf ${MSIM_LIBS_PATH}/ni_initiator_67109008_CLUSTER_1_lib  
rm -rf ${MSIM_LIBS_PATH}/ni_target_67109010_CLUSTER_1_lib  
rm -rf ${MSIM_LIBS_PATH}/ni_initiator_67109012_CLUSTER_2_lib  
rm -rf ${MSIM_LIBS_PATH}/ni_initiator_67109011_CLUSTER_2_lib  
rm -rf ${MSIM_LIBS_PATH}/ni_target_67109013_CLUSTER_2_lib 
rm -rf ${MSIM_LIBS_PATH}/ni_initiator_67109014_CLUSTER_3_lib
rm -rf ${MSIM_LIBS_PATH}/ni_initiator_67109015_CLUSTER_3_lib  
rm -rf ${MSIM_LIBS_PATH}/ni_target_67109016_CLUSTER_3_lib     
rm -rf ${MSIM_LIBS_PATH}/ni_initiator_67109018_SOC_MASTER_lib 
rm -rf ${MSIM_LIBS_PATH}/ni_target_67109017_L2_MEM_lib     
rm -rf ${MSIM_LIBS_PATH}/switch_16777292_lib
rm -rf ${MSIM_LIBS_PATH}/switch_16777293_lib
rm -rf ${MSIM_LIBS_PATH}/switch_16777291_lib     
rm -rf ${MSIM_LIBS_PATH}/switch_16777294_lib



vlib ${MSIM_LIBS_PATH}/ni_initiator_67109005_CLUSTER_0_lib    
vlib ${MSIM_LIBS_PATH}/ni_initiator_67109007_CLUSTER_0_lib    
vlib ${MSIM_LIBS_PATH}/ni_target_67109006_CLUSTER_0_lib          
vlib ${MSIM_LIBS_PATH}/ni_initiator_67109009_CLUSTER_1_lib    
vlib ${MSIM_LIBS_PATH}/ni_initiator_67109008_CLUSTER_1_lib    
vlib ${MSIM_LIBS_PATH}/ni_target_67109010_CLUSTER_1_lib          
vlib ${MSIM_LIBS_PATH}/ni_initiator_67109012_CLUSTER_2_lib    
vlib ${MSIM_LIBS_PATH}/ni_initiator_67109011_CLUSTER_2_lib    
vlib ${MSIM_LIBS_PATH}/ni_target_67109013_CLUSTER_2_lib           
vlib ${MSIM_LIBS_PATH}/ni_initiator_67109014_CLUSTER_3_lib      
vlib ${MSIM_LIBS_PATH}/ni_initiator_67109015_CLUSTER_3_lib   
vlib ${MSIM_LIBS_PATH}/ni_target_67109016_CLUSTER_3_lib       
vlib ${MSIM_LIBS_PATH}/ni_initiator_67109018_SOC_MASTER_lib  
vlib ${MSIM_LIBS_PATH}/ni_target_67109017_L2_MEM_lib             
vlib ${MSIM_LIBS_PATH}/switch_16777292_lib                                      
vlib ${MSIM_LIBS_PATH}/switch_16777293_lib                                      
vlib ${MSIM_LIBS_PATH}/switch_16777291_lib                                 
vlib ${MSIM_LIBS_PATH}/switch_16777294_lib                                      


vmap ni_initiator_67109005_CLUSTER_0_lib   ${MSIM_LIBS_PATH}/ni_initiator_67109005_CLUSTER_0_lib  
vmap ni_initiator_67109007_CLUSTER_0_lib   ${MSIM_LIBS_PATH}/ni_initiator_67109007_CLUSTER_0_lib  
vmap ni_target_67109006_CLUSTER_0_lib      ${MSIM_LIBS_PATH}/ni_target_67109006_CLUSTER_0_lib  
vmap ni_initiator_67109009_CLUSTER_1_lib   ${MSIM_LIBS_PATH}/ni_initiator_67109009_CLUSTER_1_lib  
vmap ni_initiator_67109008_CLUSTER_1_lib   ${MSIM_LIBS_PATH}/ni_initiator_67109008_CLUSTER_1_lib  
vmap ni_target_67109010_CLUSTER_1_lib      ${MSIM_LIBS_PATH}/ni_target_67109010_CLUSTER_1_lib  
vmap ni_initiator_67109012_CLUSTER_2_lib   ${MSIM_LIBS_PATH}/ni_initiator_67109012_CLUSTER_2_lib  
vmap ni_initiator_67109011_CLUSTER_2_lib   ${MSIM_LIBS_PATH}/ni_initiator_67109011_CLUSTER_2_lib  
vmap ni_target_67109013_CLUSTER_2_lib      ${MSIM_LIBS_PATH}/ni_target_67109013_CLUSTER_2_lib 
vmap ni_initiator_67109014_CLUSTER_3_lib   ${MSIM_LIBS_PATH}/ni_initiator_67109014_CLUSTER_3_lib
vmap ni_initiator_67109015_CLUSTER_3_lib   ${MSIM_LIBS_PATH}/ni_initiator_67109015_CLUSTER_3_lib   
vmap ni_target_67109016_CLUSTER_3_lib      ${MSIM_LIBS_PATH}/ni_target_67109016_CLUSTER_3_lib     
vmap ni_initiator_67109018_SOC_MASTER_lib  ${MSIM_LIBS_PATH}/ni_initiator_67109018_SOC_MASTER_lib  
vmap ni_target_67109017_L2_MEM_lib         ${MSIM_LIBS_PATH}/ni_target_67109017_L2_MEM_lib     
vmap switch_16777292_lib                   ${MSIM_LIBS_PATH}/switch_16777292_lib
vmap switch_16777293_lib                   ${MSIM_LIBS_PATH}/switch_16777293_lib
vmap switch_16777291_lib                   ${MSIM_LIBS_PATH}/switch_16777291_lib     
vmap switch_16777294_lib                   ${MSIM_LIBS_PATH}/switch_16777294_lib





vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_initiator_67109005_CLUSTER_0/*  
vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_initiator_67109007_CLUSTER_0/*  
vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_target_67109006_CLUSTER_0/*  

vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_initiator_67109009_CLUSTER_1/*  
vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_initiator_67109008_CLUSTER_1/*  
vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_target_67109010_CLUSTER_1/*  

vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_initiator_67109012_CLUSTER_2/*  
vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_initiator_67109011_CLUSTER_2/*  
vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_target_67109013_CLUSTER_2/* 

vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_initiator_67109014_CLUSTER_3/*
vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_initiator_67109015_CLUSTER_3/*   
vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_target_67109016_CLUSTER_3/*     

vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_initiator_67109018_SOC_MASTER/*  
vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/ni_target_67109017_L2_MEM/*     

vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/switch_16777292/*
vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/switch_16777293/*
vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/switch_16777291/*     
vlog -work noc_lib +incdir+${NOC_PATH}  -quiet ${NOC_PATH}/switch_16777294/*







echo "${Green}Compiling component:   ${Brown} ni_initiator_.ni_initiator_67109159_CLUSTER_0 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/axi_ni_response_pinout_mask.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/synch_fifo.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/ni_admit_control.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/ni_request_header_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/ni_initiator_67109159_CLUSTER_0.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/ni_resend_transaction_store.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/axi_ni_request.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/ni_clock_synchro.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/ni_request_payload_shifter.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/ni_flit_compose.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/ni_flit_type.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/axi_ni_request_payload_register.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/axi_ni_response_fsm.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/axi_ni_request_fsm.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/axi_ni_response.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/axi_ni_request_header_register.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/axi_ni_request_encoder.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/ni_response_transaction_store.v     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/routing_initiator_67109159.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/axi_ni_response_header_register.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/out_buffer.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/ni_resend_header_shifter.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/in_buffer_6.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/ni_transmit_control.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/ni_resend_payload_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/mem_elem.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109159_CLUSTER_0/axi_ni_response_payload_register.v  || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109159_CLUSTER_0 compilation complete! ${NC}"



echo "${Green}Compiling component:   ${Brown} noc_lib.ni_target_67109160_CLUSTER_0 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/synch_fifo.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/ni_admit_control.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/ni_request_header_shifter.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/axi_ni_resend.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/routing_target_67109160.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/ni_resend_transaction_store.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/ni_clock_synchro.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/ni_request_payload_shifter.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/ni_flit_compose.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/ni_flit_type.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/axi_ni_resend_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/ni_target_67109160_CLUSTER_0.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/axi_ni_resend_payload_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/ni_response_transaction_store.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/axi_ni_receive_pinout_mask.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/axi_ni_receive_fsm.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/out_buffer.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/ni_resend_header_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/axi_ni_receive_header_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/in_buffer_6.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/ni_transmit_control.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/axi_ni_resend_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/ni_resend_payload_shifter.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/mem_elem.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/axi_ni_receive.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/axi_ni_receive_payload_register.v      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109160_CLUSTER_0/axi_ni_receive_decoder.v               || exit 1
echo "${Cyan}--> noc_lib.ni_target_67109160_CLUSTER_0 compilation complete! ${NC}"



echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109161_CLUSTER_0 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/axi_ni_response_pinout_mask.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/synch_fifo.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/ni_admit_control.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/ni_request_header_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/ni_resend_transaction_store.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/axi_ni_request.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/ni_clock_synchro.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/ni_request_payload_shifter.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/ni_flit_compose.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/ni_flit_type.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/axi_ni_request_payload_register.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/axi_ni_response_fsm.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/axi_ni_request_fsm.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/axi_ni_response.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/axi_ni_request_header_register.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/axi_ni_request_encoder.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/ni_response_transaction_store.v     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/ni_initiator_67109161_CLUSTER_0.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/axi_ni_response_header_register.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/out_buffer.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/ni_resend_header_shifter.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/in_buffer_6.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/ni_transmit_control.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/routing_initiator_67109161.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/ni_resend_payload_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/mem_elem.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109161_CLUSTER_0/axi_ni_response_payload_register.v  || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109161_CLUSTER_0 compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109162_CLUSTER_1 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/axi_ni_response_pinout_mask.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/synch_fifo.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/ni_initiator_67109162_CLUSTER_1.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/ni_admit_control.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/ni_request_header_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/ni_resend_transaction_store.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/axi_ni_request.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/routing_initiator_67109162.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/ni_clock_synchro.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/ni_request_payload_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/ni_flit_compose.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/ni_flit_type.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/axi_ni_request_payload_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/axi_ni_response_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/axi_ni_request_fsm.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/axi_ni_response.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/axi_ni_request_header_register.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/axi_ni_request_encoder.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/ni_response_transaction_store.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/axi_ni_response_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/out_buffer.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/ni_resend_header_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/in_buffer_6.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/ni_transmit_control.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/ni_resend_payload_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/mem_elem.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109162_CLUSTER_1/axi_ni_response_payload_register.v       || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109162_CLUSTER_1 compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109163_CLUSTER_1 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/axi_ni_response_pinout_mask.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/synch_fifo.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/routing_initiator_67109163.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/ni_admit_control.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/ni_request_header_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/ni_resend_transaction_store.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/axi_ni_request.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/ni_clock_synchro.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/ni_request_payload_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/ni_flit_compose.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/ni_flit_type.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/axi_ni_request_payload_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/axi_ni_response_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/axi_ni_request_fsm.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/axi_ni_response.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/axi_ni_request_header_register.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/axi_ni_request_encoder.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/ni_response_transaction_store.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/axi_ni_response_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/out_buffer.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/ni_resend_header_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/in_buffer_6.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/ni_transmit_control.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/ni_resend_payload_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/mem_elem.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/axi_ni_response_payload_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109163_CLUSTER_1/ni_initiator_67109163_CLUSTER_1.v        || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109163_CLUSTER_1 compilation complete! ${NC}"

echo "${Green}Compiling component:   ${Brown} noc_lib.ni_target_67109164_CLUSTER_1 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/synch_fifo.v                                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/ni_admit_control.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/ni_request_header_shifter.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/axi_ni_resend.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/ni_resend_transaction_store.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/ni_clock_synchro.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/ni_request_payload_shifter.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/ni_flit_compose.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/ni_flit_type.v                              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/axi_ni_resend_header_register.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/axi_ni_resend_payload_register.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/ni_response_transaction_store.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/axi_ni_receive_pinout_mask.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/axi_ni_receive_fsm.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/out_buffer.v                                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/ni_resend_header_shifter.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/axi_ni_receive_header_register.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/routing_target_67109164.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/in_buffer_6.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/ni_target_67109164_CLUSTER_1.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/ni_transmit_control.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/axi_ni_resend_fsm.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/ni_resend_payload_shifter.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/mem_elem.v                                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/axi_ni_receive.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/axi_ni_receive_payload_register.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109164_CLUSTER_1/axi_ni_receive_decoder.v                    || exit 1
echo "${Cyan}--> noc_lib.ni_target_67109164_CLUSTER_1 compilation complete! ${NC}"





echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109165_CLUSTER_2 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/axi_ni_response_pinout_mask.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/synch_fifo.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/ni_admit_control.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/ni_request_header_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/routing_initiator_67109165.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/ni_resend_transaction_store.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/axi_ni_request.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/ni_clock_synchro.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/ni_request_payload_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/ni_flit_compose.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/ni_flit_type.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/axi_ni_request_payload_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/axi_ni_response_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/axi_ni_request_fsm.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/axi_ni_response.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/ni_initiator_67109165_CLUSTER_2.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/axi_ni_request_header_register.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/axi_ni_request_encoder.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/ni_response_transaction_store.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/axi_ni_response_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/out_buffer.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/ni_resend_header_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/in_buffer_6.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/ni_transmit_control.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/ni_resend_payload_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/mem_elem.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109165_CLUSTER_2/axi_ni_response_payload_register.v       || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109165_CLUSTER_2 compilation complete! ${NC}"

echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109166_CLUSTER_2 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/axi_ni_response_pinout_mask.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/synch_fifo.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/ni_admit_control.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/routing_initiator_67109166.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/ni_initiator_67109166_CLUSTER_2.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/ni_request_header_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/ni_resend_transaction_store.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/axi_ni_request.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/ni_clock_synchro.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/ni_request_payload_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/ni_flit_compose.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/ni_flit_type.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/axi_ni_request_payload_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/axi_ni_response_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/axi_ni_request_fsm.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/axi_ni_response.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/axi_ni_request_header_register.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/axi_ni_request_encoder.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/ni_response_transaction_store.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/axi_ni_response_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/out_buffer.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/ni_resend_header_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/in_buffer_6.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/ni_transmit_control.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/ni_resend_payload_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/mem_elem.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109166_CLUSTER_2/axi_ni_response_payload_register.v       || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109166_CLUSTER_2 compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.ni_target_67109167_CLUSTER_2 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/synch_fifo.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/ni_admit_control.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/routing_target_67109167.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/ni_request_header_shifter.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/axi_ni_resend.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/ni_resend_transaction_store.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/ni_clock_synchro.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/ni_request_payload_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/ni_flit_compose.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/ni_flit_type.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/axi_ni_resend_header_register.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/axi_ni_resend_payload_register.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/ni_response_transaction_store.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/axi_ni_receive_pinout_mask.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/axi_ni_receive_fsm.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/out_buffer.v                               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/ni_resend_header_shifter.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/axi_ni_receive_header_register.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/in_buffer_6.v                              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/ni_transmit_control.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/axi_ni_resend_fsm.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/ni_resend_payload_shifter.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/mem_elem.v                                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/axi_ni_receive.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/axi_ni_receive_payload_register.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/ni_target_67109167_CLUSTER_2.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109167_CLUSTER_2/axi_ni_receive_decoder.v                   || exit 1
echo "${Cyan}--> noc_lib.ni_target_67109167_CLUSTER_2 compilation complete! ${NC}"






echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109168_CLUSTER_3 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/axi_ni_response_pinout_mask.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/synch_fifo.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/ni_admit_control.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/ni_request_header_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/ni_initiator_67109168_CLUSTER_3.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/ni_resend_transaction_store.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/axi_ni_request.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/ni_clock_synchro.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/ni_request_payload_shifter.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/ni_flit_compose.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/ni_flit_type.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/axi_ni_request_payload_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/axi_ni_response_fsm.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/axi_ni_request_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/axi_ni_response.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/axi_ni_request_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/axi_ni_request_encoder.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/ni_response_transaction_store.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/axi_ni_response_header_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/out_buffer.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/ni_resend_header_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/in_buffer_6.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/ni_transmit_control.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/ni_resend_payload_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/routing_initiator_67109168.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/mem_elem.v                              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109168_CLUSTER_3/axi_ni_response_payload_register.v      || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109168_CLUSTER_3 compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109169_CLUSTER_3 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/axi_ni_response_pinout_mask.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/synch_fifo.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/routing_initiator_67109169.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/ni_admit_control.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/ni_request_header_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/ni_resend_transaction_store.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/axi_ni_request.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/ni_clock_synchro.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/ni_request_payload_shifter.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/ni_flit_compose.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/ni_flit_type.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/axi_ni_request_payload_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/axi_ni_response_fsm.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/axi_ni_request_fsm.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/axi_ni_response.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/axi_ni_request_header_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/axi_ni_request_encoder.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/ni_response_transaction_store.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/axi_ni_response_header_register.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/out_buffer.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/ni_resend_header_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/in_buffer_6.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/ni_transmit_control.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/ni_resend_payload_shifter.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/ni_initiator_67109169_CLUSTER_3.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/mem_elem.v                              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109169_CLUSTER_3/axi_ni_response_payload_register.v      || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109169_CLUSTER_3 compilation complete! ${NC}"

echo "${Green}Compiling component:   ${Brown} noc_lib.ni_target_67109170_CLUSTER_3 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/synch_fifo.v                              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/ni_admit_control.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/ni_request_header_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/axi_ni_resend.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/routing_target_67109170.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/ni_resend_transaction_store.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/ni_clock_synchro.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/ni_request_payload_shifter.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/ni_flit_compose.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/ni_flit_type.v                            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/axi_ni_resend_header_register.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/ni_target_67109170_CLUSTER_3.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/axi_ni_resend_payload_register.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/ni_response_transaction_store.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/axi_ni_receive_pinout_mask.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/axi_ni_receive_fsm.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/out_buffer.v                              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/ni_resend_header_shifter.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/axi_ni_receive_header_register.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/in_buffer_6.v                             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/ni_transmit_control.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/axi_ni_resend_fsm.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/ni_resend_payload_shifter.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/mem_elem.v                                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/axi_ni_receive.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/axi_ni_receive_payload_register.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109170_CLUSTER_3/axi_ni_receive_decoder.v                  || exit 1
echo "${Cyan}--> noc_lib.ni_target_67109170_CLUSTER_3 compilation complete! ${NC}"





echo "${Green}Compiling component:   ${Brown} noc_lib.ni_target_67109171_L2_MEM ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/synch_fifo.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/ni_target_67109171_L2_MEM.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/ni_admit_control.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/ni_request_header_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/axi_ni_resend.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/ni_resend_transaction_store.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/ni_clock_synchro.v                  || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/ni_request_payload_shifter.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/ni_flit_compose.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/ni_flit_type.v                      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/axi_ni_resend_header_register.v     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/routing_target_67109171.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/axi_ni_resend_payload_register.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/ni_response_transaction_store.v     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/axi_ni_receive_pinout_mask.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/axi_ni_receive_fsm.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/out_buffer.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/ni_resend_header_shifter.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/axi_ni_receive_header_register.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/in_buffer_6.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/ni_transmit_control.v               || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/axi_ni_resend_fsm.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/ni_resend_payload_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/mem_elem.v                          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/axi_ni_receive.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/axi_ni_receive_payload_register.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_target_67109171_L2_MEM/axi_ni_receive_decoder.v            || exit 1
echo "${Cyan}--> noc_lib.ni_target_67109171_L2_MEM compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.ni_initiator_67109172_SOC_MASTER ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/axi_ni_response_pinout_mask.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/synch_fifo.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/ni_admit_control.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/ni_request_header_shifter.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/ni_resend_transaction_store.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/axi_ni_request.v                     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/ni_clock_synchro.v                   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/routing_initiator_67109172.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/ni_request_payload_shifter.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/ni_flit_compose.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/ni_flit_type.v                       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/axi_ni_request_payload_register.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/axi_ni_response_fsm.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/axi_ni_request_fsm.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/axi_ni_response.v                    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/axi_ni_request_header_register.v     || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/axi_ni_request_encoder.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/ni_response_transaction_store.v      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/axi_ni_response_header_register.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/out_buffer.v                         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/ni_resend_header_shifter.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/ni_initiator_67109172_SOC_MASTER.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/in_buffer_6.v                        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/ni_transmit_control.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/ni_resend_payload_shifter.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/mem_elem.v                           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/ni_initiator_67109172_SOC_MASTER/axi_ni_response_payload_register.v   || exit 1
echo "${Cyan}--> noc_lib.ni_initiator_67109172_SOC_MASTER compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.switch_16777289 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777289/allocator_3x5_32.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777289/multiplexer_4_32.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777289/multiplexer_3_32.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777289/combinational.v      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777289/allocator_4x5_32.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777289/switch_16777289.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777289/out_buffer.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777289/in_buffer_6.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777289/shifter.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777289/ff_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777289/routing_switch.v     || exit 1
echo "${Cyan}--> noc_lib.switch_16777289 compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.switch_16777290 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777290/multiplexer_4_32.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777290/allocator_4x4_32.v   || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777290/switch_16777290.v    || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777290/combinational.v      || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777290/out_buffer.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777290/in_buffer_6.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777290/shifter.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777290/ff_register.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777290/routing_switch.v     || exit 1
echo "${Cyan}--> noc_lib.switch_16777290 compilation complete! ${NC}"



echo "${Green}Compiling component:   ${Brown} noc_lib.sw_16777291 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777291/allocator_7x2_32.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777291/allocator_2x2_32.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777291/combinational.v           || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777291/switch_16777291.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777291/out_buffer.v              || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777291/in_buffer_6.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777291/shifter.v                 || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777291/multiplexer_7_32.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777291/ff_register.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777291/multiplexer_2_32.v        || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777291/routing_switch.v          || exit 1
echo "${Cyan}--> noc_lib.sw_16777291 compilation complete! ${NC}"


echo "${Green}Compiling component:   ${Brown} noc_lib.switch_16777292 ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777292/combinational.v          || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777292/allocator_2x7_32.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777292/out_buffer.v             || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777292/allocator_1x7_32.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777292/in_buffer_6.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777292/shifter.v                || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777292/ff_register.v            || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777292/multiplexer_2_32.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777292/routing_switch.v         || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777292/multiplexer_1_32.v       || exit 1
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/switch_16777292/switch_16777292.v        || exit 1
echo "${Cyan}--> noc_lib.switch_16777292 compilation complete! ${NC}"

echo "${Green}Compiling component:   ${Brown} noc_lib.noc_interconnect ${NC}"
echo "${Red}"
vlog -work noc_lib +incdir+${NOC_PATH} -quiet ${NOC_PATH}/noc_interconnect.v                        || exit 1
vlog -work noc_lib -quiet -sv ../rtl/multicluster/SoC/noc_interconnect_wrap.sv +incdir+../rtl/components +incdir+../rtl/includes  || exit 1 
echo "${Cyan}--> noc_lib.noc_interconnect compilation complete! ${NC}"