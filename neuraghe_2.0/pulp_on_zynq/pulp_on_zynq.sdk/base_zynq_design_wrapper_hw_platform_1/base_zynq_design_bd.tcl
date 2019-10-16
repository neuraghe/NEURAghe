
################################################################
# This is a generated script based on design: base_zynq_design
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source base_zynq_design_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z045ffg900-2
#    set_property BOARD_PART xilinx.com:zc706:part0:1.2 [current_project]

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name base_zynq_design

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  # Create ports
  set fech_enable_o [ create_bd_port -dir O fech_enable_o ]

  # Create instance: axi_dwidth_converter_0, and set properties
  set axi_dwidth_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dwidth_converter:2.1 axi_dwidth_converter_0 ]

  # Create instance: axi_protocol_converter_0, and set properties
  set axi_protocol_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_protocol_converter:2.1 axi_protocol_converter_0 ]

  # Create instance: axi_protocol_converter_1, and set properties
  set axi_protocol_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_protocol_converter:2.1 axi_protocol_converter_1 ]
  set_property -dict [ list \
CONFIG.ID_WIDTH {6} \
CONFIG.MI_PROTOCOL {AXI3} \
CONFIG.TRANSLATION_MODE {2} \
 ] $axi_protocol_converter_1

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {151.636} \
CONFIG.CLKOUT1_PHASE_ERROR {98.575} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50} \
CONFIG.CLKOUT2_JITTER {130.958} \
CONFIG.CLKOUT2_PHASE_ERROR {98.575} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {100} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.MMCM_CLKFBOUT_MULT_F {10.000} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {20.000} \
CONFIG.MMCM_CLKOUT1_DIVIDE {10} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.NUM_OUT_CLKS {2} \
CONFIG.RESET_PORT {resetn} \
CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $clk_wiz_0

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_EN_CLK1_PORT {0} \
CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_USE_S_AXI_GP0 {1} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
CONFIG.PCW_USE_S_AXI_HP1 {0} \
CONFIG.preset {ZC706} \
 ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {2} \
 ] $processing_system7_0_axi_periph

  # Create instance: rst_processing_system7_0_50M, and set properties
  set rst_processing_system7_0_50M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_50M ]

  # Create instance: soc_AXI_ctrl_v1_0_0, and set properties
  set soc_AXI_ctrl_v1_0_0 [ create_bd_cell -type ip -vlnv user.org:user:soc_AXI_ctrl_v1_0:1.0 soc_AXI_ctrl_v1_0_0 ]
  set_property -dict [ list \
CONFIG.C_S00_AXI_ID_WIDTH {12} \
 ] $soc_AXI_ctrl_v1_0_0

  # Create instance: ulpsoc_0, and set properties
  set ulpsoc_0 [ create_bd_cell -type ip -vlnv uniCA:user:ulpsoc:1.0 ulpsoc_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_dwidth_converter_0_M_AXI [get_bd_intf_pins axi_dwidth_converter_0/M_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_GP0]
  connect_bd_intf_net -intf_net axi_protocol_converter_0_M_AXI [get_bd_intf_pins axi_protocol_converter_0/M_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net axi_protocol_converter_1_M_AXI [get_bd_intf_pins axi_dwidth_converter_0/S_AXI] [get_bd_intf_pins axi_protocol_converter_1/M_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI] [get_bd_intf_pins soc_AXI_ctrl_v1_0_0/s00_axi]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M01_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M01_AXI] [get_bd_intf_pins ulpsoc_0/DATA_IN_S]
  connect_bd_intf_net -intf_net ulpsoc_0_DATA_OUT_M [get_bd_intf_pins axi_protocol_converter_0/S_AXI] [get_bd_intf_pins ulpsoc_0/DATA_OUT_M]
  connect_bd_intf_net -intf_net ulpsoc_0_STDOUT_M [get_bd_intf_pins axi_protocol_converter_1/S_AXI] [get_bd_intf_pins ulpsoc_0/STDOUT_M]

  # Create port connections
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins rst_processing_system7_0_50M/dcm_locked]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins axi_dwidth_converter_0/s_axi_aclk] [get_bd_pins axi_protocol_converter_0/aclk] [get_bd_pins axi_protocol_converter_1/aclk] [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/M01_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins rst_processing_system7_0_50M/slowest_sync_clk] [get_bd_pins soc_AXI_ctrl_v1_0_0/s00_axi_aclk] [get_bd_pins ulpsoc_0/clk_soc_i]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins ulpsoc_0/clk_cluster_fast_i]
  connect_bd_net -net processing_system7_0_FCLK_CLK2 [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins processing_system7_0/FCLK_CLK0]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins clk_wiz_0/resetn] [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_50M/ext_reset_in]
  connect_bd_net -net rst_processing_system7_0_50M_interconnect_aresetn [get_bd_pins processing_system7_0_axi_periph/ARESETN] [get_bd_pins rst_processing_system7_0_50M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_50M_peripheral_aresetn [get_bd_pins axi_dwidth_converter_0/s_axi_aresetn] [get_bd_pins axi_protocol_converter_0/aresetn] [get_bd_pins axi_protocol_converter_1/aresetn] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M01_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_processing_system7_0_50M/peripheral_aresetn] [get_bd_pins soc_AXI_ctrl_v1_0_0/s00_axi_aresetn] [get_bd_pins ulpsoc_0/rstn_sync_i]
  connect_bd_net -net soc_AXI_ctrl_v1_0_0_fech_enable_o [get_bd_ports fech_enable_o] [get_bd_pins soc_AXI_ctrl_v1_0_0/fech_enable_o] [get_bd_pins ulpsoc_0/fetch_en_i]
  connect_bd_net -net soc_AXI_ctrl_v1_0_0_mode_select_o [get_bd_pins soc_AXI_ctrl_v1_0_0/mode_select_o] [get_bd_pins ulpsoc_0/mode_select_i]
  connect_bd_net -net soc_AXI_ctrl_v1_0_0_test_mode_o [get_bd_pins soc_AXI_ctrl_v1_0_0/test_mode_o] [get_bd_pins ulpsoc_0/test_mode_i]
  connect_bd_net -net ulpsoc_0_eoc_o [get_bd_pins soc_AXI_ctrl_v1_0_0/eoc_i] [get_bd_pins ulpsoc_0/eoc_o]
  connect_bd_net -net ulpsoc_0_return_o [get_bd_pins soc_AXI_ctrl_v1_0_0/return_i] [get_bd_pins ulpsoc_0/return_o]

  # Create address segments
  create_bd_addr_seg -range 0x10000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs soc_AXI_ctrl_v1_0_0/s00_axi/reg0] SEG_soc_AXI_ctrl_v1_0_0_reg0
  create_bd_addr_seg -range 0x10000000 -offset 0x50000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs ulpsoc_0/DATA_IN_S/Reg] SEG_ulpsoc_0_Reg

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   commentid: "",
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.8
#  -string -flagsOSRD
preplace port DDR -pg 1 -y 70 -defaultsOSRD
preplace port fech_enable_o -pg 1 -y 370 -defaultsOSRD
preplace port FIXED_IO -pg 1 -y 90 -defaultsOSRD
preplace inst axi_protocol_converter_0 -pg 1 -lvl 6 -y 250 -defaultsOSRD
preplace inst axi_dwidth_converter_0 -pg 1 -lvl 6 -y 90 -defaultsOSRD
preplace inst axi_protocol_converter_1 -pg 1 -lvl 5 -y 90 -defaultsOSRD
preplace inst ulpsoc_0 -pg 1 -lvl 4 -y 220 -defaultsOSRD
preplace inst rst_processing_system7_0_50M -pg 1 -lvl 2 -y 190 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 1 -y 210 -defaultsOSRD
preplace inst soc_AXI_ctrl_v1_0_0 -pg 1 -lvl 4 -y 460 -defaultsOSRD
preplace inst processing_system7_0_axi_periph -pg 1 -lvl 3 -y 150 -defaultsOSRD
preplace inst processing_system7_0 -pg 1 -lvl 7 -y 180 -defaultsOSRD -resize 346 295
preplace netloc processing_system7_0_DDR 1 7 1 NJ
preplace netloc clk_wiz_0_locked 1 1 1 N
preplace netloc processing_system7_0_axi_periph_M00_AXI 1 3 1 890
preplace netloc ulpsoc_0_eoc_o 1 3 2 940 340 1240
preplace netloc rst_processing_system7_0_50M_interconnect_aresetn 1 2 1 560
preplace netloc processing_system7_0_M_AXI_GP0 1 2 6 590 10 NJ 10 NJ 10 NJ 10 NJ 10 2280
preplace netloc soc_AXI_ctrl_v1_0_0_test_mode_o 1 3 2 940 110 1250
preplace netloc processing_system7_0_FCLK_RESET0_N 1 0 8 20 140 200 80 NJ 360 NJ 360 NJ 360 NJ 360 NJ 360 2270
preplace netloc rst_processing_system7_0_50M_peripheral_aresetn 1 2 4 590 310 910 100 1270 160 1560
preplace netloc axi_protocol_converter_0_M_AXI 1 6 1 1870
preplace netloc ulpsoc_0_STDOUT_M 1 4 1 1280
preplace netloc processing_system7_0_FIXED_IO 1 7 1 NJ
preplace netloc soc_AXI_ctrl_v1_0_0_fech_enable_o 1 3 5 930 370 1280 370 NJ 370 NJ 370 NJ
preplace netloc ulpsoc_0_DATA_OUT_M 1 4 2 N 210 NJ
preplace netloc axi_dwidth_converter_0_M_AXI 1 6 1 1870
preplace netloc processing_system7_0_FCLK_CLK0 1 1 6 190 70 580 300 900 70 1270 20 1550 180 1860
preplace netloc processing_system7_0_FCLK_CLK1 1 1 3 210 100 NJ 290 NJ
preplace netloc soc_AXI_ctrl_v1_0_0_mode_select_o 1 3 2 930 80 1260
preplace netloc axi_protocol_converter_1_M_AXI 1 5 1 1540
preplace netloc processing_system7_0_axi_periph_M01_AXI 1 3 1 N
preplace netloc processing_system7_0_FCLK_CLK2 1 0 8 30 350 NJ 350 NJ 350 NJ 350 NJ 350 NJ 350 NJ 350 2280
preplace netloc ulpsoc_0_return_o 1 3 2 920 330 1230
levelinfo -pg 1 0 110 380 740 1090 1410 1710 2070 2300 -top 0 -bot 550
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


