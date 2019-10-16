set_dft_configuration -fix_bidirectional disable -connect_clock_gating enable

set_dft_signal -view existing_dft -type ScanClock  -port clk_i -timing [list 45 55]
set_dft_signal -view existing_dft -type Reset      -port rst_ni -active_state 0
set_dft_signal -view existing_dft -type ScanClock  -port tck_i -timing [list 45 55]
set_dft_signal -view existing_dft -type Reset      -port trstn_i -active_state 0
set_dft_signal -view existing_dft -type TestMode   -active_state 1 -port test_mode_i
set_dft_signal -view existing_dft -type ScanEnable -active_state 1 -port SE
set_dft_signal -view existing_dft -type Constant   -active_state 0 -port en_sa_boot_i
set_dft_signal -view existing_dft -type Constant   -active_state 0 -port tdi_i
set_dft_signal -view existing_dft -type Constant   -active_state 0 -port tms_i

set_scan_configuration -chain_count 11

set_dft_signal -view spec -type ScanDataIn -port [list SI[0] SI[1] SI[2] SI[3] SI[4] SI[5] SI[6] SI[7] SI[8] SI[9] SI[10]] 

set_dft_signal -view spec -type ScanDataOut -port [list SO[0] SO[1] SO[2] SO[3] SO[4] SO[5] SO[6] SO[7] SO[8] SO[9] SO[10]] 

set_scan_path chain0  -view spec -scan_data_in SI[0]  -scan_data_out SO[0]
set_scan_path chain1  -view spec -scan_data_in SI[1]  -scan_data_out SO[1]
set_scan_path chain2  -view spec -scan_data_in SI[2]  -scan_data_out SO[2]
set_scan_path chain3  -view spec -scan_data_in SI[3]  -scan_data_out SO[3]
set_scan_path chain4  -view spec -scan_data_in SI[4]  -scan_data_out SO[4]
set_scan_path chain5  -view spec -scan_data_in SI[5]  -scan_data_out SO[5]
set_scan_path chain6  -view spec -scan_data_in SI[6]  -scan_data_out SO[6]
set_scan_path chain7  -view spec -scan_data_in SI[7]  -scan_data_out SO[7]
set_scan_path chain8  -view spec -scan_data_in SI[8]  -scan_data_out SO[8]
set_scan_path chain9  -view spec -scan_data_in SI[9]  -scan_data_out SO[9]
set_scan_path chain10 -view spec -scan_data_in SI[10] -scan_data_out SO[10]

s
set_scan_element false rstgen_i
set_scan_element false [get_cells hwce_wrap_i/hwce_top_i/u_wrapper/u_slave/u_regfile/regfile_latch_gen.u_regfile_latch/*]
set_scan_element false [get_cells hwce_wrap_i/hwce_top_i/u_engine/u_linebuffer/u_fifo_latch/*]
set_scan_element false [get_cells hwce_wrap_i/hwce_top_i/u_engine/u_linebuffer/u_fifo_end_latch/*]
set_scan_element false [get_cells hwce_wrap_i/hwce_top_i/weight_loader_5x5_gen.u_weight_loader/u_weight_latch/*]
set_scan_element false [get_cells icache_top_i/_SHARED_ENABLED_.SHARED_ICACHE_BANKS[*].u_icache_bank/DATA_RAM_WAY[*].DATA_RAM/scm_data/*]
set_scan_element false [get_cells icache_top_i/_SHARED_ENABLED_.SHARED_ICACHE_BANKS[*].u_icache_bank/TAG_RAM_WAY[*].TAG_RAM/scm_tag/*]
set_scan_element false [get_cells tcdm_scm_island/BANK[*].scm_bank_i/scm_*_i/*]
set_scan_element false [get_cells CORE[*].core_region_i/ORION_CORE/id_stage_i/registers_i/*]

