#!/bin/bash 
# \
exec vsim -64 -do "$0"

set TB            tb

set VSIM_FLAGS    "-L secureip \
  -L simprims_ver \
  -L unifast \
  -L unifast_ver \
  -L unimacro \
  -L unimacro_ver \
  -L unisim \
  -L unisims_ver "
# -pli ./work/jtag_vpi.so"

source ./tcl_files/vsim_fpga.tcl
add list -r sim:/tb/i_dut/hwce_wrap_i/hwce_top_i/*
#add list -r sim:/tb/i_dut/dmac_wrap_i/mchan_i/tcdm_unit_i/*
_add_menu main controls right #ffffff black {ReRun} {restart; run 10ms}
_add_menu main controls right #ffffff black {wave.do} {do ./wave.do}
