#!/bin/bash
# \
exec vsim -64 -do "$0"

set TB            tb
set VSIM_FLAGS    "-gENABLE_DPI=1"

source ./tcl_files/vsim.tcl
