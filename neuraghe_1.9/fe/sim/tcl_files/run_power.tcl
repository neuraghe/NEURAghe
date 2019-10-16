#!/bin/bash
# \
exec vsim -64 -do "$0"

set TB            tb
set VSIM_FLAGS    "-gLOAD_L2=\"SPI\" -gINTERNAL_EOC=\"FALSE\" -gDUMP_VCD=500"

source ./tcl_files/vsim_pls_cluster.tcl

# do a vcd dump of the cluster
vcd file ./ulpcluster.vcd
vcd add -r tb/i_dut/ulpsoc_i/cluster_i/*
vcd off
