set_property  target_part "XC7Z045FFG900-2" [current_fileset -constrset]
set_property design_mode GateLvL [current_fileset]
set_property edif_top_file ./.rev_1/hwce.edf [current_fileset]
read_edif ./rev_1/hwce.edf
set TopModule [find_top]
link_design
write_verilog -mode synth_stub hwce_stub.v
