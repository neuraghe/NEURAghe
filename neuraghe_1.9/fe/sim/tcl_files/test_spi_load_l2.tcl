vsim -quiet tb_spi -L work -L tech_lib -L tech_lib_UMC65 -L tech_lib_UMC65  -L or1200_lib -L cluster_interconnect_lib -L fll_lib -L cvp_lib -L common_cells_lib -L axi_id_remap_lib -L axi_cvp_if_lib -L wb2axi_lib -L axi2per_lib -L per2axi_lib -L axi2mem_lib -L axi_node_lib -L axi_gpreg_lib -L axi_slice_lib -L axi_slice_dc_lib -L axi_mem_if_lib -L axi_spi_master_lib -L axi_spi_slave_lib -L jtag_lib -L mchan_lib -L clock_divider_lib +nowarn +nowarnTRAN +nowarnTSCALE +nowarnTFMPC "-voptargs=-suppress 2103" -t ps -voptargs=+acc;

restart -f

run 50 ns

mem load -i slm_files/l2_ram_cut0_lo.slm -format hex /tb_spi/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut\[0\]/cut_lo/Mem
mem load -i slm_files/l2_ram_cut0_hi.slm -format hex /tb_spi/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut\[0\]/cut_hi/Mem
mem load -i slm_files/l2_ram_cut1_lo.slm -format hex /tb_spi/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut\[1\]/cut_lo/Mem
mem load -i slm_files/l2_ram_cut1_hi.slm -format hex /tb_spi/i_dut/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut\[1\]/cut_hi/Mem

run -a

