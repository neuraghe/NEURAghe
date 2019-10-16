current_design ${myTopLevel}

set_input_transition 0.5    [all_inputs]
set_load             0.1    [all_outputs]

create_clock -period 10.0 -name reference_clk [get_ports reference_clk]

set_clock_transition 1.0    [all_clocks]

set_input_delay 0 -clock reference_clk [all_inputs]
set_output_delay 0 -clock reference_clk [all_outputs]

set_max_delay 10.0 -from [all_inputs] -to [all_outputs]

set_ideal_network       [get_ports  reference_clk]
set_ideal_network       [get_ports  nRST]

set_dont_touch_network  [get_ports  reference_clk]
set_dont_touch_network  [get_ports  nRST]

