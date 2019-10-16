set_attribute [get_cells  C28SOI_SC_8_CLK_LR/C8T28SOI_LRP_CNHLSX9_P0 ] is_clock_gating_cell true

set_clock_gating_style -minimum_bitwidth 4 -positive_edge_logic integrated:C28SOI_SC_8_CLK_LR/C8T28SOI_LRP_CNHLSX9_P0  -control_point       before  -control_signal scan_enable  -max_fanout 256

echo "Setting clock gating variables"
set compile_clock_gating_through_hierarchy true ;
set power_cg_balance_stages false ;


