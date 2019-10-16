set PERIOD 5.0

set DIR_LIST [list ni_initiator_67109005_CLUSTER_0 ni_target_67109006_CLUSTER_0 ni_initiator_67109007_CLUSTER_0 \
                   ni_initiator_67109008_CLUSTER_1 ni_initiator_67109009_CLUSTER_1 ni_target_67109010_CLUSTER_1 \
                   ni_initiator_67109011_CLUSTER_2 ni_initiator_67109012_CLUSTER_2 ni_target_67109013_CLUSTER_2 \
                   ni_initiator_67109014_CLUSTER_3 ni_initiator_67109015_CLUSTER_3 ni_target_67109016_CLUSTER_3 \
                   ni_target_67109017_L2_MEM ni_initiator_67109018_SOC_MASTER \
                   switch_16777291 switch_16777292 switch_16777293 switch_16777294 ]

set search_path  [lappend search_path "$NOC_PATH" ]
foreach DIR_NAME $DIR_LIST {
		set LIST [ls $NOC_PATH/$DIR_NAME/*] 
		foreach ITEM $LIST { 
			analyze -f sverilog $ITEM
		}
}


analyze -f sverilog $NOC_PATH/noc_interconnect.v

elaborate noc_interconnect

link
uniquify

create_clock -period 5.0 -name CLK [get_ports clk]
set_ideal_network {clk rst}
set_dont_touch_network {clk rst}

set_input_delay [expr $PERIOD/2.0 ] -clock CLK [get_ports AW* -filter {@port_direction == in}]
set_input_delay [expr $PERIOD/2.0 ] -clock CLK [get_ports W* -filter {@port_direction == in}]
set_input_delay [expr $PERIOD/2.0 ] -clock CLK [get_ports R* -filter {@port_direction == in}]
set_input_delay [expr $PERIOD/2.0 ] -clock CLK [get_ports AR* -filter {@port_direction == in}]
set_input_delay [expr $PERIOD/2.0 ] -clock CLK [get_ports B* -filter {@port_direction == in}]

set_output_delay [expr $PERIOD/2.0 ] -clock CLK [get_ports AW* -filter {@port_direction == out}]
set_output_delay [expr $PERIOD/2.0 ] -clock CLK [get_ports W* -filter {@port_direction == out}]
set_output_delay [expr $PERIOD/2.0 ] -clock CLK [get_ports R* -filter {@port_direction == out}]
set_output_delay [expr $PERIOD/2.0 ] -clock CLK [get_ports AR* -filter {@port_direction == out}]
set_output_delay [expr $PERIOD/2.0 ] -clock CLK [get_ports B* -filter {@port_direction == out}]
