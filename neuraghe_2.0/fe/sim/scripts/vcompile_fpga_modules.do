#!/bin/tcsh
source scripts/colors.sh

echo ""
echo "${Green}--> Compiling PULP FPGA MODULES... ${NC}"


echo "${Green}library: work ${NC}"
echo "${Red}"

vlog -quiet -sv   +incdir+./../rtl/includes ../../fpga/rtl/ulpcluster_wrap.sv                                                || exit 1
vlog -quiet -sv   +incdir+./../rtl/includes ../../fpga/rtl/l2_generic.sv                                                     || exit 1
vlog -quiet -sv   +incdir+./../rtl/includes ../../fe/rtl/ulpsoc/axi_rab_wrap.sv                                              || exit 1

vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_rom_bank_1024x64/ip/xilinx_rom_bank_1024x64_sim_netlist.v      || exit 1 
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_256x32/ip/xilinx_tcdm_bank_256x32_sim_netlist.v      || exit 1 
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_2048x32/ip/xilinx_tcdm_bank_2048x32_sim_netlist.v    || exit 1   
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_4096x32/ip/xilinx_tcdm_bank_4096x32_sim_netlist.v    || exit 1   
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_8192x32/ip/xilinx_tcdm_bank_8192x32_sim_netlist.v    || exit 1 
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_1024x32/ip/xilinx_tcdm_bank_1024x32_sim_netlist.v    || exit 1   
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_1024x64/ip/xilinx_tcdm_bank_1024x64_sim_netlist.v    || exit 1   
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_16x32/ip/xilinx_tcdm_bank_16x32_sim_netlist.v    || exit 1 
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_l2_mem_32768x64/ip/xilinx_l2_mem_32768x64_sim_netlist.v        || exit 1
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_l2_mem_32768x64_dp/ip/xilinx_l2_mem_32768x64_dp_sim_netlist.v  || exit 1
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_axi_mem_32768x64/ip/xilinx_axi_mem_32768x64_sim_netlist.v      || exit 1
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_axi_mem_131072x64/ip/xilinx_axi_mem_131072x64_sim_netlist.v      || exit 1
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_l2_mem_131072x64_dp/ip/xilinx_l2_mem_131072x64_dp_sim_netlist.v  || exit 1
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_l2_mem_262144x64_dp/ip/xilinx_l2_mem_262144x64_dp_sim_netlist.v  || exit 1
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_l2_mem_262144x64_dp2/ip/xilinx_l2_mem_262144x64_dp2_sim_netlist.v  || exit 1   
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_4096x64_asym/ip/xilinx_tcdm_bank_4096x64_asym_sim_netlist.v    || exit 1 
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_4096x64_16_asym/ip/xilinx_tcdm_bank_4096x64_16_asym_sim_netlist.v    || exit 1
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_2048x16_16_Sdp/ip/xilinx_tcdm_bank_2048x16_16_Sdp_sim_netlist.v    || exit 1
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_4096x64_64/ip/xilinx_tcdm_bank_4096x64_64_sim_netlist.v    || exit 1
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_1024x16_16_Sdp/ip/xilinx_tcdm_bank_1024x16_16_Sdp_sim_netlist.v    || exit 1
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_2048x64_64/ip/xilinx_tcdm_bank_2048x64_64_sim_netlist.v    || exit 1
vlog -quiet       +incdir+./../rtl/includes ../../fpga/ips/xilinx_tcdm_bank_2048x64_128/ip/xilinx_tcdm_bank_2048x64_128_sim_netlist.v    || exit 1

rm -rf ${MSIM_LIBS_PATH}/fpga_lib

vlib ${MSIM_LIBS_PATH}/fpga_lib
vmap fpga_lib ${MSIM_LIBS_PATH}/fpga_lib

vlog -quiet -sv -work fpga_lib  +incdir+./../rtl/includes ../../fpga/rtl/register_file_2r_1w_asymm.sv                        || exit 1 
vlog -quiet -sv -work fpga_lib  +incdir+./../rtl/includes ../../fpga/rtl/register_file_1r_1w_all.sv                          || exit 1
vlog -quiet -sv -work fpga_lib  +incdir+./../rtl/includes ../../fpga/rtl/register_file_1r_1w.sv                              || exit 1

#vlog -quiet ../rtl/components/l2_ram_32768x64.sv      || exit 1

echo "${Cyan} PULP FPGA MODULES compilation complete! ${NC}"
