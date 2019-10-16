run 50 ns

mem load -i slm_files/l2_ram_cut0_lo.slm -format hex /tb_spi/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut\[0\]/cut_lo/Mem
mem load -i slm_files/l2_ram_cut0_hi.slm -format hex /tb_spi/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut\[0\]/cut_hi/Mem
mem load -i slm_files/l2_ram_cut1_lo.slm -format hex /tb_spi/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut\[1\]/cut_lo/Mem
mem load -i slm_files/l2_ram_cut1_hi.slm -format hex /tb_spi/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut\[1\]/cut_hi/Mem
