onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/clk_i
add wave -noupdate /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/rst_ni
add wave -noupdate /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/busy_o
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_addr
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_prot
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_region
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_len
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_size
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_burst
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_lock
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_cache
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_qos
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_id
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_user
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_ready
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/aw_valid
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_addr
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_prot
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_region
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_len
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_size
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_burst
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_lock
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_cache
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_qos
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_id
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_user
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_ready
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/ar_valid
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/w_valid
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/w_data
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/w_strb
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/w_user
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/w_last
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/w_ready
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/r_data
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/r_resp
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/r_last
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/r_id
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/r_user
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/r_ready
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/r_valid
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/b_resp
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/b_id
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/b_user
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/b_ready
add wave -noupdate -group {AXI2PER AXI SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/axi_slave/b_valid
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/req
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/add
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/wen
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/wdata
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/be
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/gnt
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/r_opc
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/r_rdata
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/r_valid
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
