group_path -name "ORION_DATA_REQ" -through   [ list [get_ports CORE*core_region_i/ORION_CORE/data_addr_o*   ] \
					            [get_ports CORE*core_region_i/ORION_CORE/data_wdata_o*  ] \
					            [get_ports CORE*core_region_i/ORION_CORE/data_we_o*     ] \
					            [get_ports CORE*core_region_i/ORION_CORE/data_req_o*    ] \
					            [get_ports CORE*core_region_i/ORION_CORE/data_be_o*     ] \
					            [get_ports CORE*core_region_i/ORION_CORE/data_gnt_i*    ] \
				              ] -weight 2.0
				              
group_path -name "ORION_DATA_RESP" -through  [ list [get_ports CORE*core_region_i/ORION_CORE/data_rdata_i*   ] \
						    [get_ports CORE*core_region_i/ORION_CORE/data_r_valid_i*   ] \
					     ] -weight 2.0



group_path -name "ORION_INSTR_REQ" -through   [ list [get_ports CORE*core_region_i/ORION_CORE/instr_addr_o*   ] \
					             [get_ports CORE*core_region_i/ORION_CORE/instr_req_o*     ] \
					             [get_ports CORE*core_region_i/ORION_CORE/instr_grant_i*   ] \
				              ] -weight 2.0
				              
group_path -name "ORION_INSTR_RESP" -through  [ list [get_ports CORE*core_region_i/ORION_CORE/instr_rdata_i*   ] \
						     [get_ports CORE*core_region_i/ORION_CORE/instr_rvalid_i*   ] \
					      ] -weight 2.0

group_path -name "HWCE" -through  [ list [get_ports hwce_wrap_i/*] ] -weight 2.0

group_path -name "ORION_R2R"  -from [all_registers CORE[*].core_region_i/ORION_CORE/*]  -to [all_registers CORE[*].core_region_i/ORION_CORE/*] -weight 2.0
