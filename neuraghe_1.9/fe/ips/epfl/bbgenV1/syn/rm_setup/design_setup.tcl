set NUM_CORES 4

set DESIGN_NAME bbgen_control

set DESIGN_PATH ../rtl
set IPS_PATH ../../..

set search_path [concat \
$IPS_PATH/or10n/include \
$IPS_PATH/icache/globals \
$IPS_PATH/axi/wb2axi \
$IPS_PATH/axi/per2axi \
$IPS_PATH/axi/axi2per \
$IPS_PATH/axi/axi2mem \
$IPS_PATH/axi/axi_node \
$IPS_PATH/apb/apb_i2c \
$IPS_PATH/mchan/include \
$IPS_PATH/cluster_peripherals/include \
$IPS_PATH/cluster_peripherals/event_unit/include \
$IPS_PATH/hwpe/hwpe-sm/rtl/axi  \
$IPS_PATH/hwpe/hwpe-sm/rtl      \
$IPS_PATH/hwpe/hwce/rtl         \
$IPS_PATH/epfl/bbgenV1/rtl      \
$DESIGN_PATH/rtl/includes       \
$search_path]

set OR10N_PATH                $IPS_PATH/or10n
set ICACHE_PATH               $IPS_PATH/icache
set CLUSTER_INTERCONNECT_PATH $IPS_PATH/cluster_interconnect/rtl
set AXI_PATH                  $IPS_PATH/axi
set SCM_PATH                  $IPS_PATH/scm
set APB_PATH                  $IPS_PATH/apb
set CEA_PATH                  $IPS_PATH/cea
set MINICHAN_PATH             $IPS_PATH/mchan
set JTAG_PATH                 $IPS_PATH/jtag_pulp/src
set CLKDIV_PATH               $IPS_PATH/clock_divider
set CLUSTER_PERIPHERALS_PATH  $IPS_PATH/cluster_peripherals
set ULPCLUSTER_PATH           $DESIGN_PATH/rtl
set ADV_DEBUG_IF_PATH         $IPS_PATH/adv_dbg_if/rtl
set BBGEN_PATH                $IPS_PATH/epfl/bbgenV1/rtl

define_design_lib work -path ./work
