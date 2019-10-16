setenv BASE_DIR         "/home/igor/Desktop/prj/PULP/PULP/pulp2"


setenv SW_DIR           "$BASE_DIR/sw"
setenv IPS_DIR          "$BASE_DIR/fe/ips"
setenv SIM_DIR          "$BASE_DIR/fe/sim"
setenv RTL_DIR          "$BASE_DIR/fe/rtl"
setenv TB_DIR           "$BASE_DIR/fe/tb"

echo "STARTING SVN UPDATE"

pushd $IPS_DIR
svn update
popd

pushd $RTL_DIR
svn update
popd

pushd $TB_DIR
svn update
popd

pushd $SIM_DIR
svn update
popd 

pushd $SW_DIR
svn update
popd

echo "Starting RTL compile and BUILD"
pushd $IPS_DIR
source scripts/vcompile_libs.do
popd
pushd $SIM_DIR
source scripts/vcompile_work.do
popd

vsim -quiet tb -L work -L tech_lib -L tech_lib_UMC65 -L or1200_lib -L cluster_interconnect_lib -L fll_lib -L cvp_lib -L common_cells_lib -L axi_id_remap_lib -L axi_cvp_if_lib -L wb2axi_lib -L axi2per_lib -L per2axi_lib -L axi2mem_lib -L axi_node_lib -L axi_gpreg_lib -L axi_slice_lib -L axi_slice_dc_lib -L axi_mem_if_lib -L axi_spi_master_lib -L axi_spi_slave_lib -L jtag_lib -L mchan_lib -L clock_divider_lib +nowarn +nowarnTRAN +nowarnTSCALE +nowarnTFMPC "-voptargs=-suppress 2103" -t ps -voptargs=+acc -do tcl_files/load_mem.tcl;








