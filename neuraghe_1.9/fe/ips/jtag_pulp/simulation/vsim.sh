#!/bin/tcsh
vlib-10.1a work

vlog-10.1a ../src/tap_top.v
vlog-10.1a ../src/bscell.v
vlog-10.1a ../src/std_reg.v

vlog-10.1a +incdir+../testbench ../testbench/top_tb_jtag.v

vsim-10.1a -voptargs=+acc work.top_tb_jtag





