#!/bin/bash 
# \
exec vsim -64 -do "$0"

set TB            tb
set VSIM_FLAGS    ""

source ./tcl_files/vsim.tcl
#do ./tcl_files/suppress_warning.tcl

#do do_files/CORE_0_REGION.do
#do do_files/CORE_1_REGION.do
#do do_files/CORE_2_REGION.do
#do do_files/CORE_3_REGION.do
#do do_files/CLUSTER_INTERCONNECT.do
#do do_files/CLUSTER_PERIPHERALS.do
#do do_files/TCDM.do
#do do_files/SOC_BUS.do
#do do_files/SOC_PERIPHERALS.do
#do do_files/MCHAN.do
#do do_files/CVP.do
#do do_files/ULPSOC.do
#do do_files/TESTBENCH.do
