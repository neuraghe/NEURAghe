all: synth

ips:
	cd ips/xilinx_l2_mem_32768x64_dp; make clean all
	cd ips/xilinx_tcdm_bank_256x32; make clean all
	cd ips/xilinx_tcdm_bank_8192x32; make clean all
	cd ips/xilinx_rom_bank_1024x64; make clean all
	cd ips/xilinx_icache_bank_data_16x128; make clean all
	cd ips/xilinx_icache_bank_tag_16x8; make clean all

synth: synth-soc 

synth-soc:
	cd soc; make clean all
	xmessage -center - "synth-soc complete."

clean-ips:
	cd ips/xilinx_l2_mem_32768x64; make clean 
	cd ips/xilinx_tcdm_bank_128x32; make clean 
	cd ips/xilinx_tcdm_bank_256x32; make clean
	cd ips/xilinx_tcdm_bank_512x32; make clean
	cd ips/xilinx_tcdm_bank_1024x32; make clean
	cd ips/xilinx_tcdm_bank_2048x32; make clean
	cd ips/xilinx_rom_bank_1024x64; make clean
	cd ips/xilinx_icache_bank_data_16x128; make clean
	cd ips/xilinx_icache_bank_tag_16x8; make clean
	cd ips/xilinx_clock_manager; make clean
.PHONY: ips synth-soc
