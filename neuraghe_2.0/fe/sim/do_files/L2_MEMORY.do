onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {L2 MEMORY}
add wave -noupdate -group L2_RAM -group MEM_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/mem_slave/wdata
add wave -noupdate -group L2_RAM -group MEM_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/mem_slave/add
add wave -noupdate -group L2_RAM -group MEM_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/mem_slave/csn
add wave -noupdate -group L2_RAM -group MEM_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/mem_slave/wen
add wave -noupdate -group L2_RAM -group MEM_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/mem_slave/ben
add wave -noupdate -group L2_RAM -group MEM_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/mem_slave/rdata
add wave -noupdate -group L2_RAM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/clk_i
add wave -noupdate -group L2_RAM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/rst_ni
add wave -noupdate -group L2_RAM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/clk_i
add wave -noupdate -group L2_RAM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/rst_ni
add wave -noupdate -group L2_RAM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/init_ni
add wave -noupdate -group L2_RAM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/test_mode_i
add wave -noupdate -group L2_RAM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/wm_l2_mem
add wave -noupdate -group L2_RAM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/rm_l2_mem
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/CLK
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/RSTN
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/INITN
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/CEN
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/WEN
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/A
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/D
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/BE
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/Q
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/WM
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/RM
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/TM
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/s_cen
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/s_wen
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/s_addr_sync
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/s_wmn
add wave -noupdate -group L2_MEM -radix hexadecimal /tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/s_q
add wave -noupdate -group {MEM CUTS} {/tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut[0]/cut_lo/Mem}
add wave -noupdate -group {MEM CUTS} {/tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut[0]/cut_hi/Mem}
add wave -noupdate -group {MEM CUTS} {/tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut[1]/cut_lo/Mem}
add wave -noupdate -group {MEM CUTS} {/tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut[1]/cut_hi/Mem}
add wave -noupdate -group {MEM CUTS} {/tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut[2]/cut_lo/Mem}
add wave -noupdate -group {MEM CUTS} {/tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut[2]/cut_hi/Mem}
add wave -noupdate -group {MEM CUTS} {/tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut[3]/cut_lo/Mem}
add wave -noupdate -group {MEM CUTS} {/tb/ulpsoc_wrap_i/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut[3]/cut_hi/Mem}
add wave -noupdate -group L2_MEM_IF /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/clk_i
add wave -noupdate -group L2_MEM_IF /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/rst_ni
add wave -noupdate -group L2_MEM_IF -group MEM_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/mem_master/wdata
add wave -noupdate -group L2_MEM_IF -group MEM_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/mem_master/add
add wave -noupdate -group L2_MEM_IF -group MEM_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/mem_master/csn
add wave -noupdate -group L2_MEM_IF -group MEM_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/mem_master/wen
add wave -noupdate -group L2_MEM_IF -group MEM_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/mem_master/ben
add wave -noupdate -group L2_MEM_IF -group MEM_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/mem_master/rdata
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_addr
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_prot
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_region
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_len
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_size
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_burst
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_lock
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_cache
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_qos
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_id
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_user
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_ready
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/aw_valid
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_addr
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_prot
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_region
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_len
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_size
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_burst
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_lock
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_cache
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_qos
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_id
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_user
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_ready
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/ar_valid
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/w_valid
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/w_data
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/w_strb
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/w_user
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/w_last
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/w_ready
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/r_data
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/r_resp
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/r_last
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/r_id
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/r_user
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/r_ready
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/r_valid
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/b_resp
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/b_id
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/b_user
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/b_ready
add wave -noupdate -group L2_MEM_IF -group AXI_SLAVE /tb/ulpsoc_wrap_i/ulpsoc_i/l2_mem_if_i/axi_slave/b_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15506086933 ps} 0}
configure wave -namecolwidth 769
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
WaveRestoreZoom {1396000492 ps} {1397058476 ps}
