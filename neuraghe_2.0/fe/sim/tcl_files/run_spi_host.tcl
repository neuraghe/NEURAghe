#!/bin/bash 
# \
exec vsim -64 -do "$0"

set TB            tb_spi_host
set VSIM_FLAGS ""
#set VSIM_FLAGS    "-pli ./work/jtag_vpi.so"

source ./tcl_files/vsim.tcl
