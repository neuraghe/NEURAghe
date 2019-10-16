
mem load -i slm_files/l2_ram_cut0_lo.slm -format hex /tb/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/cut\[0\]/cut_lo/Mem
mem load -i slm_files/l2_ram_cut0_hi.slm -format hex /tb/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/cut\[0\]/cut_hi/Mem
mem load -i slm_files/l2_ram_cut1_lo.slm -format hex /tb/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/cut\[1\]/cut_lo/Mem
mem load -i slm_files/l2_ram_cut1_hi.slm -format hex /tb/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/cut\[1\]/cut_hi/Mem
mem load -i slm_files/l2_ram_cut2_lo.slm -format hex /tb/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/cut\[2\]/cut_lo/Mem
mem load -i slm_files/l2_ram_cut2_hi.slm -format hex /tb/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/cut\[2\]/cut_hi/Mem
mem load -i slm_files/l2_ram_cut3_lo.slm -format hex /tb/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/cut\[3\]/cut_lo/Mem
mem load -i slm_files/l2_ram_cut3_hi.slm -format hex /tb/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/cut\[3\]/cut_hi/Mem

run 50 ns
