
solution file add ./weight_loader_5x5.c

# Establish the location of this script and use it to reference all
# other files in this example
set sfd [file dirname [info script]]

# Reset the options to the factory defaults
options defaults

# Establish the default component library search path
# and append this example directory so that the component libraries
# will be available
set libpaths [options get ProjectInit/ComponentLibs/SearchPath]
lappend libpaths ./lib
options set ProjectInit/ComponentLibs SearchPath $libpaths

# Start a new project to have the above change take effect
exec rm -rf ./working_project
project new -dir ./working_project

# Both VHDL and Verilog are supported for this example
options set Output OutputVHDL true
options set Output OutputVerilog true
options set Output OutputSystemC true

# Enable the SCVerify verification flow
#flow package require /SCVerify

# This script is for lcbg11p
directive set -TECHLIBS [list [list lib/Catapult_ST32.lib ST32] [list [file join $sfd lib/ram_w_handshake-STMicroelectronics-st32_28nm.lib] ram_w_handshake]]

# Set the clock period
directive set -CLOCK_PERIOD 2.0

# Set the standard CatC interface signals (start, done, clk, rst_n, en)
directive set -START_FLAG start
directive set -DONE_FLAG done
directive set -CLOCKS {clk {-CLOCK_PERIOD 2.0 -CLOCK_EDGE rising \
-CLOCK_HIGH_TIME 0.000000 -CLOCK_OFFSET 0.000000 \
-RESET_KIND async \
-RESET_SYNC_NAME srst_n -RESET_SYNC_ACTIVE low \
-RESET_ASYNC_NAME rst_n -RESET_ASYNC_ACTIVE low -ENABLE_NAME en -ENABLE_ACTIVE high}}

solution file add ./weight_loader_5x5.c

go analyze
directive set -DESIGN_HIERARCHY weight_loader_5x5
go compile
directive set /weight_loader_5x5 -EFFORT_LEVEL high
directive set /weight_loader_5x5/core/main/for -PIPELINE_INIT_INTERVAL 1
directive set /weight_loader_5x5/core/main/for -UNROLL 2
directive set /weight_loader_5x5/weight_tcdm:rsc -INTERLEAVE 2
directive set /weight_loader_5x5/weight_tcdm:rsc -MAP_TO_MODULE ram_w_handshake.ram_w_handshake
directive set /weight_loader_5x5/weight_priv:rsc -MAP_TO_MODULE mgc_ioport.mgc_out_stdreg
go allocate
go compile
go allocate
go extract