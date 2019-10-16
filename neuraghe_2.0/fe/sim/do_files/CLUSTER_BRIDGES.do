onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {CLUSTER BRIDGES}
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_addr
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_prot
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_region
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_len
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_size
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_burst
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_lock
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_cache
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_qos
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_id
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_user
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_ready
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/aw_valid
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_addr
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_prot
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_region
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_len
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_size
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_burst
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_lock
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_cache
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_qos
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_id
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_user
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_ready
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/ar_valid
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/w_valid
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/w_data
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/w_strb
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/w_user
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/w_last
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/w_ready
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/r_data
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/r_resp
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/r_last
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/r_id
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/r_user
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/r_ready
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/r_valid
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/b_resp
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/b_id
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/b_user
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/b_ready
add wave -noupdate -group {AXI2MEM AXI_SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi_slave/b_valid
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[3]/req}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[3]/add}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[3]/we}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[3]/wdata}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[3]/be}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[3]/gnt}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[3]/r_opc}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[3]/r_rdata}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[3]/r_valid}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[2]/req}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[2]/add}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[2]/we}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[2]/wdata}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[2]/be}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[2]/gnt}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[2]/r_opc}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[2]/r_rdata}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[2]/r_valid}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[1]/req}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[1]/add}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[1]/we}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[1]/wdata}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[1]/be}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[1]/gnt}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[1]/r_opc}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[1]/r_rdata}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[1]/r_valid}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[0]/req}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[0]/add}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[0]/we}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[0]/wdata}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[0]/be}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[0]/gnt}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[0]/r_opc}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[0]/r_rdata}
add wave -noupdate -group {AXI2MEM TCDM MASTER} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/tcdm_master[0]/r_valid}
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
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/we
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/wdata
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/be
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/gnt
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/r_opc
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/r_rdata
add wave -noupdate -group {AXI2PER PERIPH MASTER} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2per_wrap_i/periph_master/r_valid
add wave -noupdate -group {PER2AXI PERIPH SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/req
add wave -noupdate -group {PER2AXI PERIPH SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/add
add wave -noupdate -group {PER2AXI PERIPH SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/we
add wave -noupdate -group {PER2AXI PERIPH SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/wdata
add wave -noupdate -group {PER2AXI PERIPH SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/be
add wave -noupdate -group {PER2AXI PERIPH SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/gnt
add wave -noupdate -group {PER2AXI PERIPH SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/id
add wave -noupdate -group {PER2AXI PERIPH SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/r_valid
add wave -noupdate -group {PER2AXI PERIPH SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/r_opc
add wave -noupdate -group {PER2AXI PERIPH SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/r_id
add wave -noupdate -group {PER2AXI PERIPH SLAVE} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/per2axi_wrap_i/periph_slave/r_rdata
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
WaveRestoreCursors {{Cursor 1} {4563871234 ps} 0}
configure wave -namecolwidth 660
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
WaveRestoreZoom {4563859946 ps} {4563879027 ps}
