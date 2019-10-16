onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/clk_i
add wave -noupdate /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/rst_ni
add wave -noupdate /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/busy_o
add wave -noupdate -group {PER2AXI PER SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/req
add wave -noupdate -group {PER2AXI PER SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/add
add wave -noupdate -group {PER2AXI PER SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/wen
add wave -noupdate -group {PER2AXI PER SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/wdata
add wave -noupdate -group {PER2AXI PER SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/be
add wave -noupdate -group {PER2AXI PER SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/gnt
add wave -noupdate -group {PER2AXI PER SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/id
add wave -noupdate -group {PER2AXI PER SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/r_valid
add wave -noupdate -group {PER2AXI PER SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/r_opc
add wave -noupdate -group {PER2AXI PER SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/r_id
add wave -noupdate -group {PER2AXI PER SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/r_rdata
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_addr
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_prot
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_region
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_len
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_size
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_burst
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_lock
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_cache
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_qos
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_id
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_user
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_ready
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/aw_valid
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_addr
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_prot
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_region
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_len
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_size
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_burst
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_lock
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_cache
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_qos
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_id
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_user
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_ready
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/ar_valid
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/w_valid
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/w_data
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/w_strb
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/w_user
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/w_last
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/w_ready
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/r_data
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/r_resp
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/r_last
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/r_id
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/r_user
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/r_ready
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/r_valid
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/b_resp
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/b_id
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/b_user
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/b_ready
add wave -noupdate -group {PER2AXI AXI MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/axi_master/b_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1396849682 ps} 0} {{Cursor 2} {0 ps} 0}
configure wave -namecolwidth 753
configure wave -valuecolwidth 292
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {8846103063 ps} {8915161174 ps}
